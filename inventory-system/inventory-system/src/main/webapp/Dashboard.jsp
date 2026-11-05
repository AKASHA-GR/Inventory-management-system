<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Inventory Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }
        
        .stat-card {
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15);
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            height: 100%;
            position: relative;
            overflow: hidden;
            backdrop-filter: blur(10px);
        }
        
        .stat-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(135deg, rgba(255,255,255,0.1) 0%, rgba(255,255,255,0) 100%);
            pointer-events: none;
        }
        
        .stat-card:hover {
            transform: translateY(-8px) scale(1.02);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.25);
        }
        
        .stat-card-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        
        .stat-card-success {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
        }
        
        .stat-card-info {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
        }
        
        .stat-card-warning {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
        }
        
        .stat-card-secondary {
            background: linear-gradient(135deg, #434343 0%, #000000 100%);
        }
        
        .stat-card-danger {
            background: linear-gradient(135deg, #eb3349 0%, #f45c43 100%);
        }
        
        .stat-card-dark {
            background: linear-gradient(135deg, #232526 0%, #414345 100%);
        }
        
        .stat-icon {
            font-size: 3rem;
            opacity: 0.9;
            filter: drop-shadow(0 4px 8px rgba(0,0,0,0.2));
            animation: float 3s ease-in-out infinite;
        }
        
        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
        }
        
        .stat-number {
            font-size: 3rem;
            font-weight: 700;
            text-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        
        .stat-label {
            font-size: 1.1rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            opacity: 0.95;
        }
        
        .stat-link {
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: all 0.2s ease;
        }
        
        .stat-link:hover {
            transform: translateX(5px);
            text-shadow: 0 0 10px rgba(255,255,255,0.5);
        }
        
        .quick-action-card {
            border-radius: 20px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12);
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            height: 100%;
            text-decoration: none;
            color: inherit;
            background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
            border: 2px solid transparent;
        }
        
        .quick-action-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2);
            border-color: #667eea;
        }
        
        .quick-action-icon {
            font-size: 2.5rem;
            animation: pulse 2s ease-in-out infinite;
        }
        
        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.1); }
        }
        
        .recent-item {
            border-left: 4px solid #667eea;
            padding-left: 16px;
            margin-bottom: 16px;
            background: linear-gradient(90deg, rgba(102,126,234,0.05) 0%, transparent 100%);
            padding: 12px 16px;
            border-radius: 0 12px 12px 0;
            transition: all 0.2s ease;
        }
        
        .recent-item:hover {
            transform: translateX(5px);
            background: linear-gradient(90deg, rgba(102,126,234,0.1) 0%, transparent 100%);
        }
        
        .recent-item.low-stock {
            border-left-color: #ffc107;
            background: linear-gradient(90deg, rgba(255,193,7,0.05) 0%, transparent 100%);
        }
        
        .recent-item.low-stock:hover {
            background: linear-gradient(90deg, rgba(255,193,7,0.1) 0%, transparent 100%);
        }
        
        .recent-item.out-of-stock {
            border-left-color: #dc3545;
            background: linear-gradient(90deg, rgba(220,53,69,0.05) 0%, transparent 100%);
        }
        
        .recent-item.out-of-stock:hover {
            background: linear-gradient(90deg, rgba(220,53,69,0.1) 0%, transparent 100%);
        }
        
        .card {
            border-radius: 20px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12);
            border: none;
            overflow: hidden;
        }
        
        .card-header {
            border-radius: 20px 20px 0 0;
            padding: 20px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .card-body {
            padding: 24px;
        }
        
        .status-card {
            background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
            border-radius: 16px;
            padding: 24px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
            border: 2px solid transparent;
        }
        
        .status-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
            border-color: #667eea;
        }
        
        .status-number {
            font-size: 2.5rem;
            font-weight: 700;
        }
        
        .container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 30px;
            padding: 40px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.2);
            margin-top: 40px;
            margin-bottom: 40px;
        }
        
        h2 {
            font-weight: 700;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        
        h4 {
            font-weight: 600;
            color: #333;
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
            <div class="stat-card stat-card-primary text-white p-4">
                <div class="stat-icon">📦</div>
                <h5 class="stat-label mt-2">Total Products</h5>
                <h2 class="stat-number">${totalProducts}</h2>
                <a href="Products" class="stat-link text-white text-decoration-none">View All →</a>
            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-3">
            <div class="stat-card stat-card-success text-white p-4">
                <div class="stat-icon">🛒</div>
                <h5 class="stat-label mt-2">Total Orders</h5>
                <h2 class="stat-number">${totalOrders}</h2>
                <a href="Orders" class="stat-link text-white text-decoration-none">View All →</a>
            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-3">
            <div class="stat-card stat-card-info text-white p-4">
                <div class="stat-icon">💰</div>
                <h5 class="stat-label mt-2">Total Revenue</h5>
                <h2 class="stat-number">$${totalRevenue}</h2>
                <a href="Reports" class="stat-link text-white text-decoration-none">View Reports →</a>
            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-3">
            <div class="stat-card stat-card-warning text-white p-4">
                <div class="stat-icon">⚠️</div>
                <h5 class="stat-label mt-2">Low Stock</h5>
                <h2 class="stat-number">${lowStockCount}</h2>
                <a href="Products" class="stat-link text-white text-decoration-none">Manage →</a>
            </div>
        </div>
    </div>

    <!-- Additional Stats -->
    <div class="row g-4 mb-4">
        <div class="col-12 col-md-4">
            <div class="stat-card stat-card-secondary text-white p-4">
                <div class="stat-icon">🏷️</div>
                <h5 class="stat-label mt-2">Categories</h5>
                <h2 class="stat-number">${totalCategories}</h2>
            </div>
        </div>
        <div class="col-12 col-md-4">
            <div class="stat-card stat-card-danger text-white p-4">
                <div class="stat-icon">🚫</div>
                <h5 class="stat-label mt-2">Out of Stock</h5>
                <h2 class="stat-number">${outOfStockCount}</h2>
            </div>
        </div>
        <div class="col-12 col-md-4">
            <div class="stat-card stat-card-dark text-white p-4">
                <div class="stat-icon">💵</div>
                <h5 class="stat-label mt-2">Inventory Value</h5>
                <h2 class="stat-number">$${inventoryValue}</h2>
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
                <div class="quick-action-icon">➕</div>
                <h5 class="mt-2">Add Product</h5>
                <p class="text-muted small">Create new product</p>
            </a>
        </div>
        <div class="col-12 col-md-3">
            <a href="AddOrder" class="quick-action-card card p-4 text-center">
                <div class="quick-action-icon">🛒</div>
                <h5 class="mt-2">New Order</h5>
                <p class="text-muted small">Create new order</p>
            </a>
        </div>
        <div class="col-12 col-md-3">
            <a href="Products" class="quick-action-card card p-4 text-center">
                <div class="quick-action-icon">📦</div>
                <h5 class="mt-2">Manage Products</h5>
                <p class="text-muted small">View and edit products</p>
            </a>
        </div>
        <div class="col-12 col-md-3">
            <a href="Reports" class="quick-action-card card p-4 text-center">
                <div class="quick-action-icon">📊</div>
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
                            <div class="status-card text-center">
                                <h4 class="status-number text-warning">${pendingOrders}</h4>
                                <small class="text-muted">Pending</small>
                            </div>
                        </div>
                        <div class="col-6 col-md-2 mb-3">
                            <div class="status-card text-center">
                                <h4 class="status-number text-info">${processingOrders}</h4>
                                <small class="text-muted">Processing</small>
                            </div>
                        </div>
                        <div class="col-6 col-md-2 mb-3">
                            <div class="status-card text-center">
                                <h4 class="status-number text-primary">${shippedOrders}</h4>
                                <small class="text-muted">Shipped</small>
                            </div>
                        </div>
                        <div class="col-6 col-md-2 mb-3">
                            <div class="status-card text-center">
                                <h4 class="status-number text-success">${deliveredOrders}</h4>
                                <small class="text-muted">Delivered</small>
                            </div>
                        </div>
                        <div class="col-6 col-md-2 mb-3">
                            <div class="status-card text-center">
                                <h4 class="status-number text-danger">${cancelledOrders}</h4>
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
