package com.swm.service;

import com.swm.entity.Insurancestandard;
import com.swm.util.PageUtil;

public interface InsuranceService {

    PageUtil<Insurancestandard> getPageInsurance(Integer pageIndex, Integer pageSize);

    int addInsurance(Insurancestandard insurancestandard);

    int deletInsurance(Integer id);
}
