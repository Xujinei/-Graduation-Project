package com.swm.controller;

import com.alibaba.fastjson.JSON;
import com.swm.entity.Account;
import com.swm.entity.Employeeinfo;
import com.swm.entity.EmployeeinfoEntity;
import com.swm.service.AccountService;
import com.swm.service.EmployeeInfoService;
import com.swm.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    private AccountService accountService;
    @Autowired
    private EmployeeInfoService employeeInfoService;

    /**
     * 获取分页账号
     *
     * @param pageIndex
     * @param pageSize
     * @param out
     * @param accountName
     * @param promission
     * @param department
     * @param status
     */
    @RequestMapping("/getPage")
    public void getPageAccount(Integer pageIndex, Integer pageSize, PrintWriter out,
                               String accountName, String promission, String department, String status) {

        PageUtil<Account> accountPage = new PageUtil<Account>();
        Account account = new Account();
        List<Employeeinfo> employeeinfos = null;
        if (accountName != null && !"".equals(accountName)) {
            account.setUsername(accountName);
        }
        if (promission != null && !"".equals(promission)) {
            account.setPromission(Integer.valueOf(promission));
        }
        if (department != null && !"".equals(department)) {
            Employeeinfo tempEmp = new Employeeinfo();
            tempEmp.setDepartmentid(Integer.valueOf(department));
            employeeinfos = employeeInfoService.getEmployeeBySearch(tempEmp);
        }
        if (status != null && !"".equals(status)) {
            account.setStatus(Integer.valueOf(status));
        }
        accountPage = accountService.getPageAccount(pageIndex, pageSize, account, employeeinfos);
        String accountJSON = JSON.toJSONString(accountPage);
        out.write(accountJSON);
    }

}
