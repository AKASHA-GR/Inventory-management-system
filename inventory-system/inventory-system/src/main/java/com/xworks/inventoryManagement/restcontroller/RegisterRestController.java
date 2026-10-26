package com.xworks.inventoryManagement.restcontroller;

import com.xworks.inventoryManagement.service.RegisterService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/")
@AllArgsConstructor
public class RegisterRestController {

    private RegisterService service;

    @GetMapping("checkEmailExit/{email}")
    public String checkEmailExit(@PathVariable("email")String email){
        System.out.println("Invoking checkEmailExit:"+email);
        return service.findEmail(email);
    }
}
