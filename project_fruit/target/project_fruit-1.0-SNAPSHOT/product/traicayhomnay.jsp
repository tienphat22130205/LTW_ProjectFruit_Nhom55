<%--
  Created by IntelliJ IDEA.
  User: phuon
  Date: 12/19/2024
  Time: 1:07 AM
  To change this template use File | Settings | File Templates.
--%>
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
<%--    <link rel="stylesheet" href="/assets/css/style.css" />--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <!-- Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <!-- link logo anh -->
    <link rel="icon" href="../assets/img/logoBank/logoweb.png" type="image/x-icon">
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
                <p>SAV.7-00.01, Tầng trệt Tháp 7, The Sun Avenue, 28 Mai Chí Thọ, phường An Phú, thành phố Thủ Đức,
                    Phường An
                    Phú, Thành phố Thủ Đức</p>
            </div>
        </div>
    </div>
    <div class="login-form" id="loginForm">
        <h2>ĐĂNG NHẬP</h2>
        <p>Nhập email và mật khẩu của bạn:</p>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" placeholder="Email">
        </div>
        <div class="form-group">
            <label for="password">Mật khẩu</label>
            <input type="password" id="password" placeholder="Mật khẩu">
        </div>
        <p id="error-message" style="color: red; display: none;">Xin vui lòng kiểm tra lại thông tin đăng nhập</p>
        <p class="captcha-text">
            Trang web này được bảo vệ bởi reCAPTCHA và Google
            <a href="https://policies.google.com/privacy">Privacy Policy</a> and
            <a href="https://policies.google.com/terms">Terms of Service</a> apply.
        </p>
        <button class="login-button" onclick="login()">ĐĂNG NHẬP</button>
        <p class="additional-links">

            Khách hàng mới? <a href="../user/register.jsp">Tạo tài khoản</a><br>

            Quên mật khẩu? <a href="#">Khôi phục mật khẩu</a>
        </p>
    </div>
    <div class="user-menu" id="userMenu" style="display: none;">
        <p>Xin chào, <span id="userNameDisplay">User</span></p>
        <ul>
            <li><a href="../user/user.jsp"><i class="fas fa-box"></i> Thông tin cá nhân</a></li>
            <li><a href="#"><i class="fas fa-eye"></i> Đã xem gần đây</a></li>
            <li><a href="#" id="logout"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
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
        <a href="../card/card.jsp" class="view-cart-button">XEM GIỎ HÀNG</a>
    </div>
</header>
<!-- Menu Bar dưới Header -->
<!-- Menu Bar dưới Header -->
<nav class="menu-bar">
    <ul>
        <li><a href="/index.jsp" onclick="setActive(this)"><i class="fas fa-home"></i> Trang chủ</a></li>
        <li class="active"><a href="../product/traicayhomnay.jsp" onclick="setActive(this)">Trái ngon hôm nay</a></li>
        <li><a href="../product/traicayvietnam.jsp" onclick="setActive(this)">Trái cây Việt Nam</a></li>
        <li><a href="../product/traicaynhapkhau.jsp" onclick="setActive(this)">Trái cây nhập khẩu</a></li>
        <li><a href="../product/traicaycatsan.jsp" onclick="setActive(this)">Trái cây cắt sẵn</a></li>
        <li><a href="../product/quatangtraicay.jsp" onclick="setActive(this)">Quà tặng trái cây</a></li>
        <li><a href="../product/hopqua.jsp" onclick="setActive(this)">Hộp quà Nguyệt Cát</a></li>
        <li><a href="../product/traicaysaykho.jsp" onclick="setActive(this)">Trái cây sấy khô</a></li>
        <li><a href="../product/muttraicay.jsp" onclick="setActive(this)">Mứt trái cây</a></li>
        <li><a href="../user/contact.jsp" onclick="setActive(this)">Liên hệ</a></li>
    </ul>
</nav>
<!-- Menu docj ban đầu ẩn , chỉ xuất hiện khi ấn icon -->
<nav class="sidebar-menu" id="sidebarMenu">
    <ul>
        <li><a href="../index.jsp" onclick="setActive(this)">Trang chủ</a></li>
        <li><a href="../product/traicayhomnay.jsp" onclick="setActive(this)">Trái ngon hôm nay</a></li>
        <li><a href="../product/traicayvietnam.jsp" onclick="setActive(this)">Trái cây Việt Nam</a></li>
        <li><a href="../product/traicaynhapkhau.jsp" onclick="setActive(this)">Trái cây nhập khẩu</a></li>
        <li><a href="../product/traicaycatsan.jsp" onclick="setActive(this)">Trái cây cắt sẵn</a></li>
        <li><a href="../product/quatangtraicay.jsp" onclick="setActive(this)">Quà tặng trái cây</a></li>
        <li><a href="../product/hopqua.jsp" onclick="setActive(this)">Hộp quà Nguyệt Cát</a></li>
        <li><a href="../product/traicaysaykho.jsp" onclick="setActive(this)">Trái cây sấy khô</a></li>
        <li><a href="../product/muttraicay.jsp" onclick="setActive(this)">Mứt trái cây</a></li>
        <li><a href="../user/contact.jsp" onclick="setActive(this)">Liên hệ</a></li>
    </ul>
