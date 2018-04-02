package com.swm.service.serviceImpl;

import com.swm.entity.Employeeinfo;
import com.swm.entity.EmployeeinfoEntity;
import com.swm.mapper.EmployeeinfoMapper;
import com.swm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    EmployeeinfoMapper employeeinfoMapper;

    public Employeeinfo getEmployeeById(int id) {
        return employeeinfoMapper.selectByPrimaryKey(id);
    }

    public void addEmployee(Employeeinfo employeeinfo) {
        employeeinfoMapper.insert(employeeinfo);
    }

    public EmployeeinfoEntity getEmployeeInfoEntity(Integer id) {
        return employeeinfoMapper.getEmployeeEntityById(id);
    }
}
