package com.xworks.inventoryManagement.service;

import com.xworks.inventoryManagement.dto.ProductDTO;

import java.util.List;

public interface ProductService {
    boolean save(ProductDTO productDTO);

    ProductDTO findById(Integer id);

    List<ProductDTO> findAll();

    boolean update(ProductDTO productDTO);

    boolean deleteById(Integer id);
}
