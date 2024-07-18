<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>





<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Menu Page</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

    <link href="css/myStyle.css" rel="stylesheet" type="text/css"/>

</head>
<!--begin of menu-->
<nav class="navbar navbar-expand-md navbar-dark" style="background-color: #000000;">
    <div class="container">
        <a class="navbar-brand" href="homecontroll">
            <img src="https://www.hamiltonwatch.com/static/version1721134665/frontend/Hamilton/Default/en_US/images/logo.svg" width="200" height="53" alt="Hamilton Logo" class="inverted">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-between" id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="#"><strong> HI ${sessionScope.acc.userName}</strong></a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc.role eq 'ad'}">
                    <li class="nav-item">
                        <a class="nav-link" href="managercontrol"><strong>MANAGER STORE</strong></a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="Login.jsp"><strong>LOGIN</strong></a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="logoutcontrol"><strong>LOGOUT</strong></a>
                    </li>
                </c:if>
            </ul>
            <form action="search" method="post" class="form-inline search-form my-2 my-lg-0 mx-auto">
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
            <a class="btn btn-success btn-sm ml-3 cart-button d-flex align-items-center" href="Cart.jsp">
                <i class="fa fa-shopping-cart mr-2"></i> Shopping Cart
                <span class="badge badge-light ml-2">${quantity}</span>
            </a>
        </div>
    </div>
</nav>




























<!--end of menu-->