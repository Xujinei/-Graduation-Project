package com.swm.service;

import com.swm.entity.Department;

import java.util.List;

public interface DepartmentService {
    List<Department> getAllDepartment();

    int addDepartment(Department department);
}
