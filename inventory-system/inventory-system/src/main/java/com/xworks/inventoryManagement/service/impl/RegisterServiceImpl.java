package com.xworks.inventoryManagement.service.impl;

import com.xworks.inventoryManagement.dto.RegisterDTO;
import com.xworks.inventoryManagement.entity.RegisterEntity;
import com.xworks.inventoryManagement.repository.RegisterRepository;
import com.xworks.inventoryManagement.service.RegisterService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class RegisterServiceImpl implements RegisterService {

    @Autowired
    private RegisterRepository registerRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    public RegisterServiceImpl(){
        System.out.println("The RegisterServiceImpl is created.");
    }


    @Override
    public boolean validateAndSave(RegisterDTO registerDTO) {
        if(registerDTO != null){
            System.out.println("DTO received: " + registerDTO);
            RegisterEntity registerEntity = new RegisterEntity();
            String password = bCryptPasswordEncoder.encode(registerDTO.getPassword());
            System.out.println("Encoded password:"+password);
            registerDTO.setPassword(password);

            BeanUtils.copyProperties(registerDTO,registerEntity);
            System.out.println("Entity before save: " + registerEntity);
            registerRepository.save(registerEntity);
            return true;
        }
        return false;
    }

    @Override
    public String findEmail(String email) {
        System.out.println("Invoking findEmail:Service"+email);

        String status = null;

        if(email != null){
            boolean isCheck = registerRepository.emailExist(email);

            status = (isCheck)? "Email Id Already Exist ":"Email Id id not Exist";
        }
        return status;
    }
}
