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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/detail.css">
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
                <a href="/index.jsp">
                    <h1>Vitamin<span>FRUIT</span></h1>
                </a>
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
                <a href="${pageContext.request.contextPath}/show-cart" style="color: white">
                    <i class="fa-solid fa-cart-shopping"></i>
                    <span>Giỏ hàng</span>
                    <span class="cart-badge">${sessionScope.cart != null ? sessionScope.cart.getTotalQuantity() : 0}</span>
                </a>
            </div>
            <div class="account">
                <!-- Kiểm tra nếu người dùng đã đăng nhập -->
                <c:if test="${not empty sessionScope.user}">
                    <!-- Nếu người dùng đã đăng nhập, hiển thị avatar và thông tin -->
                    <a href="${pageContext.request.contextPath}/user/user.jsp">
                        <img src="${pageContext.request.contextPath}/assets/img/anhdaidien.jpg" alt="Avatar" class="avatar" onclick="toggleUserMenu()">
                    </a>
                </c:if>
                <c:if test="${empty sessionScope.user}">
                    <!-- Nếu chưa đăng nhập, hiển thị icon tài khoản -->
                    <a href="${pageContext.request.contextPath}/user/login.jsp" style="color: white">
                        <i class="fa-solid fa-user"></i>
                        <span>Tài khoản</span>
                    </a>
                </c:if>
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
    <!-- User Menu (ẩn khi chưa đăng nhập) -->
    <%--    <div class="user-menu" id="userMenu" style="display: none;">--%>
    <%--        <p>Xin chào, <span id="userNameDisplay">${sessionScope.user.email}</span></p>--%>
    <%--        <ul>--%>
    <%--            <li><a href="${pageContext.request.contextPath}/user/user.jsp"><i class="fas fa-box"></i> Thông tin cá nhân</a></li>--%>
    <%--            <li><a href="#"><i class="fas fa-eye"></i> Đã xem gần đây</a></li>--%>
    <%--            <li><a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>--%>
    <%--        </ul>--%>
    <%--    </div>--%>
</header>
<!-- Menu Bar dưới Header -->
<!-- Menu Bar dưới Header -->
<nav class="menu-bar">
    <ul>
        <li><a href="/project_fruit/home" onclick="setActive(this)"><i class="fas fa-home"></i> Trang chủ</a></li>
        <li><a href="/project_fruit/home?category=traicayhomnay" onclick="setActive(this)">Trái ngon hôm nay</a></li>
        <li><a href="/project_fruit/home?category=traicayvietnam" onclick="setActive(this)">Trái cây Việt Nam</a></li>
        <li><a href="/project_fruit/home?category=traicaynhapkhau" onclick="setActive(this)">Trái cây nhập khẩu</a></li>
        <li><a href="/project_fruit/home?category=traicaycatsan" onclick="setActive(this)">Trái cây cắt sẵn</a></li>
        <li><a href="/project_fruit/home?category=quatangtraicay" onclick="setActive(this)">Quà tặng trái cây</a></li>
        <li><a href="/project_fruit/home?category=hopquanguyencat" onclick="setActive(this)">Hộp quà Nguyệt Cát</a></li>
        <li><a href="/project_fruit/home?category=traicaysaykho" onclick="setActive(this)">Trái cây sấy khô</a></li>
        <li><a href="/project_fruit/home?category=muttraicay" onclick="setActive(this)">Mứt trái cây</a></li>
        <li><a href="/project_fruit/user/contact.jsp" onclick="setActive(this)">Liên hệ</a></li>
    </ul>
