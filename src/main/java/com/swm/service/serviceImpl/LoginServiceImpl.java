package com.swm.service.serviceImpl;

import com.swm.entity.Account;
import com.swm.mapper.AccountMapper;
import com.swm.service.LoginService;
import com.swm.util.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {

    @Autowired
    AccountMapper accountMapper;

    /**
     * 用户登录
     *
     * @param username
     * @param password
     * @param ifRemb
     * @param response
     * @return
     */
    public Account userLogin(String username, String password, String ifRemb, HttpServletResponse response) {

        if (username != null && password != null) {
            Account account = new Account();
            account.setUsername(username);
            String pw = MD5.toMD5(password);
            account.setPassword(pw);
            // account.setStatus(1);
            Account user = accountMapper.selectByAccount(account);
            if (user != null) {

                user.setLastLoginTime(new Date());

                //更新最后登录时间
                accountMapper.updateByPrimaryKey(user);
                return user;
            }
        }

        return null;
    }

    public Account loginOut() {
        return null;
    }
}
