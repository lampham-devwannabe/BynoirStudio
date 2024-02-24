<%-- 
    Document   : product
    Created on : Feb 20, 2024, 11:46:24 PM
    Author     : lamph
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bynoir Studio.</title>
        <!-- CSS stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/theme.css"/>
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/black-logo.png">      
    </head>
    <body>
        <!-- Navbar -->
        <jsp:include page="../../common/user/navbar.jsp"></jsp:include>
            <section id="product">
                <div class="row">
                    <h1 class="fs-4 fs-lg-8 fs-md-6 fw-bold" style="text-align: center">Shop by Category</h1>
                    <!-- Sidebar -->
                <jsp:include page="../../common/user/sidebar.jsp"></jsp:include>
                    <!-- Product list -->
                    <div class="col-md-12">         
                        <div class="row d-flex" style="justify-content: center">
                        <c:forEach items="${productList}" var="p">
                            <div class="col-lg-4 mb-md-5 ">
                                <div class="card h-100">
                                    <a href="detail?product_id=${p.product_id}"><img src="${pageContext.request.contextPath}/${p.img}" alt="..." class="card-img-top"></a>
                                    <div class="card-body">
                                        <div class="text-center">
                                            <h5 class="card-title"><a href="detail?product_id=${p.product_id}">${p.product_name}</a></h5>
                                            <p>${p.product_price}</p>
                                        </div>
                                    </div>
                                    <div class="card-footer  bg-transparent border-top-0">
                                        <div class="text-center">
                                            <a href="#" class="btn btn-outline-dark">View option</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Footer -->
    <jsp:include page="../../common/user/footer.jsp"></jsp:include>    
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
