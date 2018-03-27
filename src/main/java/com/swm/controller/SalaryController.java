package com.swm.controller;

import com.alibaba.fastjson.JSON;
import com.swm.entity.*;
import com.swm.service.DepartmentService;
import com.swm.service.EmployeeInfoService;
import com.swm.service.SalaryService;
import com.swm.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
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

    /**
     * 分页获取当月的薪酬信息（如果没有当月的获取上一个月的）
     *
     * @param out
     */
    @RequestMapping("/getPage")
    public void getPageList(PrintWriter out, Integer pageIndex, Integer pageSize, Integer departmentId, String time, Integer upOrDown) {
        PageUtil<EmpSalary> salaryPage = new PageUtil<EmpSalary>();

        Salary salary = new Salary();
        if (departmentId != null) {
            salary.setDepartementId(departmentId);
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
        String salaryPageJson = JSON.toJSONString(salaryPage);
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
        String json = JSON.toJSONString(empSalaries);
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
        String json = JSON.toJSONString(empSalaries);
        out.write(json);
    }

    /**
     * 获得各部门人员工资详情
     *
     * @param response
     * @param out
     * @param date
     * @param upOrDown
     * @param department
     */
    @RequestMapping("/departEmpSalary")
    public void selectDepartEmpSalary(HttpServletResponse response, PrintWriter out,
                                      Integer pageIndex, Integer pageSize,
                                      String date, Integer upOrDown,
                                      Integer department) {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        getPageList(out, pageIndex, pageSize, department, date, upOrDown);
    }

}
