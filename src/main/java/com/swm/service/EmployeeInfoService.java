package com.swm.service;

import com.swm.entity.Employeeinfo;
import com.swm.entity.EmployeeinfoEntity;
import com.swm.util.PageUtil;

import java.util.List;

public interface EmployeeInfoService {

    int addEmployee(Employeeinfo employeeinfo);

    PageUtil<EmployeeinfoEntity> getPageEmployee(Integer pageIndex, Integer pageSize);

    PageUtil<EmployeeinfoEntity> getPageEmployeeByKey(Integer pageIndex, Integer pageSize, Employeeinfo employeeinfo);

    Employeeinfo getEmployeeDetail(Integer id);

    EmployeeinfoEntity getEmployeeEntityById(Integer id);

    int updateInfo(Employeeinfo employeeinfo);


    int deleteInfo(Integer id);

    List<Employeeinfo> getEmployeeBySearch(Employeeinfo employeeinfo);
}
