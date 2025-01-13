
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
    <script>
        $(document).ready(function() {
            $('#feedbackTable').DataTable();  // Khởi tạo DataTable
        });
    </script>
    <script>
        $(document).ready(function() {
            $('#supplierTable').DataTable();  // Khởi tạo DataTable
        });
    </script>
    <script>
        $(document).ready(function() {
            $('#customerTable').DataTable();  // Khởi tạo DataTable
        });
    </script>
    <script>
        $(document).ready(function() {
            $('#productTable').DataTable();  // Khởi tạo DataTable
        });
    </script>

<body>
<input type="checkbox" name="" id="nav-toggle">
<div class="sidebar">
    <div class="sidebar-brand">
        <h1><i class="fa-solid fa-leaf"></i> <span>Fruit</span></h1>
    </div>
    <div class="sidebar-menu">
        <ul>
            <li>
                <a href="#" class="menu-item active" onclick="showSection('dashboard', 'Dashboard')"><span><i
                        class="fa-solid fa-gauge"></i></span>
                    <span>Dashboard</span></a>
            </li>
            <li>
                <a href="#" class="menu-item" onclick="showSection('customers', 'Khách hàng')"><span><i
                        class="fa-solid fa-user"></i></span>
                    <span>Quản lý khách hàng</span></a>
            </li>
            <li>
                <a href="#" class="menu-item" onclick="showSection('products', 'Sản phẩm')"><span><i
                        class="fa-solid fa-box"></i></span>
                    <span>Quản lý sản phẩm</span></a>
            </li>
            <li>
                <a href="#" class="menu-item" onclick="showSection('orders', 'Đặt hàng')"><span><i
                        class="fa-solid fa-bag-shopping"></i></span>
                    <span>Quản lý đặt hàng</span></a>
            </li>
            <li>
                <a href="#" class="menu-item" onclick="showSection('suppliers', 'Quản lý nhà cung cấp')"><span><i
                        class="fa-solid fa-truck"></i></span>
                    <span>Quản lý nhà cung cấp</span></a>
            </li>
            <li>
                <a href="#" class="menu-item" onclick="showSection('promotions', 'Quản lý khuyến mãi')"><span><i
                        class="fa-solid fa-tags"></i></span>
                    <span>Quản lý khuyến mãi</span></a>
            </li>
            <li>
                <a href="#" class="menu-item" onclick="showSection('feedback', 'Phản hồi khách hàng')"><span><i
                        class="fa-solid fa-comments"></i></span>
                    <span>Phản hồi khách hàng</span></a>
            </li>
            <li>
                <a href="#" class="menu-item" onclick="showSection('statistics', 'Thống kê doanh thu')"><span><i
                        class="fa-solid fa-chart-line"></i></span>
                    <span>Thống kê doanh thu</span></a>
            </li>
            <li>
                <a href="#" class="menu-item" onclick="showSection('system', 'Hệ thống')"><span><i
                        class="fa-solid fa-cogs"></i></span>
                    <span>Hệ thống</span></a>
            </li>
        </ul>
    </div>
    <div class="logout">
        <a href="javascript:void(0);" class="menu-item" id="logoutBtn">
            <span><i class="fa-solid fa-right-from-bracket"></i></span><span>Đăng xuất</span>
        </a>
    </div>
