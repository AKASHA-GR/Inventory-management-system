package com.xworks.inventoryManagement.service.impl;

import com.xworks.inventoryManagement.dto.LoginDTO;
import com.xworks.inventoryManagement.entity.RegisterEntity;
import com.xworks.inventoryManagement.repository.LoginRepository;
import com.xworks.inventoryManagement.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginRepository loginRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    public LoginServiceImpl() {
        System.out.println("The LoginServiceImpl is created.");
    }

    @Override
    public boolean login(LoginDTO loginDTO) {
        if (loginDTO != null && loginDTO.getEmail() != null && loginDTO.getPassword() != null) {
            System.out.println("Attempting login for email: " + loginDTO.getEmail());
            
            RegisterEntity user = loginRepository.findByEmail(loginDTO.getEmail());
            
            if (user != null) {
                System.out.println("User found: " + user.getEmail());
                boolean passwordMatch = bCryptPasswordEncoder.matches(loginDTO.getPassword(), user.getPassword());
                
                if (passwordMatch) {
                    System.out.println("Login successful for: " + user.getEmail());
                    return true;
                } else {
                    System.out.println("Password mismatch for: " + user.getEmail());
                }
            } else {
                System.out.println("User not found with email: " + loginDTO.getEmail());
            }
        }
        return false;
    }
}
