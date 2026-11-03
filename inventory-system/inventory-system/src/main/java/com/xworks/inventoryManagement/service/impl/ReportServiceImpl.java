package com.xworks.inventoryManagement.service.impl;

import com.xworks.inventoryManagement.dto.InventoryReportDTO;
import com.xworks.inventoryManagement.dto.ProductDTO;
import com.xworks.inventoryManagement.dto.SalesReportDTO;
import com.xworks.inventoryManagement.service.OrderService;
import com.xworks.inventoryManagement.service.ProductService;
import com.xworks.inventoryManagement.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class ReportServiceImpl implements ReportService {

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderService orderService;

    @Override
    public InventoryReportDTO getInventoryReport() {
        InventoryReportDTO report = new InventoryReportDTO();
        List<ProductDTO> products = productService.findAll();

        // Total products
        report.setTotalProducts(products.size());

        // Total categories
        report.setTotalCategories((int) products.stream()
                .map(ProductDTO::getCategory)
                .distinct()
                .count());

        // Low stock products (quantity < 10)
        report.setLowStockProducts((int) products.stream()
                .filter(p -> p.getQuantity() > 0 && p.getQuantity() < 10)
                .count());

        // Out of stock products
        report.setOutOfStockProducts((int) products.stream()
                .filter(p -> p.getQuantity() == 0)
                .count());

        // Total inventory value
        report.setTotalInventoryValue(products.stream()
                .map(p -> p.getPrice().multiply(BigDecimal.valueOf(p.getQuantity())))
                .reduce(BigDecimal.ZERO, BigDecimal::add));

        // Products by category
        report.setProductsByCategory(products.stream()
                .collect(Collectors.groupingBy(
                        ProductDTO::getCategory,
                        Collectors.collectingAndThen(Collectors.counting(), Long::intValue)
                )));

        // Low stock by category
        report.setLowStockByCategory(products.stream()
                .filter(p -> p.getQuantity() > 0 && p.getQuantity() < 10)
                .collect(Collectors.groupingBy(
                        ProductDTO::getCategory,
                        Collectors.collectingAndThen(Collectors.counting(), Long::intValue)
                )));

        return report;
    }

    @Override
    public SalesReportDTO getSalesReport() {
        SalesReportDTO report = new SalesReportDTO();
        List<SalesReportDTO> orders = orderService.findAll().stream()
                .map(orderDTO -> {
                    SalesReportDTO temp = new SalesReportDTO();
                    return temp;
                })
                .collect(Collectors.toList());

        // Total orders
        report.setTotalOrders(orderService.findAll().size());

        // Calculate totals from actual orders
        List<com.xworks.inventoryManagement.dto.OrderDTO> actualOrders = orderService.findAll();
        
        // Total revenue
        report.setTotalRevenue(actualOrders.stream()
                .map(com.xworks.inventoryManagement.dto.OrderDTO::getTotalAmount)
                .reduce(BigDecimal.ZERO, BigDecimal::add));

        // Average order value
        if (report.getTotalOrders() > 0) {
            report.setAverageOrderValue(report.getTotalRevenue()
                    .divide(BigDecimal.valueOf(report.getTotalOrders()), 2, java.math.RoundingMode.HALF_UP));
        } else {
            report.setAverageOrderValue(BigDecimal.ZERO);
        }

        // Orders by status
        Map<String, Integer> ordersByStatus = new HashMap<>();
        Map<String, BigDecimal> revenueByStatus = new HashMap<>();

        for (com.xworks.inventoryManagement.dto.OrderDTO order : actualOrders) {
            String status = order.getStatus();
            ordersByStatus.put(status, ordersByStatus.getOrDefault(status, 0) + 1);
            revenueByStatus.put(status, revenueByStatus.getOrDefault(status, BigDecimal.ZERO)
                    .add(order.getTotalAmount()));
        }

        report.setOrdersByStatus(ordersByStatus);
        report.setRevenueByStatus(revenueByStatus);

        // Status counts
        report.setPendingOrders(ordersByStatus.getOrDefault("Pending", 0));
        report.setProcessingOrders(ordersByStatus.getOrDefault("Processing", 0));
        report.setShippedOrders(ordersByStatus.getOrDefault("Shipped", 0));
        report.setDeliveredOrders(ordersByStatus.getOrDefault("Delivered", 0));
        report.setCancelledOrders(ordersByStatus.getOrDefault("Cancelled", 0));

        return report;
    }
}
