<%@ page import="vn.edu.hcmuaf.fit.project_fruit.dao.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- link swiper -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <!-- link style css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <!-- Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <!-- link logo anh -->
    <link rel="icon" href="${pageContext.request.contextPath}/assets/img/logoBank/logoweb.png"  type="image/x-icon">
    <title>Selling Fruit</title>
</head>

<body>
<!-- header section stars -->
<header>
    <div class="header-container">
        <div class="left">
            <div class="menu">
          <span id="menuToggle" onclick="toggleSidebarMenu()">
            <i id="menuIcon" class="fa-solid fa-bars"></i></span>
            </div>
            <div class="logo">
                <h1>Vitamin<span>FRUIT</span></h1>
            </div>
            <div class="search">
                <input type="text" placeholder="Tìm kiếm sản phẩm...">
                <i class="fa-solid fa-search"></i>
            </div>
        </div>
        <div class="center">
            <div class="delivery" onclick="toggleBranchSelection()">
                <span>Giao hoặc đến lấy tại ▼</span>
                <p>Chi nhánh 1 - 43 Nguyễn Thái Học...</p>
            </div>
        </div>
        <div class="right">
            <div class="hotline">
                <i class="fas fa-phone"></i>
                <span>Hotline: 0865660775</span>
            </div>
            <div class="cart">
                <i class="fa-solid fa-cart-shopping"></i>
                <span>Giỏ hàng</span>
                <span class="cart-badge">0</span>
            </div>
            <%-- Kiểm tra nếu người dùng đã đăng nhập --%>
            <% User user = (User) session.getAttribute("user"); %>
            <% if (user != null) { %>
            <!-- Hiển thị avatar và tên người dùng khi đã đăng nhập -->
            <div class="account" style="display: none;">
                <i class="fa-solid fa-user"></i>
                <span>Tài khoản</span>
            </div>

            <div class="user-menu" id="userMenu" style="display: block;">
                <p><i class="fa fa-handshake"></i> Xin chào, <span id="userNameDisplay"><%= user.getEmail() %></span></p>
                <ul>
                    <li><a href="./user/user.jsp"><i class="fas fa-box"></i> Thông tin cá nhân</a></li>
                    <li><a href="#"><i class="fas fa-headset"></i> Hỗ trợ khách hàng</a></li>
                    <li><a href="logout" id="logout"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
                </ul>
            </div>

            <!-- Hiển thị avatar của người dùng -->
            <div class="avatar">
                <img src="${pageContext.request.contextPath}/assets/img/anhdaidien.jpg" alt="Avatar" class="avatar-image">
            </div>
            <% } else { %>
            <!-- Hiển thị form đăng nhập nếu người dùng chưa đăng nhập -->
            <form action="login" method="post">
                <div class="login-form" id="loginForm">
                    <h2>ĐĂNG NHẬP</h2>
                    <p>Nhập email và mật khẩu của bạn:</p>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" placeholder="Email" name="useremail">
                    </div>
                    <div class="form-group">
                        <label for="password">Mật khẩu</label>
                        <input type="password" id="password" placeholder="Mật khẩu" name="pass">
                    </div>
                    <p id="error-message" style="color: red; display: none;">Xin vui lòng kiểm tra lại thông tin đăng nhập</p>
                    <button class="login-button" type="submit">ĐĂNG NHẬP</button>
                    <p class="additional-links">
                        Khách hàng mới? <a href="./user/register.html">Tạo tài khoản</a><br>
                        Quên mật khẩu? <a href="#" onclick="showForgotPasswordForm()">Khôi phục mật khẩu</a>
                    </p>
                </div>
            </form>
            <% } %>
        </div>
    </div>
    <!-- Branch Selection Form -->
    <div class="branch-selection" id="branchSelection">
        <h2>KHU VỰC MUA HÀNG</h2>
        <div class="form-group">
            <label for="city">Tỉnh/Thành</label>
            <select id="city">
                <option>- Chọn Thành phố/ tỉnh -</option>
                <option>Hồ Chí Minh</option>
                <!-- Thêm các tỉnh/thành khác nếu cần -->
            </select>
        </div>
        <div class="form-group">
            <label for="district">Quận/Huyện</label>
            <select id="district">
                <option>- Chọn Quận/Huyện -</option>
                <option>- Thủ Đức -</option>
                <option>- Quận 1 -</option>
                <!-- Thêm các quận/huyện khác nếu cần -->
            </select>
        </div>

        <div class="selected-branch">
            <p>Giao hoặc đến lấy tại:</p>
            <div class="branch-info-highlight">
                <p><strong>Chi nhánh 1 - 43 Nguyễn Thái Học, Phường Cầu Ông Lãnh, Quận 1</strong></p>
            </div>
        </div>

        <p>Chọn cửa hàng gần bạn nhất để tối ưu chi phí giao hàng. Hoặc đến lấy hàng</p>

        <div class="branch-list">
            <div class="branch">
                <p><i class="fas fa-map-marker-alt"></i> Chi nhánh 1</p>
                <p>43 Nguyễn Thái Học, Phường Cầu Ông Lãnh, Quận 1</p>
            </div>
            <div class="branch">
                <p><i class="fas fa-map-marker-alt"></i> Chi nhánh 2</p>
                <p>SAV.7-00.01, Tầng trệt Tháp 7, The Sun Avenue, 28 Mai Chí Thọ, phường An Phú, thành phố Thủ Đức, Phường An
                    Phú, Thành phố Thủ Đức</p>
            </div>
        </div>
    </div>
