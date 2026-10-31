package com.xworks.inventoryManagement.service.impl;

import com.xworks.inventoryManagement.dto.ProductDTO;
import com.xworks.inventoryManagement.repository.ProductRepository;
import com.xworks.inventoryManagement.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Override
    public boolean save(ProductDTO productDTO) {
        return false;
    }

    @Override
    public ProductDTO findById(Integer id) {
        return null;
    }

    @Override
    public List<ProductDTO> findAll() {
        return Collections.emptyList();
    }

    @Override
    public boolean update(ProductDTO productDTO) {
        return false;
    }

    @Override
    public boolean deleteById(Integer id) {
        return false;
    }
}
