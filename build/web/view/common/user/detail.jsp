<%-- 
    Document   : detail
    Created on : Feb 23, 2024, 4:09:17?PM
    Author     : lamph
--%>
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
                    <h4 class="title text-dark">${detail.product_name}</h4>
                    <span class="text-success ms-2">In stock</span>
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

                <div class="row mb-4">
                    <div class="col-md-4 col-6">
                        <label class="mb-2">Size</label>
                        <br/>
                        <select class="border border-secondary" style="height: 35px;">
                            <option>Small</option>
                            <option>Medium</option>
                            <option>Large</option>
                        </select>
                    </div>
                    <!-- col.// -->
                    <div class="col-md-4 col-6 mb-3">
                        <label class="mb-2 d-block">Quantity</label>
                        <div class="input-group mb-3" style="width: 170px;">
                            <button class="btn btn-white border border-secondary px-3" type="button" id="button-addon1" data-mdb-ripple-color="dark">
                                <i class="fas fa-minus"></i>
                            </button>
                            <input type="text" class="form-control text-center border border-secondary" placeholder="1" aria-label="Example text with button addon" aria-describedby="button-addon1" />
                            <button class="btn btn-white border border-secondary px-3" type="button" id="button-addon2" data-mdb-ripple-color="dark">
                                <i class="fas fa-plus"></i>
                            </button>
                        </div>
                    </div>
                </div>
                <a href="#" class="btn btn-warning shadow-0"> Buy now </a>
                <a href="#" class="btn btn-primary shadow-0"> <i class="me-1 fa fa-shopping-basket"></i> Add to cart </a>
                <a href="#" class="btn btn-light border border-secondary py-2 icon-hover px-3"> <i class="me-1 fa fa-heart fa-lg"></i> Save </a>
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
                        <div
                            class="tab-pane fade show active"
                            id="ex1-pills-1"
                            role="tabpanel"
                            aria-labelledby="ex1-tab-1"
                            >

                            <table class="table border mt-3 mb-2">
                                <tr>
                                    <th class="py-2">ID</th>
                                    <td class="py-2">13.3-inch LED-backlit display with IPS</td>
                                </tr>
                                <tr>
                                    <th class="py-2">Size</th>
                                    <td class="py-2">2.3GHz dual-core Intel Core i5</td>
                                </tr>
                                <tr>
                                    <th class="py-2">Measurements</th>
                                    <td class="py-2">720p FaceTime HD camera</td>
                                </tr>
                                <tr>
                                    <th class="py-2">Height</th>
                                    <td class="py-2">8 GB RAM or 16 GB RAM</td>
                                </tr>
                                <tr>
                                    <th class="py-2">Weight</th>
                                    <td class="py-2">Intel Iris Plus Graphics 640</td>
                                </tr>
                            </table>

                            <!-- Pills content -->
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-lg-4">
                <div class="px-0 border rounded-2 shadow-0">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Similar items</h5>
                            <div class="d-flex mb-3">
                                <a href="#" class="me-3">
                                    <img
                                        src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/8.webp"
                                        style="min-width: 96px; height: 96px"
                                        class="img-md img-thumbnail"
                                        />
                                </a>
                                <div class="info">
                                    <a href="#" class="nav-link mb-1">
                                        Rucksack Backpack Large <br />
                                        Line Mounts
                                    </a>
                                    <strong class="text-dark"> $38.90</strong>
                                </div>
                            </div>

                            <div class="d-flex mb-3">
                                <a href="#" class="me-3">
                                    <img
                                        src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/9.webp"
                                        style="min-width: 96px; height: 96px"
                                        class="img-md img-thumbnail"
                                        />
                                </a>
                                <div class="info">
                                    <a href="#" class="nav-link mb-1">
                                        Summer New Men's Denim <br />
                                        Jeans Shorts
                                    </a>
                                    <strong class="text-dark"> $29.50</strong>
                                </div>
                            </div>

                            <div class="d-flex mb-3">
                                <a href="#" class="me-3">
                                    <img
                                        src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/10.webp"
                                        style="min-width: 96px; height: 96px"
                                        class="img-md img-thumbnail"
                                        />
                                </a>
                                <div class="info">
                                    <a href="#" class="nav-link mb-1">
                                        T-shirts with multiple colors, for men and lady
                                    </a>
                                    <strong class="text-dark"> $120.00</strong>
                                </div>
                            </div>

                            <div class="d-flex">
                                <a href="#" class="me-3">
                                    <img
                                        src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/11.webp"
                                        style="min-width: 96px; height: 96px"
                                        class="img-md img-thumbnail"
                                        />
                                </a>
                                <div class="info">
                                    <a href="#" class="nav-link mb-1">
                                        Blazer Suit Dress Jacket for Men, Blue color
                                    </a>
                                    <strong class="text-dark"> $339.90</strong>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </section>


