<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Inventory Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .stat-card {
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            height: 100%;
        }
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }
        .stat-icon {
            font-size: 2.5rem;
            opacity: 0.8;
        }
        .quick-action-card {
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
            transition: transform 0.2s ease;
            height: 100%;
            text-decoration: none;
            color: inherit;
        }
        .quick-action-card:hover {
            transform: translateY(-3px);
            text-decoration: none;
            color: inherit;
        }
        .recent-item {
            border-left: 3px solid #007bff;
            padding-left: 12px;
            margin-bottom: 12px;
        }
        .recent-item.low-stock {
            border-left-color: #ffc107;
        }
        .recent-item.out-of-stock {
            border-left-color: #dc3545;
        }
    </style>
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
                    <a class="nav-link active" href="Dashboard">Dashboard</a>
                </li>
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

<div class="container mt-4">
    <h2 class="mb-4">🏠 Dashboard</h2>

    <!-- Stats Cards -->
    <div class="row g-4 mb-4">
        <div class="col-12 col-md-6 col-lg-3">
            <div class="stat-card bg-primary text-white p-4">
                <div class="stat-icon">📦</div>
                <h5 class="mt-2">Total Products</h5>
                <h2>${totalProducts}</h2>
                <a href="Products" class="text-white text-decoration-none">View All →</a>
            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-3">
            <div class="stat-card bg-success text-white p-4">
                <div class="stat-icon">🛒</div>
                <h5 class="mt-2">Total Orders</h5>
                <h2>${totalOrders}</h2>
                <a href="Orders" class="text-white text-decoration-none">View All →</a>
            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-3">
            <div class="stat-card bg-info text-white p-4">
                <div class="stat-icon">💰</div>
                <h5 class="mt-2">Total Revenue</h5>
                <h4>$${totalRevenue}</h4>
                <a href="Reports" class="text-white text-decoration-none">View Reports →</a>
            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-3">
            <div class="stat-card bg-warning text-dark p-4">
                <div class="stat-icon">⚠️</div>
                <h5 class="mt-2">Low Stock</h5>
                <h2>${lowStockCount}</h2>
                <a href="Products" class="text-dark text-decoration-none">Manage →</a>
            </div>
        </div>
    </div>

    <!-- Additional Stats -->
    <div class="row g-4 mb-4">
        <div class="col-12 col-md-4">
            <div class="stat-card bg-secondary text-white p-4">
                <div class="stat-icon">🏷️</div>
                <h5 class="mt-2">Categories</h5>
                <h3>${totalCategories}</h3>
            </div>
        </div>
        <div class="col-12 col-md-4">
            <div class="stat-card bg-danger text-white p-4">
                <div class="stat-icon">🚫</div>
                <h5 class="mt-2">Out of Stock</h5>
                <h3>${outOfStockCount}</h3>
            </div>
        </div>
        <div class="col-12 col-md-4">
            <div class="stat-card bg-dark text-white p-4">
                <div class="stat-icon">💵</div>
                <h5 class="mt-2">Inventory Value</h5>
                <h4>$${inventoryValue}</h4>
            </div>
        </div>
    </div>

    <!-- Quick Actions -->
    <div class="row g-4 mb-4">
        <div class="col-12">
            <h4 class="mb-3">⚡ Quick Actions</h4>
        </div>
        <div class="col-12 col-md-3">
            <a href="AddProduct" class="quick-action-card card p-4 text-center">
                <div class="stat-icon">➕</div>
                <h5 class="mt-2">Add Product</h5>
                <p class="text-muted small">Create new product</p>
            </a>
        </div>
        <div class="col-12 col-md-3">
            <a href="AddOrder" class="quick-action-card card p-4 text-center">
                <div class="stat-icon">🛒</div>
                <h5 class="mt-2">New Order</h5>
                <p class="text-muted small">Create new order</p>
            </a>
        </div>
        <div class="col-12 col-md-3">
            <a href="Products" class="quick-action-card card p-4 text-center">
                <div class="stat-icon">📦</div>
                <h5 class="mt-2">Manage Products</h5>
                <p class="text-muted small">View and edit products</p>
            </a>
        </div>
        <div class="col-12 col-md-3">
            <a href="Reports" class="quick-action-card card p-4 text-center">
                <div class="stat-icon">📊</div>
                <h5 class="mt-2">View Reports</h5>
                <p class="text-muted small">Analytics and insights</p>
            </a>
        </div>
    </div>

    <!-- Recent Products & Orders -->
    <div class="row g-4">
        <div class="col-12 col-lg-6">
            <div class="card">
                <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">📦 Recent Products</h5>
                    <a href="Products" class="text-white text-decoration-none small">View All →</a>
                </div>
                <div class="card-body">
                    <c:if test="${not empty recentProducts}">
                        <c:forEach var="product" items="${recentProducts}">
                            <div class="recent-item ${product.quantity == 0 ? 'out-of-stock' : product.quantity < 10 ? 'low-stock' : ''}">
                                <div class="d-flex justify-content-between align-items-start">
                                    <div>
                                        <h6 class="mb-1">${product.name}</h6>
                                        <small class="text-muted">${product.category}</small>
                                    </div>
                                    <div class="text-end">
                                        <div class="fw-bold">$${product.price}</div>
                                        <small class="${product.quantity == 0 ? 'text-danger' : product.quantity < 10 ? 'text-warning' : 'text-success'}">
                                            Qty: ${product.quantity}
                                        </small>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty recentProducts}">
                        <p class="text-muted text-center">No products added yet</p>
                    </c:if>
                </div>
            </div>
        </div>

        <div class="col-12 col-lg-6">
            <div class="card">
                <div class="card-header bg-success text-white d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">🛒 Recent Orders</h5>
                    <a href="Orders" class="text-white text-decoration-none small">View All →</a>
                </div>
                <div class="card-body">
                    <c:if test="${not empty recentOrders}">
                        <c:forEach var="order" items="${recentOrders}">
                            <div class="recent-item">
                                <div class="d-flex justify-content-between align-items-start">
                                    <div>
                                        <h6 class="mb-1">${order.customerName}</h6>
                                        <small class="text-muted">${order.customerEmail}</small>
                                    </div>
                                    <div class="text-end">
                                        <div class="fw-bold">$${order.totalAmount}</div>
                                        <span class="badge ${order.status == 'Delivered' ? 'bg-success' : order.status == 'Pending' ? 'bg-warning text-dark' : order.status == 'Cancelled' ? 'bg-danger' : 'bg-info'}">
                                            ${order.status}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty recentOrders}">
                        <p class="text-muted text-center">No orders placed yet</p>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <!-- Order Status Summary -->
    <div class="row g-4 mt-2">
        <div class="col-12">
            <div class="card">
                <div class="card-header bg-dark text-white">
                    <h5 class="mb-0">📊 Order Status Summary</h5>
                </div>
                <div class="card-body">
                    <div class="row text-center">
                        <div class="col-6 col-md-2 mb-3">
                            <div class="p-3 bg-light rounded">
                                <h4 class="text-warning">${pendingOrders}</h4>
                                <small class="text-muted">Pending</small>
                            </div>
                        </div>
                        <div class="col-6 col-md-2 mb-3">
                            <div class="p-3 bg-light rounded">
                                <h4 class="text-info">${processingOrders}</h4>
                                <small class="text-muted">Processing</small>
                            </div>
                        </div>
                        <div class="col-6 col-md-2 mb-3">
                            <div class="p-3 bg-light rounded">
                                <h4 class="text-primary">${shippedOrders}</h4>
                                <small class="text-muted">Shipped</small>
                            </div>
                        </div>
                        <div class="col-6 col-md-2 mb-3">
                            <div class="p-3 bg-light rounded">
                                <h4 class="text-success">${deliveredOrders}</h4>
                                <small class="text-muted">Delivered</small>
                            </div>
                        </div>
                        <div class="col-6 col-md-2 mb-3">
                            <div class="p-3 bg-light rounded">
                                <h4 class="text-danger">${cancelledOrders}</h4>
                                <small class="text-muted">Cancelled</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
