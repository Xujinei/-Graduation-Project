package com.swm.controller;

import com.alibaba.fastjson.JSON;
import com.swm.entity.Employeeinfo;
import com.swm.entity.EmployeeinfoEntity;
import com.swm.service.EmployeeInfoService;
import com.swm.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/employInfo")
public class EmployeeInfoController {

    @Autowired
    private EmployeeInfoService employeeInfoService;

    /**
     * 分页获取员工信息
     *
     * @param pageIndex
     * @param pageSize
     * @param out
     */
    @RequestMapping("/pageEmployee")
    public void getPageEmployee(Integer pageIndex, Integer pageSize, PrintWriter out) {
        PageUtil<EmployeeinfoEntity> employeeinfoPage = employeeInfoService.getPageEmployee(pageIndex, pageSize);
        String employeeListJSON = JSON.toJSONString(employeeinfoPage);
        out.write(employeeListJSON);
    }

    /**
     * 添加员工信息
     *
     * @param out
     * @param request
     */
    @RequestMapping("/add")
    public void addEmployee(PrintWriter out, HttpServletRequest request) {

        Employeeinfo employeeinfo = initEmployee(request);
        if (employeeinfo.getEntrytime() == null) {
            employeeinfo.setEntrytime(new Date());
        }
        if (employeeinfo.getEmployeestatus() == null || "".equals(employeeinfo.getEmployeestatus())) {
            employeeinfo.setEmployeestatus(1); // 在职
        }

        int re = employeeInfoService.addEmployee(employeeinfo);
        if (re > 0) {
            out.write("添加成功");
        } else {
            out.write("添加失败");
        }

    }

    /**
     * 查询员工详细信息
     *
     * @param out
     *
     */
    @RequestMapping("detail")
    public void EmployeeDetail(Integer id, PrintWriter out) {
        Employeeinfo employeeinfo = employeeInfoService.getEmployeeDetail(id);
        String employJSON = JSON.toJSONString(employeeinfo);
        out.write(employJSON);
    }

    /**
     * 更新用户信息
     *
     * @param out
     * @param request
     */
    @RequestMapping("/update")
    public void updateEmployeeInfo(PrintWriter out, HttpServletRequest request) {
        Employeeinfo employeeinfo = initEmployee(request);
        employeeinfo.setId(Integer.valueOf(request.getParameter("id")));
        employeeinfo.setEmployeestatus(1);
        int re = employeeInfoService.updateInfo(employeeinfo);
        if (re > 0) {
            out.write("修改成功");
        } else {
            out.write("修改失败");
        }

    }

    /**
     * 删除用户
     *
     * @param id
     * @param out
     */
    @RequestMapping("/delete")
    public void deletEmployee(Integer id, PrintWriter out) {
        int re = employeeInfoService.deleteInfo(id);
        if (re > 0) {
            out.write("删除成功");
        }
    }

    /**
     * 根据条件查询用户信息
     *
     * @param out
     * @param request
     */
    @RequestMapping("/selectByKey")
    public void selectEmployee(Integer pageIndex, Integer pageSize,
                               String name, Integer department, Integer position, PrintWriter out, HttpServletRequest request) {

        Employeeinfo employeeinfo = new Employeeinfo();
        if (name != null && !"".equals(name)) {
            employeeinfo.setName(name);
        }
        if (department != null) {
            employeeinfo.setDepartmentid(department);
        }
        if (position != null) {
            employeeinfo.setPositionid(position);
        }
        PageUtil<EmployeeinfoEntity> employeeinfoPage = employeeInfoService.getPageEmployeeByKey(pageIndex, pageSize, employeeinfo);
        String employeeListJSON = JSON.toJSONString(employeeinfoPage);
        out.write(employeeListJSON);
    }

    /**
     * 从前后获取员工信息，初始化员工对象
     *
     * @param request
     * @return
     */
    public Employeeinfo initEmployee(HttpServletRequest request) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Employeeinfo employeeinfo = new Employeeinfo();
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        String brithday = request.getParameter("brithday"); // 需转换
        Date dateBrithday = null;
        if (brithday != null && brithday != "") {
            // 转换为data类型
            try {
                dateBrithday = sdf.parse(brithday);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        String telphone = request.getParameter("telphone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String identificationid = request.getParameter("identificationid");
        String education = request.getParameter("education");
        String school = request.getParameter("school");
        String profession = request.getParameter("profession");
        String politicalstatus = request.getParameter("politicalstatus");
        String expiredate = request.getParameter("expiredate"); // 需转换
        Date dateExpiredate = null;
        if (expiredate != null && expiredate != "") {
            // 转换为data类型
            try {
                dateExpiredate = sdf.parse(expiredate);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        String entrytime = request.getParameter("entrytime"); // 需转换
        Date dateEntrytime = null;
        if (entrytime != null && entrytime != "") {
            // 转换为data类型
            try {
                dateEntrytime = sdf.parse(entrytime);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        String departmentid = request.getParameter("departmentid"); // 需转换为int
        int intDepartment = Integer.valueOf(departmentid);
        String positionid = request.getParameter("positionid");// 需转换为int
        int intPosition = Integer.valueOf(positionid);
        String basesalary = request.getParameter("basesalary"); // 需转为double
        Double dBaseSalary = Double.parseDouble(basesalary);
        String positionsalary = request.getParameter("positionsalary"); // 需转为double
        Double dPositionSalary = Double.parseDouble(positionsalary);
        String insurancestandard = request.getParameter("insurancestandard"); // 需转为int

        Integer intInsuStand = null;
        if (insurancestandard != null && "".equals(insurancestandard)) {
            intInsuStand = Integer.valueOf(insurancestandard);
        }

        String employeestatus = request.getParameter("employeestatus"); // 需转为int
        Integer intEmployStat = null;
        if (employeestatus != null && "".equals(employeestatus)) {
            intEmployStat = Integer.valueOf(employeestatus);
        }

        String subsidy = request.getParameter("subsidy"); // 需转为double
        Double dSubsidy = Double.parseDouble(subsidy);


        employeeinfo.setName(name);
        employeeinfo.setAddress(address);
        employeeinfo.setSex(sex);
        employeeinfo.setBrithday(dateBrithday);
        employeeinfo.setTelphone(telphone);
        employeeinfo.setEmail(email);
        employeeinfo.setEducation(education);
        employeeinfo.setIdentificationid(identificationid);
        employeeinfo.setSchool(school);
        employeeinfo.setProfession(profession);
        employeeinfo.setPoliticalstatus(politicalstatus);
        employeeinfo.setExpiredate(dateExpiredate);
        employeeinfo.setEntrytime(dateEntrytime);
        employeeinfo.setDepartmentid(intDepartment);
        employeeinfo.setPositionid(intPosition);
        employeeinfo.setBasesalary(dBaseSalary);
        employeeinfo.setEmployeestatus(intEmployStat);
        employeeinfo.setPositionsalary(dPositionSalary);
        employeeinfo.setInsurancestandard(intInsuStand);
        employeeinfo.setSubsidy(dSubsidy);
        employeeinfo.setHoursSalary((employeeinfo.getBasesalary() + employeeinfo.getPositionsalary()) / 40.0); // 小时工资
        return employeeinfo;

    }
}
