package com.swm.service;

import com.swm.entity.EmpSalary;
import com.swm.entity.Salary;
import com.swm.util.PageUtil;

import java.util.Date;
import java.util.List;

public interface SalaryService {

    void cleanByDate(Date date);

    List<Salary> accountMonthSalary(Date date);

    void add(Salary salary);

    PageUtil<EmpSalary> selectBySalary(Integer pageIndex, Integer pageSize, Salary salary);

    List<EmpSalary> selectDepartmentSalary(Date date, Integer upOrDown);

    List<EmpSalary> selectPositionSalary(Date date, Integer upOrDown);

}