<%--    <form action="login" method="post">--%>
<%--    <div class="login-form" id="loginForm">--%>
<%--        <h2>ĐĂNG NHẬP</h2>--%>
<%--        <p>Nhập email và mật khẩu của bạn:</p>--%>
<%--        <div class="form-group">--%>
<%--            <label for="email">Email</label>--%>
<%--            <input type="email" id="email" placeholder="Email" name="useremail">--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="password">Mật khẩu</label>--%>
<%--            <input type="password" id="password" placeholder="Mật khẩu" name="pass">--%>
<%--        </div>--%>
<%--        <p id="error-message" style="color: red; display: none;">Xin vui lòng kiểm tra lại thông tin đăng nhập</p>--%>
<%--        <p class="captcha-text">--%>
<%--            Trang web này được bảo vệ bởi reCAPTCHA và Google--%>
<%--            <a href="https://policies.google.com/privacy">Privacy Policy</a> and--%>
<%--            <a href="https://policies.google.com/terms">Terms of Service</a> apply.--%>
<%--        </p>--%>
<%--        <button class="login-button" onclick="login()">ĐĂNG NHẬP</button>--%>
<%--        <p class="additional-links">--%>

<%--            Khách hàng mới? <a href="./user/register.html">Tạo tài khoản</a><br>--%>

<%--            Quên mật khẩu? <a href="#" onclick="showForgotPasswordForm()">Khôi phục mật khẩu</a>--%>
<%--        </p>--%>
<%--    </div>--%>
<%--    </form>--%>
    <div class="overlay" id="overlay"></div>
    <div class="forgot-password-form" id="forgotPasswordForm">
        <h2>KHÔI PHỤC MẬT KHẨU</h2>
        <p>Nhập email của bạn để khôi phục mật khẩu:</p>
        <div class="form-group">
            <label for="forgot-email">Email</label>
            <input type="email" id="forgot-email" placeholder="Email">
        </div>
        <button class="forgot-password-button" onclick="resetPassword()">Gửi yêu cầu khôi phục</button>
        <p class="additional-links">
            <a href="#" onclick="showLoginForm()">Quay lại đăng nhập</a>
        </p>
    </div>
    <div class="cart-form" id="cartForm">
        <h2>GIỎ HÀNG</h2>
        <hr>
        <div class="cart-content">
            <i class="fa-solid fa-cart-shopping cart-icon"></i>
            <p>Hiện chưa có sản phẩm</p>
        </div>
        <hr>
        <div class="cart-total">
            <span>TỔNG TIỀN:</span>
            <span class="total-amount">0₫</span>
        </div>
        <a href="./card/card.jsp" class="view-cart-button">XEM GIỎ HÀNG</a>
    </div>
