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
            <div class="account">
                <i class="fa-solid fa-user"></i>
                <span>Tài khoản</span>
            </div>
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
        <p class="captcha-text">
            Trang web này được bảo vệ bởi reCAPTCHA và Google
            <a href="https://policies.google.com/privacy">Privacy Policy</a> and
            <a href="https://policies.google.com/terms">Terms of Service</a> apply.
        </p>
        <button class="login-button" onclick="login()">ĐĂNG NHẬP</button>
        <p class="additional-links">

            Khách hàng mới? <a href="./user/register.html">Tạo tài khoản</a><br>

            Quên mật khẩu? <a href="#" onclick="showForgotPasswordForm()">Khôi phục mật khẩu</a>
        </p>
    </div>
    </form>
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
    <div class="user-menu" id="userMenu" style="display: none;">
        <p><i class="fa fa-handshake"></i> Xin chào,<span id="userNameDisplay">User</span></p>
        <ul>
            <li><a href="./user/user.jsp"><i class="fas fa-box"></i>Thông tin cá nhân</a></li>
            <li><a href="#"><i class="fas fa-headset"></i> Hỗ trợ khách hàng</a></li>
            <li><a href="" id="logout"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
        </ul>
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
                        <div class="discount">-10%</div>
                        <!-- Hiển thị thông tin sản phẩm -->
                        <h4 style="color: red">Mã sản phẩm: ${product.id_product}</h4>
                        <h3>${product.name}</h3>
                        <h3 class="price">${product.price}đ</h3>
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
                        <div class="discount">-10%</div>
                        <!-- Hiển thị thông tin sản phẩm -->
                        <h4 style="color: red">Mã sản phẩm: ${product.id_product}</h4>
                        <h3>${product.name}</h3>
                        <h3 class="price">${product.price}đ</h3>
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
            <div class="swiper-slide box">
                <img src="./assets/img/traicaytrangchu/manvangmy.webp" alt="" />
                <h3>Mận vàng Mỹ</h3>
                <h3 class="price">80.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/traicaytrangchu/leduongmat.webp" alt="" />
                <h3>Lê đường mật</h3>
                <h3 class="price">88.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/traicaytrangchu/mangcauxiem.webp" alt="" />
                <h3>Mãng cầu xiêm</h3>
                <h3 class="price">77.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/traicaytrangchu/medotbot.webp" alt="" />
                <h3>Me dốt bột</h3>
                <h3 class="price">65.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/traicaytrangchu/taocanada.jpg" alt="" />
                <h3>Táo canada</h3>
                <h3 class="price">82.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
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
            <div class="swiper-slide box">
                <img src="./assets/img/traicayhomnay/bonamlong.webp" alt="" />
                <h3>Bơ năm lóng</h3>
                <h3 class="price">95.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/traicayhomnay/thanhtra.webp" alt="" />
                <h3>Thanh Trà</h3>
                <h3 class="price">185.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/traicayhomnay/oiruby.webp" alt="" />
                <h3>Ổi ruby</h3>
                <h3 class="price">60.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/traicayhomnay/cam.png" alt="" />
                <h3>Cam</h3>
                <h3 class="price">65.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/traicayhomnay/mandenuc.jpg" alt="" />
                <h3>Mận đen Úc</h3>
                <h3 class="price">295.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
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
            <div class="swiper-slide box">
                <img src="./assets/img/traicayvietnam/taoxanh.jpg" alt="" />
                <h3>Táo xanh</h3>
                <h3 class="price">80.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/traicayvietnam/bo.png" alt="" />
                <h3>Bơ</h3>
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
            <div class="swiper-slide box">
                <img src="./assets/img/traicayvietnam/na.png" alt="" />
                <h3>Na</h3>
                <h3 class="price">145.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/traicayvietnam/chuoi.png" alt="" />
                <h3>Chuối</h3>
                <h3 class="price">29.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/traicayvietnam/duagang.png" alt="" />
                <h3>Dưa gang</h3>
                <h3 class="price">25.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
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
            <div class="swiper-slide box">
                <img src="./assets/img/traicayvietnam/dua.jpg" alt="" />
                <h3>Dừa</h3>
                <h3 class="price">15.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/traicayvietnam/hong.jpg" alt="" />
                <h3>Hồng</h3>
                <h3 class="price">125.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/traicayvietnam/man.jpg" alt="" />
                <h3>Mận</h3>
                <h3 class="price">85.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/traicayvietnam/mit.jpg" alt="" />
                <h3>Mít</h3>
                <h3 class="price">55.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/traicayvietnam/saurieng.jpg" alt="" />
                <h3>Sầu riêng</h3>
                <h3 class="price">420.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
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
            <div class="swiper-slide box">
                <img src="./assets/img/traicaynhapkhau/luuisrael.png" alt="" />
                <h3>Lựu Israel</h3>
                <h3 class="price">135.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/traicaynhapkhau/luuperu.png" alt="" />
                <h3>Lựu Peru</h3>
                <h3 class="price">255.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/traicaynhapkhau/mandenuc.jpg" alt="" />
                <h3>Mận đen úc</h3>
                <h3 class="price">295.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/traicaynhapkhau/manvangmy.webp" alt="" />
                <h3>Mận vàng Mỹ</h3>
                <h3 class="price">470.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/traicaynhapkhau/medotbot.png" alt="" />
                <h3>Me dốt bột</h3>
                <h3 class="price">105.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
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
            <div class="swiper-slide box">
                <img src="./assets/img/traicaynhapkhau/nhokeodomy.png" alt="" />
                <h3>Nho kẹo đỏ Mỹ</h3>
                <h3 class="price">1855.500đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/traicaynhapkhau/nhomaudonhanquoc.jpg" alt="" />
                <h3>Nho mẫu đơn Hàn Quốc</h3>
                <h3 class="price">495.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/traicaynhapkhau/nhoxanhngontayuc.png" alt="" />
                <h3>Nho xanh ngón tay Úc</h3>
                <h3 class="price">365.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/traicaynhapkhau/nhoxanhperu.png" alt="" />
                <h3>Nho xanh Peru</h3>
                <h3 class="price">285.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/traicaynhapkhau/taoenvynewzealand.jpg" alt="" />
                <h3>Táo envy New Zealand</h3>
                <h3 class="price">155.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
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
            <div class="swiper-slide box">
                <img src="./assets/img/traicaycatsan/cs40.webp" alt="" />
                <h3>Trái cây cắt sẵn CS40</h3>
                <h3 class="price">125.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/traicaycatsan/cs41.webp" alt="" />
                <h3>Trái cây cắt sẵn CS41</h3>
                <h3 class="price">88.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/traicaycatsan/cs43.webp" alt="" />
                <h3>Trái cây cắt sẵn CS43</h3>
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
            <div class="swiper-slide box">
                <img src="./assets/img/traicaycatsan/cs44.webp" alt="" />
                <h3>Trái cây cắt sẵn CS44</h3>
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
            <div class="swiper-slide box">
                <img src="./assets/img/traicaycatsan/cs45.webp" alt="" />
                <h3>Trái cây cắt sẵn CS45</h3>
                <h3 class="price">50.000đ</h3>
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
            <div class="swiper-slide box">
                <img src="./assets/img/traicaycatsan/cs47.webp" alt="" />
                <h3>Trái cây cắt sẵn CS47</h3>
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
            <div class="swiper-slide box">
                <img src="./assets/img/traicaycatsan/cs48.webp" alt="" />
                <h3>Trái cây cắt sẵn CS48</h3>
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
            <div class="swiper-slide box">
                <img src="./assets/img/traicaycatsan/cs49.webp" alt="" />
                <h3>Trái cây cắt sẵn CS49</h3>
                <h3 class="price">69.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/traicaycatsan/cs50.webp" alt="" />
                <h3>Trái cây cắt sẵn CS50</h3>
                <h3 class="price">90.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/traicaycatsan/cs51.webp" alt="" />
                <h3>Trái cây cắt sẵn CS51</h3>
                <h3 class="price">89.000đ</h3>
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
            <div class="swiper-slide box">
                <img src="./assets/img/gq19.webp" alt="" />
                <h3>Hộp Quà Năm Mới 01</h3>
                <h3 class="price">800.000đ</h3>

                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/gq20.webp" alt="" />
                <h3>Hộp Quà Năm Mới 02</h3>
                <h3 class="price">1.111.000đ</h3>

                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/gq21.webp" alt="" />
                <h3>Hộp Quà Năm Mới 03</h3>
                <h3 class="price">450.000đ</h3>

                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/gq22.webp" alt="" />
                <h3>Hộp Quà Năm Mới 04</h3>
                <h3 class="price">800.000đ</h3>

                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/gq23.webp" alt="" />
                <h3>Hộp Quà Năm Mới 05</h3>
                <h3 class="price">1.234.000đ</h3>

                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/gq23.webp" alt="" />
                <h3>Hộp Quà Năm Mới 06</h3>
                <h3 class="price">65.000đ</h3>

                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/gq23.webp" alt="" />
                <h3>Hộp Quà Năm Mới 07</h3>
                <h3 class="price">65.000đ</h3>

                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
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
            <div class="swiper-slide box">
                <img src="./assets/img/gq20101.webp" alt="" />
                <h3>Giỏ Quà Tặng 20/10 02</h3>
                <h3 class="price">890.000đ</h3>

                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/gq201010.webp" alt="" />
                <h3>Hộp Quà Tặng 20/10 03</h3>
                <h3 class="price">900.000đ</h3>
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
            <div class="swiper-slide box">
                <img src="./assets/img/gq201012.webp" alt="" />
                <h3>Hộp Quà Tặng 20/10 04</h3>
                <h3 class="price">450.000đ</h3>

                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/gq201013.webp" alt="" />
                <h3>Hộp Quà Tặng 20/10 05</h3>
                <h3 class="price">350.000đ</h3>

                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/gq201014.webp" alt="" />
                <h3>Hộp Quà Tặng 20/10 06</h3>
                <h3 class="price">700.000đ</h3>

                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/gq201015.webp" alt="" />
                <h3>Hộp Quà Tặng 20/10 07</h3>
                <h3 class="price">760.000đ</h3>

                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/gq201016.webp" alt="" />
                <h3>Hộp Quà Tặng 20/10 08</h3>
                <h3 class="price">800.000đ</h3>

                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
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
            <div class="swiper-slide box">

                <img src="./assets/img/hqnc2.png" alt="" />
                <h3>Hộp Nguyệt Cát 02</h3>
                <h3 class="price">5.219.000đ</h3>

                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/hqnc3.png" alt="" />
                <h3>Hộp Nguyệt Cát 03</h3>
                <h3 class="price">3.409.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">

                <img src="./assets/img/hqnc4.png" alt="" />
                <h3>Hộp Nguyệt Cát 04</h3>
                <h3 class="price">4.109.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/hqnc5.png" alt="" />
                <h3>Hộp Nguyệt Cát 05</h3>
                <h3 class="price">3.309.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/hqnc6.png" alt="" />
                <h3>Hộp Nguyệt Cát 06</h3>
                <h3 class="price">1.234.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/hqnc7.png" alt="" />
                <h3>Hộp Nguyệt Cát 07</h3>
                <h3 class="price">4.415.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">

                <img src="./assets/img/hqnc8.png" alt="" />
                <h3>Hộp Nguyệt Cát 08</h3>
                <h3 class="price">2.600.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
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
            <div class="swiper-slide box">
                <img src="./assets/img/hqnc10.png" alt="" />
                <h3>Hộp Nguyệt Cát 10</h3>
                <h3 class="price">6.500.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/hqnc11..png" alt="" />
                <h3>Hộp Nguyệt Cát 11</h3>
                <h3 class="price">3.000.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/hqnc12.png" alt="" />
                <h3>Hộp Nguyệt Cát 12</h3>
                <h3 class="price">4.600.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/hqnc13.png" alt="" />
                <h3>Hộp Nguyệt Cát 13</h3>
                <h3 class="price">6.305.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/hqnc14.png" alt="" />
                <h3>Hộp Nguyệt Cát 14</h3>
                <h3 class="price">2.300.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/hqnc15.png" alt="" />
                <h3>Hộp Nguyệt Cát 15</h3>
                <h3 class="price">3.900.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/hqnc16.png" alt="" />
                <h3>Hộp Nguyệt Cát 16</h3>
                <h3 class="price">1.250.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
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
            <div class="swiper-slide box">
                <img src="./assets/img/tcs2.jpg" alt="" />
                <h3>Xoài sấy dẻo ớt cay</h3>
                <h3 class="price">100.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/tcs3.jpg" alt="" />
                <h3>Xoài cát sấy dẻo</h3>
                <h3 class="price">9090.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/tcs4.jpg" alt="" />
                <h3>Mít sấy vị sầu riêng</h3>
                <h3 class="price">90.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/tcs5.png" alt="" />
                <h3>Mãng cầu sấy dẻo ớt cay</h3>
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
            <div class="swiper-slide box">
                <img src="./assets/img/tcs24.jpg" alt="" />
                <h3>Nấm hương sấy dẻo</h3>
                <h3 class="price">60.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/tcs6.jpg" alt="" />
                <h3>Chuối già sấy dẻo</h3>
                <h3 class="price">70.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/tcs7.jpg" alt="" />
                <h3>Chuối cau sấy dẻo</h3>
                <h3 class="price">90.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
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
            <div class="swiper-slide box">
                <img src="./assets/img/tcs9.jpg" alt="" />
                <h3>Thanh long sấy dẻo</h3>
                <h3 class="price">120120.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/tcs10.jpg" alt="" />
                <h3>Mẵng cầu sấy dẻo</h3>
                <h3 class="price">150.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/tcs11.jpg" alt="" />
                <h3>Thơm sấy dẻo</h3>
                <h3 class="price">80.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/tcs12.jpg" alt="" />
                <h3>Ổi sấy dẻo</h3>
                <h3 class="price">70.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/tcs13.jpg" alt="" />
                <h3>Xoài keo sấy dẻo</h3>
                <h3 class="price">80.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/tcs14.jpg" alt="" />
                <h3>Mận sấy dẻo</h3>
                <h3 class="price">110110.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/tcs15.png" alt="" />
                <h3>Thập cẩm sấy dẻo</h3>
                <h3 class="price">7070.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
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
            <div class="swiper-slide box">
                <img src="./assets/img/mtc2.webp" alt="" />
                <h3>Mứt Chanh Dây</h3>
                <h3 class="price">126.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/mtc3.webp" alt="" />
                <h3>Mứt Kiwi</h3>
                <h3 class="price">115.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/mtc4.webp" alt="" />
                <h3>Mứt Phúc Bổn Tử</h3>
                <h3 class="price">136.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/mtc5.webp" alt="" />
                <h3>Mứt Việt Quất</h3>
                <h3 class="price">129.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/mtc6.webp" alt="" />
                <h3>Mứt Đào</h3>
                <h3 class="price">120.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/mtc7.webp" alt="" />
                <h3>Mứt Cam Nha Đam</h3>
                <h3 class="price">115.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/mtc8.webp" alt="" />
                <h3>Mứt Đào Tiên</h3>
                <h3 class="price">95.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
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
            <div class="swiper-slide box">
                <img src="./assets/img/mtc10.webp" alt="" />
                <h3>Mứt Nho Đen</h3>
                <h3 class="price">90.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/mtc11.webp" alt="" />
                <h3>Mứt Vải</h3>
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
            <div class="swiper-slide box">
                <img src="./assets/img/mtc12.webp" alt="" />
                <h3>Mứt Xoài</h3>
                <h3 class="price">95.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/mtc15.webp" alt="" />
                <h3>Mứt Xoài Dứa</h3>
                <h3 class="price">119.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/mtc16.webp" alt="" />
                <h3>Mứt Nho Tím</h3>
                <h3 class="price">145.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/mtc17.webp" alt="" />
                <h3>Mứt Mâm Xôi</h3>
                <h3 class="price">160.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
            <div class="swiper-slide box">
                <img src="./assets/img/mtc18.webp" alt="" />
                <h3>Mứt Cam Xoài</h3>
                <h3 class="price">117.000đ</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
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