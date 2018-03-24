package com.swm.service;

import com.swm.entity.Employeesubsidy;
import com.swm.entity.Workinghours;

import java.util.List;

public interface EmployeeSubsidyService {

    int add(Employeesubsidy employeesubsidy);

    List<Employeesubsidy> getAll();

    List<Employeesubsidy> getSubsidyByKey(Employeesubsidy employeesubsidy);

}

