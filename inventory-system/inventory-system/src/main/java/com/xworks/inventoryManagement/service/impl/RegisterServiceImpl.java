package com.xworks.inventoryManagement.service.impl;

import com.xworks.inventoryManagement.dto.RegisterDTO;
import com.xworks.inventoryManagement.entity.RegisterEntity;
import com.xworks.inventoryManagement.repository.RegisterRepository;
import com.xworks.inventoryManagement.service.RegisterService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegisterServiceImpl implements RegisterService {

    @Autowired
    private RegisterRepository registerRepository;

    @Override
    public boolean validateAndSave(RegisterDTO registerDTO) {
        if(registerDTO != null){
            RegisterEntity registerEntity = new RegisterEntity();
            BeanUtils.copyProperties(registerDTO,registerEntity);
            return registerRepository.save(registerEntity);
        }
        return false;
    }
}