</header>
<!-- Menu Bar dưới Header -->
<!-- Menu Bar dưới Header -->
<nav class="menu-bar">
    <ul>
        <li class="active"><a href="/project_fruit/list-product" onclick="setActive(this)"><i class="fas fa-home"></i> Trang chủ</a></li>
        <li><a href="/project_fruit/list-product?category=traicayhomnay" onclick="setActive(this)">Trái ngon hôm nay</a></li>
        <li><a href="/project_fruit/list-product?category=traicayvietnam" onclick="setActive(this)">Trái cây Việt Nam</a></li>
        <li><a href="/project_fruit/list-product?category=traicaynhapkhau" onclick="setActive(this)">Trái cây nhập khẩu</a></li>
        <li><a href="/project_fruit/list-product?category=traicaycatsan" onclick="setActive(this)">Trái cây cắt sẵn</a></li>
        <li><a href="/project_fruit/list-product?category=quatangtraicay" onclick="setActive(this)">Quà tặng trái cây</a></li>
        <li><a href="/project_fruit/list-product?category=hopquanguyencat" onclick="setActive(this)">Hộp quà Nguyệt Cát</a></li>
        <li><a href="/project_fruit/list-product?category=traicaysaykho" onclick="setActive(this)">Trái cây sấy khô</a></li>
        <li><a href="/project_fruit/list-product?category=muttraicay" onclick="setActive(this)">Mứt trái cây</a></li>
        <li><a href="/project_fruit/user/contact.jsp" onclick="setActive(this)">Liên hệ</a></li>
    </ul>
</nav>

<!-- Menu docj ban đầu ẩn , chỉ xuất hiện khi ấn icon -->
<nav class="sidebar-menu" id="sidebarMenu">
    <ul>
        <li><a href="/project_fruit/list-product" onclick="setActive(this)"><i class="fas fa-home"></i> Trang chủ</a></li>
        <li><a href="/project_fruit/list-product?category=traicayhomnay" onclick="setActive(this)">Trái ngon hôm nay</a></li>
        <li><a href="/project_fruit/list-product?category=traicayvietnam" onclick="setActive(this)">Trái cây Việt Nam</a></li>
        <li><a href="/project_fruit/list-product?category=traicaynhapkhau" onclick="setActive(this)">Trái cây nhập khẩu</a></li>
        <li><a href="/project_fruit/list-product?category=traicaycatsan" onclick="setActive(this)">Trái cây cắt sẵn</a></li>
        <li><a href="/project_fruit/list-product?category=quatangtraicay" onclick="setActive(this)">Quà tặng trái cây</a></li>
        <li><a href="/project_fruit/list-product?category=hopquanguyencat" onclick="setActive(this)">Hộp quà Nguyệt Cát</a></li>
        <li><a href="/project_fruit/list-product?category=traicaysaykho" onclick="setActive(this)">Trái cây sấy khô</a></li>
        <li><a href="/project_fruit/list-product?category=muttraicay" onclick="setActive(this)">Mứt trái cây</a></li>
        <li><a href="../user/contact.jsp" onclick="setActive(this)">Liên hệ</a></li>


    </ul>
</nav>
<!-- header section ends -->

<!-- home section starts -->
<section class="home" id="home">
    <div class="swiper-container background-slider">
        <div class="swiper-wrapper">
            <div class="swiper-slide"><img src="./assets/img/back6.webp" alt="Background 4"></div>
            <div class="swiper-slide"><img src="./assets/img/back5.webp" alt="Background 1"></div>
            <div class="swiper-slide"><img src="./assets/img/back2.jpg" alt="Background 2"></div>
            <div class="swiper-slide"><img src="./assets/img/back3.jpg" alt="Background 3"></div>
            <div class="swiper-slide"><img src="./assets/img/back3.webp" alt="Background 4"></div>
        </div>
    </div>
    <div class="swiper-button-pre"><i class="fa-solid fa-angle-left"></i></div>
    <div class="swiper-button-nex"><i class="fa-solid fa-angle-right"></i></div>
</section>

<!-- home section ends -->

<!-- features section starts -->
<section class="features" id="features">
    <h1 class="heading"><span>Dịch vụ nổi bật</span></h1>
    <div class="box-container">
        <div class="box">
            <img src="./assets/img/fea1.jpg" alt="" />
            <h3>Tươi và xanh</h3>
            <p>
                Trái cây tươi nhập khẩu và trong nước phục vụ theo nhu cầu của bạn.
            </p>
            <a href="#" class="btn">đọc thêm</a>
        </div>
        <div class="box">
            <img src="./assets/img/fea2.jpg" alt="" />
            <h3>giao hàng miễn phí</h3>
            <p>
                Giao hàng mọi lúc, mọi nơi, miễn phí vận chuyển, còn chần chừ gì
                nữa.
            </p>
            <a href="#" class="btn">đọc thêm</a>
        </div>
        <div class="box">
            <img src="./assets/img/fea3.jpg" alt="" />
            <h3>thanh toán dễ dàng</h3>
            <p>
                Nhiều phương thức thanh toán, tùy theo nhu cầu thanh toán của bạn.
            </p>
            <a href="#" class="btn">đọc thêm</a>
        </div>
        </div>
    </section>
