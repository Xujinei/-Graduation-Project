package com.swm.mapper;

import com.swm.entity.Employeeinfo;
import com.swm.entity.EmployeeinfoEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmployeeinfoMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employeeinfo
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employeeinfo
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    int insert(Employeeinfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employeeinfo
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    Employeeinfo selectByPrimaryKey(Integer id);

    EmployeeinfoEntity getEmployeeEntityById(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employeeinfo
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    List<Employeeinfo> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employeeinfo
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    int updateByPrimaryKey(Employeeinfo record);

    int countAll();

    int countAllByKey(@Param("employeeinfo") Employeeinfo employeeinfo);

    List<Employeeinfo> selectByPage(@Param("pageIndex") Integer pageIndex, @Param("pageSize") Integer pageSize);

    List<Employeeinfo> selectBySearch(@Param("employeeinfo") Employeeinfo employeeinfo);

    List<EmployeeinfoEntity> selectEntityByPage(@Param("pageIndex") Integer pageIndex, @Param("pageSize") Integer pageSize);

    List<EmployeeinfoEntity> selectEntityByPageAndOther(@Param("pageIndex") Integer pageIndex, @Param("pageSize") Integer pageSize, @Param("employeeinfo") Employeeinfo employeeinfo);

    List<Employeeinfo> selectNoAccount();
}