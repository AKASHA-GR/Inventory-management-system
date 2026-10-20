package com.xworks.inventoryManagement.dto;

import lombok.Data;
import javax.validation.constraints.*;

@Data
public class RegisterDTO {
    @NotBlank(message = "First name is required")
    @Size(min = 3, max = 10, message = "The first name should be 3 to 10 characters")
    private String firstName;

    @NotBlank(message = "Last name is required")
    @Size(min = 1, max = 10, message = "The last name should be 1 to 10 characters")
    private String lastName;

    @NotBlank(message = "Email is required")
    @Email(message = "Please provide a valid email address")
    private String email;

    @NotBlank(message = "Phone number is required")
    @Pattern(regexp = "^[0-9]{10}$", message = "Phone number must be exactly 10 digits")
    private String phoneNumber;

    @NotBlank(message = "Password is required")
    @Size(min = 3, max = 20, message = "The password should be 3 to 20 characters")
    private String password;

    @NotBlank(message = "Confirm password is required")
    private String confirmPassword;
}