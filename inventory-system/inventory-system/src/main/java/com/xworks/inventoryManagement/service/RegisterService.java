package com.xworks.inventoryManagement.service;

import com.xworks.inventoryManagement.dto.RegisterDTO;

public interface RegisterService {
    public boolean validateAndSave(RegisterDTO registerDTO);
    String findEmail(String email);
}
