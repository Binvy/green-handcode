package com.binvi.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/5/14 23:31
 */
@Data
@Entity
@Table(name = "person")
public class Person {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "created")
    private Long created = System.currentTimeMillis();

    @Column(name = "username")
    private String username;

    @Column(name = "address")
    private String address;

    @Column(name = "phone")
    private String phone;

    @Column(name = "remark")
    private String remark;

}
