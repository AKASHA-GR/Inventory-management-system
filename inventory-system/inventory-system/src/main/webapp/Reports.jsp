<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reports - Inventory Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .stat-card {
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease;
        }
        .stat-card:hover {
            transform: translateY(-5px);
        }
        .stat-icon {
            font-size: 2.5rem;
            opacity: 0.8;
        }
        .report-section {
            background-color: #f8f9fa;
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 25px;
        }
        .category-badge {
            font-size: 0.85rem;
            margin: 3px;
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
                    <a class="nav-link" href="Dashboard">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Products">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Orders">Orders</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="Reports">Reports</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Login">Login</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <h2 class="mb-4">📊 Inventory Reports Dashboard</h2>

    <!-- Inventory Report Section -->
    <div class="report-section">
        <h4 class="mb-4">📦 Inventory Summary</h4>
        <div class="row g-4">
            <div class="col-12 col-md-6 col-lg-3">
                <div class="stat-card bg-primary text-white p-4">
                    <div class="stat-icon">📦</div>
                    <h5 class="mt-2">Total Products</h5>
                    <h2>${inventoryReport.totalProducts}</h2>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-3">
                <div class="stat-card bg-info text-white p-4">
                    <div class="stat-icon">🏷️</div>
                    <h5 class="mt-2">Categories</h5>
                    <h2>${inventoryReport.totalCategories}</h2>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-3">
                <div class="stat-card bg-warning text-dark p-4">
                    <div class="stat-icon">⚠️</div>
                    <h5 class="mt-2">Low Stock</h5>
                    <h2>${inventoryReport.lowStockProducts}</h2>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-3">
                <div class="stat-card bg-danger text-white p-4">
                    <div class="stat-icon">🚫</div>
                    <h5 class="mt-2">Out of Stock</h5>
                    <h2>${inventoryReport.outOfStockProducts}</h2>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0">Products by Category</h5>
                    </div>
                    <div class="card-body">
                        <c:forEach var="entry" items="${inventoryReport.productsByCategory}">
                            <span class="badge bg-secondary category-badge">
                                ${entry.key}: ${entry.value}
                            </span>
                        </c:forEach>
                        <c:if test="${empty inventoryReport.productsByCategory}">
                            <p class="text-muted">No category data available</p>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-warning text-dark">
                        <h5 class="mb-0">Low Stock by Category</h5>
                    </div>
                    <div class="card-body">
                        <c:forEach var="entry" items="${inventoryReport.lowStockByCategory}">
                            <span class="badge bg-warning text-dark category-badge">
                                ${entry.key}: ${entry.value}
                            </span>
                        </c:forEach>
                        <c:if test="${empty inventoryReport.lowStockByCategory}">
                            <p class="text-muted">No low stock items</p>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-12">
                <div class="card">
                    <div class="card-header bg-success text-white">
                        <h5 class="mb-0">Total Inventory Value</h5>
                    </div>
                    <div class="card-body">
                        <h3 class="text-success">$${inventoryReport.totalInventoryValue}</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Sales Report Section -->
    <div class="report-section">
        <h4 class="mb-4">💰 Sales Analytics</h4>
        <div class="row g-4">
            <div class="col-12 col-md-6 col-lg-3">
                <div class="stat-card bg-success text-white p-4">
                    <div class="stat-icon">🛒</div>
                    <h5 class="mt-2">Total Orders</h5>
                    <h2>${salesReport.totalOrders}</h2>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-3">
                <div class="stat-card bg-primary text-white p-4">
                    <div class="stat-icon">💵</div>
                    <h5 class="mt-2">Total Revenue</h5>
                    <h4>$${salesReport.totalRevenue}</h4>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-3">
                <div class="stat-card bg-info text-white p-4">
                    <div class="stat-icon">📊</div>
                    <h5 class="mt-2">Avg Order Value</h5>
                    <h4>$${salesReport.averageOrderValue}</h4>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-3">
                <div class="stat-card bg-success text-white p-4">
                    <div class="stat-icon">✅</div>
                    <h5 class="mt-2">Delivered</h5>
                    <h2>${salesReport.deliveredOrders}</h2>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-dark text-white">
                        <h5 class="mb-0">Orders by Status</h5>
                    </div>
                    <div class="card-body">
                        <table class="table table-sm">
                            <tr>
                                <td><span class="badge bg-warning text-dark">Pending</span></td>
                                <td class="text-end">${salesReport.pendingOrders}</td>
                            </tr>
                            <tr>
                                <td><span class="badge bg-info">Processing</span></td>
                                <td class="text-end">${salesReport.processingOrders}</td>
                            </tr>
                            <tr>
                                <td><span class="badge bg-primary">Shipped</span></td>
                                <td class="text-end">${salesReport.shippedOrders}</td>
                            </tr>
                            <tr>
                                <td><span class="badge bg-success">Delivered</span></td>
                                <td class="text-end">${salesReport.deliveredOrders}</td>
                            </tr>
                            <tr>
                                <td><span class="badge bg-danger">Cancelled</span></td>
                                <td class="text-end">${salesReport.cancelledOrders}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0">Revenue by Status</h5>
                    </div>
                    <div class="card-body">
                        <c:forEach var="entry" items="${salesReport.revenueByStatus}">
                            <div class="d-flex justify-content-between mb-2">
                                <span><span class="badge bg-secondary">${entry.key}</span></span>
                                <span class="fw-bold">$${entry.value}</span>
                            </div>
                        </c:forEach>
                        <c:if test="${empty salesReport.revenueByStatus}">
                            <p class="text-muted">No revenue data available</p>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
