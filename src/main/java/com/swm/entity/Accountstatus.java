package com.swm.entity;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import java.util.Date;

@Component
public class Accountstatus {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column accountstatus.id
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column accountstatus.name
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    private String name;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column accountstatus.addTime
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    private Date addtime;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column accountstatus.id
     *
     * @return the value of accountstatus.id
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column accountstatus.id
     *
     * @param id the value for accountstatus.id
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column accountstatus.name
     *
     * @return the value of accountstatus.name
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column accountstatus.name
     *
     * @param name the value for accountstatus.name
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column accountstatus.addTime
     *
     * @return the value of accountstatus.addTime
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public Date getAddtime() {
        return addtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column accountstatus.addTime
     *
     * @param addtime the value for accountstatus.addTime
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}