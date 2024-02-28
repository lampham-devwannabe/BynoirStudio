<%-- 
    Document   : homePage
    Created on : Feb 17, 2024, 10:26:34 PM
    Author     : lamph
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="text/html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bynoir Studio.</title>
        <!-- CSS stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/theme.css"/>
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/black-logo.png">      
    </head>
    <body>
        <main class="main" id="top">
            <c:if test="${not empty sessionScope['signUpSuccess']}">
                <script>
                    alert('Sign Up Successfully');
                </script>
                <c:remove var="signUpSuccess" scope="session" />
            </c:if>
            <!-- Navbar -->
            <jsp:include page="../../common/user/navbar.jsp"></jsp:include>
                <!-- Header -->   
            <jsp:include page="../../common/user/header.jsp"></jsp:include>
                <!-- Banner -->
            <jsp:include page="../../common/user/banner.jsp"></jsp:include>
                <!-- Slide -->
            <jsp:include page="../../common/user/slide.jsp"></jsp:include>
                <!-- Addresses -->
            <jsp:include page="../../common/user/addresses.jsp"></jsp:include>
                <!-- Footer -->
            <jsp:include page="../../common/user/footer.jsp"></jsp:include>      
            </main>
            <script src="${pageContext.request.contextPath}/assets/vendor/@popperjs/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/is/is.min.js"></script>
        <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
        <script src="${pageContext.request.contextPath}/assets/vendor/feather-icons/feather.min.js"></script>
        <script>
                    feather.replace();
        </script>
        <script src="${pageContext.request.contextPath}/assets/js/theme.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet">
    </body>
</html>
