<%--
  Created by IntelliJ IDEA.
  User: phuon
  Date: 12/19/2024
  Time: 1:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="../assets/css/style.css" />
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
        <li><a href="../index.jsp" onclick="setActive(this)"><i class="fas fa-home"></i> Trang chủ</a></li>
        <li><a href="../product/traicayhomnay.jsp" onclick="setActive(this)">Trái ngon hôm nay</a></li>
        <li><a href="../product/traicayvietnam.jsp" onclick="setActive(this)">Trái cây Việt Nam</a></li>
        <li><a href="../product/traicaynhapkhau.jsp" onclick="setActive(this)">Trái cây nhập khẩu</a></li>
        <li><a href="../product/traicaycatsan.jsp" onclick="setActive(this)">Trái cây cắt sẵn</a></li>
        <li class="active"><a href="../product/quatangtraicay.jsp" onclick="setActive(this)">Quà tặng trái cây</a></li>
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
            <div class="swiper-slide"><img src="../assets/img/back3.webp" alt="Background 1"></div>
        </div>
    </div>
</section>

<!-- home section ends -->
<!-- products section starts-->
<!-------------------------------------------------------- quà tặng trái cây  -------------------------------------->
<section class="products" id="products">
    <h1 class="heading"><span>quà tặng trái cây</span></h1>
    <div class="sale_sort">
        <div class="sale">
            <div class="discount-text">Giảm Giá Sốc Đến 25%</div>
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
            <div class="swiper-slide box">
                <img src="./img/gioqua2010.webp" alt="" />
                <h3>Giỏ Quà Tặng 20/10 01</h3>
                <div class="discount">-25%</div>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">999,000₫</span> /
                    <span style="color: #f00;">699,300₫</span></h3>
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
                <img src="./img/gq19.webp" alt="" />
                <h3>Hộp Quà Năm Mới 01</h3>
                <div class="discount">-25%</div>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">888,000₫</span> /
                    <span style="color: #f00;">621,600₫</span></h3>
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
                <img src="./img/gq20.webp" alt="" />
                <h3>Hộp Quà Năm Mới 02</h3>
                <div class="discount">-25%</div>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">1,111,000₫</span> /
                    <span style="color: #f00;">777,700₫</span></h3>
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
                <img src="./img/gq21.webp" alt="" />
                <h3>Hộp Quà Năm Mới 03</h3>
                <div class="discount">-25%</div>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">450,000₫</span> /
                    <span style="color: #f00;">315,000₫</span></h3>
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
                <img src="./img/gq22.webp" alt="" />
                <h3>Hộp Quà Năm Mới 04</h3>
                <div class="discount">-25%</div>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">800,000₫</span> /
                    <span style="color: #f00;">560,000₫</span></h3>
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
                <img src="./img/gq23.webp" alt="" />
                <h3>Hộp Quà Năm Mới 05</h3>
                <div class="discount">-25%</div>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">1,234,000₫</span> /
                    <span style="color: #f00;">863,800₫</span></h3>
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
                <img src="./img/gq24.webp" alt="" />
                <h3>Hộp Quà Niềm Vui</h3>
                <div class="discount">-25%</div>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">666,000₫</span> /
                    <span style="color: #f00;">466,200₫</span></h3>
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
                <img src="./img/gq20101.webp" alt="" />
                <h3>Giỏ Quà Tặng 20/10 02</h3>
                <div class="discount">-25%</div>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">890,000₫</span> /
                    <span style="color: #f00;">623,000₫</span></h3>
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
                <img src="./img/gq201010.webp" alt="" />
                <h3>Hộp Quà Tặng 20/10 03</h3>
                <div class="discount">-25%</div>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">900,000₫</span> /
                    <span style="color: #f00;">630,000₫</span></h3>
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
                <img src="./img/gq201012.webp" alt="" />
                <h3>Hộp Quà Tặng 20/10 04</h3>
                <div class="discount">-25%</div>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">450,000₫</span> /
                    <span style="color: #f00;">315,000₫</span></h3>
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
                <img src="./img/gq201013.webp" alt="" />
                <h3>Hộp Quà Tặng 20/10 05</h3>
                <div class="discount">-25%</div>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">350,000₫</span> /
                    <span style="color: #f00;">245,000₫</span></h3>
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
                <img src="./img/gq201014.webp" alt="" />
                <h3>Hộp Quà Tặng 20/10 06</h3>
                <div class="discount">-25%</div>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">700,000₫</span> /
                    <span style="color: #f00;">490,000₫</span></h3>
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
                <img src="./img/gq201015.webp" alt="" />
                <h3>Hộp Quà Tặng 20/10 07</h3>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">760,000₫</span> /
                    <span style="color: #f00;">532,000₫</span></h3>
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
                <img src="./img/gq201016.webp" alt="" />
                <h3>Hộp Quà Tặng 20/10 08</h3>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">800,000₫</span> /
                    <span style="color: #f00;">560,000₫</span></h3>
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
                <img src="./img/gq201017.webp" alt="" />
                <h3>Hộp Quà Tặng 20/10 09</h3>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">950,000₫</span> /
                    <span style="color: #f00;">665,000₫</span></h3>
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
                <img src="./img/gq201018.webp" alt="" />
                <h3>Hộp Quà Tặng 20/10 10</h3>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">650,000₫</span> /
                    <span style="color: #f00;">455,000₫</span></h3>
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
                <img src="./img/gq20102.webp" alt="" />
                <h3>Hộp Quà Tặng 20/10 11</h3>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">999,000₫</span> /
                    <span style="color: #f00;">699,300₫</span></h3>
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
                <img src="./img/gq20103.webp" alt="" />
                <h3>Hộp Quà Tặng 20/10 12</h3>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">890,000₫</span> /
                    <span style="color: #f00;">623,000₫</span></h3>
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
                <img src="./img/gq20104.webp" alt="" />
                <h3>Hộp Quà Tặng 20/10 13</h3>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">456,000₫</span> /
                    <span style="color: #f00;">319,000₫</span></h3>
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
                <img src="./img/gq20105.webp" alt="" />
                <h3>Hộp Quà Tặng 20/10 14</h3>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">789,000₫</span> /
                    <span style="color: #f00;">552,000₫</span></h3>
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
                <img src="./img/gq20106.webp" alt="" />
                <h3>Hộp Quà Tặng 20/10 15</h3>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">860,000₫</span> /
                    <span style="color: #f00;">602,000₫</span></h3>
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
                <img src="./img/gq20107.webp" alt="" />
                <h3>Hộp Quà Chúc Tết</h3>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">830,000₫</span> /
                    <span style="color: #f00;">581,000₫</span></h3>
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
                <img src="./img/gq20108.webp" alt="" />
                <h3>Hộp Quà Mừng Năm Mới</h3>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">790,000₫</span> /
                    <span style="color: #f00;">553,000₫</span></h3>
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
                <img src="./img/gq20109.webp" alt="" />
                <h3>Hộp Quà Tặng 20/10 16</h3>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">850,000₫</span> /
                    <span style="color: #f00;">595,000₫</span></h3>
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
    <div class="swiper product-slider hidden" id="product-slider-1">
        <div class="swiper-wrapper">
            <div class="swiper-slide box">
                <img src="./img/hqnc7.png" alt="" />
                <h3>Hộp Quà Vali Trái Cây 01</h3>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">4,415,000₫</span> /
                    <span style="color: #f00;">3,090,000₫</span>
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

                <img src="./img/hqnc8.png" alt="" />
                <h3>Hộp Quà Vali Trái Cây 02</h3>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">2,600,000₫</span> /
                    <span style="color: #f00;">1,820,000₫</span>
                </h3>
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
                <img src="./img/hqnc9.png" alt="" />
                <h3>Bó Hoa Cam Vàng Úc</h3>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">5,300,000₫</span> /
                    <span style="color: #f00;">3,710,000₫</span>
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
                <img src="./img/hqnc10.png" alt="" />
                <h3>Bó Hoa Táo New Zealand</h3>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">6,500,000₫</span> /
                    <span style="color: #f00;">4,255,000₫</span>
                </h3>
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
                <img src="./img/hqnc11..png" alt="" />
                <h3>Hộp Quà Trái Cây 001</h3>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">3,000,000₫</span> /
                    <span style="color: #f00;">2,100,000₫</span>
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
                <img src="./img/hqnc12.png" alt="" />
                <h3>Hộp Quà Trái Cây 002</h3>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">4,600,000₫</span> /
                    <span style="color: #f00;">3,220,000₫</span>
                </h3>
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
    <div class="swiper product-slider hidden" id="product-slider-2">
        <div class="swiper-wrapper">
            <div class="swiper-slide box">
                <img src="./img/hqnc7.png" alt="" />
                <h3>Hộp Quà Trái Cây 003</h3>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">4,415,000₫</span> /
                    <span style="color: #f00;">3,090,000₫</span>
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

                <img src="./img/hqnc8.png" alt="" />
                <h3>Hộp Quà Trái Cây 004</h3>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">2,600,000₫</span> /
                    <span style="color: #f00;">1,820,000₫</span>
                </h3>
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
                <img src="./img/hqnc9.png" alt="" />
                <h3>Hộp Quà Trái Cây 005</h3>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">5,300,000₫</span> /
                    <span style="color: #f00;">3,710,000₫</span>
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
                <img src="./img/hqnc10.png" alt="" />
                <h3>Hộp Quà Trái Cây 006</h3>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">6,500,000₫</span> /
                    <span style="color: #f00;">4,255,000₫</span>
                </h3>
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
                <img src="./img/hqnc11..png" alt="" />
                <h3>Hộp Quà Trái Cây 007</h3>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">3,000,000₫</span> /
                    <span style="color: #f00;">2,100,000₫</span>
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
                <img src="./img/hqnc12.png" alt="" />
                <h3>Hộp Quà Trái Cây 008</h3>
                <h3 class="price"><span style="text-decoration: line-through; color: #888;">4,600,000₫</span> /
                    <span style="color: #f00;">3,220,000₫</span>
                </h3>
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
        <a href="#" class="view-more" id="view-more-btn">Xem tất cả sản phẩm ưu đãi</a>
    </div>
</section>
<!-- products section end-->
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="../assets/js/fruit.js"></script>
<script src="../assets/js/login.js"></script>
</body>

</html>
