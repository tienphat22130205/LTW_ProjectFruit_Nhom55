
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="vn.edu.hcmuaf.fit.project_fruit.dao.PromotionsDao" %>
<%@ page import="vn.edu.hcmuaf.fit.project_fruit.dao.model.Promotions" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/custom-datatable.css">
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
                                <table id="recent-customers" class="display" width="100%">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên khách hàng</th>
                                        <th>Số điện thoại</th>
                                        <th>Địa chỉ</th>
                                        <th>Ngày tạo tài khoản</th>
                                        <th>Email</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <!-- Lặp qua danh sách khách hàng gần đây -->
                                    <c:forEach var="customer" items="${recentCustomers}">
                                        <tr>
                                            <td>${customer.idCustomer}</td>
                                            <td>${customer.customerName}</td>
                                            <td>${customer.customerPhone}</td>
                                            <td>${customer.address}</td>
                                            <td>${customer.dateRegister}</td>
                                            <td>${customer.email}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box">
                    <div class="flex-container">
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
                                            <!-- Lặp qua danh sách các sản phẩm bán chạy -->
                                            <c:forEach var="product" items="${bestSellingProducts}" varStatus="status">
                                                <tr>
                                                    <td>${status.index + 1}</td>  <!-- Số thứ tự, bắt đầu từ 1 -->
                                                    <td>${product.name}</td>  <!-- Tên sản phẩm -->
                                                    <td>${product.totalQuantity}</td>  <!-- Tổng số lượng mua -->
                                                    <td>${product.totalAmount} VND</td>  <!-- Tổng số tiền -->
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
            
            </div>
            <div class="recent-grid">
                <div class="customers">
                    <div class="card">
                        <h1>Danh sách sản phẩm</h1>
                        <div class="card-body">
                            <h3>Thêm sản phẩm</h3>
                            <form class="productAddTable" action="<%= request.getContextPath() %>/addproduct"
                                  method="post">
                                <div class="form-group">
                                    <label for="product-name">Tên sản phẩm:</label>
                                    <input type="text" id="product-name" name="product-name"
                                           placeholder="Nhập tên sản phẩm" required/>
                                </div>
                                <div class="form-group">
                                    <label for="product-type">Loại sản phẩm:</label>
                                    <input type="text" id="product-type" name="product-type"
                                           placeholder="Nhập loại sản phẩm" required/>
                                </div>
                                <div class="form-group">
                                    <label for="origin">Xuất xứ:</label>
                                    <input type="text" id="origin" name="origin" placeholder="Nhập xuất xứ" required/>
                                </div>
                                <div class="form-group">
                                    <label for="product-price">Giá:</label>
                                    <input type="text" id="product-price" name="product-price"
                                           placeholder="Nhập mức giá" required/>
                                </div>
                                <div class="form-group">
                                    <label for="quantity">Số lượng:</label>
                                    <input type="text" id="quantity" name="quantity" placeholder="Nhập số lượng"
                                           required/>
                                </div>
                                <div class="form-group">
                                    <label for="promotion-code">Mã khuyến mãi:</label>
                                    <input type="text" id="promotion-code" name="promotion-code"
                                           placeholder="Nhập mã khuyến mãi" required/>
                                </div>
                                <div class="form-group">
                                    <label for="supplier-add">Mã nhà cung cấp:</label>
                                    <input type="text" id="supplier-add" name="supplier-add"
                                           placeholder="Nhập mã nhà cung cấp" required/>
                                </div>
                                <div class="form-group">
                                    <label for="warranty-period">Thời gian bảo hành:</label>
                                    <input type="text" id="warranty-period" name="warranty-period"
                                           placeholder="Nhập thời gian bảo hành" required/>
                                </div>
                                <div class="form-group">
                                    <label for="shelf-life">Hạn sử dụng:</label>
                                    <input type="text" id="shelf-life" name="shelf-life" placeholder="Nhập hạn sử dụng"
                                           required/>
                                </div>
                                <div class="form-group">
                                    <label for="describe">Mô tả:</label>
                                    <input type="text" id="describe" name="describe" placeholder="Nhập mô tả sản phẩm"
                                           required/>
                                </div>
                                <div class="form-group">
                                    <label for="rating">Đánh giá:</label>
                                    <input type="text" id="rating" name="rating" placeholder="Nhập đánh giá sản phẩm"
                                           required/>
                                </div>
                                <div class="form-group">
                                    <label for="characteristic">Đặc điểm:</label>
                                    <input type="text" id="characteristic" name="characteristic"
                                           placeholder="Nhập đặc điểm sản phẩm" required/>
                                </div>
                                <div class="form-group">
                                    <label for="preserve-product">Bảo quản:</label>
                                    <input type="text" id="preserve-product" name="preserve-product"
                                           placeholder="Nhập cách bảo quản" required/>
                                </div>
                                <div class="form-group">
                                    <label for="use-product">Hướng dẫn sử dụng:</label>
                                    <input type="text" id="use-product" name="use-product"
                                           placeholder="Nhập hướng dẫn sử dụng" required/>
                                </div>
                                <div class="form-group">
                                    <label for="benefit">Lợi ích:</label>
                                    <input type="text" id="benefit" name="benefit" placeholder="Nhập lợi ích sản phẩm"
                                           required/>
                                </div>
                                <div class="form-group">
                                    <label for="image-link">Link ảnh:</label>
                                    <input type="text" id="image-link" name="image-link" placeholder="Nhập link ảnh"
                                           required/>
                                </div>
                                <button type="submit" class="btn-submit">Cập nhật</button>
                            </form>

                            <div class="table-reponsive">
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
<%--                        <th>Hành động</th>--%>
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
                            <td>
                                    ${supplier.status}
                                <c:choose>
                                    <c:when test="${supplier.status == 'Đang hợp tác'}">
                                        <i class="fas fa-circle" style="color: blue;"></i>
                                    </c:when>
                                    <c:when test="${supplier.status == 'Đã dừng'}">
                                        <i class="fas fa-circle" style="color: red;"></i>
                                    </c:when>
                                </c:choose>
                            </td>
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
                </div>
                <div class="search-bar">
                    <input type="text" placeholder="Tìm khuyến mãi..."/>
                    <button>Tìm kiếm</button>
                </div>

                <!-- Form Thêm Khuyến Mãi -->
                <h3>Thêm khuyến mãi</h3>
                <form class="promotionAddTable" action="<%= request.getContextPath() %>/AddPromotionServlet"
                      method="POST">
                    <div class="form-group">
                        <label for="promotion-code">Tên khuyến mãi:</label>
                        <input type="text" id="promotion-code" name="promotion_code" placeholder="Nhập mã giảm giá"
                               required/>
                    </div>

                    <div class="form-group">
                        <label for="description-add">Mô tả:</label>
                        <input type="text" id="description-add" name="description_add" placeholder="Nhập mô tả"
                               required/>
                    </div>

                    <div class="form-group">
                        <label for="start-date">Ngày bắt đầu:</label>
                        <input type="date" id="start-date" name="start_date" required/>
                    </div>

                    <div class="form-group">
                        <label for="expiration-date">Ngày hết hạn:</label>
                        <input type="date" id="expiration-date" name="expiration_date" required/>
                    </div>

                    <div class="form-group">
                        <label for="promotion-discount">Mức giảm (%):</label>
                        <input type="number" id="promotion-discount" name="promotion_discount"
                               placeholder="Nhập mức giảm (%)" min="0" max="100" required/>
                    </div>

                    <div class="form-group">
                        <label for="promotion-type">Loại:</label>
                        <select id="promotion-type" name="promotion_type" class="promotionType" required>
                            <option value="weekly">Weekly</option>
                            <option value="general">General</option>
                        </select>
                    </div>
                    <button type="submit" class="btn-submit">Cập nhật</button>
                </form>

                <h3>Danh sách Khuyến mãi</h3>
                <div class="promotion-table">
                    <%
                        PromotionsDao promotionsDao = new PromotionsDao();
                        List<Promotions> promotionsList = promotionsDao.getAll();
                    %>
                    <table>
                        <thead>
                        <tr style="text-align: center">
                            <th>ID</th>
                            <th style="text-align: left">Tên Khuyến Mãi</th>
                            <th>Mô Tả</th>
                            <th>Ngày Bắt Đầu</th>
                            <th>Ngày Kết Thúc</th>
                            <th>Phần Trăm Giảm Giá</th>
                            <th>Loại</th>
                            <th>Hành Động
                            <th>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for (Promotions promotion : promotionsList) {
                        %>
                        <tr>
                            <td><%= promotion.getId_promotion() %>
                            </td>
                            <td><%= promotion.getPromotion_name() %>
                            </td>
                            <td><%= promotion.getDescribe_1() %>
                            </td>
                            <td><%= promotion.getStart_date() %>
                            </td>
                            <td style="text-align: center"><%= promotion.getEnd_date() %>
                            </td>
                            <td style="text-align: center"><%= promotion.getPercent_discount()%>%
                            </td>
                            <td style="text-align: center"><%= promotion.getType() %>
                            </td>
                            <td>
                                <button onclick="openModal({promoTitle: '', promoDiscount: 0, promoStart: '', promoEnd: ''}, 'editPromotion')">Sửa</button>
                                <button onclick="window.location.href='remove-promotion?pid=<%= promotion.getId_promotion() %>'">Xóa</button>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
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
                                <td style="gap: 5px">${feedback.rating} <i class="fas fa-star"></i></td>
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
</div>
<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/logicAdmin.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
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
<script>
    $(document).ready(function() {
        $('#recent-customers').DataTable();  // Khởi tạo DataTable cho bảng
    });
</script>
<script src="${pageContext.request.contextPath}/assets/js/admin.js" defer></script>
<script>
    const contextPath = "${pageContext.request.contextPath}";
    document.getElementById("confirmLogoutBtn").onclick = function() {
        window.location.href = contextPath + "/logout";
    };
</script>
</body>

</html>

