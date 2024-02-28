<%-- 
    Document   : edit-product
    Created on : Feb 28, 2024, 12:56:28 PM
    Author     : lamph
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Edit Product</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/black-logo.png">    
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="../../../assets/css/manage.css"/>
    <body>
        <!-- Navbar -->
        <jsp:include page="../common/user/navbar.jsp"></jsp:include>
            <div id="editEmployeeModal" style="margin: 5% 0 5%">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="editProduct" method="POST">
                            <div class="header">						
                                <h4 class="modal-title text-center">Edit Employee</h4>                               
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>Product ID</label>
                                    <input type="text" name="id" class="form-control" value="${p.product_id}" readonly required>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" name="name" class="form-control" value="${p.product_name}" required>
                            </div>
                            <div class="form-group">
                                <label>Image adress</label>
                                <input type="text" name="img" class="form-control" value="${p.img}" required>
                            </div>
                            <div class="form-group">
                                <label>Color</label>
                                <input type="text" name="color" class="form-control" value="${co.color}" required>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea class="form-control" name="desc" required>${p.product_description}</textarea>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input type="text" name="price" class="form-control" value="${p.product_price}" required>
                            </div>		
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-select" aria-label>
                                    <c:forEach items="${categoryList}" var="c">
                                        <option ${p.category_id == c.category_id ? "selected" : ""} value="${c.category_id}">${c.category_name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a href="manageProduct" class="btn btn-default">Cancel</a>
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>  
        <!-- Footer -->
        <jsp:include page="../common/user/footer.jsp"></jsp:include>
    </body>
</html>
