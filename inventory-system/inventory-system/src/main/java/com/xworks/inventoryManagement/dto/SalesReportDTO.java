package com.xworks.inventoryManagement.dto;

import lombok.Data;
import java.math.BigDecimal;
import java.util.Map;

@Data
public class SalesReportDTO {
    private Integer totalOrders;
    private BigDecimal totalRevenue;
    private BigDecimal averageOrderValue;
    private Integer pendingOrders;
    private Integer processingOrders;
    private Integer shippedOrders;
    private Integer deliveredOrders;
    private Integer cancelledOrders;
    private Map<String, Integer> ordersByStatus;
    private Map<String, BigDecimal> revenueByStatus;
}
