package com.swm.service;

import com.swm.entity.Workinghours;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface WorkHoursService {

    int addWorkHours(Workinghours workinghours);

    List<Workinghours> getAllWorkHours();

    List<Workinghours> getWorkHoursById(Integer id);

    List<Workinghours> getByWorkinghours(Workinghours workinghours);

    int deleteById(Integer id);
}

