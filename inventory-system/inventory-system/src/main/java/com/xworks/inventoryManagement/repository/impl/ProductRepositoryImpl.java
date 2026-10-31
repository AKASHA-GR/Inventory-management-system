package com.xworks.inventoryManagement.repository.impl;

import com.xworks.inventoryManagement.entity.ProductEntity;
import com.xworks.inventoryManagement.repository.ProductRepository;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
public class ProductRepositoryImpl implements ProductRepository {

    @PersistenceContext
    private EntityManager entityManager;

    public void ProductRepositoryImpl(){
        System.out.println("The Product repository Implementation is created.");
    }

    @Override
    public ProductEntity save(ProductEntity productEntity) {
        entityManager.persist(productEntity);
        return productEntity;
    }

    @Override
    public ProductEntity findById(Integer id) {
        return entityManager.find(ProductEntity.class,id);
    }

    @Override
    public List<ProductEntity> findAll() {
        return entityManager.createNamedQuery("findAll", ProductEntity.class).getResultList();
    }

    @Override
    public ProductEntity update(ProductEntity productEntity) {
        return entityManager.merge(productEntity);
    }

    @Override
    public void deleteById(Integer id) {
        ProductEntity product = findById(id);
        if(product != null){
            entityManager.remove(product);
        }
    }
}
