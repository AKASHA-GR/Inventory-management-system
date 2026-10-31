package com.xworks.inventoryManagement.repository;

import com.xworks.inventoryManagement.entity.ProductEntity;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface ProductRepository {

    ProductEntity save(ProductEntity productEntity);

    ProductEntity findById(Integer id);

    List<ProductEntity> findAll();

    ProductEntity update(ProductEntity productEntity);

    void deleteById(Integer id);

}
