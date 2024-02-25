<%-- 
    Document   : navbar
    Created on : Feb 17, 2024, 10:47:13?PM
    Author     : lamph
--%>
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
            </ul>
            <!-- Cart button -->
            <a class="text-1000" href="#!">
                <svg class="feather feather-shopping-cart me-3" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="9" cy="21" r="1"></circle>
                    <circle cx="20" cy="21" r="1"></circle>
                    <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
                </svg></a>
            <!-- Search button -->
            <a class="text-1000" href="#!" id="searchButton">
                <svg class="feather feather-search me-3" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="11" cy="11" r="8"></circle>
                    <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                </svg></a>
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
            <!-- Login/signup button -->
            <a class="text-1000" href="#!">
                <svg class="feather feather-user me-3" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                    <circle cx="12" cy="7" r="4"></circle>
                </svg></a>
        </div>
    </div>
</nav>

<script src="${pageContext.request.contextPath}/assets/js/navbar.js" type="text/javascript"></script>