</nav>
<%--<!-- Menu docj ban đầu ẩn , chỉ xuất hiện khi ấn icon -->--%>
<nav class="sidebar-menu" id="sidebarMenu">
    <ul>
        <li><a href="/project_fruit/home" onclick="setActive(this)"><i class="fas fa-home"></i> Trang chủ</a></li>
        <li><a href="/project_fruit/home?category=traicayhomnay" onclick="setActive(this)">Trái ngon hôm nay</a></li>
        <li><a href="/project_fruit/home?category=traicayvietnam" onclick="setActive(this)">Trái cây Việt Nam</a></li>
        <li><a href="/project_fruit/home?category=traicaynhapkhau" onclick="setActive(this)">Trái cây nhập khẩu</a></li>
        <li><a href="/project_fruit/home?category=traicaycatsan" onclick="setActive(this)">Trái cây cắt sẵn</a></li>
        <li><a href="/project_fruit/home?category=quatangtraicay" onclick="setActive(this)">Quà tặng trái cây</a></li>
        <li><a href="/project_fruit/home?category=hopquanguyencat" onclick="setActive(this)">Hộp quà Nguyệt Cát</a></li>
        <li><a href="/project_fruit/home?category=traicaysaykho" onclick="setActive(this)">Trái cây sấy khô</a></li>
        <li><a href="/project_fruit/home?category=muttraicay" onclick="setActive(this)">Mứt trái cây</a></li>
        <li><a href="/project_fruit/user/contact.jsp" onclick="setActive(this)">Liên hệ</a></li>
    </ul>
</nav>
<%--<!-- header section ends -->--%>

<section class="container">
    <div class="product-info">
        <div class="product">
            <!-- Phần hình ảnh sản phẩm -->
            <div class="product-image">
                <div class="carousel-images">
                    <!-- Hiển thị hình ảnh chính -->
                    <img src="${not empty product.imageUrl ? product.imageUrl : '/assets/img/default.jpg'}"
                         alt="${product.name}" class="carousel-img active">
                </div>
                <!-- Navigation Controls -->
                <div class="carousel-controls">
                    <i class="fas fa-chevron-left prev"></i>
                    <i class="fas fa-chevron-right next"></i>
                </div>
            </div>

            <!-- Phần chi tiết sản phẩm -->
            <div class="product-price-section">
                <h2>${product.name}</h2>
                <p class="product-code">Mã sản phẩm: ${product.id_product} | Tình trạng: ${product.statusDisplay} </p>
                <p class="product-code">Số lượng: ${product.quantity}</p>
                <p class="discount-code">Chương trình giảm giá:</p>
                <div class="discount-buttons">
                    <button>${not empty product.promotionName ? product.promotionName : "Không có chương trình giảm giá"}</button>
                    <button> Giảm đến ${not empty product.percentDiscount ? product.percentDiscount : 0}% </button>
                </div>
                <p class="price">
                    <span style="color: red; font-size: 24px;">
                        <f:formatNumber value="${product.discountedPrice}" type="number" /> đ
                    </span>
                    <del style="color: gray; text-decoration: line-through">
                        <f:formatNumber value="${product.price}" type="number" /> đ
                    </del>
                </p>

                <!-- Phần thêm số lượng -->
                <div class="quantity">
                    <button class="minus"><i class="fa-solid fa-minus"></i></button>
                    <input type="number" value="1" min="1"/>
                    <button class="plus"><i class="fa-solid fa-plus"></i></button>
                </div>

                <!-- Nút thêm vào giỏ hàng -->
                <button class="add-to-cart">THÊM VÀO GIỎ</button>
            </div>
        </div>
    </div>

    <div class="content_detail">
        <div class="product-description">
            <h2>THÔNG TIN SẢN PHẨM</h2>
            <p><strong>Xuất xứ:</strong> ${not empty product.origin ? product.origin : 'Không xác định'}</p>
            <p><strong>Ngày nhập:</strong> ${not empty product.entry_date ? product.entry_date : 'Không có thông tin'}</p>
            <p><strong>Hạn sử dụng:</strong> ${not empty product.shelf_life ? product.shelf_life : 'Không có thông tin'}</p>
            <p><strong>Đặc Điểm Sản Phẩm:</strong></p>
            <ul>
                <li>${not empty product.characteristic ? product.characteristic : 'Không có thông tin'}</li>
            </ul>
            <p><strong>Bảo Quản Và Sử Dụng:</strong></p>
            <ul>
                <li>${not empty product.preserve_product ? product.preserve_product : 'Không có thông tin'}</li>
                <li>${not empty product.use_prodcut ? product.use_prodcut : 'Không có thông tin'}</li>
            </ul>
            <p><strong>Lợi Ích:</strong></p>
            <ul>
                <li>${not empty product.benefit ? product.benefit : 'Không có thông tin'}</li>
            </ul>
        </div>
        <div class="delivery-service">
            <h2>DỊCH VỤ GIAO HÀNG</h2>
            <ul>
                <li><i class="fas fa-check-circle"></i> Cam kết 100% chính hãng</li>
                <li><i class="fas fa-clock"></i> Giao hàng dự kiến: Thứ 2 - Chủ nhật từ 8h00 - 21h00</li>
                <li><i class="fas fa-headset"></i> Hỗ trợ 24/7 với các kênh facebook, instagram & phone</li>
            </ul>
        </div>
    </div>

