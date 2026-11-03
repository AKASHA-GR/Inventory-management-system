package com.xworks.inventoryManagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class ReportController {

    public ReportController(){
        System.out.println("The ReportController is created");
    }

    @GetMapping("Reports")
    public String openReports(){
        return "redirect:/ReportDashboard";
    }
}
