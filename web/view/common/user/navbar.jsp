<%-- 
    Document   : navbar
    Created on : Feb 17, 2024, 10:47:13?PM
    Author     : lamph
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="../../../assets/css/theme.css"/>
    <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 d-block" data-navbar-on-scroll="data-navbar-on-scroll">
        <div class="container"><a class="navbar-brand d-inline-flex" href="${pageContext.request.contextPath}/home"><img class="d-inline-block" src="${pageContext.request.contextPath}/assets/img/logo.png" alt="logo" style=""/><span class="text-1000 fs-0 fw-bold ms-2" style="">Bynoir</span></a>
            <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item px-2"><a class="nav-link fw-medium active" aria-current="page" href="${pageContext.request.contextPath}/product">Product</a></li>
                    <li class="nav-item px-2"><a class="nav-link fw-medium" href="#header">Latest</a></li>
                    <li class="nav-item px-2"><a class="nav-link fw-medium" href="#collection">Collection</a></li>
                    <li class="nav-item px-2"><a class="nav-link fw-medium" href="#outlet">Outlet</a></li>
                        <c:if test="${sessionScope.currentLogin.admin == true}">
                        <li class="nav-item px-2"><a class="nav-link fw-medium" href="manageAccount">Manage Account</a></li>
                        <li class="nav-item px-2"><a class="nav-link fw-medium" href="manageProduct">Manage Product</a></li>
                        </c:if>
                </ul>
                <!-- Cart button -->
                <a class="text-1000" href="#!">
                    <svg class="feather feather-shopping-cart me-3" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="9" cy="21" r="1"></circle>
                        <circle cx="20" cy="21" r="1"></circle>
                        <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
                    </svg>
                </a>
                <!-- Search button -->
                <a class="text-1000" href="#!" id="searchButton">
                    <svg class="feather feather-search me-3" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="11" cy="11" r="8"></circle>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                    </svg>
                </a>
                <!-- Search box -->
                <div class="s005" id="searchBox" style="display: none;">
                    <form action="search" method="POST" id="searchForm">
                        <div class="inner-form">
                            <div class="input-field">
                                <input class="form-control" name="keyword" id="search-input" type="text" placeholder="Type to search..." onkeypress="return handleKeyPress(event)"/>                                   
                            </div>
                        </div>                          
                    </form>
                </div>
                <!-- Hello username -->
                <c:if test="${sessionScope.currentLogin != null}">
                    <div class="text-1000" style="padding-right: 5px">Hello
                        <a href="#" style="color: blue">${sessionScope.currentLogin.user_fullname}</a>
                    </div>
                </c:if>
                <!-- Logout button -->
                <c:if test="${sessionScope.currentLogin != null}">
                    <a class="text-1000" href="logout" style="padding-top: 3px">
                        <svg class="feather feather-user me-3" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24">
                            <path d="M1 1L8 1V2L2 2L2 13H8V14H1L1 1ZM10.8536 4.14645L14.1932 7.48614L10.8674 11.0891L10.1326 10.4109L12.358 8L4 8V7L12.2929 7L10.1464 4.85355L10.8536 4.14645Z" fill="#000000"/>                     
                        </svg>
                    </a>
                </c:if>
                <!-- Login/signup button -->
                <c:if test="${sessionScope.currentLogin == null}">
                    <a class="text-1000" href="view/user/home-page/login.jsp">
                        <svg class="feather feather-user me-3" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                            <circle cx="12" cy="7" r="4"></circle>
                        </svg></a>
                    </c:if>
            </div>
        </div>
    </nav>

    <script src="${pageContext.request.contextPath}/assets/js/navbar.js" type="text/javascript"></script>

