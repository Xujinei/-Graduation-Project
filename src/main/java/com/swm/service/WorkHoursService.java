package com.swm.service;

import com.swm.entity.Workinghours;

import java.util.List;

public interface WorkHoursService {

    int addWorkHours(Workinghours workinghours);

    List<Workinghours> getAllWorkHours();

    List<Workinghours> getWorkHoursById(Integer id);

}

