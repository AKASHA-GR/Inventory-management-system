<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Register Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body class="d-flex justify-content-center align-items-center vh-100">

    <form action="register" method="post" class="w-50 ratio-4x3 border p-4 rounded" onsubmit="return validateForm()">
        <h1 class="d-flex justify-content-center align-items-center">Sign Up</h1>
        
        <c:if test="${not empty message}">
            <div class="alert alert-success">${message}</div>
        </c:if>
        
        <c:if test="${not empty validationErrors}">
            <div class="alert alert-danger">
                <c:forEach items="${validationErrors}" var="error">
                    <p>${error.defaultMessage}</p>
                </c:forEach>
            </div>
        </c:if>
        
        <div>
            <label for="firstName" class="form-label">First Name:</label>
            <input class="form-control " type="text" id="firstName" name="firstName" placeholder="Enter first name" aria-label="First name">
        </div><br>
        <div>
            <label for="lastName" class="form-label">Last Name:</label>
            <input class="form-control" type="text" id="lastName" name="lastName" placeholder="Enter last name" aria-label="Last name">
        </div><br>
        <div>
            <label for="email" class="form-label">Email:</label>
            <input class="form-control" type="email" id="email" name="email" placeholder="Enter email" aria-label="Email">
        </div><br>
        <div>
            <label for="phoneNumber" class="form-label">Phone Number:</label>
            <input class="form-control" type="tel" id="phoneNumber" name="phoneNumber" placeholder="Enter phone number" aria-label="Phone number">
        </div><br>
        <div>
            <label for="password" class="form-label">Password:</label>
            <input class="form-control" type="password" id="password" name="password" placeholder="Enter password" aria-label="Password">
        </div><br>
        <div>
            <label for="confirmPassword" class="form-label">Confirm Password:</label>
            <input class="form-control" type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm password" aria-label="Confirm password">
        </div><br>
        <div class="mt-3">
            <button type="submit" class="btn btn-primary w-100">Register</button>
        </div><br>
    </form>

    <script src="RegisterValidation.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>