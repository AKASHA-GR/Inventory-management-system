package com.xworks.inventoryManagement.service;

import com.xworks.inventoryManagement.dto.InventoryReportDTO;
import com.xworks.inventoryManagement.dto.SalesReportDTO;

public interface ReportService {
    InventoryReportDTO getInventoryReport();
    
    SalesReportDTO getSalesReport();
}
