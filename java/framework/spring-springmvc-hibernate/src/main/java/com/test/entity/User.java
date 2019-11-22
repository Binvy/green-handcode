package com.test.entity;

import lombok.Data;

import java.util.Date;

@Data
public class User {

    private String id;
    private String name;
    private String sex;
    private Date birthday;
    private String address;
    private String comment;

}
