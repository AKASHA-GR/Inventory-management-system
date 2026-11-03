package com.xworks.inventoryManagement.restcontroller;

import com.xworks.inventoryManagement.dto.InventoryReportDTO;
import com.xworks.inventoryManagement.dto.SalesReportDTO;
import com.xworks.inventoryManagement.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class ReportRestController {

    @Autowired
    private ReportService reportService;

    public ReportRestController(){
        System.out.println("ReportController created.");
    }

    @GetMapping("ReportDashboard")
    public String viewReports(Model model){
        InventoryReportDTO inventoryReport = reportService.getInventoryReport();
        SalesReportDTO salesReport = reportService.getSalesReport();
        
        model.addAttribute("inventoryReport", inventoryReport);
        model.addAttribute("salesReport", salesReport);
        
        return "Reports";
    }
}
