package com.xworks.inventoryManagement.controller;

import com.xworks.inventoryManagement.dto.RegisterDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequestMapping("/")
public class RegisterController {

    public RegisterController(){
        System.out.println("The RegisterController is created");
    }

    @GetMapping("Register")
    public String openRegister(){
        return "Register";
    }

    @PostMapping("register")
    public String register(Model model, @Valid RegisterDTO registerDTO, BindingResult bindingResult){
        System.out.println("The ");
        return "Register";
    }
}
