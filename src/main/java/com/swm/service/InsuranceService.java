package com.swm.service;

import com.swm.entity.Insurancestandard;
import com.swm.util.PageUtil;

import java.util.List;

public interface InsuranceService {

    PageUtil<Insurancestandard> getPageInsurance(Integer pageIndex, Integer pageSize);

    List<Insurancestandard> getAllInsu();

    int addInsurance(Insurancestandard insurancestandard);

    int deletInsurance(Integer id);

    int updateInsurance(Insurancestandard insurancestandard);
}
