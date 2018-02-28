package com.swm.service;

import com.swm.entity.Employeeinfo;

public interface UserService {
    /**
     * 根据员工编号获得员工信息
     *
     * @param id
     * @return
     */
    Employeeinfo getEmployeeById(int id);

    /**
     * 添加员工
     */
    void addEmployee(Employeeinfo employeeinfo);
}
