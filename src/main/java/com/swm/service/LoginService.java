package com.swm.service;

import com.swm.entity.Account;

import javax.servlet.http.HttpServletResponse;

public interface LoginService {
    /**
     * 用户登录
     *
     * @param username
     * @param password
     * @param ifRemb
     * @return
     */
    Account userLogin(String username, String password, String ifRemb, HttpServletResponse response);

    Account loginOut();
}
