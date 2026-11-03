package com.xworks.inventoryManagement.service.impl;

import com.xworks.inventoryManagement.dto.OrderDTO;
import com.xworks.inventoryManagement.entity.OrderEntity;
import com.xworks.inventoryManagement.repository.OrderRepository;
import com.xworks.inventoryManagement.service.OrderService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Override
    public boolean save(OrderDTO orderDTO) {
        System.out.println("The save method is executed on OrderServiceImpl.");
        OrderEntity orderEntity = new OrderEntity();
        BeanUtils.copyProperties(orderDTO, orderEntity);
        OrderEntity savedEntity = orderRepository.save(orderEntity);
        return savedEntity != null;
    }

    @Override
    public OrderDTO findById(Integer id) {
        OrderEntity orderEntity = orderRepository.findById(id);
        if(orderEntity != null){
            OrderDTO orderDTO = new OrderDTO();
            BeanUtils.copyProperties(orderEntity, orderDTO);
            return orderDTO;
        }
        return null;
    }

    @Override
    public List<OrderDTO> findAll() {
        List<OrderEntity> entities = orderRepository.findAll();
        return entities.stream()
                .map(entity -> {
                    OrderDTO dto = new OrderDTO();
                    BeanUtils.copyProperties(entity, dto);
                    return dto;
                })
                .collect(Collectors.toList());
    }

    @Override
    public boolean update(OrderDTO orderDTO) {
        OrderEntity orderEntity = new OrderEntity();
        BeanUtils.copyProperties(orderDTO, orderEntity);
        OrderEntity updatedEntity = orderRepository.update(orderEntity);
        return updatedEntity != null;
    }

    @Override
    public boolean deleteById(Integer id) {
        orderRepository.deleteById(id);
        return true;
    }
}
