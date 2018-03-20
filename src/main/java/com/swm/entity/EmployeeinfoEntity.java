package com.swm.entity;

import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class EmployeeinfoEntity {

    private Integer id;

    private String name;

    private String sex;

    private Date brithday;

    private String telphone;

    private String email;

    private String address;

    private String identificationid;

    private String education;

    private String school;

    private String profession;

    private String politicalstatus;

    private Date entrytime;

    private Date expiredate;

    private Department department;

    private Position position;

    private Double basesalary;

    private Double positionsalary;

    private Double subsidy;


    private Insurancestandard insurancestandard;


    private Integer employeestatus;

    public Integer getId() {
        return id;
    }


    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getBrithday() {
        return brithday;
    }

    public void setBrithday(Date brithday) {
        this.brithday = brithday;
    }

    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone;
    }

    public String getEmail() {
        return email;
    }


    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }


    public String getIdentificationid() {
        return identificationid;
    }

    public void setIdentificationid(String identificationid) {
        this.identificationid = identificationid;
    }


    public String getEducation() {
        return education;
    }


    public void setEducation(String education) {
        this.education = education;
    }


    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }


    public String getPoliticalstatus() {
        return politicalstatus;
    }


    public void setPoliticalstatus(String politicalstatus) {
        this.politicalstatus = politicalstatus;
    }


    public Date getEntrytime() {
        return entrytime;
    }

    public void setEntrytime(Date entrytime) {
        this.entrytime = entrytime;
    }

    public Date getExpiredate() {
        return expiredate;
    }


    public void setExpiredate(Date expiredate) {
        this.expiredate = expiredate;
    }


    public Double getBasesalary() {
        return basesalary;
    }


    public void setBasesalary(Double basesalary) {
        this.basesalary = basesalary;
    }


    public Double getPositionsalary() {
        return positionsalary;
    }


    public void setPositionsalary(Double positionsalary) {
        this.positionsalary = positionsalary;
    }


    public Double getSubsidy() {
        return subsidy;
    }


    public void setSubsidy(Double subsidy) {
        this.subsidy = subsidy;
    }


    public Integer getEmployeestatus() {
        return employeestatus;
    }


    public void setEmployeestatus(Integer employeestatus) {
        this.employeestatus = employeestatus;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Insurancestandard getInsurancestandard() {
        return insurancestandard;
    }

    public void setInsurancestandard(Insurancestandard insurancestandard) {
        this.insurancestandard = insurancestandard;
    }
}