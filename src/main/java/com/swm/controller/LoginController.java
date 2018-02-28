package com.swm.controller;

import com.swm.entity.Account;
import com.swm.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private LoginService loginService;


    @RequestMapping("/userLogin")
    public ModelAndView login(String username, String password, String remember, HttpSession session, HttpServletResponse response) {

        ModelAndView modelAndView = new ModelAndView();

        Account account = loginService.userLogin(username, password, remember, response);

        if (account == null) {
            modelAndView.addObject("message", "用户名和密码错误，请重新输入");
            modelAndView.setViewName("/login");
        } else {
            modelAndView.setViewName("/home");
            session.setAttribute("account", account);
        }
        return modelAndView;
    }
}