</nav>
<!-- header section ends -->

<!-- home section starts -->
<section class="home" id="home">
    <div class="swiper-container background-slider">
        <div class="swiper-wrapper">
            <div class="swiper-slide"><img src="${pageContext.request.contextPath}/assets/img/traicayhomnayy.webp" alt="Background 1">
            </div>
        </div>
    </div>
</section>

<!-- home section ends -->
<!-- products section starts-->
<!-------------------------------------------------------- trái cây hôm nay -------------------------------------->
<section class="products" id="products">
    <h1 class="heading"><span>trái cây hôm nay</span></h1>
    <div class="sale_sort">
        <div class="sale">
            <div class="discount-text">Giảm Giá Sốc Đến 40%</div>
            <div class="timer">
                <div>3<br />Giờ</div>
                <div>0<br />Phút</div>
                <div>0<br />Giây</div>
            </div>
        </div>
        <div class="sort">
            <div class="sort-menu">
                <select id="sort-options">
                    <option value="#">Sắp xếp</option>
                    <option value="date">Sản phẩm nổi bật</option>
                    <option value="price_asc">Giá: Tăng dần</option>
                    <option value="price_desc">Giá: Giảm dần</option>
                </select>
            </div>
        </div>
    </div>
    <div class="swiper product-slider">
        <div class="swiper-wrapper">
            <c:forEach var="p" items="${data}">
                <a href="product-detail?pid=${p.id}">
            <div class="swiper-slide box">
                <img src="${p.img}" alt="" />
                <h3>${p.name}</h3>
                <div class="discount">-40%</div>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;"><f:formatNumber value="${p.price}"/> </span> / <span
                        style="color: #f00;">75.000d</span></h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <a href="#" class="btn">thêm vào giỏ hàng</a>
            </div>
                </a>
            </c:forEach>
        </div>
    </div>
    <div class="swiper product-slider">
        <div class="swiper-wrapper">
            <div class="swiper-slide box">

                <img src="./img/traicaytrangchu/luutuxuyen.webp" alt="" />
                <h3>Lựu tứ xuyên</h3>
                <div class="discount">-40%</div>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">120.000đ</span> / <span
                        style="color: #f00;">75.000đ</span></h3>
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

                <img src="./img/traicaytrangchu/mandomy.webp" alt="" />
                <h3>Mận đỏ mỹ</h3>
                <div class="discount">-40%</div>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">100.000đ</span> / <span
                        style="color: #f00;">60.000đ</span></h3>

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
                <img src="./img/traicaytrangchu/oinuhoang.webp" alt="" />
                <h3>Ổi nữ hoàng</h3>
                <div class="discount">-40%</div>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">110.000đ</span> / <span
                        style="color: #f00;">70.000đ</span></h3>
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
                <img src="./img/traicaytrangchu/mangcutmientay.webp" alt="" />
                <h3>Măng cụt miền Tây</h3>
                <div class="discount">-40%</div>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">90.000đ</span> / <span
                        style="color: #f00;">50.000đ</span></h3>
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
                <img src="./img/traicaytrangchu/vaithieu.webp" alt="" />
                <h3>Vãi thiều</h3>
                <div class="discount">-40%</div>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">150.000đ</span> / <span
                        style="color: #f00;">80.000đ</span></h3>
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
                <img src="./img/traicaytrangchu/vusua.webp" alt="" />
                <h3>Vú sữa rò rằng</h3>
                <div class="discount">-40%</div>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">120.000đ</span> / <span
                        style="color: #f00;">75.000đ</span></h3>
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
                <img src="./img/traicayhomnay/vietquoc.jpg" alt="" />
                <h3>Việt quốc</h3>
                <div class="discount">-40%</div>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">145.000đ</span> / <span
                        style="color: #f00;">87.000đ</span></h3>
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
                <img src="./img/traicayhomnay/quytuc.png" alt="" />
                <h3>Quýt Úc</h3>
                <div class="discount">-40%</div>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">145.000đ</span> / <span
                        style="color: #f00;">87.000đ</span></h3>
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
                <img src="./img/traicaytrangchu/nagiongthai.webp" alt="" />
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
            </div>
            <div class="swiper-slide box">
                <img src="./img/traicaytrangchu/manvangmy.webp" alt="" />
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
                <img src="./img/traicaytrangchu/leduongmat.webp" alt="" />
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
                <img src="./img/traicaytrangchu/mangcauxiem.webp" alt="" />
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
                <img src="./img/traicaytrangchu/medotbot.webp" alt="" />
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
                <img src="./img/traicaytrangchu/taocanada.jpg" alt="" />
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
            <div class="swiper-slide box">
                <img src="./img/traicayhomnay/buoidaxanh.jpg" alt="" />
                <h3>Bưởi da xanh</h3>
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

                <img src="./img/traicayhomnay/xuadaouc.png" alt="" />
                <h3>Xuân đào Úc</h3>
                <h3 class="price">330.000đ</h3>
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
    <div id="product-slider-1" class="hidden">
        <!-- Các sản phẩm ưu đãi -->
        <div class="swiper product-slider">
            <div class="swiper-wrapper">
                <div class="swiper-slide box">
                    <img src="./img/traicayhomnay/nhan.webp" alt="" />
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
                    <img src="./img/traicayhomnay/bonamlong.webp" alt="" />
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
                    <img src="./img/traicayhomnay/thanhtra.webp" alt="" />
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
                    <img src="./img/traicayhomnay/oiruby.webp" alt="" />
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
                    <img src="./img/traicayhomnay/cam.png" alt="" />
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
                    <img src="./img/traicayhomnay/mandenuc.jpg" alt="" />
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
                <div class="swiper-slide box">
                    <img src="./img/traicayhomnay/xoaicatchudavang.png" alt="" />
                    <h3>Xoài cát chu da vàng</h3>
                    <h3 class="price">105.000đ</h3>
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
                    <img src="./img/traicayhomnay/vusualoren.jpg" alt="" />
                    <h3>Vú sữa lò rèn</h3>
                    <h3 class="price">110.000đ</h3>
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
                    <img src="./img/traicayhomnay/mangcau.png" alt="" />
                    <h3>Mãng cầu</h3>
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
                    <img src="./img/traicayhomnay/manvangmy.png" alt="" />
                    <h3>Mận vàng Mỹ</h3>
                    <h3 class="price">470.000đ</h3>
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
                    <img src="./img/traicayhomnay/na.png" alt="" />
                    <h3>Na</h3>
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
                    <img src="./img/traicayhomnay/thom.jpg" alt="" />
                    <h3>Thơm</h3>
                    <h3 class="price">50.000đ</h3>
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
                    <img src="./img/traicayhomnay/daotienngokhong.jpg" alt="" />
                    <h3>Đào tiên Ngộ Không</h3>
                    <h3 class="price">175.000đ</h3>
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
                    <img src="./img/traicayhomnay/kiwi.png" alt="" />
                    <h3>Kiwi</h3>
                    <h3 class="price">125.000đ</h3>
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
                    <img src="./img/traicayhomnay/nhomaudonHanQuoc.jpg" alt="" />
                    <h3>Nho mẫu đơn Hàn Quốc</h3>
                    <h3 class="price">745.000đ</h3>
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
                    <img src="./img/traicayhomnay/kiwivangnewzealand.png" alt="" />
                    <h3>Kiwi vàng New Zealand</h3>
                    <h3 class="price">175.000đ</h3>
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
                    <img src="./img/traicayhomnay/nhoden.jpg" alt="" />
                    <h3>Nho đen</h3>
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
                    <img src="./img/traicayhomnay/nhomaudon.jpg" alt="" />
                    <h3>Nho mẫu đơn</h3>
                    <h3 class="price">495.000đ</h3>
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
                    <img src="./img/traicayhomnay/taodo.jpg" alt="" />
                    <h3>Táo đỏ</h3>
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
                    <img src="./img/traicayhomnay/cherry.jpg" alt="" />
                    <h3>Cherry</h3>
                    <h3 class="price">845.000đ</h3>
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
                    <img src="./img/traicayhomnay/mandomy.jpg" alt="" />
                    <h3>Mận đỏ Mỹ</h3>
                    <h3 class="price">345.000đ</h3>
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
                    <img src="./img/traicayhomnay/nhoxanh.jpg" alt="" />
                    <h3>Nho xanh</h3>
                    <h3 class="price">350.000đ</h3>
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
                    <img src="./img/traicayhomnay/dualuoimat.jpg" alt="" />
                    <h3>Dưa lưới mật</h3>
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
                    <img src="./img/traicayhomnay/chomchomthai.png" alt="" />
                    <h3>Chom Chom Thái</h3>
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
    </div>
    <div class="view-more-container">
        <a href="#" class="view-more" id="view-more-btn">Xem tất cả sản phẩm</a>
    </div>
</section>
<!-- products section end-->
<!-- footer section star -------------------------------------------------------------->
<section class="footer">
    <div class="box-container">
        <div class="box">
            <h3>VitaminFruit</h3>
            <p>
                "Chăm sóc sức khỏe bạn từ thiên nhiên! VitaminFruit – nguồn dinh dưỡng hoàn hảo cho cơ thể và tâm
                trí."
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
            <p>"Chúng tôi sử dụng các đơn vị vận chuyển uy tín như Grab, Giao Hàng Tiết Kiệm, VNPost và nhiều đơn vị
                khác."</p>
            <div class="shipping-brands">
                <img src="../assets/img/logoBank/grab.jpg" alt="Grab" />
                <img src="../assets/img/logoBank/giaohangtietkiem.png" alt="Giao Hàng Tiết Kiệm" />
                <img src="../assets/img/logoBank/vnpost.webp" alt="VNPost" />
            </div>
        </div>
    </div>
    <div class="credit">Copyright © 2024 <span>Nhom 55 - Trái Cây Chất Lượng Cao</span></div>
</section>
<!-- footer section end -->

<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="${pageContext.request.contextPath}/assets/js/fruit.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/login.js"></script>
</body>

</html>