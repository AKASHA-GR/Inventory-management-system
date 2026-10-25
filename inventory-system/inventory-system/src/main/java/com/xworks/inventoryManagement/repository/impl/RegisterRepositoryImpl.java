package com.xworks.inventoryManagement.repository.impl;

import com.xworks.inventoryManagement.entity.RegisterEntity;
import com.xworks.inventoryManagement.repository.RegisterRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
public class RegisterRepositoryImpl implements RegisterRepository {

    public RegisterRepositoryImpl(){
        System.out.println("The RegisterRepositoryImpl is created.");
    }

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    @Transactional
    public boolean save(RegisterEntity registerEntity) {
        if(registerEntity != null){
            entityManager.persist(registerEntity);
            return true;
        }
        return false;
    }

    @Override
    public boolean emailExist(String email) {
        try {
            RegisterEntity entity = (RegisterEntity) entityManager.createNamedQuery("getEmailId", RegisterEntity.class)
                    .setParameter("email", email)
                    .getSingleResult();
            return entity != null;
        } catch (Exception e) {
            return false;
        }
    }
}
