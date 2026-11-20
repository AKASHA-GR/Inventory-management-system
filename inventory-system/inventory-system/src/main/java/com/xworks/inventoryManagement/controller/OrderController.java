package com.xworks.inventoryManagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class OrderController {

    public OrderController(){
        System.out.println("The OrderController is created");
    }

    @GetMapping("Orders")
    public String openOrders(){
        System.out.println("The openOrder  is created");
        return "redirect:/OrderList";
    }
}
