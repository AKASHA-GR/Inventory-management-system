package com.xworks.inventoryManagement.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.*;

@Data
@Getter
@Setter
@ToString
public class RegisterDTO {
    @NotBlank
    @Size(min = 3,max = 10,message = "The name should be 3 to 10 character")
    private String firstName;

    @NotBlank
    @Size(min = 1,max = 10,message = "The name should be 1 to 10 character")
    private String lastName;

    @NotBlank
    @Email
    private String email;

    @NotNull
    @Min(value = 10, message = "The phoneNumber is must have 10 number")
    private Long phoneNumber;

    @NotBlank
    @Size(min = 3,max = 10,message = "The name should be 3 to 10 character")
    private String password;

    @NotBlank
    @Size(min = 3,max = 10,message = "The name should be 3 to 10 character")
    private String confirmPassword;
}
