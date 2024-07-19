<%-- 
    Document   : InforUser
    Created on : Jun 23, 2024, 7:34:45 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Profile</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h2>My Profile</h2>
    <form action="processuserdata" method="post">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" name="name" value="${user.name}" required>
        </div>
        <div class="form-group">
            <label for="birthdate">Birthdate:</label>
            <input type="date" class="form-control" id="birthdate" name="birthdate" value="${user.birthdate}" required>
        </div>
        <div class="form-group">
            <label for="phone">Phone:</label>
            <input type="text" class="form-control" id="phone" name="phone" value="${user.phone}" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" class="form-control" id="email" name="email" value="${user.email}" required>
        </div>
        <div class="form-group">
            <label for="address">Address:</label>
            <input type="text" class="form-control" id="address" name="address" value="${user.address}" required>
        </div>
        <div class="form-group d-flex justify-content-between">
            <button type="submit" class="btn btn-primary">Submit</button>
            <a href="homecontroll" class="btn btn-secondary">Back</a>
        </div>
    </form>

    <h2>Purchase History</h2>
    <table class="table table-striped">
        <thead>
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
</body>
</html>
