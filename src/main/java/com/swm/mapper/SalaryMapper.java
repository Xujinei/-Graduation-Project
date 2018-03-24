package com.swm.mapper;

import com.swm.entity.EmpSalary;
import com.swm.entity.Salary;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface SalaryMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table salary
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    int deleteByPrimaryKey(Date workdata);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table salary
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    int insert(Salary record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table salary
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    Salary selectByPrimaryKey(Date workdata);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table salary
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    List<Salary> selectAll();


    List<Salary> accountMonthSalary(Date workdata);

    List<EmpSalary> selectBySalary(@Param("pageIndex") Integer pageIndex, @Param("pageSize") Integer pageSize, @Param("salary") Salary salary);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table salary
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    int updateByPrimaryKey(Salary record);

    int countAll();

    int countAllByKey(@Param("salary") Salary salary);
}