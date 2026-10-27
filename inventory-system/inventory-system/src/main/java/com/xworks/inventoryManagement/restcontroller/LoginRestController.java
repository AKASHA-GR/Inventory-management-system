package com.xworks.inventoryManagement.restcontroller;

import com.xworks.inventoryManagement.dto.LoginDTO;
import com.xworks.inventoryManagement.service.LoginService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/")
@AllArgsConstructor
public class LoginRestController {

    private LoginService loginService;

    @PostMapping("login")
    public String login(@RequestBody LoginDTO loginDTO) {
        System.out.println("Invoking login with email: " + loginDTO.getEmail());
        boolean loginSuccess = loginService.login(loginDTO);
        
        if (loginSuccess) {
            return "Login Successful";
        } else {
            return "Login Failed - Invalid email or password";
        }
    }
}
