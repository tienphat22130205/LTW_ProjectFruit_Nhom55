<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- link swiper -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <!-- link style css -->
    <link rel="stylesheet" href="../assets/css/style.css" />
    <link rel="stylesheet" href="../assets/css/user.css">
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
                <i class="fa-solid fa-cart-shopping"></i>
                <span>Giỏ hàng</span>
                <span class="cart-badge">0</span>
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
    <div class="user-menu" id="userMenu" style="display: none;">
        <p>Xin chào, <span id="userNameDisplay">${sessionScope.user.email}</span></p>
        <ul>
            <li><a href="${pageContext.request.contextPath}/user/user.jsp"><i class="fas fa-box"></i> Thông tin cá nhân</a></li>
            <li><a href="#"><i class="fas fa-eye"></i> Đã xem gần đây</a></li>
            <li><a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
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
<!-- Menu docj ban đầu ẩn , chỉ xuất hiện khi ấn icon -->
<nav class="sidebar-menu" id="sidebarMenu">
    <ul>
        <li class="active"><a href="/project_fruit/home" onclick="setActive(this)"><i class="fas fa-home"></i> Trang chủ</a></li>
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
<!-- header section ends -->

<div class="container">
    <div class="sidebar">
        <div class="profile">
            <img alt="Profile Picture" height="50" src="../assets/img/anhdaidien.jpg" width="50" />
            <span>Nguyễn Văn A</span>
        </div>
        <ul>
            <li><a class="active" href="#" onclick="showSection('account-info', this)"><i class="fas fa-user"></i>
                Thông tin tài khoản</a></li>
            <li><a href="#" onclick="showSection('order-management', this)"><i class="fas fa-box"></i> Quản lý đơn
                hàng</a></li>
            <li><a href="${pageContext.request.contextPath}/logout" id="logoutBtn"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
        </ul>
    </div>
    <div class="content">
        <div id="account-info" class="section active">
            <h2>Thông tin tài khoản</h2>
            <form>
                <div class="form-group">
                    <label for="name">Họ Tên</label>
                    <input id="name" type="text" value="" placeholder="Nhập họ và tên" />
                </div>
                <div class="form-group">
                    <label>Giới tính</label>
                    <div class="radio-group">
                        <label><input checked="" name="gender" type="radio" /> Nam</label>
                        <label><input name="gender" type="radio" /> Nữ</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="phone">Số điện thoại</label>
                    <input id="phone" type="text" value="" placeholder="Nhập số điện thoại" />
                    <a href="#">Thay đổi</a>
                </div>
                <div class="form-group">
                    <%--@declare id="email"--%><label for="email">Email</label>
                    <input id="gmail" type="text" value="" placeholder="Nhập email " />
                    <a href="#">Thay đổi</a>
                </div>
                <div class="form-group">
                    <label>Ngày sinh</label>
                    <div class="date-group">
                        <select>
                            <option>Ngày</option>
                            <option>01</option>
                            <option>02</option>
                            <option>03</option>
                            <option>04</option>
                            <option>05</option>
                            <option>06</option>
                            <option>07</option>
                            <option>08</option>
                            <option>09</option>
                            <option>10</option>
                            <option>11</option>
                            <option>12</option>
                            <option>13</option>
                            <option>14</option>
                            <option>15</option>
                            <option>16</option>
                            <option>17</option>
                            <option>18</option>
                            <option>19</option>
                            <option>20</option>
                            <option>21</option>
                            <option>22</option>
                            <option>23</option>
                            <option>24</option>
                            <option>25</option>
                            <option>26</option>
                            <option>27</option>
                            <option>28</option>
                            <option>29</option>
                            <option>30</option>
                            <option>31</option>
                        </select>
                        <select>
                            <option>Tháng</option>
                            <option>01</option>
                            <option>02</option>
                            <option>03</option>
                            <option>04</option>
                            <option>05</option>
                            <option>06</option>
                            <option>07</option>
                            <option>08</option>
                            <option>09</option>
                            <option>10</option>
                            <option>11</option>
                            <option>12</option>
                        </select>
                        <select>
                            <option>Năm</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit">LƯU THAY ĐỔI</button>
                </div>
            </form>
        </div>
        <!-- Quản Lý Đơn Hàng Section -->
        <div id="order-management" class="section">
            <h2>Quản lý đơn hàng</h2>
            <div class="tabs">
                <button onclick="showTab('all-orders')" class="tab active">Tất cả</button>
                <button onclick="showTab('new-orders')" class="tab">Mới</button>
                <button onclick="showTab('processing-orders')" class="tab">Đang xử lý</button>
                <button onclick="showTab('shipping-orders')" class="tab">Đang vận chuyển</button>
                <button onclick="showTab('completed-orders')" class="tab">Hoàn thành</button>
                <button onclick="showTab('cancelled-orders')" class="tab">Hủy</button>
            </div>


            <div class="order-search">
                <input type="text" placeholder="Tìm đơn hàng theo Mã đơn hàng..." id="orderSearchInput">
                <button onclick="searchOrders()">Tìm đơn hàng</button>
            </div>


            <div class="tab-content">
                <div id="all-orders" class="tab-pane active">
                    <p>Quý khách chưa có đơn hàng nào.</p>
                </div>
                <div id="new-orders" class="tab-pane">
                    <p>Không có đơn hàng mới.</p>
                </div>
                <div id="processing-orders" class="tab-pane">
                    <p>Không có đơn hàng đang xử lý.</p>
                </div>
                <div id="shipping-orders" class="tab-pane">
                    <p>Không có đơn hàng đang vận chuyển.</p>
                </div>
                <div id="completed-orders" class="tab-pane">
                    <p>Không có đơn hàng hoàn thành.</p>
                </div>
                <div id="cancelled-orders" class="tab-pane">
                    <p>Không có đơn hàng bị hủy.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- footer -->
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
                <img src="./img/logoBank/grab.jpg" alt="Grab" />
                <img src="./img/logoBank/giaohangtietkiem.png" alt="Giao Hàng Tiết Kiệm" />
                <img src="./img/logoBank/vnpost.webp" alt="VNPost" />
            </div>
        </div>
    </div>
    <div class="credit">Copyright © 2024 <span>Nhom 55 - Trái Cây Chất Lượng Cao</span></div>
</section>
<script src="../assets/js/user.js"></script>
<script src="../assets/js/fruit.js"></script>
<script src="../assets/js/login.js"></script>
</body>

</html>