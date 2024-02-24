<%-- 
    Document   : latest
    Created on : Feb 24, 2024, 7:01:12 PM
    Author     : lamph
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Latest product -->
        <h1 class="fw-normal" style="text-align: center">Latest product</h1>
        <c:if test="${not empty latest}">
            <div class="mb-md-5">
                <div class="card h-100">
                    <img src="${pageContext.request.contextPath}/${latest.img}" alt="..." class="card-img-top">
                    <div class="card-body">
                        <div class="text-center">
                            <h5 class="card-title">${latest.product_name}</h5>
                            ${latest.product_price}
                        </div>
                    </div>                   
                </div>
            </div>
        </c:if>
    </body>
</html>
