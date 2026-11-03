package com.xworks.inventoryManagement.dto;

import lombok.Data;
import java.math.BigDecimal;
import java.util.Map;

@Data
public class InventoryReportDTO {
    private Integer totalProducts;
    private Integer totalCategories;
    private Integer lowStockProducts;
    private Integer outOfStockProducts;
    private BigDecimal totalInventoryValue;
    private Map<String, Integer> productsByCategory;
    private Map<String, Integer> lowStockByCategory;
}
