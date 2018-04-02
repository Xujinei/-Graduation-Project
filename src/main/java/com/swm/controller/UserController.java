package com.swm.controller;

import com.alibaba.fastjson.JSON;
import com.swm.entity.*;
import com.swm.service.AccountService;
import com.swm.service.SalaryService;
import com.swm.service.UserService;
import com.swm.util.MD5;
import com.swm.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.json.Json;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private SalaryService salaryService;
    @Autowired
    private AccountService accountService;

    /**
     * 获得用户信息
     *
     * @param session
     * @param response
     */
    @RequestMapping("/userInfo")
    public void initUserInfo(HttpSession session, HttpServletResponse response) {

        Account account = (Account) session.getAttribute("account");
        // 根据账号中的employId在employeeinfo表中查找用户信息
        if (account != null) {
            EmployeeinfoEntity employeeinfo = userService.getEmployeeInfoEntity(account.getEmployeeId().getId());
            if (employeeinfo != null) {
                try {
                    response.getWriter().write(JSON.toJSONString(employeeinfo));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } else {
                try {
                    response.getWriter().write(JSON.toJSONString("系统错误"));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

    }

    /**
     * 添加员工信息
     *
     * @param employeeinfo
     */
    @RequestMapping("/addEmployee")
    public void addEmployee(Employeeinfo employeeinfo) {
        userService.addEmployee(employeeinfo);
    }

    /**
     * 查看个人薪酬报表
     *
     * @param session
     */
    @RequestMapping("/selfSalary")
    public void checkSelfSalary(HttpSession session) {
        Account account = (Account) session.getAttribute("account");
        Salary salary = new Salary();
        if (account != null) {
            salary.setEmployeeId(account.getEmployeeId().getId());
        }
        PageUtil<EmpSalary> salaryPage = salaryService.selectBySalary(null, null, salary, null);
    }

    /**
     * 原始密码验证
     *
     * @param session
     * @param password
     * @param out
     */
    @RequestMapping("/comparePw")
    public void comparePW(HttpSession session, String password, PrintWriter out) {
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            String md5Pw = MD5.toMD5(password);
            if (md5Pw.equals(account.getPassword())) {
                out.write("1");
            } else {
                out.write("0");
            }
        } else {
            out.write("0");
        }
    }

    /**
     * 修改密码
     *
     * @param session
     * @param password
     * @param out
     */
    @RequestMapping("/updatePw")
    public void updatePw(HttpSession session, String password, PrintWriter out) {
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            int i = accountService.updatePassword(account.getId(), MD5.toMD5(password));
            if (i > 0) {
                out.write("修改成功");
            } else {
                out.write("修改失败");
            }
        } else {
            out.write("修改失败");
        }

    }


}
