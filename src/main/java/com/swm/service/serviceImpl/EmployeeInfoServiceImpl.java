package com.swm.service.serviceImpl;

import com.swm.entity.Employeeinfo;
import com.swm.mapper.EmployeeinfoMapper;
import com.swm.service.EmployeeInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeInfoServiceImpl implements EmployeeInfoService {

    @Autowired
    private EmployeeinfoMapper employeeinfoMapper;

    /**
     * 添加员工信息
     *
     * @param employeeinfo
     * @return
     */
    public int addEmployee(Employeeinfo employeeinfo) {
        return employeeinfoMapper.insert(employeeinfo);
    }
}