<!-- features section ends -->
<section class="products1" id="products1">
    <h1 class="heading"><span>Ưu đãi trong tuần</span></h1>
    <div class="swiper product-slider">
        <div class="swiper-wrapper">
            <c:forEach var="product" items="${data}">
                <div class="swiper-slide box">
                    <a href="${pageContext.request.contextPath}/product-detail?pid=${product.id_product}">
                        <!-- Hiển thị hình ảnh sản phẩm -->
                        <img src="${product.imageUrl != null ? product.imageUrl : '/assets/img/default.jpg'}"
                             alt="${product.name}" />
                        <!-- Phần giảm giá -->
                        <div class="discount">${product.percentDiscount}%</div>
                        <!-- Hiển thị thông tin sản phẩm -->
                        <h4 style="color: red">Mã sản phẩm: ${product.id_product}</h4>
                        <h3>${product.name}</h3>
                        <h3 class="price" >${product.discountedPrice}đ/ <span style= "color: gray; text-decoration: line-through"><del>${product.price}đ</del> </span></h3>
                        <div class="stars">
                            <i>Đánh giá: ${product.rating} <i class="fas fa-star"></i></i>
                        </div>
                        <!-- Nút thêm vào giỏ hàng -->
                        <a href="#" class="btn">thêm vào giỏ hàng</a>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="swiper product-slider">
        <div class="swiper-wrapper">
            <c:forEach var="product" items="${data}">
                <div class="swiper-slide box">
                    <a href="${pageContext.request.contextPath}/product-detail?pid=${product.id_product}">
                        <!-- Hiển thị hình ảnh sản phẩm -->
                        <img src="${product.imageUrl != null ? product.imageUrl : '/assets/img/default.jpg'}"
                             alt="${product.name}" />
                        <!-- Phần giảm giá -->
                        <div class="discount">${product.percentDiscount}%</div>
                        <!-- Hiển thị thông tin sản phẩm -->
                        <h4 style="color: red">Mã sản phẩm: ${product.id_product}</h4>
                        <h3>${product.name}</h3>
                        <h3 class="price" >${product.discountedPrice}đ/ <span style= "color: gray; text-decoration: line-through"><del>${product.price}đ</del> </span></h3>
                        <div class="stars">
                            <i>Đánh giá: ${product.rating} <i class="fas fa-star"></i></i>
                        </div>
                        <!-- Nút thêm vào giỏ hàng -->
                        <a href="#" class="btn">thêm vào giỏ hàng</a>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="swiper product-slider hidden" id="product-slider-1">
        <div class="swiper-wrapper">
            <c:forEach var="product" items="${data}">
                <div class="swiper-slide box">
                    <a href="${pageContext.request.contextPath}/product-detail?pid=${product.id_product}">
                        <!-- Hiển thị hình ảnh sản phẩm -->
                        <img src="${product.imageUrl != null ? product.imageUrl : '/assets/img/default.jpg'}"
                             alt="${product.name}" />
                        <!-- Phần giảm giá -->
                        <div class="discount">${product.percentDiscount}%</div>
                        <!-- Hiển thị thông tin sản phẩm -->
                        <h4 style="color: red">Mã sản phẩm: ${product.id_product}</h4>
                        <h3>${product.name}</h3>
                        <h3 class="price" >${product.discountedPrice}đ/ <span style= "color: gray; text-decoration: line-through"><del>${product.price}đ</del> </span></h3>
                        <div class="stars">
                            <i>Đánh giá: ${product.rating} <i class="fas fa-star"></i></i>
                        </div>
                        <!-- Nút thêm vào giỏ hàng -->
                        <a href="#" class="btn">thêm vào giỏ hàng</a>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="view-more-container">
        <a href="#" class="view-more" id="view-more-btn">Xem tất cả sản phẩm ưu đãi</a>
    </div>