</section>


<section class="products" id="products">
    <h1 class="heading"><span>Sản phẩm liên quan</span></h1>
    <div class="swiper product-slider">
        <div class="swiper-wrapper">
            <div class="swiper-slide box">
                <img src="./img/traicaytrangchu/luutuxuyen.webp" alt=""/>
                <h3>Lựu tứ xuyên</h3>
                <h3 class="price"><span>120.000đ</span></h3>
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
                <img src="./img/traicaytrangchu/mandomy.webp" alt=""/>
                <h3>Mận đỏ mỹ</h3>
                <h3 class="price"><span>100.000đ</span></h3>
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
                <img src="./img/traicaytrangchu/oinuhoang.webp" alt=""/>
                <h3>Ổi nữ hoàng</h3>
                <h3 class="price"><span>110.000đ</span></h3>
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
                <img src="./img/traicaytrangchu/mangcutmientay.webp" alt=""/>
                <h3>Măng cụt miền Tây</h3>
                <h3 class="price"><span>90.000đ</span></h3>
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
                <img src="./img/traicaytrangchu/vaithieu.webp" alt=""/>
                <h3>Vãi thiều</h3>
                <h3 class="price"><span>150.000đ</span></h3>
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
                <img src="./img/traicaytrangchu/vusua.webp" alt=""/>
                <h3>Vú sữa rò rằng</h3>
                <h3 class="price"><span>120.000đ</span></h3>
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
                <img src="./img/traicaytrangchu/nagiongthai.webp" alt=""/>
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
                <img src="./img/traicaytrangchu/manvangmy.webp" alt=""/>
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
                <img src="./img/traicaytrangchu/leduongmat.webp" alt=""/>
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
                <img src="./img/traicaytrangchu/mangcauxiem.webp" alt=""/>
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
                <img src="./img/traicaytrangchu/medotbot.webp" alt=""/>
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
                <img src="./img/traicaytrangchu/taocanada.jpg" alt=""/>
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
</section>


<section class="product-reviews">
    <h2 class="reviews-title">KHÁCH HÀNG NÓI VỀ SẢN PHẨM</h2>
    <p class="reviews-subtitle">Trở thành người đầu tiên đánh giá về sản phẩm.</p>

    <!-- Form Gửi Bình Luận -->
    <form action="AddFeedbackServlet" method="POST" class="review-form">
        <input type="hidden" name="productId" value="${product.id_product}">
        <input type="hidden" name="idAccount" value="${sessionScope.user.id_account}">
        <textarea name="content" id="reviewComment" placeholder="Nhập nội dung bình luận" required></textarea>
        <select name="rating" id="ratingText" class="rating-form" required>
            <option value="" disabled selected>Chọn rating</option>
            <option value="1">1 - Rất tệ</option>
            <option value="2">2 - Tệ</option>
            <option value="3">3 - Bình thường</option>
            <option value="4">4 - Tốt</option>
            <option value="5">5 - Rất tốt</option>
        </select>
        <button type="submit" class="submit-review-btn">Gửi bình luận</button>
    </form>

    <!-- Danh Sách Bình Luận -->
    <h3 class="reviews-count">Bình luận</h3>
    <div class="reviews-list">
        <div class="review-item">
            <div class="review-avatar">
                <img src="https://via.placeholder.com/50" alt="Nguyễn Văn A"/>
            </div>
            <div class="review-content">
                <p class="review-author">Nguyễn Văn A</p>
                <p class="review-date">02/11/2024</p>
                <p class="review-text">Sản phẩm tuyệt vời, tôi rất hài lòng với chất lượng và giá cả!</p>
            </div>
        </div>
    </div>
</section>


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

<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/fruit.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/login.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>

</html>

