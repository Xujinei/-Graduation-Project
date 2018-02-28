package com.swm.mapper;

import com.swm.entity.Insurancestandard;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InsurancestandardMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table insurancestandard
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table insurancestandard
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    int insert(Insurancestandard record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table insurancestandard
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    Insurancestandard selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table insurancestandard
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    List<Insurancestandard> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table insurancestandard
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    int updateByPrimaryKey(Insurancestandard record);
}