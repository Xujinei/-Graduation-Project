package com.swm.entity;

import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class Employeestatus {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column employeestatus.id
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column employeestatus.name
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    private String name;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column employeestatus.addTime
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    private Date addtime;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column employeestatus.id
     *
     * @return the value of employeestatus.id
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column employeestatus.id
     *
     * @param id the value for employeestatus.id
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column employeestatus.name
     *
     * @return the value of employeestatus.name
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column employeestatus.name
     *
     * @param name the value for employeestatus.name
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column employeestatus.addTime
     *
     * @return the value of employeestatus.addTime
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public Date getAddtime() {
        return addtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column employeestatus.addTime
     *
     * @param addtime the value for employeestatus.addTime
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}