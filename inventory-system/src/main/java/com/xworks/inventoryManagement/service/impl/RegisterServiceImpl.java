package com.xworks.inventoryManagement.service.impl;

import com.xworks.inventoryManagement.dto.RegisterDTO;
import com.xworks.inventoryManagement.service.RegisterService;
import org.springframework.stereotype.Service;

@Service
public class RegisterServiceImpl implements RegisterService {


    @Override
    public boolean validateAndSave(RegisterDTO registerDTO) {
        return false;
    }
}
