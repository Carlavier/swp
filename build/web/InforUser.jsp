<%-- 
    Document   : InforUser
    Created on : Jun 23, 2024, 7:34:45 PM
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
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link href="css/myStyle.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<!--begin of menu-->
<nav  class="navbar navbar-expand-md navbar-dark" style="background-color: #000000;">
    <div class="container">
        <a class="navbar-brand" href="homecontroll"  style="font-family: 'lobster', sans-serif; font-size: 24px; color: #fff; text-decoration: none; font-style: italic;">
            HAMILTON WATCH
        </a>
        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="#"><strong> HI ${sessionScope.acc.userName}</strong></a>
                    </li>
                </c:if>
                <c:if test= "${sessionScope.acc.role eq 'ad'}" >
                    <li class="nav-item">
                        <a class="nav-link" href="managercontrol"><strong>MANAGER STORE</strong></a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc.role eq 'us'}">
                    <li class="nav-item">
                        <a class="nav-link" href="processuserdata"><strong>MY PROFILE</strong></a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc == null}">
                    <li class="nav-item">
                        <a class="nav-link"  href="Login.jsp"><strong>LOGIN</strong></a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="logoutcontrol"><strong>LOGOUT</strong></a>
                    </li>
                </c:if>
            </ul>
            <form action="search" method="post" class="form-inline search-form my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input value="${txtS}" name="txt" type="text" class="form-control search-input" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number search-button">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
            </form>
            <c:set var="quantity" value="0" />
            <c:if test="${sessionScope.cart != null}">
                <c:forEach items="${sessionScope.cart.listCart}" var="item">
                    <c:set var="quantity" value="${quantity + item.quantity}" />
                </c:forEach>
            </c:if>
            <a class="btn btn-success btn-sm ml-3 cart-button" href="Cart.jsp">
                <i class="fa fa-shopping-cart"></i> Shopping Cart
                <span class="badge badge-light">${quantity}</span>
            </a>
        </div>
    </div>
</nav>
<!--end of menu-->

<div class="container">
    <h2 class="text-center">PROFILE</h2>
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
