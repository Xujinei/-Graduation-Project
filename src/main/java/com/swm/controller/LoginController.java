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
        if (null == session.getAttribute("account")) {
            Account account = loginService.userLogin(username, password, remember, response);

            if (account == null) {
                modelAndView.addObject("message", "用户名和密码错误，请重新输入");
                modelAndView.setViewName("/login");
            } else if(0 == account.getStatus()){
                modelAndView.addObject("message", "账号未激活,无法使用");
                modelAndView.setViewName("/login");
            }else if(null == account.getEmployeeId()){
                modelAndView.addObject("message", "账号未分配,无法使用");
                modelAndView.setViewName("/login");
            }else{
                session.setAttribute("account", account);
                if (account.getPromission() == 1) {
                    modelAndView.setViewName("/home");
                } else {
                    modelAndView.setViewName("/userhome");
                }

            }
        } else {
            Account account = (Account) session.getAttribute("account");
            if (account.getPromission() == 1) {
                modelAndView.setViewName("/home");
            } else {
                modelAndView.setViewName("/userhome");
            }
        }
        return modelAndView;
    }

    /**
     * 退出登录
     *
     * @param session
     * @return
     */
    @RequestMapping("/loginOut")
    public ModelAndView loginOut(HttpSession session) {
        if (null != session.getAttribute("account")) {
            session.removeAttribute("account");
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/login");
        return modelAndView;
    }
}
