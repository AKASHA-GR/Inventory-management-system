package com.xworks.inventoryManagement.dto;

import lombok.Data;

import javax.validation.constraints.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
public class OrderDTO {
    private Integer id;

    @NotBlank(message = "Customer name is required")
    @Size(max = 100, message = "Name must not exceed 100 characters")
    private String customerName;

    @NotBlank(message = "Customer email is required")
    @Email(message = "Invalid email format")
    @Size(max = 100, message = "Email must not exceed 100 characters")
    private String customerEmail;

    @NotBlank(message = "Customer phone is required")
    @Size(max = 15, message = "Phone must not exceed 15 characters")
    private String customerPhone;

    @NotBlank(message = "Shipping address is required")
    @Size(max = 200, message = "Address must not exceed 200 characters")
    private String shippingAddress;

    @NotNull(message = "Total amount is required")
    @DecimalMin(value = "0.01", message = "Amount must be greater than 0")
    private BigDecimal totalAmount;

    @NotBlank(message = "Order status is required")
    @Size(max = 50, message = "Status must not exceed 50 characters")
    private String status;

    private LocalDateTime orderDate;

    private LocalDateTime deliveryDate;

    @Size(max = 500, message = "Notes must not exceed 500 characters")
    private String notes;
}
