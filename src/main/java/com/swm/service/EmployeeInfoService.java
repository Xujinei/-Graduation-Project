package com.swm.service;

import com.swm.entity.Employeeinfo;
import com.swm.util.PageUtil;

public interface EmployeeInfoService {

    int addEmployee(Employeeinfo employeeinfo);

    PageUtil<Employeeinfo> getPageEmployee(Integer pageIndex, Integer pageSize);

    Employeeinfo getEmployeeDetail(Integer id);

    int updateInfo(Employeeinfo employeeinfo);

    int deleteInfo(Integer id);
}
