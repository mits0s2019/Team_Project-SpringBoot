<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Register</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/registercss/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
        <link href="${pageContext.request.contextPath}/css/registercss/css/style.css" rel="stylesheet">
    </head>

    <body>

        <div class="wrapper" style="background-image: url('https://azmind.com/demo/bootstrap-registration-forms/form-1/assets/img/backgrounds/1@2x.jpg');">
            <div class="inner" style="background-image: url('');">
                <spring:form modelAttribute="user" action="${pageContext.request.contextPath}/postRegister" method="POST" id="registerForm" enctype="multipart/form-data">
                    <h3>Registration Form</h3>
                    <div class="form-group">
                    </div>
                    <div class="form-wrapper">
                        <spring:label path="username">Username</spring:label>
                        <spring:input path="username" autocomplete="off" cssClass="form-control" placeholder="Enter Username..."/>
                        <div class="error">${error} </div>                       
                    </div>
                    <div class="form-wrapper">
                        <spring:label path="email">Email</spring:label>
                        <spring:input path="email" cssClass="form-control" placeholder="Enter Email..."/>
                        <div class="error">${emailError} </div>  
                    </div>
                    <div class="form-wrapper">
                        <spring:label path="password">Password</spring:label>
                        <spring:input path="password" type="password" cssClass="form-control" placeholder="Enter Password..."/>
                    </div>
                    <div class="form-wrapper">
                        <label for="confirmPassword">Confirm Password</label>
                        <input name="confirmPassword" type="password" class="form-control" placeholder="Enter Password..."/>                      
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" required="required"> I accept the Terms of Use & Privacy Policy.
                            <span class="checkmark"></span>
                        </label>
                    </div>
                        <spring:input type="hidden" path="roleRef.roleId" value="2"/>
                    <button type="submit" Class="btn btn-primary btn-block">Register Now</button>
                </spring:form>
            </div>
        </div>

        <jsp:include page="../components/scripts.jsp"/>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/additional-methods.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/register.js"></script>


    </body>
</html> 