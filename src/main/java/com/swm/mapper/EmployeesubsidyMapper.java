package com.swm.mapper;

import com.swm.entity.Employeesubsidy;
import java.util.Date;
import java.util.List;

public interface EmployeesubsidyMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employeesubsidy
     *
     * @mbg.generated Mon Dec 04 16:14:32 CST 2017
     */
    int deleteByPrimaryKey(Date workdata);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employeesubsidy
     *
     * @mbg.generated Mon Dec 04 16:14:32 CST 2017
     */
    int insert(Employeesubsidy record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employeesubsidy
     *
     * @mbg.generated Mon Dec 04 16:14:32 CST 2017
     */
    Employeesubsidy selectByPrimaryKey(Date workdata);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employeesubsidy
     *
     * @mbg.generated Mon Dec 04 16:14:32 CST 2017
     */
    List<Employeesubsidy> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employeesubsidy
     *
     * @mbg.generated Mon Dec 04 16:14:32 CST 2017
     */
    int updateByPrimaryKey(Employeesubsidy record);
}