</section>
<!-- products section starts-->
<!-------------------------------------------------------- trái cây hôm nay -------------------------------------->
<section class="products" id="products">
    <h1 class="heading"><span>trái cây hôm nay</span></h1>
    <div class="swiper product-slider">
        <div class="swiper-wrapper">
            <div class="swiper-slide box">
                <a href="detailproduct.html">
                    <img src="./assets/img/traicaytrangchu/nagiongthai.webp" alt="" />
                    <h3>Na giống thái</h3>
                    <h3 class="price">45.000đ</h3>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <a href="#" class="btn">thêm vào giỏ hàng</a>
                </a>
            </div>
        </div>
    </div>
    <div class="swiper product-slider">
        <div class="swiper-wrapper">
            <div class="swiper-slide box">
                <img src="./assets/img/traicayhomnay/nhan.webp" alt="" />
                <h3>Nhãn</h3>
                <h3 class="price">95.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
        </div>
    </div>
    <div class="view-more-container">
        <a href="./product/traicayhomnay.html" class="view-more" id="view-more-btn">Xem thêm sản phẩm hôm nay</a>
    </div>
</section>
<!--------------------------------------- sản phẩm việt nam ------------------------------------------------->
<section class="products" id="products">
    <h1 class="heading"><span>trái cây việt nam</span></h1>

    <div class="swiper product-slider">
        <div class="swiper-wrapper">
            <div class="swiper-slide box">
                <img src="./assets/img/traicayvietnam/oi.jpg" alt="" />
                <h3>ỔI</h3>
                <h3 class="price">60.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
        </div>
    </div>
    <div class="swiper product-slider">
        <div class="swiper-wrapper">
            <div class="swiper-slide box">
                <img src="./assets/img/traicayvietnam/vai.png" alt="" />
                <h3>Vải</h3>
                <h3 class="price">85.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
        </div>
    </div>
    <div class="view-more-container">
        <a href="traicayvietnam.html" class="view-more" id="view-more-btn">Xem thêm sản phẩm việt nam</a>
    </div>
</section>
<!--------------------------------------------------- Trái cây nhập khẩu --------------------------------------->
<section class="products" id="products">
    <h1 class="heading"><span>trái cây nhập khẩu</span></h1>

    <div class="swiper product-slider">
        <div class="swiper-wrapper">
            <div class="swiper-slide box">
                <img src="./assets/img/traicaynhapkhau/lehanrima.png" alt="" />
                <h3>Lê Hàn Rima</h3>
                <h3 class="price">195.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
        </div>
    </div>
    <div class="swiper product-slider">
        <div class="swiper-wrapper">
            <div class="swiper-slide box">
                <img src="./assets/img/traicaynhapkhau/methailan.jpg" alt="" />
                <h3>Me Thái Lan</h3>
                <h3 class="price">86.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
        </div>
    </div>
    <div class="view-more-container">
        <a href="./product/traicaynhapkhau.html" class="view-more" id="view-more-btn">Xem thêm sản phẩm nhập khẩu</a>
    </div>
</section>
<!--------------------------------------------------------------- trái cây cắt sẵn ------------------------------------------->
<section class="products" id="products">
    <h1 class="heading"><span>trái cây cắt sẵn</span></h1>
    <div class="swiper product-slider">
        <div class="swiper-wrapper">
            <div class="swiper-slide box">
                <img src="./assets/img/traicaycatsan/cs37.webp" alt="" />
                <h3>Trái cây cắt sẵn CS37</h3>
                <h3 class="price">99.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
        </div>
    </div>
    <div class="swiper product-slider">
        <div class="swiper-wrapper">
            <div class="swiper-slide box">
                <img src="./assets/img/traicaycatsan/cs46.webp" alt="" />
                <h3>Trái cây cắt sẵn CS46</h3>
                <h3 class="price">85.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
        </div>
    </div>
    <div class="view-more-container">
        <a href="./product/traicaycatsan.html" class="view-more" id="view-more-btn">Xem thêm sản phẩm cắt sẵn</a>
    </div>
