package com.xworks.inventoryManagement.repository;

import com.xworks.inventoryManagement.entity.RegisterEntity;

public interface LoginRepository {
    RegisterEntity findByEmail(String email);
}
