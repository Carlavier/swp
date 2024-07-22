<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Profile</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <jsp:include page="Navbar.jsp"></jsp:include>
    <style>
        body {
            background-color: #f4f4f4;
            font-family: 'Arial', sans-serif;
        }
        .profile-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .profile-container h2 {
            margin-bottom: 30px;
            color: #333;
            font-weight: 600;
        }
        .profile-container .form-group label {
            font-weight: 500;
            color: #555;
        }
        .profile-container .input-group {
            margin-bottom: 20px;
        }
        .profile-container .form-control {
            border-radius: 0 20px 20px 0;
            padding: 15px;
            border: 1px solid #ddd;
            transition: border-color 0.3s;
        }
        .profile-container .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.25);
        }
        .profile-container .input-group-text {
            border-radius: 20px 0 0 20px;
            border: 1px solid #ddd;
            background-color: #f4f4f4;
        }
        .profile-container .btn-primary, .profile-container .btn-secondary {
            border-radius: 20px;
            padding: 10px 30px;
            font-weight: 600;
        }
        .profile-container .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .profile-container .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }
        .profile-container .table-wrapper {
            margin-top: 50px;
        }
        .profile-container .table {
            margin-top: 20px;
            background: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .profile-container .thead-dark th {
            background-color: #333;
            color: #fff;
            border: none;
        }
        .profile-container .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f9f9f9;
        }
        .profile-container .table td, .profile-container .table th {
            padding: 15px;
            vertical-align: middle;
        }
    </style>
</head>
<body>
<div class="profile-container container">
    <h2 class="text-center">My Profile</h2>
    <form action="processuserdata" method="post">
        <div class="form-group">
            <label for="name">Name:</label>
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                </div>
                <input type="text" class="form-control" id="name" name="name" value="${user.name}" required>
            </div>
        </div>
        <div class="form-group">
            <label for="birthdate">Birthdate:</label>
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
                </div>
                <input type="date" class="form-control" id="birthdate" name="birthdate" value="${user.birthdate}" required>
            </div>
        </div>
        <div class="form-group">
            <label for="phone">Phone:</label>
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-phone"></i></span>
                </div>
                <input type="text" class="form-control" id="phone" name="phone" value="${user.phone}" required>
            </div>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                </div>
                <input type="email" class="form-control" id="email" name="email" value="${user.email}" required>
            </div>
        </div>
        <div class="form-group">
            <label for="address">Address:</label>
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
                </div>
                <input type="text" class="form-control" id="address" name="address" value="${user.address}" required>
            </div>
        </div>
        <div class="form-group d-flex justify-content-between">
            <button type="submit" class="btn btn-primary">Submit</button>
            <a href="homecontroll" class="btn btn-secondary">Back</a>
        </div>
    </form>

    <div class="table-wrapper">
        <h2>Purchase History</h2>
        <table class="table table-striped">
            <thead class="thead-dark">
            <tr>
                <th>Product Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Date of Purchase</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="history" items="${purchaseHistory}">
                <tr>
                    <td>${history.product.name}</td>
                    <td>${history.product.price}</td>
                    <td>${history.quantity}</td>
                    <td>${history.order.orderDate}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
