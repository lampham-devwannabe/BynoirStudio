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
            <a href="category?category_id=${c.category_id}"><li class="list-group-item ${flag == c.category_id ? "active" : ""}" style="text-align: center">${c.category_name}</li></a>
                    </c:forEach>                
    </ul>  
</div>
