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
    <title>Login Page</title>
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
        .form-signin input {
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
    <!-- Begin of login form -->
    <div id="logreg-forms" class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <form class="form-signin" action="login" method="post">
                    <h1 class="h3 mb-3 font-weight-normal text-center">Sign in</h1>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">${error}</div>
                    </c:if>

                    <div class="form-group">
                        <input value="${username}" name="user" type="text" id="inputEmail" class="form-control" placeholder="Username" required autofocus>
                    </div>

                    <div class="form-group">
                        <input value="${password}" name="pass" type="password" id="inputPassword" class="form-control" placeholder="Password" required>
                    </div>

                    <div class="form-group form-check">
                        <input name="rem" value="1" type="checkbox" class="form-check-input" id="exampleCheck1">
                        <label class="form-check-label" for="exampleCheck1">Remember me</label>
                    </div>

                    <button class="btn btn-signin btn-block" type="submit">
                        <i class="fa fa-sign-in"></i> Sign in
                    </button>
                </form>

                <button class="btn btn-signup btn-block mt-2" type="button" id="btn-signup" onclick="redirectToSignUpPage()">
                    <i class="fa fa-user-plus"></i> Sign up
                </button>
            </div>
        </div>
    </div>
    <!-- End of login form -->

    <script>
        function redirectToSignUpPage() {
            window.location.href = 'signup.jsp';
        }
    </script>
</body>
</html>
