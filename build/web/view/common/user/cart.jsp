<%-- 
    Document   : cart
    Created on : Mar 2, 2024, 9:47:47 PM
    Author     : lamph
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bynoir Studio.</title>
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/black-logo.png"> 
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="../../../assets/css/cart.css"/>
    </head>
    <body>
        <jsp:include page="../../common/user/navbar.jsp"></jsp:include>
            <section class="h-100 h-custom" style="background-color: #d2c9ff; margin: 5% 0 5%">
                <div class="container py-5 h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-12">
                            <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                                <div class="card-body p-0">
                                    <div class="row g-0">
                                        <div class="col-lg-8">
                                            <div class="p-5">
                                                <div class="d-flex justify-content-between align-items-center mb-5">
                                                    <h1 class="fw-bold mb-0 text-black">Shopping Cart</h1>
                                                    <c:set var="size" value="${sessionScope.size}"/>
                                                    <h6 class="mb-0 text-muted">${size} item(s)</h6>
                                                </div>
                                                <hr class="my-4">
                                                <!-- Products loop -->
                                            <c:set var="o" value="${sessionScope.cart}"/>
                                            <c:forEach items="${o.itemList}" var="i">
                                                <div class="row mb-4 d-flex justify-content-between align-items-center">
                                                    <div class="col-md-2 col-lg-2 col-xl-2">
                                                        <img
                                                            src="${pageContext.request.contextPath}/${i.product.img}"
                                                            class="img-fluid rounded-3" alt="Product image">
                                                    </div>
                                                    <div class="col-md-3 col-lg-3 col-xl-3">
                                                        <h6 class="text-muted">${i.product.product_name}</h6>
                                                        <h6 class="text-black mb-0">${i.product.product_description}</h6>
                                                    </div>
                                                    <!-- Increase/decrease number of a specific item in cart -->
                                                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                                        <button class="btn btn-link px-2"
                                                                onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                            <a href="process?num=-1&pid=${i.product.product_id}" class="fas fa-minus" style="text-decoration: none">-</a>
                                                        </button>

                                                        <input id="form1" min="0" name="num" value="${i.quantity}" type="number"
                                                               class="form-control form-control-sm" readonly style="text-align: center">

                                                        <button class="btn btn-link px-2"
                                                                onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                            <a href="process?num=+1&pid=${i.product.product_id}" class="fas fa-plus" style="text-decoration: none">+</a>
                                                        </button>
                                                    </div>
                                                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                                        <h6 class="mb-0"><fmt:formatNumber pattern="##.#" value="${i.price * i.quantity}"/></h6>
                                                    </div>
                                                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">  
                                                        <!-- Remove item from cart -->
                                                        <form action="process" method="POST">
                                                            <input type="hidden" name="pid" value="${i.product.product_id}">
                                                            <input type="submit" value="X">
                                                        </form>
                                                    </div>
                                                </div>
                                                <hr class="my-4">
                                            </c:forEach>
                                            <!-- Cart footer -->
                                            <div class="pt-5">
                                                <h6 class="mb-0"><a href="product" class="text-body"><i
                                                            class="fas fa-long-arrow-alt-left me-2"></i>Back to shop</a></h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 bg-grey">
                                        <div class="p-5">
                                            <h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>
                                            <hr class="my-4">

                                            <div class="d-flex justify-content-between mb-4">
                                                <h5 class="text-uppercase">items ${size}</h5>
                                                <h5><fmt:formatNumber pattern="##.#" value="${sessionScope.cart.getTotalMoney()}"></fmt:formatNumber></h5>
                                            </div>

                                            <h5 class="text-uppercase mb-3">Shipping</h5>

                                            <div class="mb-4 pb-2">
                                                <p>Standard Delivery: 30.000</p>
                                            </div>

                                            <hr class="my-4">

                                            <div class="d-flex justify-content-between mb-5">
                                                <h5 class="text-uppercase">Total price</h5>
                                                <h5><fmt:formatNumber pattern="##.#" value="${sessionScope.cart.getTotalMoney() + 30000}"></fmt:formatNumber></h5>
                                            </div>
                                            <form action="checkout" method="POST">
                                                <input type="submit" class="btn btn-dark btn-block btn-lg"
                                                       data-mdb-ripple-color="dark" value="Check out">
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="../../common/user/footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
