package com.xworks.inventoryManagement.entity;

import lombok.Data;
import javax.persistence.*;

@Data
@Entity
@Table(name = "Users")
@NamedQueries(@NamedQuery(name = "getEmailId", query = "select e from RegisterEntity e where e.email = :email"))
public class RegisterEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "first_name", nullable = false, length = 10)
    private String firstName;

    @Column(name = "last_name", nullable = false, length = 10)
    private String lastName;

    @Column(nullable = false, unique = true)
    private String email;

    @Column(name = "phoneNumber", nullable = false, length = 10)
    private String phoneNumber;

    @Column(nullable = false, length = 100) // Increased for secure hashing
    private String password;
}