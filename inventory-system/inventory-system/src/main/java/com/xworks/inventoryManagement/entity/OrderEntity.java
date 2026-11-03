package com.xworks.inventoryManagement.entity;

import lombok.Data;
import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@Entity
@NamedQueries(
        @NamedQuery(name = "findAllOrders", query = "SELECT o FROM OrderEntity o")
)
@Table(name = "orders")
public class OrderEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false, length = 100)
    private String customerName;

    @Column(nullable = false, length = 100)
    private String customerEmail;

    @Column(nullable = false, length = 15)
    private String customerPhone;

    @Column(nullable = false, length = 200)
    private String shippingAddress;

    @Column(nullable = false)
    private BigDecimal totalAmount;

    @Column(nullable = false)
    private String status;

    @Column(name = "order_date")
    private LocalDateTime orderDate;

    @Column(name = "delivery_date")
    private LocalDateTime deliveryDate;

    @Column(length = 500)
    private String notes;

    @PrePersist
    protected void onCreate() {
        orderDate = LocalDateTime.now();
    }

    @PreUpdate
    protected void onUpdate() {
    }
}
