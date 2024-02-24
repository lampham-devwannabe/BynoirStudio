<%-- 
    Document   : sidebar
    Created on : Feb 23, 2024, 5:16:54?PM
    Author     : lamph
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="tab-pane fade show active">
    <!-- Categories -->
    <ul class="nav nav-pills justify-content-center mb-5">
        <c:forEach items="${cateList}" var="c">
            <li class="nav-item ${flag == c.category_id ? "active" : ""}" style="text-align: center"><button class="nav-link active"><a href="category?category_id=${c.category_id}">${c.category_name}</a></button></li>
                    </c:forEach>                
    </ul>  
</div>
