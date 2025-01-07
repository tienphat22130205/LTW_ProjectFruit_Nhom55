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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/card.css">
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
        <a href="../card/card.jsp" class="view-cart-button">XEM GIỎ HÀNG</a>
    </div>
</header>
<!-- Menu Bar dưới Header -->
<!-- Menu Bar dưới Header -->
<nav class="menu-bar">
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
<div class="cart-container">
    <div class="cart-details">
        <c:if test="${not empty sessionScope.previousPage}">
            <a href="${sessionScope.previousPage}" class="continue-shopping-btn">Tiếp tục mua hàng</a>
        </c:if>
        <h2>Giỏ hàng của bạn</h2>
        <!-- Hiển thị thông báo nếu giỏ hàng trống -->
        <c:if test="${not empty message}">
            <p>${message}</p>
        </c:if>

        <!-- Hiển thị các sản phẩm trong giỏ hàng -->
        <c:forEach var="cp" items="${sessionScope.cart.getList()}">
            <div class="cart-item">
                <div class="product-image">
                    <img src="${cp.listImg[0].url}" alt="${cp.name}">
                </div>
                <div class="product-info">
                    <h4>${cp.name}</h4>
                    <p>${cp.price}₫</p>
                    <div class="quantity-controls">
                        <button class="decrease" onclick="updateQuantity(${cp.id_product}, -1)">-</button>
                        <span class="quantity">${cp.quantity}</span>
                        <button class="increase" onclick="updateQuantity(${cp.id_product}, 1)">+</button>
                    </div>
                    <p><strong>Tổng:</strong> <span class="item-total">${cp.price * cp.quantity}₫</span></p>
                </div>
                <button class="remove-item" onclick="window.location.href='remove-cart?pid=${cp.id_product}'">Xóa</button>
            </div>
        </c:forEach>

        <!-- Ghi chú đơn hàng -->
        <div class="order-note">
            <h4>Ghi chú đơn hàng</h4>
            <p>Lưu ý: Khách hàng đặt quà tặng trái cây, vui lòng ghi rõ thông tin của người được tặng và người đặt để
                Vitamin Fruit thuận tiện liên hệ.</p>
            <textarea placeholder="Thêm ghi chú cho đơn hàng..."></textarea>
            <div class="invoice-option">
                <input type="checkbox" id="invoice-checkbox">
                <label for="invoice-checkbox">Xuất hóa đơn cho đơn hàng</label>
            </div>
        </div>
    </div>

    <div class="order-info">
        <h3>Thông tin đơn hàng</h3>

        <div class="delivery-options">
            <label>
                <input type="radio" name="delivery" id="delivery-asap" checked>
                Giao khi có hàng
            </label>
            <label>
                <input type="radio" name="delivery" id="delivery-schedule">
                Chọn thời gian
            </label>
        </div>

        <div id="asap-info">
            <p>Giao khi có hàng</p>
        </div>

        <div id="schedule-info" style="display: none;">
            <label for="delivery-date">Ngày giao</label>
            <select id="delivery-date">
                <option value="today">Hôm nay</option>
                <option value="tomorrow">Ngày mai</option>
            </select>

            <label for="delivery-time">Thời gian giao</label>
            <select id="delivery-time">
                <option value="08:00-10:00">08:00 - 10:00</option>
                <option value="10:00-12:00">10:00 - 12:00</option>
            </select>

            <button class="confirm-time-button">XÁC NHẬN THỜI GIAN</button>
        </div>
        <div id="voucher">
            <p>Áp mã giảm giá</p>
            <input type="text" id="voucher-input" placeholder="Nhập mã giảm giá">
            <button id="apply-voucher">Áp dụng</button>
        </div>

        <p class="total"><strong>Tổng tiền:</strong> <span>${sessionScope.cart.getTotalPrice()}</span></p>
        <p class="note">Phí vận chuyển sẽ được tính ở trang thanh toán.</p>
        <p class="note">Bạn cũng có thể nhập mã giảm giá ở trang thanh toán.</p>
        <div class="warning" id="minimum-warning">
            Giỏ hàng của bạn hiện chưa đạt mức tối thiểu để thanh toán.
        </div>

        <a href="../user/payment.jsp" class="checkout-button" id="checkout-button" disabled>THANH TOÁN</a>

        <div class="policy-info">
            <p><strong>Chính sách mua hàng</strong></p>
            <p>Hiện chúng tôi chỉ áp dụng thanh toán với đơn hàng có giá trị tối thiểu 100.000₫ trở lên.</p>
        </div>
    </div>
</div>
<!-- footer section star -->
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
            <p>"Chúng tôi sử dụng các đơn vị vận chuyển uy tín như Grab, Giao Hàng Tiết Kiệm, VNPost và nhiều đơn vị khác."</p>
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

<%--<script src="../assets/js/card.js"></script>--%>
<%--<script src="../assets/js/login.js"></script>--%>
</body>

</html>
