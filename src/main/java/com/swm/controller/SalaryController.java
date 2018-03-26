package com.swm.controller;

import com.alibaba.fastjson.JSON;
import com.swm.entity.EmpSalary;
import com.swm.entity.Employeeinfo;
import com.swm.entity.EmployeeinfoEntity;
import com.swm.entity.Salary;
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

    /**
     * 分页获取当月的薪酬信息（如果没有当月的获取上一个月的）
     *
     * @param out
     */
    @RequestMapping("/getPage")
    public void getPageList(PrintWriter out, Integer pageIndex, Integer pageSize, Integer departmentId, String time) {
        PageUtil<EmpSalary> salaryPage = new PageUtil<EmpSalary>();

        Salary salary = new Salary();
        if (departmentId != null) {
            salary.setDepartementId(departmentId);
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date now = new Date();
        Calendar c = Calendar.getInstance();
        if (time == null || "".equals(time)) {
            c.add(Calendar.MONTH, 0);
            c.set(Calendar.DAY_OF_MONTH, 1);//设置为1号,当前日期既为本月第一天
        } else {

            try {
                Date date = sdf.parse(time);
                c.setTime(date);
                c.add(Calendar.MONTH, 0);
                c.set(Calendar.DAY_OF_MONTH, 1);//设置为1号,当前日期既为本月第一天
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        now = c.getTime();

        System.out.println("now===" + sdf.format(now));
        salary.setWorkdata(now);

        salaryPage = salaryService.selectBySalary(pageIndex, pageSize, salary);
        if ((time == null || "".equals(time)) && departmentId == null) {
            int month = 0;
            while (salaryPage.getList().size() <= 0 && month > -12) {
                month = month - 1;
                c.add(Calendar.MONTH, month);
                salary.setWorkdata(c.getTime());
                salaryPage = salaryService.selectBySalary(pageIndex, pageSize, salary);
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
    public void departmentSalary(HttpServletResponse response, PrintWriter out, Date date, Integer upOrDown) {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        boolean flag = false;
        Calendar c = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if (date == null) {
            c.add(Calendar.MONTH, 0);
            c.set(Calendar.DAY_OF_MONTH, 1);//设置为1号,当前日期既为本月第一天
            date = c.getTime();
            flag = true;
            System.out.println("now===" + sdf.format(date));
        }
        List<EmpSalary> empSalaries = salaryService.selectDepartmentSalary(date, upOrDown);
        if (flag && empSalaries.size() <= 0) {
            c.add(Calendar.MONTH, -1);
            date = c.getTime();
            System.out.println("now===" + sdf.format(date));
            empSalaries = salaryService.selectDepartmentSalary(date, upOrDown);
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
    public void positionSalary(HttpServletResponse response, PrintWriter out, Date date, Integer upOrDown) {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        boolean flag = false;
        Calendar c = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if (date == null) {
            c.add(Calendar.MONTH, 0);
            c.set(Calendar.DAY_OF_MONTH, 1);//设置为1号,当前日期既为本月第一天
            date = c.getTime();
            flag = true;
            System.out.println("now===" + sdf.format(date));
        }
        List<EmpSalary> empSalaries = salaryService.selectPositionSalary(date, upOrDown);
        if (flag && empSalaries.size() <= 0) {
            c.add(Calendar.MONTH, -1);
            date = c.getTime();
            System.out.println("now===" + sdf.format(date));
            empSalaries = salaryService.selectPositionSalary(date, upOrDown);
        }
        String json = JSON.toJSONString(empSalaries);
        out.write(json);
    }

}
