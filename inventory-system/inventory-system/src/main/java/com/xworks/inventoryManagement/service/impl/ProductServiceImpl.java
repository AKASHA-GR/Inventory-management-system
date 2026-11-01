package com.xworks.inventoryManagement.service.impl;

import com.xworks.inventoryManagement.dto.ProductDTO;
import com.xworks.inventoryManagement.entity.ProductEntity;
import com.xworks.inventoryManagement.repository.ProductRepository;
import com.xworks.inventoryManagement.service.ProductService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Override
    public boolean save(ProductDTO productDTO) {
        ProductEntity productEntity = new ProductEntity();
        BeanUtils.copyProperties(productDTO,productEntity);
        ProductEntity savedEntity = productRepository.save(productEntity);
        return savedEntity != null;
    }

    @Override
    public ProductDTO findById(Integer id) {
        ProductEntity productEntity = productRepository.findById(id);
        if(productEntity != null){
            ProductDTO productDTO = new ProductDTO();
            BeanUtils.copyProperties(productEntity,productDTO);
            return productDTO;
        }
        return null;
    }

    @Override
    public List<ProductDTO> findAll() {
        List<ProductEntity> entities = productRepository.findAll();
        return entities.stream()
                .map(entity -> {
                    ProductDTO dto = new ProductDTO();
                    BeanUtils.copyProperties(entity, dto);
                    return dto;
                })
                .collect(Collectors.toList());
    }

    @Override
    public boolean update(ProductDTO productDTO) {
        ProductEntity productEntity = new ProductEntity();
        BeanUtils.copyProperties(productDTO, productEntity);
        ProductEntity updatedEntity = productRepository.update(productEntity);
        return updatedEntity != null;
    }

    @Override
    public boolean deleteById(Integer id) {
        productRepository.deleteById(id);
        return true;
    }
}
