package com.xworks.inventoryManagement.repository.impl;

import com.xworks.inventoryManagement.entity.OrderEntity;
import com.xworks.inventoryManagement.repository.OrderRepository;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
public class OrderRepositoryImpl implements OrderRepository {

    @PersistenceContext
    private EntityManager entityManager;

    public OrderRepositoryImpl(){
        System.out.println("The Order repository Implementation is created.");
    }

    @Override
    public OrderEntity save(OrderEntity orderEntity) {
        entityManager.persist(orderEntity);
        return orderEntity;
    }

    @Override
    public OrderEntity findById(Integer id) {
        return entityManager.find(OrderEntity.class, id);
    }

    @Override
    public List<OrderEntity> findAll() {
        return entityManager.createNamedQuery("findAllOrders", OrderEntity.class).getResultList();
    }

    @Override
    public OrderEntity update(OrderEntity orderEntity) {
        return entityManager.merge(orderEntity);
    }

    @Override
    public void deleteById(Integer id) {
        OrderEntity order = findById(id);
        if(order != null){
            entityManager.remove(order);
        }
    }
}
