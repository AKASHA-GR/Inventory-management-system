package com.xworks.inventoryManagement.repository;

import com.xworks.inventoryManagement.entity.RegisterEntity;

public interface RegisterRepository {
    public boolean save(RegisterEntity registerEntity);
}