</section>
<!-- quà tặng trái cây -->
<section class="products" id="products">
    <h1 class="heading"><span>quà tặng trái cây</span></h1>
    <div class="swiper product-slider">
        <div class="swiper-wrapper">
            <div class="swiper-slide box">
                <img src="./assets/img/gq24.webp" alt="" />
                <h3>Hộp Quà Niềm Vui</h3>
                <h3 class="price">666.000đ</h3>

                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
        </div>
    </div>
    <div class="swiper product-slider">
        <div class="swiper-wrapper">
            <div class="swiper-slide box">
                <img src="./assets/img/gioqua2010.webp" alt="" />
                <h3>Giỏ Quà Tặng 20/10 01</h3>
                <h3 class="price">999.000đ</h3>

                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
        </div>
    </div>
    <div class="view-more-container">
        <a href="./product/quatangtraicay.html" class="view-more" id="view-more-btn">Xem thêm sản phẩm quà tặng</a>
    </div>
</section>
<section class="products" id="products">
    <h1 class="heading"><span>hộp quà nguyệt cát</span></h1>
    <div class="swiper product-slider">
        <div class="swiper-wrapper">
            <div class="swiper-slide box">

                <img src="./assets/img/hqnc1.png" alt="" />
                <h3>Hộp Nguyệt Cát 01</h3>
                <h3 class="price">3.200.000đ</h3>

                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
        </div>
    </div>
    <div class="swiper product-slider">
        <div class="swiper-wrapper">
            <div class="swiper-slide box">
                <img src="./assets/img/hqnc9.png" alt="" />
                <h3>Hộp Nguyệt Cát 09</h3>
                <h3 class="price">5.300.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
        </div>
    </div>
    <div class="view-more-container">
        <a href="./product/hopqua.html" class="view-more" id="view-more-btn">Xem thêm sản phẩm quà tặng nguyên cát</a>
    </div>
</section>
<section class="products" id="products">
    <h1 class="heading"><span>trái cây sấy khô</span></h1>
    <div class="swiper product-slider">
        <div class="swiper-wrapper">
            <div class="swiper-slide box">
                <img src="./assets/img/tcs1.jpg" alt="" />
                <h3>Thơm sấy dẻo ớt cay</h3>
                <h3 class="price">80.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
        </div>
    </div>
    <div class="swiper product-slider">
        <div class="swiper-wrapper">
            <div class="swiper-slide box">
                <img src="./assets/img/tcs8.jpg" alt="" />
                <h3>Xoài sấy dẻo không đường</h3>
                <h3 class="price">100.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
        </div>
    </div>
    <div class="view-more-container">
        <a href="./product/traicaysaykho.html" class="view-more" id="view-more-btn">Xem thêm sản phẩm sấy khô</a>
    </div>
</section>
<!-- Mứt -->
<section class="products" id="products">
    <h1 class="heading"><span>Mứt trái cây</span></h1>
    <div class="swiper product-slider">
        <div class="swiper-wrapper">
            <div class="swiper-slide box">
                <img src="./assets/img/mtc1.webp" alt="" />
                <h3>Mứt Nho</h3>
                <h3 class="price">139.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
        </div>
    </div>
    <div class="swiper product-slider">
        <div class="swiper-wrapper">
            <div class="swiper-slide box">
                <img src="./assets/img/mtc9.webp" alt="" />
                <h3>Mứt Dâu</h3>
                <h3 class="price">99.000đ</h3>
                </h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
        </div>
    </div>
    <div class="view-more-container">
        <a href="./product/muttraicay.html" class="view-more" id="view-more-btn">Xem thêm sản phẩm mứt trái cây</a>
    </div>
