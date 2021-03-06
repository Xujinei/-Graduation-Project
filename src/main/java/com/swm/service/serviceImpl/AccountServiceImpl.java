package com.swm.service.serviceImpl;

import com.swm.entity.Account;
import com.swm.entity.Employeeinfo;
import com.swm.mapper.AccountMapper;
import com.swm.mapper.EmployeeinfoMapper;
import com.swm.service.AccountService;
import com.swm.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Service
public class AccountServiceImpl implements AccountService {
    @Autowired
    AccountMapper accountMapper;
    @Autowired
    EmployeeinfoMapper employeeinfoMapper;

    public PageUtil<Account> getPageAccount(Integer pageIndex, Integer pageSize,
                                            Account account, List<Employeeinfo> empList) {
        PageUtil<Account> accountPage = new PageUtil<Account>();

        Integer skipSize = pageIndex;
        Integer pageNumber = accountMapper.countByPageAccount(skipSize, pageSize, account, empList);
        Integer pageCount = (int) Math.ceil(pageNumber / (pageSize * 1.0));
        if (pageCount == 0) {
            pageCount = 1;
        }

        List<Account> accountList = accountMapper.selectByPageAccount(skipSize, pageSize, account, empList);

        accountPage.setList(accountList);
        accountPage.setPageCount(pageCount);
        accountPage.setPageNumber(pageNumber);
        accountPage.setPageIndex(pageIndex);
        return accountPage;

    }

    public void updateAccount(Account account) {
        accountMapper.updateByPrimaryKey(account);
    }

    public Account getById(Integer id) {
        return accountMapper.selectByPrimaryKey(id);
    }

    public int delete(Integer id) {
        return accountMapper.deleteByPrimaryKey(id);
    }

    public List<Employeeinfo> selectNoAccount() {
        return employeeinfoMapper.selectNoAccount();
    }

    public int add(Account account) {
        return accountMapper.insert(account);
    }

    public int updatePassword(Integer id, String password) {
        return accountMapper.updatePassword(id, password);
    }
}
