<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link href="css/myStyle.css" rel="stylesheet" type="text/css"/>
    <title>Sign Up Page</title>
    <style>
        body {
            background: url('https://www.hamiltonwatch.com/media/wysiwyg/1_12.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        #logreg-forms {
            margin-top: 100px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px #000;
        }
        .form-signup input {
            margin-bottom: 10px;
        }
        .btn-signin {
            background-color: black;
            color: white;
            border: none;
        }
        .btn-signup {
            background-color: gray;
            color: white;
            border: none;
        }
        .btn-signin:hover, .btn-signup:hover {
            opacity: 0.8;
        }
    </style>
</head>

<body>
    <!-- Begin of signup form -->
    <div id="logreg-forms" class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <form class="form-signup" action="signup" method="post">
                    <h1 class="h3 mb-3 font-weight-normal text-center">Sign up</h1>

                    <c:if test="${not empty err}">
                        <div class="alert alert-danger">${err}</div>
                    </c:if>
                    <c:if test="${not empty er}">
                        <div class="alert alert-danger">${er}</div>
                    </c:if>

                    <div class="form-group">
                        <input name="user" type="text" id="user-name" class="form-control" placeholder="User name" required autofocus>
                    </div>

                    <div class="form-group">
                        <input name="pass" type="password" id="user-pass" class="form-control" placeholder="Password" required>
                    </div>

                    <div class="form-group">
                        <input name="repass" type="password" id="user-repeatpass" class="form-control" placeholder="Repeat Password" required>
                    </div>

                    <button class="btn btn-signup btn-block" type="submit">
                        <i class="fa fa-user-plus"></i> Sign up
                    </button>

                    <a href="Login.jsp" class="btn btn-link mt-2">
                        <i class="fa fa-angle-left"></i> Back
                    </a>
                </form>
            </div>
        </div>
    </div>
    <!-- End of signup form -->
</body>
</html>
