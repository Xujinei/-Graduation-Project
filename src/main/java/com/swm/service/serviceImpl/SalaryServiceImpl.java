package com.swm.service.serviceImpl;

import com.swm.entity.EmpSalary;
import com.swm.entity.Employeeinfo;
import com.swm.entity.EmployeeinfoEntity;
import com.swm.entity.Salary;
import com.swm.mapper.SalaryMapper;
import com.swm.service.EmployeeInfoService;
import com.swm.service.SalaryService;
import com.swm.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class SalaryServiceImpl implements SalaryService {

    @Autowired
    private SalaryMapper salaryMapper;
    @Autowired
    private EmployeeInfoService employeeInfoService;

    public void cleanByDate(Date date) {
        salaryMapper.deleteByPrimaryKey(date);
    }

    public List<Salary> accountMonthSalary(Date date) {
        List<Salary> salaryList = salaryMapper.accountMonthSalary(date);
        /*调整税收和总工资*/
        for (Salary salary : salaryList) {
            double tax = salary.getTax();
            if (tax < 1500 && tax > 0) {
                tax = tax * 0.03;
            } else if (tax >= 1500 && tax < 4500) {
                tax = tax * 0.1 - 105;
            } else if (tax >= 4500 && tax < 9000) {
                tax = tax * 0.2 - 555;
            } else if (tax >= 9000 && tax < 35000) {
                tax = tax * 0.25 - 1005;
            } else if (tax >= 35000 && tax < 55000) {
                tax = tax * 0.3 - 2755;
            } else if (tax >= 55000 && tax < 80000) {
                tax = tax * 0.35 - 5505;
            } else if (tax >= 80000) {
                tax = tax * 0.45 - 13505;
            }
            salary.setTax(tax);
            salary.setTotal(salary.getTotal() - tax);
        }

        return salaryList;
    }

    public void add(Salary salary) {
        salaryMapper.insert(salary);
    }

    /**
     * 按条件分页查询
     *
     * @param pageIndex
     * @param pageSize
     * @param salary
     * @return
     */
    public PageUtil<EmpSalary> selectBySalary(Integer pageIndex, Integer pageSize, Salary salary) {
        PageUtil<EmpSalary> pageSalary = new PageUtil<EmpSalary>();

        Integer skipSize = (pageIndex - 1) * pageSize;
        Integer pageNumber = salaryMapper.countAllByKey(salary);
        Integer pageCount = (int) Math.ceil(pageNumber / (pageSize * 1.0));
        if (pageCount == 0) {
            pageCount = 1;
        }
        List<EmpSalary> salaryList = salaryMapper.selectBySalary(skipSize, pageSize, salary);
        /*完善部门职务信息*/
        for (EmpSalary empSalary : salaryList) {
            if (empSalary != null) {
                Integer empId = empSalary.getEmployeeId();
                EmployeeinfoEntity emp = employeeInfoService.getEmployeeEntityById(empId);
                empSalary.setEmployeeEntity(emp);
                empSalary.setPosition(emp.getPosition());
                empSalary.setDepartment(emp.getDepartment());
            }
        }
        pageSalary.setList(salaryList);
        pageSalary.setPageCount(pageCount);
        pageSalary.setPageNumber(pageNumber);
        pageSalary.setPageIndex(pageIndex);
        return pageSalary;
    }
}