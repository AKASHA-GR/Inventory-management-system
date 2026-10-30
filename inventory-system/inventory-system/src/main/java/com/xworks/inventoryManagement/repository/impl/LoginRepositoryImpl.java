package com.xworks.inventoryManagement.repository.impl;

import com.xworks.inventoryManagement.entity.RegisterEntity;
import com.xworks.inventoryManagement.repository.LoginRepository;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

@Repository
public class LoginRepositoryImpl implements LoginRepository {

    @PersistenceContext
    private EntityManager entityManager;

    public LoginRepositoryImpl() {
        System.out.println("The LoginRepositoryImpl is created.");
    }

    @Override
    public RegisterEntity findByEmail(String email) {

        try {
            return entityManager
                    .createNamedQuery("getEmailId", RegisterEntity.class)
                    .setParameter("email", email)
                    .getSingleResult();

        } catch (NoResultException e) {
            // No registered user exists with this email.
            return null;
        }
    }
}
