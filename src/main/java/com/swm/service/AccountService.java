package com.swm.service;

import com.swm.entity.Account;
import com.swm.entity.Employeeinfo;
import com.swm.util.PageUtil;

import java.util.List;

public interface AccountService {
    PageUtil<Account> getPageAccount(Integer pageIndex, Integer pageSize,
                                     Account account, List<Employeeinfo> empList);
}
