package com.xworks.inventoryManagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class LoginController {

    public LoginController(){
        System.out.println("The LoginController is created");
    }

    @GetMapping("Login")
    public String openLogin(){
        return "Login";
    }
}
