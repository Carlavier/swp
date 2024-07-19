<%-- 
    Document   : Cart
    Created on : Oct 12, 2023, 10:01:00 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/csss.css">
        <style>
            body {
                background-image: url('https://www.hamiltonwatch.com/media/wysiwyg/1_12.jpg');
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
            }
            .shopping-cart {
                margin-top: 50px;
            }
            .table-responsive {
                margin: 20px 0;
            }
            .shopping-cart .col-lg-12 {
                padding: 20px;
            }
            .shopping-cart .table thead th {
                font-size: 16px;
            }
            .shopping-cart .table tbody td {
                font-size: 15px;
            }
            .shopping-cart .table img {
                max-width: 70px;
            }
            .shopping-cart .table .btn {
                padding: 5px 10px;
            }
            .total-section {
                margin-top: 30px;
            }
            .total-section .list-unstyled li {
                font-size: 16px;
            }
            .total-section .font-weight-bold {
                font-size: 20px;
            }
            .total-header {
                color: white;
                background-color: #343a40;
                padding: 10px;
                border-radius: 10px;
                text-align: center;
                border: 2px solid #ffffff;
            }
            .checkout-form {
                width: 100%;
                max-width: 500px;
                padding: 20px;
                background-color: #f9f9f9;
                border-radius: 10px;
                margin-left: 180px;
                font-weight: bold;
            }
            .checkout-form label {
                font-size: 14px;
                margin-bottom: 5px;
            }
            .checkout-form input, 
            .checkout-form textarea {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border-radius: 5px;
                border: 1px solid #ddd;
            }
            .checkout-form .btn {
                width: 100%;
            }
            .equal-width {
                max-width: 500px;
            }
        </style>
    </head>
    <body>
        <div class="shopping-cart">
            <div class="px-4 px-lg-0">
                <div class="pb-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">
                                <!-- Shopping cart table -->
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="p-2 px-3 text-uppercase">Items</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Price</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Quantity</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Total amount</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Remove</div>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${cart.listCart}" var="o">
                                                <tr>
                                                    <th scope="row">
                                                        <div class="p-2">
                                                            <img src="${o.product.image}" alt="" class="img-fluid rounded shadow-sm">
                                                            <div class="ml-3 d-inline-block align-middle">
                                                                <h5 class="mb-0"> <a href="#" class="text-dark d-inline-block">${o.product.name}</a></h5><span class="text-muted font-weight-normal font-italic"></span>
                                                            </div>
                                                        </div>
                                                    </th>
                                                    <td class="align-middle"><strong>${o.product.price}</strong></td>
                                                    <td class="align-middle">
                                                        <form action="updateitem" method="post" class="d-inline-block">
                                                            <input type="hidden" name="productId" value="${o.product.id}">
                                                            <input type="hidden" name="action" value="increment">
                                                            <button style="width: 30px; height: 30px; font-size: 20px; background: transparent; border: none; cursor: pointer;" type="submit">+</button>
                                                        </form>
                                                        <strong style="font-size: 18px; margin: 0 10px;">${o.quantity}</strong>
                                                        <form action="updateitem" method="post" class="d-inline-block">
                                                            <input type="hidden" name="productId" value="${o.product.id}">
                                                            <input type="hidden" name="action" value="decrement">
                                                            <button style="width: 30px; height: 30px; font-size: 20px; background: transparent; border: none; cursor: pointer;" type="submit">-</button>
                                                        </form>
                                                    </td>
                                                    <td class="align-middle"><strong>${o.getTotal()}</strong></td>
                                                    <td class="align-middle"><a href="deleteitem?did=${o.product.id}" class="text-dark">
                                                        <button type="button" class="btn btn-danger">Delete</button>
                                                    </a></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- End -->
                            </div>
                        </div>
                        <div class="row total-section">
                            <div class="col-lg-5 equal-width">
                                <div class="total-header">Total amount</div>
                                <div class="p-4 bg-light rounded">
                                    <ul class="list-unstyled mb-4">
                                        <c:set var="totalAmount" value="0" />
                                        <c:forEach items="${cart.listCart}" var="item">
                                            <c:set var="itemTotal" value="${item.getTotal()}" />
                                            <c:set var="totalAmount" value="${totalAmount + itemTotal}" />
                                        </c:forEach>
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total cost</strong><strong>${totalAmount} $</strong></li>
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Shipping</strong><strong>Free ship</strong></li>
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total payment</strong>
                                            <h5 class="font-weight-bold">${totalAmount}</h5>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-7 equal-width">
                                <div class="checkout-form">
                                    <form action="checkoutcontrol" method="post">
                                        <!-- User Information Fields -->
                                        <label for="fullName">Full Name:</label>
                                        <input type="text" id="fullName" name="fullName" required>
                                        <label for="phonenumber">Telephone:</label>
                                        <input type="number" id="phonenumber" name="phonenumber" required>
                                        <label for="userEmail">Your Email:</label>
                                        <input type="email" id="userEmail" name="userEmail" required>
                                        <label for="address">Address:</label>
                                        <textarea id="address" name="address" rows="4" cols="50" required></textarea>
                                        <!-- Hidden Field for Total Amount -->
                                        <input type="hidden" name="totalAmount" value="${totalAmount}">
                                        <!-- Checkout Button -->
                                        <div class="text-center">
                                            <input type="submit" name="action" value="Payment" class="btn btn-dark btn-lg">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
