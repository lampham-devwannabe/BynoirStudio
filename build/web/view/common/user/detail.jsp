<%-- 
    Document   : detail
    Created on : Feb 23, 2024, 4:09:17?PM
    Author     : lamph
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- content -->
<section class="py-5" style="margin-top: 50px">
    <div class="container">
        <div class="row gx-5">
            <aside class="col-lg-6">
                <div class="border rounded-4 mb-3 d-flex justify-content-center">
                    <a data-fslightbox="mygalley" class="rounded-4" data-type="image" href="#">
                        <img style="max-width: 100%; max-height: 100vh; margin: auto;" class="rounded-4 fit" src="${pageContext.request.contextPath}/${detail.img}"/>
                    </a>
                </div>
            </aside>
            <main class="col-lg-6">
                <div class="ps-lg-3">
                    <h4 class="title text-dark">${detail.product_id}. ${detail.product_name}</h4>
                    <c:if test="${quantity > 0}"><span class="text-success ms-2">In stock</span></c:if>
                    <c:if test="${quantity <= 0}"><span class="text-danger ms-2">Out of stock</span></c:if>
                    </div>

                    <div class="mb-3">
                        <span class="h5">${detail.product_price}</span>
                    <span class="text-muted">/per product</span>
                </div>
                <p>${detail.product_description}</p>
                <div class="row">
                    <dt class="col-3">Category:</dt>
                    <dd class="col-9">${cateDetail.category_name}</dd>

                    <dt class="col-3">Color</dt>
                    <dd class="col-9">${color.color}</dd>
                </div>

                <hr/>
                <form action="cart" method="POST">
                    <input type="hidden" name="pid" value="${detail.product_id}">
                    <c:if test="${quantity > 0}">
                        <div class="row mb-4">
                            <div class="col-md-4 col-6">
                                <label class="mb-2">Size</label>
                                <br/>
                                <select name="sz" class="border border-secondary" style="height: 35px;">
                                    <c:forEach items="${sizeList}" var="s">
                                        <option value="${s.size}" ${s.size_name == "Small" ? "selected" : ""}>${s.size_name}</option>
                                    </c:forEach>

                                </select>
                            </div>
                            <!-- col.// -->
                            <div class="col-md-4 col-6 mb-3">
                                <label class="mb-2 d-block">Quantity</label>
                                <div class="input-group mb-3" style="width: 170px;">
                                    <button class="btn btn-white border border-secondary px-3" type="button" id="minusButton" data-mdb-ripple-color="dark">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                    <input type="text" class="form-control text-center border border-secondary" id="quantityInput" name="num" value="1" placeholder="1" aria-label="Example text with button addon" aria-describedby="minusButton plusButton" />
                                    <button class="btn btn-white border border-secondary px-3" type="button" id="plusButton" data-mdb-ripple-color="dark">
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <a href="#" class="btn btn-warning shadow-0"> Buy now </a>
                        <input type="submit" value="Add to cart" class="btn btn-primary shadow-0">
                        <a href="#" class="btn btn-light border border-secondary py-2 icon-hover px-3"> <i class="me-1 fa fa-heart fa-lg"></i> Save </a>
                    </c:if>
                </form>
        </div>
        </main>
    </div>
</div>
</section>
<!-- content -->

<section class="bg-light border-top py-4">
    <div class="container">
        <div class="row gx-4">
            <div class="col-lg-8 mb-4">
                <div class="border rounded-2 px-3 py-2 bg-white">
                    <!-- Pills navs -->
                    <ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
                        <li class="nav-item d-flex" role="presentation">
                            <a
                                class="nav-link d-flex align-items-center justify-content-center w-100 active"
                                id="ex1-tab-1"
                                data-mdb-toggle="pill"
                                href="#ex1-pills-1"
                                role="tab"
                                aria-controls="ex1-pills-1"
                                aria-selected="true"
                                >Detail information</a
                            >
                        </li>
                    </ul>
                    <!-- Pills navs -->

                    <!-- Pills content -->
                    <div class="tab-content" id="ex1-content">
                        <c:forEach items="${sizeList}" var="s">
                            <div class="tab-pane fade show active" role="tabpanel" aria-labelledby="ex1-tab-1">

                                <table class="table border mt-3 mb-2">
                                    <tr>
                                        <th class="py-2">ID</th>
                                        <td class="py-2">${s.size}</td>
                                    </tr>
                                    <tr>
                                        <th class="py-2">Size</th>
                                        <td class="py-2">${s.size_name}</td>
                                    </tr>
                                    <tr>
                                        <th class="py-2">Measurements</th>
                                        <td class="py-2">${s.measurements}</td>
                                    </tr>
                                    <tr>
                                        <th class="py-2">Height</th>
                                        <td class="py-2">${s.height}</td>
                                    </tr>
                                    <tr>
                                        <th class="py-2">Weight</th>
                                        <td class="py-2">${s.weight}</td>
                                    </tr>
                                </table>



                            </div>
                        </c:forEach>
                    </div>

                </div>
            </div>
            <div class="col-lg-4">
                <div class="px-0 border rounded-2 shadow-0">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Similar items</h5>
                            <c:forEach items="${sim}" var="p">
                                <c:if test="${p.product_id ne detail.product_id}">
                                    <div class="d-flex mb-3">
                                        <a href="detail?product_id=${p.product_id}" class="me-3">
                                            <img
                                                src="${pageContext.request.contextPath}/${p.img}"
                                                alt="Similar Items"
                                                style="min-width: 96px; height: 96px"
                                                class="img-md img-thumbnail"
                                                />
                                        </a>
                                        <div class="info">
                                            <a href="detail?product_id=${p.product_id}" class="nav-link mb-1">
                                                ${p.product_name}
                                            </a>
                                            <p>${p.product_description}</p>
                                            <strong class="text-dark"> ${p.product_price}</strong>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            </section>

            <script>
                document.getElementById('minusButton').addEventListener('click', function () {
                    var input = document.getElementById('quantityInput');
                    var value = parseInt(input.value, 10);
                    value = isNaN(value) ? 0 : value;
                    value--;
                    input.value = value < 1 ? 1 : value;
                });

                document.getElementById('plusButton').addEventListener('click', function () {
                    var input = document.getElementById('quantityInput');
                    var value = parseInt(input.value, 10);
                    value = isNaN(value) ? 0 : value;
                    value++;
                    input.value = value;
                });
            </script>


