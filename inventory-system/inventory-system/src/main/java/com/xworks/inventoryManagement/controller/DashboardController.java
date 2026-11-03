package com.xworks.inventoryManagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class DashboardController {

    public DashboardController(){
        System.out.println("The DashboardController is created");
    }

    @GetMapping("Dashboard")
    public String openDashboard(){
        return "redirect:/DashboardHome";
    }
}