</div>
<div class="main-content">
    <header>
        <h1 id="page-title">
            <label for="nav-toggle">
                <span class="fa-solid fa-bars"></span>
            </label>
            Dashboard
        </h1>
        <div class="user-wrapper">
            <div class="notification-icon" id="notificationBell">
                <i class="fas fa-bell"></i>
                <span class="notification-count" id="notificationCount">0</span>
            </div>
            <div class="notification-dropdown" id="notificationDropdown">
                <h3 class="notification-title">Thông báo</h3>
                <ul class="notification-list">
                    <li class="notification-item">
                        <h4>Cập nhật hệ thống</h4>
                        <p>Hệ thống sẽ được bảo trì vào lúc 12:00 AM ngày 25/11/2023.</p>
                        <span class="notification-time">20/11/2023, 10:00 AM</span>
                    </li>
                    <li class="notification-item">
                        <h4>Cập nhật hệ thống</h4>
                        <p>Hệ thống sẽ được bảo trì vào lúc 12:00 AM ngày 25/11/2023.</p>
                        <span class="notification-time">20/11/2023, 10:00 AM</span>
                    </li>
                    <li class="notification-item">
                        <h4>Cập nhật hệ thống</h4>
                        <p>Hệ thống sẽ được bảo trì vào lúc 12:00 AM ngày 25/11/2023.</p>
                        <span class="notification-time">20/11/2023, 10:00 AM</span>
                    </li>
                    <li class="notification-item">
                        <h4>Cập nhật mã giảm giá mới</h4>
                        <p>Giảm giá 40% cho tất cả trái cây nhập khẩu</p>
                        <span class="notification-time">20/11/2023, 10:00 AM</span>
                    </li>
                    <li class="notification-item">
                        <h4>Chương trình ưu đãi</h4>
                        <p>Miễn phí giao hàng cho đơn hàng trên 500.000 VNĐ.</p>
                        <span class="notification-time">18/11/2023, 8:00 PM</span>
                    </li>
                    <li class="notification-item">
                        <h4>Khuyến mãi đặc biệt</h4>
                        <p>Mua 1 tặng 1 cho tất cả các loại táo nhập khẩu.</p>
                        <span class="notification-time">17/11/2023, 6:00 PM</span>
                    </li>
                    <li class="notification-item">
                        <h4>Khuyến mãi ngày lễ</h4>
                        <p>Giảm 20% tất cả sản phẩm nhân ngày lễ Tạ Ơn.</p>
                        <span class="notification-time">13/11/2023, 10:00 AM</span>
                    </li>
                </ul>
            </div>
            <img src="${pageContext.request.contextPath}/assets/img/anhdaidien.jpg" alt="Ảnh đại diện" width="40px" height="40px" alt="">
            <div>
                <h4>Admin</h4>
            </div>
        </div>
    </header>
    <main>
        <!-- dashboard -->
        <div id="dashboard" class="section active">
            <div class="cards">
                <div class="card-single">
                    <div>
                        <h1>245</h1>
                        <span>Khách hàng</span>
                    </div>
                    <div>
                        <span class="fa-solid fa-users"></span>
                    </div>
                </div>
                <div class="card-single">
                    <div>
                        <h1>500</h1>
                        <span>Sản phẩm</span>
                    </div>
                    <div>
                        <span class="fa-solid fa-box"></span>
                    </div>
                </div>
                <div class="card-single">
                    <div>
                        <h1>320</h1>
                        <span>Đặt hàng</span>
                    </div>
                    <div>
                        <span class="fa-solid fa-bag-shopping"></span>
                    </div>
                </div>
                <div class="card-single">
                    <div>
                        <h1>50</h1>
                        <span>Nhà cung cấp</span>
                    </div>
                    <div>
                        <span class="fa-solid fa-truck"></span>
                    </div>
                </div>
                <div class="card-single">
                    <div>
                        <h1>10</h1>
                        <span>Khuyến mãi</span>
                    </div>
                    <div>
                        <span class="fa-solid fa-tags"></span>
                    </div>
                </div>
                <div class="card-single">
                    <div>
                        <h1>120</h1>
                        <span>Phản hồi</span>
                    </div>
                    <div>
                        <span class="fa-solid fa-comments"></span>
                    </div>
                </div>
                <div class="card-single">
                    <div>
                        <h1>15%
                            <span style="font-size: 1.5rem; font-weight: normal;"> <i
                                    class="fa-solid fa-arrow-up"></i></span>
                        </h1>
                        <span>Thống kê doanh thu</span>
                    </div>
                    <div>
                        <span class="fa-solid fa-chart-line"></span>
                    </div>
                </div>
                <div class="card-single">
                    <div>
                        <h1>Hệ thống</h1>
                    </div>
                    <div>
                        <span class="fa-solid fa-cogs"></span>
                    </div>
                </div>
            </div>
            <div class="recent-grid">
                <div class="customers">
                    <div class="card">
                        <div class="card-header">
                            <h2>Khách hàng gần đây</h2>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table width="100%">
                                    <thead>
                                    <tr>
                                        <td>Id</td>
                                        <td>Tên khách hàng</td>
                                        <td>Số điện thoại</td>
                                        <td>Địa chỉ</td>
                                        <td>Ngày mua</td>
                                        <td>Chi tiết hóa đơn</td>
                                        <td>Tình trạng</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>KH001</td>
                                        <td>Ngô Tiến Phát</td>
                                        <td>0987654321</td> <!-- Số điện thoại -->
                                        <td>123 Đường ABC</td> <!-- Địa chỉ -->
                                        <td>12/11/2023</td>
                                        <td>
                                            <button class="button-invoice-detail">Xem chi tiết</button>
                                        </td>
                                        <td>
                                            <span class="status blue"></span>
                                            Đang giao hàng
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="card-bottom">
                            <div class="left-section">
                                <!-- Nội dung bên trái, ví dụ: thông tin thêm, icon, v.v. -->
                                <span class="info">Hiển thị thêm khách hàng</span>
                            </div>
                            <div class="right-section">
                                <div class="pagination">
                                    <button class="prev" onclick="changePage('prev')">Trước</button>
                                    <span class="page-num" id="page-1" onclick="goToPage(1)">1</span>
                                    <span class="page-num" id="page-2" onclick="goToPage(2)">2</span>
                                    <span class="page-num" id="page-3" onclick="goToPage(3)">3</span>
                                    <span class="page-num">...</span>
                                    <button class="next" onclick="changePage('next')">Tiếp</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box">
                    <div class="flex-container">
                        <div class="customer">
                            <div class="card">
                                <div class="card-header">
                                    <h2>Khách hàng mới </h2>
                                </div>
                                <div class="card-body">
                                    <div class="customer">
                                        <div class="info">
                                            <img src="${pageContext.request.contextPath}/assets/img/user_admin.png" alt="User Admin" width="40px" height="40px" alt="">
                                            <div>
                                                <h4>Nguyen Van A</h4>
                                            </div>
                                        </div>
                                        <div class="contact">
                                            <span class="fa-regular fa-circle-user"></span>
                                            <span class="fa-regular fa-comment"></span>
                                            <span class="fa-solid fa-phone"></span>
                                        </div>
                                    </div>
                                    <div class="customer">
                                        <div class="info">
                                            <img src="./img/user_admin.png" width="40px" height="40px" alt="">
                                            <div>
                                                <h4>Le Thi B</h4>
                                            </div>
                                        </div>
                                        <div class="contact">
                                            <span class="fa-regular fa-circle-user"></span>
                                            <span class="fa-regular fa-comment"></span>
                                            <span class="fa-solid fa-phone"></span>
                                        </div>
                                    </div>
                                    <div class="customer">
                                        <div class="info">
                                            <img src="./img/user_admin.png" width="40px" height="40px" alt="">
                                            <div>
                                                <h4>Nguyen Hong N</h4>
                                            </div>
                                        </div>
                                        <div class="contact">
                                            <span class="fa-regular fa-circle-user"></span>
                                            <span class="fa-regular fa-comment"></span>
                                            <span class="fa-solid fa-phone"></span>
                                        </div>
                                    </div>
                                    <div class="customer">
                                        <div class="info">
                                            <img src="./img/user_admin.png" width="40px" height="40px" alt="">
                                            <div>
                                                <h4>Nguyen Tu A</h4>
                                            </div>
                                        </div>
                                        <div class="contact">
                                            <span class="fa-regular fa-circle-user"></span>
                                            <span class="fa-regular fa-comment"></span>
                                            <span class="fa-solid fa-phone"></span>
                                        </div>
                                    </div>
                                    <div class="customer">
                                        <div class="info">
                                            <img src="./img/user_admin.png" width="40px" height="40px" alt="">
                                            <div>
                                                <h4>Ngo Van A</h4>
                                            </div>
                                        </div>
                                        <div class="contact">
                                            <span class="fa-regular fa-circle-user"></span>
                                            <span class="fa-regular fa-comment"></span>
                                            <span class="fa-solid fa-phone"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="product">
                            <div class="card">
                                <div class="card-header">
                                    <h2>Sản phẩm được mua nhiều nhất</h2>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table width="100%">
                                            <thead>
                                            <tr>
                                                <td>STT</td>
                                                <td>Tên sản phẩm</td>
                                                <td>Tổng số lượng mua</td>
                                                <td>Tổng số tiền</td>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Dâu Đà Lạt</td>
                                                <td>50</td>
                                                <td>10,000,000đ</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Táo Mỹ</td>
                                                <td>45</td>
                                                <td>6,750,000đ</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Nho Úc</td>
                                                <td>40</td>
                                                <td>5,200,000đ</td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td>Cam Sành</td>
                                                <td>35</td>
                                                <td>4,900,000đ</td>
                                            </tr>
                                            <tr>
                                                <td>5</td>
                                                <td>Xoài Cát</td>
                                                <td>30</td>
                                                <td>4,500,000đ</td>
                                            </tr>
                                            <tr>
                                                <td>6</td>
                                                <td>Mâm xôi đen</td>
                                                <td>25</td>
                                                <td>4,000,000đ</td>
                                            </tr>
                                            <tr>
                                                <td>7</td>
                                                <td>Dừa xiêm</td>
                                                <td>24</td>
                                                <td>3,990,000đ</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="dashboard">
                    <!-- Doanh thu 6 tháng qua -->
                    <div class="chart-box large-chart">
                        <h3>Doanh thu 6 tháng qua</h3>
                        <canvas id="monthlyRevenueChart"></canvas>
                    </div>

                    <!-- Doanh thu tháng vừa qua -->
                    <div class="chart-box small-chart">
                        <h3>Doanh thu tháng vừa qua</h3>
                        <canvas id="weeklyRevenueChart"></canvas>
                    </div>
                </div>

            </div>

        </div>
        <!-- Khach hang -->
        <div id="customers" class="section">
            <div class="container">
                <h1>Thông Tin Khách Hàng</h1>
                <!-- Customer Table -->
                <table id="customerTable">
                    <thead>
                    <tr>
                        <th>Mã khách hàng</th>
                        <th>Họ và tên</th>
                        <th>Email</th>
                        <th>Số điện thoại</th>
                        <th>Địa chỉ</th>
                        <th>Ngày đăng ký</th>
                        <th>Chi tiết sản phẩm đã mua</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- Lặp qua tất cả khách hàng -->
                    <c:forEach var="customer" items="${customers}">
                        <tr id="customer-${customer.idCustomer}">
                            <td>${customer.idCustomer}</td>
                            <td>${customer.customerName}</td>
                            <td>${customer.email}</td>
                            <td>${customer.customerPhone}</td>
                            <td>${customer.address}</td>
                            <td>${customer.dateRegister}</td>
                            <td><a href="productDetails.jsp?customerId=${customer.idCustomer}">Xem chi tiết</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Products section -->
        <div id="products" class="section">
            <div class="overview-section">
                <!-- Tổng quan sản phẩm -->
                <div class="overview-grid">
                    <div class="overview-item">
                        <h3>200</h3>
                        <p>Tổng sản phẩm</p>
                        <i class="fa-solid fa-box"></i>
                    </div>
                    <div class="overview-item">
                        <h3>80</h3>
                        <p>Sản phẩm còn hàng</p>
                        <i class="fa-solid fa-check"></i>
                    </div>
                    <div class="overview-item">
                        <h3>120</h3>
                        <p>Sản phẩm đã bán</p>
                        <i class="fa-solid fa-cart-arrow-down"></i>
                    </div>
                    <div class="overview-item">
                        <h3>4.5/5</h3>
                        <p>Đánh giá trung bình</p>
                        <i class="fa-solid fa-star"></i>
                    </div>
                </div>
                <div class="overview-content">
                    <!-- Sản phẩm nổi bật -->
                    <div class="highlight-products">
                        <h2>Sản Phẩm Bán Chạy</h2>
                        <ul>
                            <li>
                                <img src="<img src="${pageContext.request.contextPath}/assets/img/vusua.jpg" alt="Vú Sữa">" alt="Sản phẩm 1">
                                <div>
                                    <h3>Vú Sữa</h3>
                                    <p>Giá: 121,000đ</p>
                                </div>
                                <button class="button-product-description">Xem chi tiết</button>
                            </li>
                            <li>
                                <img src="<img src="${pageContext.request.contextPath}/assets/img/xoai.png" alt="Xoài">" alt="Sản phẩm 2">
                                <div>
                                    <h3>Xoài Cát</h3>
                                    <p>Giá: 75,000đ</p>
                                </div>
                                <button class="button-product-description">Xem chi tiết</button>
                            </li>
                            <li>
                                <img src="./img/traicaynhapkhau/cherrydocanada.png" alt="Sản phẩm 3">
                                <div>
                                    <h3>Cherry Đỏ</h3>
                                    <p>Giá: 135,000đ</p>
                                </div>
                                <button class="button-product-description">Xem chi tiết</button>
                            </li>
                        </ul>
                    </div>

                    <!-- Biểu đồ -->
                    <div class="chart-section">
                        <h2>Biểu Đồ Thống Kê Sản Phẩm</h2>
                        <canvas id="productOverviewChart" width="400" height="300"></canvas>
                    </div>
                </div>
            </div>
            <div class="recent-grid">
                <div class="customers">
                    <div class="card">
                        <h1>Danh sách sản phẩm</h1>
                        <div class="card-body">
                            <div class="table-reponsive">
                                <div class="add-modal" id="addModal">
                                    <div class="add-modal-content">
                                        <h3>Thêm sản phẩm mới</h3>
                                        <form id="addForm">
                                            <input type="text" name="productName" placeholder="Tên sản phẩm"
                                                   required>
                                            <input type="text" name="productCode" placeholder="Mã sản phẩm"
                                                   required>
                                            <input type="text" name="productType" placeholder="Loại sản phẩm"
                                                   required>
                                            <input type="text" name="productOrigin" placeholder="Xuất xứ" required>
                                            <select name="productStatus" required>
                                                <option value="Còn Hàng">Còn Hàng</option>
                                                <option value="Tạm Hết">Tạm Hết</option>
                                            </select>
                                            <button type="submit">Thêm</button>
                                            <button type="button" id="closeAddModal">Đóng</button>
                                        </form>
                                    </div>
                                </div>
                                <table id="productTable" class="product-table">
                                    <thead>
                                    <tr>
                                        <th>Mã Sản Phẩm</th>
                                        <th>Tên Sản Phẩm</th>
                                        <th>Loại Sản phẩm</th>
                                        <th>Xuất xứ</th>
                                        <th>Giá Sản Phẩm</th>
                                        <th>Trạng thái</th>
                                        <th>Thao tác</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <!-- Lặp qua danh sách sản phẩm -->
                                    <c:forEach var="product" items="${products}">
                                        <tr>
                                            <td>${product.id_product}</td> <!-- Mã sản phẩm -->
                                            <td>${product.name}</td> <!-- Tên sản phẩm -->
                                            <td>${product.categoryName}</td> <!-- Loại sản phẩm -->
                                            <td>${product.origin}</td> <!-- Xuất xứ sản phẩm -->
                                            <td>${product.price}</td> <!-- Xuất xứ sản phẩm -->
                                            <td>
                                                <span class="status ${product.status ? 'blue' : 'red'}"></span>
                                                    ${product.status ? 'Còn Hàng' : 'Hết Hàng'}
                                            </td>
                                            <td>
                                                <button class="delete-button">Xóa</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Orders section -->
        <div id="orders" class="section">
            <div class="orders">
                <div class="overview-grid">
                    <div class="overview-item">
                        <h3>39</h3>
                        <p>Tổng đơn hàng</p>
                        <i class="fa-solid fa-boxes-stacked"></i>
                    </div>
                    <div class="overview-item">
                        <h3>6</h3>
                        <p>Đơn hàng đang xử lý</p>
                        <i class="fa-solid fa-hourglass-start"></i>
                    </div>
                    <div class="overview-item">
                        <h3>31</h3>
                        <p>Đơn hàng đã thanh toán</p>
                        <i class="fa-regular fa-handshake"></i>
                    </div>
                    <div class="overview-item">
                        <h3>2</h3>
                        <p>Đơn hàng đã hủy</p>
                        <i class="fa-regular fa-circle-xmark"></i>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <div class="search-box">
                            <input type="text" placeholder="Tìm kiếm..." />
                            <div class="search">
                                <button class="search-btn">Tìm kiếm</button>
                            </div>
                        </div>
                        <div class="sort-options">
                            <select>
                                <option value="#">Chọn lựa chọn</option>
                                <option value="date">Ngày đăng ký</option>
                                <option value="phone">Số điện thoại</option>
                            </select>
                            <div class="sort-icon">
                                <i class="fas fa-sort"></i>
                                <span class="sort-label">Sắp xếp</span>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-reponsive">
                            <table id="orderTable" width="100%">
                                <thead>
                                <tr>
                                    <td>Mã đơn hàng</td>
                                    <td>Tên khách hàng</td>
                                    <td>Địa chỉ</td>
                                    <td>Ngày đặt hàng</td>
                                    <td>Chi tiết hóa đơn</td>
                                    <td>Phương thức thanh toán</td>
                                    <td>Tình trạng</td>
                                </tr>
                                </thead>
                                <tbody id="orderList">
                                <!-- Dữ liệu đơn hàng sẽ được thêm ở đây bằng JavaScript -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="card-bottom">
                        <div class="left-section">
                            <!-- Nội dung bên trái, ví dụ: thông tin thêm, icon, v.v. -->
                            <span class="info">Hiển thị thêm đơn hàng </span>
                        </div>
                        <div class="right-section">
                            <div class="pagination">
                                <button class="prev" onclick="changePage('prev')">Trước</button>
                                <span class="page-num" id="page-1" onclick="goToPage(1)">1</span>
                                <span class="page-num" id="page-2" onclick="goToPage(2)">2</span>
                                <span class="page-num" id="page-3" onclick="goToPage(3)">3</span>
                                <span class="page-num">...</span>
                                <button class="next" onclick="changePage('next')">Tiếp</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- Statistics section -->
        <div id="statistics" class="section">
            <div class="chart-box large-chart">
                <h3>Doanh thu theo tháng</h3>
                <canvas id="monthlyRevenueChart1"></canvas>
            </div>
            <div class="chart-container">
                <div class="chart-box large-chart">
                    <h3>Các sản phẩm đóng góp doanh thu nhiều nhất</h3>
                    <canvas id="productDonutChart"></canvas>
                </div>
                <div class="chart-box common-chart">
                    <h3>Doanh thu theo Loại sản phẩm tháng vừa qua</h3>
                    <canvas id="productTypeRevenueChart"></canvas>
                </div>
            </div>
        </div>
        <div id="suppliers" class="section">
            <div class="container">
                <h1>Thông Tin Nhà Cung Cấp</h1>
                    <!-- Supplier Table -->
                    <table id="supplierTable">
                    <thead>
                    <tr>
                        <th>Mã số</th>
                        <th>Tên nhà cung cấp</th>
                        <th>Địa chỉ</th>
                        <th>Email</th>
                        <th>Số điện thoại</th>
                        <th>Trạng thái hợp tác</th>
                        <th>Đánh giá</th>
                        <th>Danh sách sản phẩm</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- Lặp qua tất cả nhà cung cấp -->
                    <c:forEach var="supplier" items="${suppliers}">
                        <tr id="supplier-${supplier.id_supplier}">
                            <td>${supplier.id_supplier}</td>
                            <td>${supplier.name}</td>
                            <td>${supplier.address}</td>
                            <td>${supplier.email}</td>
                            <td>${supplier.phone_number}</td>
                            <td>${supplier.status} <c:choose>
                                <c:when test="${supplier.status == 'Đang hợp tác'}">
                                    <i class="fas fa-circle" style="color: blue;"></i>
                                </c:when>
                                <c:when test="${supplier.status == 'Đã dừng'}">
                                    <i class="fas fa-circle" style="color: red;"></i>
                                </c:when>
                            </c:choose></td>
                            <td>${supplier.rating} <i class="fas fa-star" style="color: #ffcc00;"></i></td>
                            <td>${supplier.name_category}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div id="promotions" class="section">
            <div class="promotion-container">
                <div class="promotion-header">
                    <h1>Quản Lý Khuyến Mãi</h1>
                    <button id="openPromotionModal" class="button-add-promotion">Thêm Khuyến Mãi</button>
                    <!-- Modal Thêm Khuyến Mãi -->
                </div>
                <div class="search-bar">
                    <input type="text" placeholder="Tìm khuyến mãi..." />
                    <button>Tìm kiếm</button>
                </div>
                <table class="promotion-table">
                    <thead>
                    <tr style="text-align: center">
                        <th>Tên Khuyến Mãi</th>
                        <th>Thời Gian</th>
                        <th>Phần Trăm Giảm Giá</th>
                        <th>Loại Sản Phẩm Áp Dụng</th>
                        <th>Hành Động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>Ngày Nhà Giáo Việt Nam</td>
                        <td style="text-align: center">19/11/2024 - 20/11/2024</td>
                        <td>25%</td>
                        <td>Tất cả sản phẩm</td>
                        <td>
                            <button class="edit-btn"
                                    onclick="openModal({promoTitle: '', promoDiscount: 0, promoStart: '', promoEnd: ''}, 'editPromotion')">
                                Sửa
                            </button>
                            <button class="delete-btn"
                                    onclick="openModal({promoTitle: ''}, 'deletePromotion')">Xóa
                            </button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div id="feedback" class="section">
            <div class="feedback-container">
                <div class="feedback-content">
                    <h1>Phản Hồi Khách Hàng</h1>
                    <table id="feedbackTable" class="feedback-table">
                        <thead>
                        <tr>
                            <th>ID Feedback</th>
                            <th>Tên sản phẩm</th>
                            <th>Tên khách hàng</th>
                            <th>Nội dung</th>
                            <th>Ngày tạo</th>
                            <th>Đánh giá</th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- Lặp qua danh sách feedback -->
                        <c:forEach var="feedback" items="${feedback}">
                            <tr>
                                <td>${feedback.idFeedback}</td>
                                <td>${feedback.productName}</td>
                                <td>${feedback.cusName}</td>
                                <td>${feedback.content}</td>
                                <td>${feedback.dateCreate}</td>
                                <td>${feedback.rating}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div id="system" class="section">
            <div class="system-settings">
                <div class="system-menu">
                    <div class="system-item button-user-management" id="user-management">
                        <i class="fa-solid fa-user-gear"></i>
                        <span>Quản lý người dùng</span>
                    </div>
                    <div class="system-item button-system-config" id="system-config">
                        <i class="fa-solid fa-cogs"></i>
                        <span>Cấu hình hệ thống</span>
                    </div>
                    <div class="system-item button-activity-log" id="activity-log">
                        <i class="fa-solid fa-clock-rotate-left"></i>
                        <span>Nhật ký hoạt động</span>
                    </div>
                    <div class="system-item" id="support">
                        <i class="fa-solid fa-headset"></i>
                        <span>Hỗ trợ kỹ thuật</span>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
