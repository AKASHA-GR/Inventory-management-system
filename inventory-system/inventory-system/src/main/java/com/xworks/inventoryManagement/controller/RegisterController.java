package com.xworks.inventoryManagement.controller;

import com.xworks.inventoryManagement.dto.RegisterDTO;
import com.xworks.inventoryManagement.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/")
public class RegisterController {

    @Autowired
    private RegisterService registerService;

    public RegisterController(){
        System.out.println("The RegisterController is created");
    }

    @GetMapping("Register")
    public String openRegister(){
        return "Register";
    }

    @PostMapping("registered")
    public String register(Model model, @Valid RegisterDTO registerDTO, BindingResult bindingResult){
        System.out.println("The register method is created to save the customer");
        if(bindingResult.hasErrors()){
            System.out.println("There is a validation error, please fix the error ");
            List<ObjectError> errors = bindingResult.getAllErrors();
            model.addAttribute("validationErrors", errors);
        }else{
            System.out.println("There is no validation error,please continue the execute the service");
            registerService.validateAndSave(registerDTO);
            model.addAttribute("message","The user is registered successfully");
        }

        return "Register";
    }
}