</section>
<!-- products section end-->
<!-- categories section starts -->
<section class="categories" id="categories">
    <h1 class="heading">thể loại<span>sản phẩm</span></h1>
    <div class="box-container">
        <div class="box">
            <img src="./assets/img/traicayvietnam/mam_xoi_den.webp" alt="" />
            <h3>Trái cây Việt Nam</h3>
            <p>Giảm giá tới 30%</p>
            <a href="./product/traicayvietnam.html" class="btn">mua ngay</a>
        </div>
        <div class="box">
            <img src="./assets/img/traicaynhapkhau/le_sua_noi_dia_trung.webp" alt="" />
            <h3>Trái cây nhập khẩu</h3>
            <p>Giảm giá tới 25%</p>
            <a href="./product/traicaynhapkhau.html" class="btn">mua ngay</a>
        </div>
        <div class="box">
            <img src="./assets/img/traicaycatsan/cs01.webp" alt="" />
            <h3>Trái cây cắt sẵn</h3>
            <p>Giảm giá tới 20%</p>
            <a href="./product/traicaycatsan.html" class="btn">mua ngay</a>
        </div>
        <div class="box">
            <img src="./assets/img/gq19.webp" alt="" />
            <h3>Quà tặng trái cây</h3>
            <p>Giảm giá tới 30%</p>
            <a href="./product/quatangtraicay.html" class="btn">mua ngay</a>
        </div>
        <div class="box">
            <img src="./assets/img/hqnc1.png" alt="" />
            <h3>Hộp quà nguyên cát</h3>
            <p>Giảm giá tới 30%</p>
            <a href="./product/hopqua.html" class="btn">mua ngay</a>
        </div>
        <div class="box">
            <img src="./assets/img/tcs1.jpg" alt="" />
            <h3>Trái cây sấy khô</h3>
            <p>Giảm giá tới 50%</p>
            <a href="./product/traicaysaykho.html" class="btn">mua ngay</a>
        </div>
        <div class="box">
            <img src="./assets/img/mtc1.webp" alt="" />
            <h3>Mứt trái cây</h3>
            <p>Giảm giá tới 45%</p>
            <a href="./product/muttraicay.html" class="btn">mua ngay</a>
        </div>
    </div>
</section>
<section class="brand" id="brand">
    <h1 class="heading"><span>Hợp tác thương hiệu</span></h1>
    <div class="swiper brand-slider">
        <div class="swiper-wrapper">
            <div class="swiper-slide box">
                <img src="./assets/img/logoBank/acb.webp" alt="" />
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/logoBank/bidv.webp" alt="" />
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/logoBank/helo.webp" alt="" />
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/logoBank/map.webp" alt="" />
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/logoBank/shahan.webp" alt="" />
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/logoBank/bo.webp" alt="" />
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/logoBank/ocb.webp" alt="" />
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/logoBank/pep.webp" alt="" />
            </div>
        </div>
        <div class="button-prev"><i class="fa-solid fa-angle-left"></i></div>
        <div class="button-next"><i class="fa-solid fa-angle-right"></i></div>
    </div>
</section>
<!-- blog section start -->
<section class="blogs" id="blogs">
    <h1 class="heading">blog <span>của chúng tôi</span></h1>
    <div class="box-container">
        <div class="box">
            <img src="./assets/img/bl1.0.jpg" alt="" />
            <div class="content">
                <div class="icons">
                    <a href="#"> <i class="fas fa-user"></i>người dùng</a>
                    <a href="#"> <i class="fas fa-calendar"></i>1st 5/2023</a>
                </div>
                <h3>
                    Lợi Ích Sức Khỏe Của Trái Cây Tươi
                </h3>
                <p> - Giới thiệu về các loại trái cây phổ biến và lợi ích sức khỏe mà chúng mang lại. Ví dụ, cam giàu vitamin
                    C giúp tăng cường hệ miễn dịch, táo chứa chất xơ tốt cho tiêu hóa, hay nho chứa chất chống oxy hóa tốt cho
                    da.
                    <br>
                    - Nâng cao nhận thức về việc bổ sung trái cây vào chế độ ăn uống hàng ngày và khuyến khích khách hàng lựa
                    chọn trái cây tươi cho sức khỏe.
                </p>
                <a href="#" class="btn">đọc thêm</a>
            </div>
        </div>
        <div class="box">
            <img src="./assets/img/bl2.jpg" alt="" />
            <div class="content">
                <div class="icons">
                    <a href="#"> <i class="fas fa-user"></i>người dùng</a>
                    <a href="#"> <i class="fas fa-calendar"></i>2st 2/2021</a>
                </div>
                <h3>
                    Cách Bảo Quản Trái Cây Tươi Lâu Hơn
                </h3>
                <p>
                    - Cung cấp các mẹo và phương pháp bảo quản trái cây đúng cách để giữ được độ tươi lâu hơn. Hướng dẫn về cách
                    bảo quản trái cây khác nhau như: để trong tủ lạnh, bảo quản ở nhiệt độ phòng, hoặc cách rửa và cất trữ trái
                    cây. <br>
                    - Giúp khách hàng bảo quản trái cây mua về được lâu hơn, tránh lãng phí và đảm bảo chất lượng tốt nhất khi
                    sử
                    dụng.
                </p>
                <a href="#" class="btn">đọc thêm</a>
            </div>
        </div>
        <div class="box">
            <img src="./assets/img/bl3.jpg" alt="" />
            <div class="content">
                <div class="icons">
                    <a href="#"> <i class="fas fa-user"></i>người dùng</a>
                    <a href="#"> <i class="fas fa-calendar"></i>3st 7/2023</a>
                </div>
                <h3>
                    Những Món Ăn Ngon Với Trái Cây
                </h3>
                <p>
                    - Gợi ý các công thức món ăn hoặc đồ uống dễ làm từ trái cây, ví dụ như sinh tố trái cây, salad trái
                    cây, hoặc nước ép tươi mát. Kèm theo hình ảnh và hướng dẫn chi tiết để khách hàng dễ dàng thực hiện tại nhà.
                    <br>
                    - Tạo cảm hứng cho khách hàng về cách sử dụng trái cây để chế biến các món ăn ngon, độc đáo, và
                    khuyến khích việc mua nhiều loại trái cây khác nhau.
                </p>
                <a href="#" class="btn">đọc thêm</a>
            </div>
        </div>
    </div>
