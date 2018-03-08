package com.swm.service.serviceImpl;

import com.swm.entity.Insurancestandard;
import com.swm.entity.Position;
import com.swm.mapper.InsurancestandardMapper;
import com.swm.service.InsuranceService;
import com.swm.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InsuranceServiceImpl implements InsuranceService {

    @Autowired
    InsurancestandardMapper insurancestandardMapper;

    public PageUtil<Insurancestandard> getPageInsurance(Integer pageIndex, Integer pageSize) {

        PageUtil<Insurancestandard> insurancestandardPage = new PageUtil<Insurancestandard>();
        Integer skipSize = (pageIndex - 1) * pageSize;
        Integer pageNumber = insurancestandardMapper.countAllResurance();
        Integer pageCount = (int) Math.ceil(pageNumber / (pageSize * 1.0));
        if (pageCount == 0) {
            pageCount = 1;
        }

        List<Insurancestandard> insurancestandards = insurancestandardMapper.selectByPage(skipSize, pageSize);

        insurancestandardPage.setList(insurancestandards);
        insurancestandardPage.setPageCount(pageCount);
        insurancestandardPage.setPageNumber(pageNumber);
        insurancestandardPage.setPageIndex(pageIndex);
        return insurancestandardPage;
    }

    public int addInsurance(Insurancestandard insurancestandard) {
        return insurancestandardMapper.insert(insurancestandard);
    }

    public int deletInsurance(Integer id) {
        return insurancestandardMapper.deleteByPrimaryKey(id);
    }
}
