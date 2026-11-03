package com.xworks.inventoryManagement.restcontroller;

import com.xworks.inventoryManagement.dto.InventoryReportDTO;
import com.xworks.inventoryManagement.dto.ProductDTO;
import com.xworks.inventoryManagement.dto.SalesReportDTO;
import com.xworks.inventoryManagement.service.OrderService;
import com.xworks.inventoryManagement.service.ProductService;
import com.xworks.inventoryManagement.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/")
public class DashboardRestController {

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private ReportService reportService;

    public DashboardRestController(){
        System.out.println("DashboardController created.");
    }

    @GetMapping("DashboardHome")
    public String viewDashboard(Model model){
        // Get basic stats
        List<ProductDTO> products = productService.findAll();
        List<com.xworks.inventoryManagement.dto.OrderDTO> orders = orderService.findAll();
        InventoryReportDTO inventoryReport = reportService.getInventoryReport();
        SalesReportDTO salesReport = reportService.getSalesReport();

        // Get recent products (last 5)
        List<ProductDTO> recentProducts = products.stream()
                .skip(Math.max(0, products.size() - 5))
                .collect(java.util.stream.Collectors.toList());

        // Get recent orders (last 5)
        List<com.xworks.inventoryManagement.dto.OrderDTO> recentOrders = orders.stream()
                .skip(Math.max(0, orders.size() - 5))
                .collect(java.util.stream.Collectors.toList());

        model.addAttribute("totalProducts", products.size());
        model.addAttribute("totalOrders", orders.size());
        model.addAttribute("totalCategories", inventoryReport.getTotalCategories());
        model.addAttribute("totalRevenue", salesReport.getTotalRevenue());
        model.addAttribute("lowStockCount", inventoryReport.getLowStockProducts());
        model.addAttribute("outOfStockCount", inventoryReport.getOutOfStockProducts());
        model.addAttribute("pendingOrders", salesReport.getPendingOrders());
        model.addAttribute("deliveredOrders", salesReport.getDeliveredOrders());
        model.addAttribute("recentProducts", recentProducts);
        model.addAttribute("recentOrders", recentOrders);
        model.addAttribute("inventoryValue", inventoryReport.getTotalInventoryValue());

        return "Dashboard";
    }
}
