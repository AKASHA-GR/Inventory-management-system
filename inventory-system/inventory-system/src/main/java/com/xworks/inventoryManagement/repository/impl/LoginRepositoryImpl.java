package com.xworks.inventoryManagement.repository.impl;

import com.xworks.inventoryManagement.entity.RegisterEntity;
import com.xworks.inventoryManagement.repository.LoginRepository;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
public class LoginRepositoryImpl implements LoginRepository {

    public LoginRepositoryImpl() {
        System.out.println("The LoginRepositoryImpl is created.");
    }

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public RegisterEntity findByEmail(String email) {
        try {
            RegisterEntity entity = (RegisterEntity) entityManager.createNamedQuery("getEmailId", RegisterEntity.class)
                    .setParameter("email", email)
                    .getSingleResult();
            return entity;
        } catch (Exception e) {
            return null;
        }
    }
}
