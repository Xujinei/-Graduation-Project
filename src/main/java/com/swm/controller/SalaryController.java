package com.swm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.swm.entity.*;
import com.swm.service.DepartmentService;
import com.swm.service.EmployeeInfoService;
import com.swm.service.NoticeService;
import com.swm.service.SalaryService;
import com.swm.util.PageUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/salary")
public class SalaryController {


    @Autowired
    private SalaryService salaryService;
    @Autowired
    private EmployeeInfoService employeeInfoService;
    @Autowired
    private DepartmentService departmentService;
    @Autowired
    private NoticeService noticeService;

    /**
     * 分页获取当月的薪酬信息（如果没有当月的获取上一个月的）
     *
     * @param out
     */
    @RequestMapping("/getPage")
    public void getPageList(PrintWriter out, Integer pageIndex, Integer pageSize,
                            Integer departmentId, String time, Integer upOrDown, Integer positon) {
        PageUtil<EmpSalary> salaryPage = new PageUtil<EmpSalary>();

        Salary salary = new Salary();
        if (departmentId != null) {
            salary.setDepartementId(departmentId);
        }
        if (positon != null) {
            salary.setPositionId(positon);
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date now = null;
        Calendar c = Calendar.getInstance();
        if (time == null || "".equals(time)) {
            c.add(Calendar.MONTH, 0);
            c.set(Calendar.DAY_OF_MONTH, 1);//设置为1号,当前日期既为本月第一天
            now = c.getTime();
        } else {
            try {
                now = sdf.parse(time);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        System.out.println("now===" + sdf.format(now));
        salary.setWorkdata(now);
        salaryPage = salaryService.selectBySalary(pageIndex, pageSize, salary, upOrDown);
        if ((time == null || "".equals(time)) && departmentId == null) {
            int month = 0;
            while (salaryPage.getList().size() <= 0 && month > -12) {
                month = month - 1;
                c.add(Calendar.MONTH, month);
                salary.setWorkdata(c.getTime());
                salaryPage = salaryService.selectBySalary(pageIndex, pageSize, salary, upOrDown);
            }
        }
        String salaryPageJson = JSON.toJSONString(salaryPage, SerializerFeature.DisableCircularReferenceDetect);
        out.write(salaryPageJson);
    }


    /**
     * 各部门工资
     *
     * @param out
     * @param date
     * @param upOrDown
     */
    @RequestMapping("/departmentSalary")
    public void departmentSalary(HttpServletResponse response, PrintWriter out, String date, Integer upOrDown) {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        boolean flag = false;
        Calendar c = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date time = null;
        if (date == null || "".equals(date)) {
            c.add(Calendar.MONTH, 0);
            c.set(Calendar.DAY_OF_MONTH, 1);//设置为1号,当前日期既为本月第一天
            time = c.getTime();
            flag = true;
        } else {
            try {
                time = sdf.parse(date);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        List<EmpSalary> empSalaries = salaryService.selectDepartmentSalary(time, upOrDown);
        if (flag && empSalaries.size() <= 0) {
            int month = 0;
            while (month > -12 && empSalaries.size() <= 0) {
                month--;
                c.add(Calendar.MONTH, month);
                time = c.getTime();
                empSalaries = salaryService.selectDepartmentSalary(time, upOrDown);
            }
        }
        String json = JSON.toJSONString(empSalaries, SerializerFeature.DisableCircularReferenceDetect);
        out.write(json);
    }

    /**
     * 各个职务工资
     *
     * @param out
     * @param date
     * @param upOrDown
     */
    @RequestMapping("/positionSalary")
    public void positionSalary(HttpServletResponse response, PrintWriter out, String date, Integer upOrDown) {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        boolean flag = false;
        Calendar c = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date time = null;
        if (date == null || "".equals(date)) {
            c.add(Calendar.MONTH, 0);
            c.set(Calendar.DAY_OF_MONTH, 1);//设置为1号,当前日期既为本月第一天
            time = c.getTime();
            flag = true;
        } else {
            try {
                time = sdf.parse(date);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        List<EmpSalary> empSalaries = salaryService.selectPositionSalary(time, upOrDown);
        if (flag && empSalaries.size() <= 0) {
            int month = 0;
            while (month > -12 && empSalaries.size() <= 0) {
                month--;
                c.add(Calendar.MONTH, month);
                time = c.getTime();
                empSalaries = salaryService.selectPositionSalary(time, upOrDown);
            }
        }
        String json = JSON.toJSONString(empSalaries, SerializerFeature.DisableCircularReferenceDetect);
        out.write(json);
    }

    /**
     * 导出报表
     * @param request
     * @param response
     * @param departmentId
     * @param time
     * @param upOrDown
     */
    @RequestMapping("/export")
    public void exportEmpSalary(HttpServletRequest request, HttpServletResponse response,
                                Integer departmentId, String time, Integer upOrDown) {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        Salary salary = new Salary();
        if (departmentId != null) {
            salary.setDepartementId(departmentId);
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date now = null;
        try {
            now = sdf.parse(time);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        salary.setWorkdata(now);
        List<EmpSalary> empSalaryList = salaryService.selectDepEmpSalaryList(upOrDown, salary);
        if (empSalaryList.size() > 0) {
            String[] title = {"姓名", "部门", "时间", "工时", "基本工资", "职务工资", "基本补贴", "加班工资", "税收", "应发总工资"};
            String fileName = empSalaryList.get(0).getDepartment().getName() + "员工薪酬报表(" + time + ").xls";
            String sheetName = empSalaryList.get(0).getDepartment().getName() + "员工薪酬报表(" + time + ")";
            String content[][] = new String[empSalaryList.size()][];
            for (int i = 0; i < empSalaryList.size(); i++) {
                content[i] = new String[title.length];
                EmpSalary obj = empSalaryList.get(i);
                content[i][0] = obj.getEmployeeEntity().getName();
                content[i][1] = obj.getDepartment().getName();
                content[i][2] = sdf.format(obj.getWorkdata());
                content[i][3] = obj.getWorkHours().toString();
                content[i][4] = obj.getBasesalary().toString();
                content[i][5] = obj.getPositionsalary().toString();
                content[i][6] = obj.getBasesubsidy().toString();
                content[i][7] = obj.getInsurance().toString();
                content[i][8] = obj.getTax().toString();
                content[i][9] = obj.getTotal().toString();
            }
            //创建HSSFWorkbook
            HSSFWorkbook wb = salaryService.getHSSFWorkbook(sheetName, title, content, null);
            //响应到客户端
            try {
                this.setResponseHeader(response, fileName);
                FileOutputStream fout = new FileOutputStream("F:/" + fileName);
                wb.write(fout);
                fout.close();
                response.getWriter().write("导出成功");
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            try {
                response.getWriter().write("没有数据可导出");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


    //发送响应流方法
    public void setResponseHeader(HttpServletResponse response, String fileName) {
        try {

            response.setContentType("application/x-msdownload");
            response.setHeader("Content-Disposition", "attachment; filename="
                    + URLEncoder.encode(fileName, "UTF-8"));
            response.addHeader("Pargam", "no-cache");
            response.addHeader("Cache-Control", "no-cache");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    /**
     * 批量审核，并且发生通知
     *
     * @param response
     * @param departmentId
     * @param time
     */
    @RequestMapping("/check")
    public void checkSalary(HttpSession session, HttpServletResponse response,
                            Integer departmentId, String time) {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        Account account = (Account) session.getAttribute("account");
        Salary salary = new Salary();
        if (departmentId != null) {
            salary.setDepartementId(departmentId);
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy年MM月");
        Date now = null;
        try {
            now = sdf.parse(time);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        salary.setWorkdata(now);
        List<EmpSalary> empSalaryList = salaryService.selectDepEmpSalaryList(null, salary);
        if (empSalaryList.size() > 0) {
            for (EmpSalary empSalary : empSalaryList) {
                empSalary.setStatus(1);
                empSalary.setApprover(account.getEmployeeId().getId());
                salaryService.updateEmpSalary(empSalary);
                /*发送通知*/
                Notice notice = new Notice();
                notice.setContent("发工资了！" + sdf2.format(empSalary.getWorkdata()) + "工资已到账");
                notice.setNoticetime(new Date());
                notice.setRecipientid(empSalary.getEmployeeId());
                notice.setStatus(1);   // 未被查看
                noticeService.addNotice(notice);
            }
            try {
                response.getWriter().write("审核完成");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            try {
                response.getWriter().write("没有数据可审核");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
