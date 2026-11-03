package com.xworks.inventoryManagement.service;

import com.xworks.inventoryManagement.dto.OrderDTO;

import java.util.List;

public interface OrderService {
    boolean save(OrderDTO orderDTO);

    OrderDTO findById(Integer id);

    List<OrderDTO> findAll();

    boolean update(OrderDTO orderDTO);

    boolean deleteById(Integer id);
}
