package com.swm.controller;

import com.swm.entity.Account;
import com.swm.entity.Employeeinfo;
import com.swm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 获得用户信息
     *
     * @param session
     * @param request
     */
    @RequestMapping("/userInfo")
    public void initUserInfo(HttpSession session, HttpServletRequest request) {

        Account account = (Account) session.getAttribute("account");
        // 根据账号中的employId在employeeinfo表中查找用户信息
        if (account != null) {
            Employeeinfo employeeinfo = userService.getEmployeeById(account.getEmployeeId());
            if (employeeinfo != null) {
                request.setAttribute("employeeInfo", employeeinfo);
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
}
