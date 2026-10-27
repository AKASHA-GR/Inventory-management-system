package com.xworks.inventoryManagement.dto;

import lombok.Data;
import javax.validation.constraints.*;

@Data
public class LoginDTO {
    @NotBlank(message = "Email is required")
    @Email(message = "Please provide a valid email address")
    private String email;

    @NotBlank(message = "Password is required")
    private String password;
}
