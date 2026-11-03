<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Order - Inventory Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
            <img src="images/logo.png" alt="Logo" width="150" height="60" class="d-inline-block align-text-top">
            Inventory Management
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="Products">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Orders">Orders</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Reports">Reports</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Login">Login</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow">
                <div class="card-header bg-warning text-dark">
                    <h4 class="mb-0">Edit Order</h4>
                </div>
                <div class="card-body">
                    <form action="UpdateOrder" method="post">
                        <input type="hidden" name="id" value="${orderDTO.id}">

                        <div class="mb-3">
                            <label for="customerName" class="form-label">Customer Name</label>
                            <input type="text" class="form-control" id="customerName" name="customerName"
                                   value="${orderDTO.customerName}" required>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="customerEmail" class="form-label">Customer Email</label>
                                <input type="email" class="form-control" id="customerEmail" name="customerEmail"
                                       value="${orderDTO.customerEmail}" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="customerPhone" class="form-label">Customer Phone</label>
                                <input type="text" class="form-control" id="customerPhone" name="customerPhone"
                                       value="${orderDTO.customerPhone}" required>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="shippingAddress" class="form-label">Shipping Address</label>
                            <textarea class="form-control" id="shippingAddress" name="shippingAddress" rows="3" required>${orderDTO.shippingAddress}</textarea>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="totalAmount" class="form-label">Total Amount ($)</label>
                                <input type="number" class="form-control" id="totalAmount" name="totalAmount"
                                       value="${orderDTO.totalAmount}" step="0.01" min="0.01" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="status" class="form-label">Order Status</label>
                                <select class="form-select" id="status" name="status" required>
                                    <option value="">Select Status</option>
                                    <option value="Pending" ${orderDTO.status == 'Pending' ? 'selected' : ''}>Pending</option>
                                    <option value="Processing" ${orderDTO.status == 'Processing' ? 'selected' : ''}>Processing</option>
                                    <option value="Shipped" ${orderDTO.status == 'Shipped' ? 'selected' : ''}>Shipped</option>
                                    <option value="Delivered" ${orderDTO.status == 'Delivered' ? 'selected' : ''}>Delivered</option>
                                    <option value="Cancelled" ${orderDTO.status == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
                                </select>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="deliveryDate" class="form-label">Delivery Date</label>
                            <input type="datetime-local" class="form-control" id="deliveryDate" name="deliveryDate"
                                   value="${orderDTO.deliveryDate}">
                        </div>

                        <div class="mb-3">
                            <label for="notes" class="form-label">Notes</label>
                            <textarea class="form-control" id="notes" name="notes" rows="3">${orderDTO.notes}</textarea>
                        </div>

                        <c:if test="${not empty validationErrors}">
                            <div class="alert alert-danger">
                                <ul>
                                    <c:forEach var="error" items="${validationErrors}">
                                        <li>${error.defaultMessage}</li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </c:if>

                        <div class="d-flex justify-content-between">
                            <a href="OrderList" class="btn btn-secondary">Cancel</a>
                            <button type="submit" class="btn btn-primary">Update Order</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