<div id="logoutOverlay" class="logout-overlay" style="display: none;"></div>
<div id="logoutNotification" class="logout-notification" style="display: none;">
    <div class="notification-content">
        <p>Bạn có muốn đăng xuất ?</p>
        <button id="confirmLogoutBtn">Có</button>
        <button id="cancelLogoutBtn">Không</button>
    </div>
</div>

<div id="deleteOverlay" class="delete-overlay" style="display: none;"></div>
<div id="deleteNotification" class="delete-notification" style="display: none;">
    <div class="notification-content">
        <p>Bạn có muốn xóa sản phẩm này?</p>
        <button id="confirmDeleteBtn">Có</button>
        <button id="cancelDeleteBtn">Không</button>
    </div>
</div>

<div id="overlay" class="overlay">
    <!-- Modal chi tiết hóa đơn -->
    <div id="invoiceModal" class="modal">
        <div class="modal-content">
            <span class="close-button" onclick="closeModal('invoice')">&times;</span>
            <h2>CHI TIẾT HÓA ĐƠN</h2>
            <div class="customer-info">
                <p><strong>Tên:</strong> <span id="customerName"></span></p>
                <p><strong>Địa chỉ:</strong> <span id="customerAddress"></span></p>
                <p><strong>Số điện thoại:</strong> <span id="customerPhone"></span></p>
                <p><strong>Ngày mua</strong> <span id="customerDateSell"></span></p>
            </div>
            <table id="invoiceTable" class="invoice-table" style="display: none;">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên SP</th>
                    <th>Số lượng</th>
                    <th>Đơn Giá</th>
                    <th>Thành Tiền</th>
                </tr>
                </thead>
                <tbody id="productList">
                <!-- Dữ liệu sản phẩm sẽ được thêm ở đây bằng JavaScript -->
                </tbody>
            </table>
            <div class="total">
                <strong>TỔNG TIỀN:</strong> <span id="totalAmount"></span> VND
            </div>
        </div>
    </div>
    <!-- Modal chi tiết sản phẩm đã mua -->
    <div id="productDetailModal" class="modal">
        <div class="modal-content">
            <span class="close-button" onclick="closeModal('productDetail')">&times;</span>
            <h2>Chi Tiết Sản Phẩm Đã Mua</h2>
            <div class="customer-info">
                <p><strong>ID Khách hàng:</strong> <span id="customerID"></span></p>
                <p><strong>Họ và Tên:</strong> <span id="customerName1"></span></p>
                <p><strong>Tổng chi tiêu:</strong> <span id="totalSpent"></span></p>
                <p><strong>Ngày đăng ký:</strong> <span id="registrationDate"></span></p>
            </div>
            <table id="productTable" class="product-table" style="display: none;">
                <thead>
                <tr>
                    <th>Tên sản phẩm</th>
                    <th>Số lượng</th>
                    <th>Đơn giá</th>
                    <th>Thành tiền</th>
                </tr>
                </thead>
                <tbody id="purchasedProductList">
                <!-- Dữ liệu sản phẩm sẽ được thêm ở đây bằng JavaScript -->
                </tbody>
            </table>
            <div class="total">
                <strong>Tổng cộng:</strong> <span id="grandTotal"></span> VND
            </div>
        </div>
    </div>
    <!-- Modal Mô Tả Sản Phẩm -->
    <div id="productDescriptionModal" class="modal">
        <div class="modal-content" id="product-description-modal-content">
            <button class="close-button" id="close-product-description-modal"
                    onclick="closeModal('productDescription')">&times;</button>
            <h2 id="product-description-title">Mô Tả Sản Phẩm</h2>
            <div class="product-detail-container" id="product-detail-container">
                <!-- Phần hình ảnh sản phẩm -->
                <div class="product-image" id="product-description-image-container">
                    <img src="" id="product-description-image" alt="Tên sản phẩm" />
                </div>
                <!-- Phần thông tin sản phẩm -->
                <div class="product-info" id="product-description-info">
                    <!-- Tên sản phẩm -->
                    <div class="form-group" id="product-name-group">
                        <strong>Tên sản phẩm:</strong>
                        <span id="product-description-name">Tên sản phẩm</span>
                        <input type="text" id="edit-product-name" value="Tên sản phẩm" style="display: none;">
                    </div>

                    <!-- Mã sản phẩm -->
                    <div class="form-group" id="product-code-group">
                        <strong>Mã sản phẩm:</strong>
                        <span id="product-description-code">12345</span>
                        <input type="text" id="edit-product-code" value="12345" style="display: none;" readonly>
                    </div>

                    <!-- Giá sản phẩm -->
                    <div class="form-group" id="product-price-group">
                        <strong>Giá:</strong>
                        <span id="product-description-price">500,000 VND</span>
                        <input type="text" id="edit-product-price" value="500,000 VND" style="display: none;">
                    </div>

                    <!-- Loại sản phẩm -->
                    <div class="form-group" id="product-category-group">
                        <strong>Loại sản phẩm:</strong>
                        <span id="product-description-category">Điện Tử</span>
                        <input type="text" id="edit-product-category" value="Điện Tử" style="display: none;">
                    </div>

                    <!-- Xuất xứ -->
                    <div class="form-group" id="product-origin-group">
                        <strong>Xuất xứ:</strong>
                        <span id="product-description-origin">Việt Nam</span>
                        <input type="text" id="edit-product-origin" value="Việt Nam" style="display: none;">
                    </div>

                    <!-- Mô tả sản phẩm -->
                    <div class="form-group" id="product-description-group">
                        <strong>Mô tả:</strong>
                        <span id="product-description-description">Mô tả chi tiết sản phẩm.</span>
                        <textarea id="edit-product-description"
                                  style="display: none;">Mô tả chi tiết sản phẩm.</textarea>
                    </div>

                    <!-- Nút chỉnh sửa và lưu -->
                    <div class="admin-actions" id="admin-actions">
                        <button class="edit-product" id="edit-product-button" onclick="editProduct()">Chỉnh sửa sản
                            phẩm</button>
                        <button class="save-product" id="save-product-button" onclick="saveProduct()"
                                style="display: none;">Lưu thay đổi</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Chi tiết hóa đơn -->
    <div id="newInvoiceModal" class="modal">
        <div class="modal-content">
            <span class="close-button" onclick="closeModal('newInvoice')">&times;</span>
            <h2>Chi Tiết Hóa Đơn</h2>
            <div class="customer-info">
                <p><strong>Mã khách hàng:</strong> <span id="newCustomerID"></span></p>
                <p><strong>Tên khách hàng:</strong> <span id="newCustomerName"></span></p>
                <p><strong>Địa chỉ:</strong> <span id="newCustomerAddress"></span></p>
                <p><strong>Số điện thoại:</strong> <span id="newCustomerPhone"></span></p>
                <p><strong>Ngày đặt hàng:</strong> <span id="newCustomerDateSell"></span></p>
            </div>
            <table id="newInvoiceTable" class="invoice-table" style="display: none;">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>Tên Sản Phẩm</th>
                    <th>Số Lượng</th>
                    <th>Đơn Giá</th>
                    <th>Thành Tiền</th>
                </tr>
                </thead>
                <tbody id="newProductList">
                <!-- Dữ liệu sản phẩm sẽ được thêm ở đây bằng JavaScript -->
                </tbody>
            </table>
            <div class="total">
                <strong>Tổng Tiền:</strong> <span id="newTotalAmount"></span> VND
            </div>
        </div>
    </div>
    <!-- Quản Lý người dùng -->
    <div id="userManagementModal" class="modal system-user">
        <div class="modal-content">
            <div class="header">
                <span class="close-button" onclick="closeModal('userManagement')">&times;</span>
                <h2>
                    <i class="fa-solid fa-user-gear"></i> Quản Lý Người Dùng
                </h2>
            </div>
            <!-- Danh sách tài khoản -->
            <div class="form-section">
                <h3>Danh sách tài khoản</h3>
                <div class="table-scroll-container">
                    <table class="user-table">
                        <thead>
                        <tr>
                            <th>Tên tài khoản</th>
                            <th>Quyền</th>
                            <th>Hành động</th>
                        </tr>
                        </thead>
                        <tbody id="userTableBody"></tbody>
                    </table>
                </div>
            </div>
            <!-- Thêm tài khoản -->
            <div class="form-section addInfo">
                <h3>Thêm tài khoản</h3>
                <label for="usernameInput">Tên tài khoản:</label>
                <input type="text" id="usernameInput" placeholder="Nhập tên tài khoản" />
                <label for="userRoleInput">Quyền:</label>
                <select id="userRoleInput">
                    <option value="admin">Admin</option>
                    <option value="staff">Nhân viên</option>
                </select>
                <button class="btn-add" onclick="addUser()">Thêm tài khoản mới</button>
            </div>

            <!-- Nút Lưu thay đổi -->
            <button class="btn-save" onclick="saveChanges()"><i class="fa-solid fa-floppy-disk"></i> Lưu thay
                đổi</button>
        </div>
    </div>
    <!-- Modal Cấu Hình Hệ Thống -->
    <div id="systemConfigModal" class="modal system-config-modal">
        <div class="modal-content">
            <div class="header">
                <span class="close-button" onclick="closeModal('systemConfig')">&times;</span>
                <h2>
                    <i class="fa fa-cogs"></i> Cấu Hình Hệ Thống
                </h2>
            </div>

            <form id="systemConfigForm" class="form-section">
                <div class="form-group">
                    <label for="systemName"><i class="fa fa-desktop"></i> Tên Hệ Thống:</label>
                    <input type="text" id="systemName" placeholder="Nhập tên hệ thống" />
                </div>

                <div class="form-group">
                    <label for="adminEmail"><i class="fa fa-envelope"></i> Email Quản Trị:</label>
                    <input type="email" id="adminEmail" placeholder="Nhập email quản trị" />
                </div>

                <div class="form-group">
                    <label for="language"><i class="fa fa-language"></i> Ngôn Ngữ:</label>
                    <select id="language">
                        <option value="vi">Tiếng Việt</option>
                        <option value="en">English</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="timeZone"><i class="fa fa-clock"></i> Múi Giờ:</label>
                    <select id="timeZone">
                        <option value="UTC+7">UTC+7 (Vietnam)</option>
                        <option value="UTC+8">UTC+8 (England)</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="maintenanceMode"><i class="fa fa-wrench"></i> Chế Độ Bảo Trì:</label>
                    <select id="maintenanceMode">
                        <option value="off">Tắt</option>
                        <option value="on">Bật</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="maxUsers"><i class="fa fa-users"></i> Số Lượng Người Dùng Tối Đa:</label>
                    <input type="number" id="maxUsers" placeholder="Nhập số lượng người dùng tối đa" />
                </div>
            </form>
            <div class="form-buttons">
                <button type="button" class="btn-save" onclick="saveSystemConfig()"><i
                        class="fa-solid fa-floppy-disk"></i> Lưu Cấu Hình</button>
            </div>
        </div>
    </div>
    <div id="activityLogModal" class="modal system-activity">
        <div class="modal-content">
            <span class="close-button" onclick="closeModal('activityLog')">&times;</span>
            <h2>Nhật Ký Hoạt Động</h2>

            <!-- Bộ lọc -->
            <div class="filters">
                <!-- Phần Tìm kiếm -->
                <div class="filter-item">
                    <label for="searchInput">
                        <i class="fas fa-search"></i> Tìm kiếm:
                    </label>
                    <input type="text" id="searchInput" placeholder="Tìm kiếm theo tên, hoạt động..." />
                </div>

                <!-- Phần Từ ngày -->
                <div class="filter-item">
                    <label for="fromDate">
                        <i class="fas fa-calendar-alt"></i> Từ ngày:
                    </label>
                    <input type="date" id="fromDate" />
                </div>

                <!-- Phần Đến ngày -->
                <div class="filter-item">
                    <label for="toDate">
                        <i class="fas fa-calendar-alt"></i> Đến ngày:
                    </label>
                    <input type="date" id="toDate" />
                </div>

                <!-- Nút Lọc -->
                <div class="filter-button">
                    <button class="btn-filter" onclick="filterLogs()">Lọc</button>
                </div>
            </div>

            <!-- Bảng nhật ký -->
            <table class="activity-log">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>Thời gian</th>
                    <th>Người thực hiện</th>
                    <th>Hành động</th>
                    <th>Kết quả</th>
                    <th>Ghi chú</th>
                </tr>
                </thead>
                <tbody id="activityLogBody">
                <!-- Nhật ký sẽ được thêm bằng JS -->
                </tbody>
            </table>

            <!-- Nút hành động -->
            <div class="action-buttons">
                <button class="btn-clear" onclick="clearLogs()">Xóa toàn bộ nhật ký</button>
                <button class="btn-export" onclick="exportLogs()">Xuất File</button>
            </div>
        </div>
    </div>
    <!-- Quản lý khuyến mãi -->
    <div id="promotionModal1" class="custom-modal">
        <div class="custom-modal-content">
            <span class="custom-close-button" onclick="closeModal('promotion')">&times;</span>
            <h2>Thêm Khuyến Mãi</h2>
            <form id="promotionForm">
                <div class="form-group">
                    <label for="promotionName">Tên Khuyến Mãi:</label>
                    <input type="text" id="promotionName" placeholder="Nhập tên khuyến mãi" required>
                </div>
                <div class="form-group">
                    <label for="discount">Giảm Giá (%):</label>
                    <input type="text" id="discount" min="1" max="100" placeholder="Nhập giảm giá" required>
                </div>
                <div class="form-group">
                    <label for="startDate">Ngày Bắt Đầu:</label>
                    <input type="date" id="startDate" required>
                </div>
                <div class="form-group">
                    <label for="endDate">Ngày Kết Thúc:</label>
                    <input type="date" id="endDate" required>
                </div>
                <div class="form-group">
                    <label for="productTypeSelect">Loại Sản Phẩm Áp Dụng</label>
                    <select id="productTypeSelect">
                        <option value="all">Tất cả sản phẩm</option>
                        <option value="domestic">Sản phẩm trong nước</option>
                        <option value="imported">Sản phẩm nhập khẩu</option>
                        <option value="today_fruits">Trái Ngon Hôm Nay</option>
                        <option value="vietnam_fruits">Trái Cây Việt Nam</option>
                        <option value="imported_fruits">Trái Cây Nhập Khẩu</option>
                        <option value="precut_fruits">Trái Cây Cắt Sẵn</option>
                        <option value="fruit_gifts">Quà Tặng Trái Cây</option>
                        <option value="mooncake_gifts">Hộp Quà Nguyệt Cát</option>
                        <option value="dried_fruits">Trái Cây Sấy Khô</option>
                        <option value="fruit_jam">Mứt Trái Cây</option>
                    </select>
                </div>
                <div class="form-actions">
                    <button type="submit" id="savePromotionBtn" class="btn-save">Lưu</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Modal Sửa Khuyến Mãi -->
    <div id="editPromotionModal" class="modal">
        <div class="editPromotionModal-content">
            <h3>Chỉnh Sửa Chương Trình Khuyến Mãi</h3>
            <form id="editPromotionForm" class="editPromotion">
                <label for="promoTitle">Tên Chương Trình</label>
                <input type="text" id="promoTitle" placeholder="Nhập tên chương trình">
                <label for="promoDiscount">Phần Trăm Giảm Giá</label>
                <input type="number" id="promoDiscount" placeholder="Nhập % giảm giá">
                <label for="promoStart">Thời Gian Bắt Đầu</label>
                <input type="date" id="promoStart">
                <label for="promoEnd">Thời Gian Kết Thúc</label>
                <input type="date" id="promoEnd">
                <label for="productTypeSelect">Loại Sản Phẩm Áp Dụng</label>
                <select id="productTypeSelect">
                    <option value="all">Tất cả sản phẩm</option>
                    <option value="domestic">Sản phẩm trong nước</option>
                    <option value="imported">Sản phẩm nhập khẩu</option>
                    <option value="today_fruits">Trái Ngon Hôm Nay</option>
                    <option value="vietnam_fruits">Trái Cây Việt Nam</option>
                    <option value="imported_fruits">Trái Cây Nhập Khẩu</option>
                    <option value="precut_fruits">Trái Cây Cắt Sẵn</option>
                    <option value="fruit_gifts">Quà Tặng Trái Cây</option>
                    <option value="mooncake_gifts">Hộp Quà Nguyệt Cát</option>
                    <option value="dried_fruits">Trái Cây Sấy Khô</option>
                    <option value="fruit_jam">Mứt Trái Cây</option>
                </select>
            </form>
            <div class="save-close" style="padding-top: 30px">
                <button type="submit">Lưu</button>
                <button type="button" onclick="closeModal()">Hủy</button>
            </div>
        </div>
    </div>
    <!-- Modal Xóa Khuyến Mãi -->
    <div id="deletePromotionModal" class="modal">
        <div class="deletePromotionModal-content">
            <h3>Xác Nhận Xóa Chương Trình</h3>
            <div class="delete-cancel">
                <button id="confirmDeleteButton">Xóa</button>
                <button type="button" onclick="closeModal('deletePromotion')">Hủy</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/logicAdmin.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
<script>
    const contextPath = "${pageContext.request.contextPath}";
    document.getElementById("confirmLogoutBtn").onclick = function() {
        window.location.href = contextPath + "/logout";
    };
</script>
<script src="${pageContext.request.contextPath}/assets/js/admin.js" defer></script>
</body>

</html>