</section>

<!-- blog section end -->
<!-- footer section star -------------------------------------------------------------->
<section class="footer">
    <div class="box-container">
        <div class="box">
            <h3>VitaminFruit</h3>
            <p>
                "Chăm sóc sức khỏe bạn từ thiên nhiên! VitaminFruit – nguồn dinh dưỡng hoàn hảo cho cơ thể và tâm trí."
            </p>
            <div class="share">
                <a href="#" class="fab fa-facebook-f"></a>
                <a href="#" class="fab fa-twitter"></a>
                <a href="#" class="fab fa-instagram"></a>
                <a href="#" class="fab fa-youtube"></a>
                <a href="#" class="fab fa-tiktok"></a>
            </div>
        </div>
        <div class="box">
            <h3>liên hệ</h3>
            <p>Liên hệ chúng tôi tại đây :</p>
            <a href="#" class="links"><i class="fas fa-phone"></i>+334 286 049</a>
            <a href="#" class="links"><i class="fas fa-phone"></i>+263 463 463</a>

            <a href="#" class="links"><i class="fas fa-envelope"></i>nhom55ltw@gmail.com</a>


            <a href="#" class="links"><i class="fas fa-map-marker-alt"></i>VQCR+GP6, khu phố 6, Thủ Đức,
                Hồ Chí Minh</a>
        </div>
        <div class="box">

            <h3>Hỗ trợ khách hàng</h3>
            <p>
                Luôn hổ trợ khách hàng mọi lúc mọi nơi.
            </p>
            <a href="#home" class="links"><i class="fas fa-arrow-right"></i>Chính sách thương hiệu</a>
            <a href="#features" class="links"><i class="fas fa-arrow-right"></i>Chính sách thành viên</a>
            <a href="#products" class="links"><i class="fas fa-arrow-right"></i>Chính sách kiểm hàng</a>
            <a href="#categories" class="links"><i class="fas fa-arrow-right"></i>Chính sách giao hàng</a>
            <a href="#review" class="links"><i class="fas fa-arrow-right"></i>Chính sách thanh toán</a>
            <a href="#blogs" class="links"><i class="fas fa-arrow-right"></i>Chính sách bảo mật</a>
        </div>
        <div class="box">
            <h3>Đơn vị vận chuyển</h3>
            <p>"Chúng tôi sử dụng các đơn vị vận chuyển uy tín như Grab, Giao Hàng Tiết Kiệm, VNPost và nhiều đơn vị khác."
            </p>
            <div class="shipping-brands">
                <img src="./assets/img/logoBank/grab.jpg" alt="Grab" />
                <img src="./assets/img/logoBank/giaohangtietkiem.png" alt="Giao Hàng Tiết Kiệm" />
                <img src="./assets/img/logoBank/vnpost.webp" alt="VNPost" />
            </div>
        </div>
    </div>
    <div class="credit">Copyright © 2024 <span>Nhom 55 - Trái Cây Chất Lượng Cao</span></div>
</section>
<!-- footer section end -->

<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/fruit.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/login.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>

</html>