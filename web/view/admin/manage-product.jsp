<%-- 
    Document   : manage-product
    Created on : Feb 28, 2024, 8:50:07 AM
    Author     : lamph
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Manage Product</title>
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
        <script>
            $(document).ready(function () {
                // Activate tooltip
                $('[data-toggle="tooltip"]').tooltip();

                // Select/Deselect checkboxes
                var checkbox = $('table tbody input[type="checkbox"]');
                $("#selectAll").click(function () {
                    if (this.checked) {
                        checkbox.each(function () {
                            this.checked = true;
                        });
                    } else {
                        checkbox.each(function () {
                            this.checked = false;
                        });
                    }
                });
                checkbox.click(function () {
                    if (!this.checked) {
                        $("#selectAll").prop("checked", false);
                    }
                });
            });
        </script>
    </head>
    <body>
        <!-- Navbar -->
        <jsp:include page="../common/user/navbar.jsp"></jsp:include>
            <div class="container-xl">
                <div class="table-responsive">
                    <div class="table-wrapper" style="margin-top: 5%">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-6">
                                    <h2 style="color: white">Manage <b>Products</b></h2>
                                </div>
                                <div class="col-sm-6">
                                    <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                                    <a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>						
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>    
                                    <th>
                                        <span class="custom-checkbox">
                                            <input type="checkbox" id="selectAll">
                                            <label for="selectAll"></label>
                                        </span>
                                    </th>
                                    <th>Name</th>
                                    <th>Image</th>
                                    <th>Description</th>
                                    <th>Price</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${productList}" var="p">
                                <tr>
                                    <td>
                                        <span class="custom-checkbox">
                                            <input type="checkbox" id="checkbox1" name="options[]" value="${p.product_id}">
                                            <label for="checkbox1"></label>
                                        </span>
                                    </td>
                                    <td>${p.product_name}</td>
                                    <td><img src="${pageContext.request.contextPath}/${p.img}" alt="Product Image" style="max-width: 150px; max-height: 150px;"/></td>
                                    <td>${p.product_description}</td>
                                    <td>${p.product_price}</td>
                                    <td>
<!--                                        <a href="load?pid=${p.product_id}" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>-->
                                        <form action="load" method="POST">
                                            <input type="hidden" name="edit_id" value="${p.product_id}">
                                            <button type="submit" class="edit" data-toggle="modal" style="background: none; border: none; cursor: pointer;"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></button>
                                        </form>
                                        <form action="deleteProduct" method="POST">
                                            <input type="hidden" name="pid" value="${p.product_id}">
                                            <button type="submit" class="delete" data-toggle="modal" style="background: none; border: none; cursor: pointer;"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>        
        </div>
        <!-- Add new Product -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addProduct" method="POST">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add new Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" class="form-control" name="name" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input type="text" class="form-control" name="img" required>
                            </div>
                            <div class="form-group">
                                <label>Color</label>
                                <input type="text" class="form-control" name="color" required>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea class="form-control" name="desc" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input type="text" class="form-control" name="price" required>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-select" aria-label>
                                    <c:forEach items="${categoryList}" var="c">
                                        <option value="${c.category_id}">${c.category_name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit a Product -->
        <!-- Footer -->
        <jsp:include page="../common/user/footer.jsp"></jsp:include>
    </body>
</html>
