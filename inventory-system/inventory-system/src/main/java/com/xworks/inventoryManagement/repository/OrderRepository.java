package com.xworks.inventoryManagement.repository;

import com.xworks.inventoryManagement.entity.OrderEntity;

import java.util.List;

public interface OrderRepository {

    OrderEntity save(OrderEntity orderEntity);

    OrderEntity findById(Integer id);

    List<OrderEntity> findAll();

    OrderEntity update(OrderEntity orderEntity);

    void deleteById(Integer id);

}
