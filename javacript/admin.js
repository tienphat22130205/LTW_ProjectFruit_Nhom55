function showSection(sectionId, title) {
    // Thay đổi tiêu đề
    document.getElementById('page-title').innerHTML = `
        <label for="nav-toggle">
            <span class="fa-solid fa-bars"></span>
        </label> ${title}`;

    // Ẩn tất cả các phần
    const sections = document.querySelectorAll('.section');
    sections.forEach(section => {
        section.classList.remove('active');
    });

    // Hiển thị phần được chọn
    const selectedSection = document.getElementById(sectionId);
    if (selectedSection) {
        selectedSection.classList.add('active');
    }

    // Xóa class active từ tất cả các mục menu
    const menuItems = document.querySelectorAll('.menu-item');
    menuItems.forEach(item => item.classList.remove('active'));

    // Thêm class active vào mục menu được chọn
    const activeMenuItem = document.querySelector(`a[onclick="showSection('${sectionId}', '${title}')"]`);
    if (activeMenuItem) {
        activeMenuItem.classList.add('active');
    }
}

// Mặc định hiển thị phần dashboard khi tải trang
document.addEventListener('DOMContentLoaded', () => {
    showSection('dashboard', 'Dashboard');
});
// dong mo sidebar
document.querySelector("#nav-toggle").addEventListener("change", function () {
    document.querySelector(".sidebar").classList.toggle("active");
});
// chart
// Cấu hình biểu đồ Doanh thu 6 tháng qua
const ctxMonthly = document.getElementById('monthlyRevenueChart').getContext('2d');
const monthlyRevenueChart = new Chart(ctxMonthly, {
    type: 'bar',
    data: {
        labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6'],
        datasets: [{
            label: 'Doanh thu',
            data: [12000000, 15000000, 13000000, 17000000, 14000000, 16000000],
            backgroundColor: '#AED9EC',
            borderColor: '#AED9EC',
            borderWidth: 1,
            hoverBackgroundColor: '#5fa2e9',
            hoverBorderColor: '#5fa2e9',
            borderRadius: 6, // Rounded corners for bars
        }]
    },
    options: {
        responsive: true,
        plugins: {
            tooltip: {
                callbacks: {
                    label: (context) => `${context.raw.toLocaleString()} VNĐ`
                }
            },
            legend: {
                display: false
            }
        },
        scales: {
            y: {
                beginAtZero: true,
                title: {
                    display: true,
                    text: 'Doanh thu (VNĐ)',
                    font: {
                        size: 12
                    }
                },
                ticks: {
                    callback: function (value) {
                        return value.toLocaleString() + ' đ';
                    }
                }
            },
            x: {
                title: {
                    display: true,
                    text: 'Tháng',
                    font: {
                        size: 12
                    }
                },
                barPercentage: 0.5,
                categoryPercentage: 0.6
            }
        }
    }
});

// Cấu hình biểu đồ Doanh thu hàng ngày của tháng vừa qua
const ctx = document.getElementById('weeklyRevenueChart').getContext('2d');
const weeklyRevenueChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['Tuần 1', 'Tuần 2', 'Tuần 3', 'Tuần 4'], // Các mốc tuần trong tháng
        datasets: [{
            label: 'Doanh thu (VND)',
            data: [5000000, 6500000, 9500000, 9000000], // Doanh thu mỗi tuần
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 2,
            pointRadius: 4,
            pointHoverRadius: 6
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        scales: {
            y: {
                beginAtZero: true,
                ticks: {
                    callback: function (value) {
                        return value.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
                    }
                },
                title: {
                    display: true,
                    text: 'Doanh thu (VND)',
                }
            },
            x: {
                title: {
                    display: true,
                    text: 'Tuần'
                }
            }
        },
        plugins: {
            legend: {
                display: false
            }
        }
    }
});
// Doanh thu theo tháng 
const monthlyRevenueCtx = document.getElementById('monthlyRevenueChart1').getContext('2d');

const monthlyRevenueChart1 = new Chart(monthlyRevenueCtx, {
    type: 'line', // Loại biểu đồ đường
    data: {
        labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"],
        datasets: [{
            label: 'Doanh thu (VND)',
            data: [150000000, 200000000, 180000000, 220000000, 250000000, 300000000, 350000000, 320000000, 280000000, 310000000, 400000000, 450000000],
            borderColor: 'rgba(75, 192, 192, 1)',
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            borderWidth: 2,
            pointRadius: 4, // Độ lớn của các điểm trên biểu đồ
            pointHoverRadius: 6, // Độ lớn của các điểm khi hover
            fill: true,
            tension: 0.4 // Độ cong của đường biểu đồ
        }]
    },
    options: {
        responsive: true,
        plugins: {
            tooltip: {
                callbacks: {
                    label: (context) => `${context.raw.toLocaleString('vi-VN')} VND` // Định dạng tooltip là VND
                }
            },
            legend: {
                display: true,
                position: 'top',
            }
        },
        scales: {
            y: {
                beginAtZero: true,
                title: {
                    display: true,
                    text: 'Doanh thu (VND)',
                    font: {
                        size: 12
                    }
                },
                ticks: {
                    callback: function (value) {
                        return `${value.toLocaleString('vi-VN')} đ`; // Hiển thị "đồng" cho trục y
                    }
                }
            },
            x: {
                title: {
                    display: true,
                    text: 'Tháng',
                    font: {
                        size: 12
                    }
                }
            }
        }
    }
});
// // biểu đồ biểu diễn các sản phẩm đã đóng góp vào doanh thu
const productDonutCtx = document.getElementById('productDonutChart').getContext('2d');

const productDonutChart = new Chart(productDonutCtx, {
    type: 'doughnut', // Loại biểu đồ Donut
    data: {
        labels: ["Táo Mỹ", "Cam Sành", "Dưa Hấu", "Nho Úc", "Xoài Cát"],
        datasets: [{
            label: 'Top Selling Categories',
            data: [34.3, 25.7, 18.6, 21.4, 15.0], // Tỷ lệ phần trăm cho từng loại sản phẩm
            backgroundColor: ['#ff6384', '#36a2eb', '#ffcd56', '#4bc0c0', '#9966ff'], // Màu sắc dễ phân biệt
            hoverOffset: 4,
            borderWidth: 2,
            borderColor: '#ffffff',
        }]
    },
    options: {
        responsive: true,
        cutout: '70%', // Độ rộng phần rỗng ở giữa biểu đồ
        animation: {
            animateRotate: true, // Hiệu ứng xoay từ 0 đến 360 độ
            duration: 1500 // Thời gian của hiệu ứng (ms)
        },
        plugins: {
            tooltip: {
                callbacks: {
                    label: (context) => `${context.label}: ${context.raw}%`
                }
            },
            legend: {
                display: true,
                position: 'bottom',
                labels: {
                    boxWidth: 10,
                    padding: 20,
                }
            },
            // Plugin để hiển thị tổng số ở giữa biểu đồ
            doughnutlabel: {
                labels: [
                    {
                        text: 'Products',
                        font: {
                            size: 18,
                            weight: 'bold'
                        }
                    },
                    {
                        text: '70', // Tổng số giả lập
                        font: {
                            size: 24,
                            weight: 'bold'
                        }
                    }
                ]
            }
        }
    }
});
// biểu đồ doanh thu các loại sản phẩm
const productTypeRevenueCtx = document.getElementById('productTypeRevenueChart').getContext('2d');

const productTypeRevenueChart = new Chart(productTypeRevenueCtx, {
    type: 'bar', // Loại biểu đồ cột
    data: {
        labels: ["Trái Ngon Hôm Nay", "Trái Cây Việt Nam", "Trái Cây Nhập Khẩu", "Trái Cây Cắt Sẵn",
            "Quà Tặng Trái Cây", "Hộp Quà Nguyệt Cát", "Trái Cây Sấy Khô", "Mứt Trái Cây"],
        datasets: [{
            label: 'Doanh thu (VND)',
            data: [50000000, 30000000, 45000000, 70000000, 20000000, 60000000, 40000000, 25000000, 15000000, 10000000], // Doanh thu giả lập cho từng loại
            backgroundColor: [
                '#4A90E2', '#7FB3D5', '#85C1E9', '#AED6F1', '#D4E6F1',
                '#f39c12', '#e74c3c', '#9b59b6', '#2ecc71', '#3498db'
            ],
            borderWidth: 1,
            borderRadius: 4
        }]
    },
    options: {
        responsive: true,
        scales: {
            y: {
                beginAtZero: true,
                title: {
                    display: true,
                    text: 'Doanh thu (VND)',
                },
                ticks: {
                    callback: function (value) {
                        return value.toLocaleString() + ' đ';
                    }
                }
            },
            x: {
                title: {
                    display: true,
                    text: 'Loại sản phẩm',
                }
            }
        },
        plugins: {
            legend: {
                display: false
            },
            tooltip: {
                callbacks: {
                    label: (context) => `${context.raw.toLocaleString()} VND`
                }
            }
        }
    }
});
// Bieu do thong ke san pham 
const productStatsChartCtx = document.getElementById('productOverviewChart').getContext('2d');

new Chart(productStatsChartCtx, {
    type: 'bar',
    data: {
        labels: ['Sản phẩm còn hàng', 'Sản phẩm đã bán', 'Đánh giá'],
        datasets: [{
            label: 'Thống kê sản phẩm',
            data: [80, 120, 4.5],
            backgroundColor: [
                'rgba(255, 159, 64, 0.7)',
                'rgba(255, 205, 86, 0.7)',
                'rgba(75, 192, 192, 0.7)'
            ],
            borderColor: [
                'rgba(255, 159, 64, 1)',
                'rgba(255, 205, 86, 1)',
                'rgba(75, 192, 192, 1)'
            ],
            borderWidth: 1.5, // Độ dày viền thanh
            borderRadius: 5, // Góc bo tròn
            barPercentage: 0.5, // Độ rộng của thanh
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: {
                display: false, // Ẩn chú thích
            },
            tooltip: {
                enabled: true, // Bật tooltip khi hover
                backgroundColor: 'rgba(0, 0, 0, 0.7)',
                titleFont: { size: 14, weight: 'bold' },
                bodyFont: { size: 12 },
                bodyColor: '#fff',
                borderColor: '#fff',
                borderWidth: 1,
            },
        },
        scales: {
            x: {
                grid: {
                    display: false, // Ẩn đường lưới dọc
                },
                ticks: {
                    font: {
                        size: 14,
                    },
                    color: '#555',
                },
            },
            y: {
                beginAtZero: true, // Bắt đầu từ 0
                grid: {
                    color: 'rgba(200, 200, 200, 0.3)', // Màu lưới ngang
                },
                ticks: {
                    font: {
                        size: 14,
                    },
                    color: '#555',
                },
            },
        },
    },
});

// Hàm mở modal chung
function openModal(data, modalType) {
    // Hiển thị overlay
    document.getElementById("overlay").style.display = "flex";

    // Ẩn tất cả các modal trước khi hiển thị modal mới
    document.getElementById("invoiceModal").style.display = "none";
    document.getElementById("productDetailModal").style.display = "none";
    document.getElementById("productDescriptionModal").style.display = "none";
    document.getElementById("newInvoiceModal").style.display = "none";
    document.getElementById("userManagementModal").style.display = "none";
    document.getElementById("systemConfigModal").style.display = "none";
    document.getElementById("activityLogModal").style.display = "none";
    document.querySelectorAll(".custom-modal").forEach(modal => {
        modal.style.display = "none";
    });
    document.querySelectorAll(".modal").forEach(modal => {
        modal.style.display = "none";
    });
    
    if (modalType === "invoice") {
        // Mở modal chi tiết hóa đơn (cũ)
        document.getElementById("invoiceModal").style.display = "block";
        document.getElementById("invoiceTable").style.display = "table";

        // Điền dữ liệu vào modal
        document.getElementById("customerName").textContent = data.customerName;
        document.getElementById("customerAddress").textContent = data.customerAddress;
        document.getElementById("customerPhone").textContent = data.customerPhone;
        document.getElementById("customerDateSell").textContent = data.customerDateSell;

        // Điền dữ liệu vào bảng hóa đơn
        const productList = document.getElementById("productList");
        productList.innerHTML = ""; // Xóa dữ liệu cũ
        data.products.forEach((product, index) => {
            const row = document.createElement("tr");
            row.innerHTML = `
                <td>${index + 1}</td>
                <td>${product.name}</td>
                <td>${product.quantity}</td>
                <td>${product.unitPrice} VND</td>
                <td>${product.totalPrice} VND</td>
            `;
            productList.appendChild(row);
        });

        // Hiển thị tổng tiền
        document.getElementById("totalAmount").textContent = data.totalAmount;
    } else if (modalType === "productDetail") {
        // Mở modal chi tiết sản phẩm đã mua
        document.getElementById("productDetailModal").style.display = "block";
        document.getElementById("productTable").style.display = "table";

        // Điền dữ liệu vào modal
        document.getElementById("customerID").textContent = data.customerID;
        document.getElementById("customerName1").textContent = data.customerName1;
        document.getElementById("totalSpent").textContent = data.totalSpent;
        document.getElementById("registrationDate").textContent = data.registrationDate;

        // Điền dữ liệu vào bảng sản phẩm đã mua
        const purchasedProductList = document.getElementById("purchasedProductList");
        purchasedProductList.innerHTML = ""; // Xóa dữ liệu cũ
        data.products.forEach((product, index) => {
            const row = document.createElement("tr");
            row.innerHTML = `
                <td>${product.name}</td>
                <td>${product.quantity}</td>
                <td>${product.unitPrice} VND</td>
                <td>${product.totalPrice} VND</td>
            `;
            purchasedProductList.appendChild(row);
        });

        // Hiển thị tổng cộng
        document.getElementById("grandTotal").textContent = data.grandTotal;
    } else if (modalType === "productDescription") {
        // Mở modal mô tả sản phẩm
        document.getElementById("productDescriptionModal").style.display = "block";

        // Điền dữ liệu vào modal
        document.getElementById("product-description-image").src = data.image;
        document.getElementById("product-description-name").textContent = data.name;
        document.getElementById("product-description-code").textContent = data.code;
        document.getElementById("product-description-price").textContent = data.price;
        document.getElementById("product-description-category").textContent = data.category;
        document.getElementById("product-description-origin").textContent = data.origin;
        document.getElementById("product-description-description").textContent = data.description;
    } else if (modalType === "newInvoice") {
        // Mở modal chi tiết hóa đơn mới
        document.getElementById("newInvoiceModal").style.display = "block";
        document.getElementById("newInvoiceTable").style.display = "table";

        // Điền dữ liệu vào modal
        document.getElementById("newCustomerID").textContent = data.customerID;
        document.getElementById("newCustomerName").textContent = data.customerName;
        document.getElementById("newCustomerAddress").textContent = data.customerAddress;
        document.getElementById("newCustomerPhone").textContent = data.customerPhone;
        document.getElementById("newCustomerDateSell").textContent = data.customerDateSell;

        // Điền dữ liệu vào bảng hóa đơn mới
        const newProductList = document.getElementById("newProductList");
        newProductList.innerHTML = ""; // Xóa dữ liệu cũ
        data.products.forEach((product, index) => {
            const row = document.createElement("tr");
            row.innerHTML = `
                <td>${index + 1}</td>
                <td>${product.name}</td>
                <td>${product.quantity}</td>
                <td>${product.unitPrice} VND</td>
                <td>${product.totalPrice} VND</td>
            `;
            newProductList.appendChild(row);
        });

        // Hiển thị tổng tiền
        document.getElementById("newTotalAmount").textContent = data.totalAmount;
    } else if (modalType === "userManagement") {
        // Mở modal quản lý người dùng
        document.getElementById("userManagementModal").style.display = "block";

        // Điền dữ liệu demo vào modal
        const userTable = document.querySelector(".user-table tbody");
        userTable.innerHTML = ""; // Xóa dữ liệu cũ
        data.forEach(user => {
            const row = document.createElement("tr");
            row.innerHTML = `
                <td>${user.username}</td>
                <td>${user.role}</td>
                <td>
                    <button class="btn-edit">Sửa</button>
                    <button class="btn-delete">Xóa</button>
                </td>
            `;
            userTable.appendChild(row);
        });
    } else if (modalType === "systemConfig") {
        document.getElementById("systemConfigModal").style.display = "block";

        // Điền dữ liệu vào các input
        document.getElementById("systemName").value = data.systemName || "";
        document.getElementById("adminEmail").value = data.adminEmail || "";
        document.getElementById("language").value = data.language || "vi";
        document.getElementById("timeZone").value = data.timeZone || "UTC+7";
        document.getElementById("maintenanceMode").value = data.maintenanceMode || "off";
        document.getElementById("maxUsers").value = data.maxUsers || "";
    } else if (modalType === "activityLog") {
        // Mở modal Nhật ký hoạt động
        document.getElementById("activityLogModal").style.display = "block";

        // Điền dữ liệu vào bảng nhật ký
        const logTableBody = document.getElementById("activityLogBody");
        logTableBody.innerHTML = ""; // Xóa dữ liệu cũ

        if (data.logs && data.logs.length > 0) {
            data.logs.forEach((log, index) => {
                const row = document.createElement("tr");
                row.innerHTML = `
                    <td>${index + 1}</td>
                    <td>${log.time}</td>
                    <td>${log.user}</td>
                    <td>${log.action}</td>
                    <td>${log.result}</td>
                    <td>${log.note}</td>
                `;
                logTableBody.appendChild(row);
            });
        } else {
            // Hiển thị thông báo nếu không có nhật ký
            const row = document.createElement("tr");
            row.innerHTML = `<td colspan="6" style="text-align: center; color: #888;">Không có nhật ký hoạt động nào</td>`;
            logTableBody.appendChild(row);
        }
    } else if (modalType === "promotion") {
        const modal = document.getElementById("promotionModal1");
        modal.style.display = "block";

        if (data) {
            // Điền dữ liệu nếu có
            document.getElementById("promotionName").value = data.promotionName || "";
            document.getElementById("discount").value = data.discount || "";
            document.getElementById("startDate").value = data.startDate || "";
            document.getElementById("endDate").value = data.endDate || "";
        } else {
            // Reset form nếu không có dữ liệu
            document.getElementById("promotionForm").reset();
        }
    }
    
    if (modalType === "editPromotion") {
        const modal = document.getElementById("editPromotionModal");
        modal.style.display = "block";

        document.getElementById("promoTitle").value = data.promoTitle || "";
        document.getElementById("promoDiscount").value = data.promoDiscount || "";
        document.getElementById("promoStart").value = data.promoStart || "";
        document.getElementById("promoEnd").value = data.promoEnd || "";
    } else if (modalType === "deletePromotion") {
        const modal = document.getElementById("deletePromotionModal");
        modal.style.display = "block";

        document.getElementById("promoToDelete").textContent = data.promoTitle || "Chương Trình Không Xác Định";

        document.getElementById("confirmDeleteButton").onclick = () => {
            console.log(`Chương trình "${data.promoTitle}" đã bị xóa.`);
            closeModal("deletePromotion");
        };
    }
}

// Hàm đóng modal và ẩn overlay
function closeModal(modalType) {
    document.getElementById("overlay").style.display = "none"; // Ẩn overlay

    if (modalType === "invoice") {
        document.getElementById("invoiceModal").style.display = "none";
        document.getElementById("invoiceTable").style.display = "none";
    } else if (modalType === "productDetail") {
        document.getElementById("productDetailModal").style.display = "none";
        document.getElementById("productTable").style.display = "none";
    } else if (modalType === "productDescription") {
        document.getElementById("productDescriptionModal").style.display = "none";
    } else if (modalType === "newInvoice") {
        document.getElementById("newInvoiceModal").style.display = "none";
        document.getElementById("newInvoiceTable").style.display = "none";
    } else if (modalType === "userManagement") {
        document.getElementById("userManagementModal").style.display = "none";
    } else if (modalType === "systemConfig") {
        document.getElementById("systemConfigModal").style.display = "none";
    } else if (modalType === "activityLog") {
        document.getElementById("activityLogModal").style.display = "none";
    } else if (modalType === "promotion") {
        document.getElementById("promotionModal1").style.display = "none";
    }
}
// Sự kiện nhấn nút "Xem chi tiết"
document.querySelectorAll(".button-invoice-detail").forEach(button => {
    button.addEventListener("click", () => {
        const invoiceData = {
            customerName: "Ngô Tiến Phát",
            customerAddress: "123 Đường ABC",
            customerPhone: "0987654321",
            customerDateSell: "12/11/2023",
            products: [
                { name: "Đào Tiên Úc", quantity: 5, unitPrice: "90,000", totalPrice: "450,000" },
                { name: "Dâu Nghệ Nhân", quantity: 3, unitPrice: "72,000", totalPrice: "213,000" }
            ],
            totalAmount: "663,000"
        };
        openModal(invoiceData, "invoice");
    });
});

document.getElementById('customer-list').addEventListener('click', (event) => {
    if (event.target && event.target.classList.contains('button-product-detail')) {
        const customerData = {
            customerName: "Ngô Tiến Phát",
            customerAddress: "123 Đường ABC",
            customerPhone: "0987654321",
            customerDateSell: "12/11/2023",
            products: [
                { name: "Đào Tiên Úc", quantity: 5, unitPrice: "90,000", totalPrice: "450,000" },
                { name: "Dâu Nghệ Nhân", quantity: 3, unitPrice: "72,000", totalPrice: "213,000" }
            ],
            totalAmount: "663,000"
        };
        openModal(customerData, "invoice");
    }
});

document.getElementById('orderList').addEventListener('click', (event) => {
    if (event.target && event.target.classList.contains('button-product-order')) {
        const productDetailData = {
            customerID: "VIP001",
            customerName1: "Nguyễn Phương Mai",
            totalSpent: "45,500,000",
            registrationDate: "2020-06-10",
            products: [
                { name: "Nho Mẫu Đơn", quantity: 10, unitPrice: "89,000", totalPrice: "890,000" }
            ],
            grandTotal: "46,390,000"
        };
        openModal(productDetailData, "productDetail");
    }
});

document.querySelectorAll(".button-product-description").forEach(button => {
    button.addEventListener("click", () => {
        const productDetailData = {
            name: "Vú Sữa",
            code: "VS",
            price: "121,000",
            category: "Trái Cây Việt Nam",
            origin: "Tiền Giang, Việt Nam",
            description: "Vú sữa là loại trái cây nổi tiếng của miền Tây, Việt Nam.",
            image: "./img/traicayvietnam/vusua.jpg"
        };
        openModal(productDetailData, "productDescription");
    });
});

document.querySelectorAll(".button-new-invoice-detail").forEach(button => {
    button.addEventListener("click", () => {
        const invoiceData = {
            customerID: "KH56789",
            customerName: "Lê Văn B",
            customerAddress: "789 Đường DEF",
            customerPhone: "0901234567",
            customerDateSell: "19/11/2023",
            products: [
                { name: "Bưởi Da Xanh", quantity: 3, unitPrice: "150,000", totalPrice: "450,000" },
                { name: "Cam Sành", quantity: 5, unitPrice: "100,000", totalPrice: "500,000" }
            ],
            totalAmount: "950,000"
        };
        openModal(invoiceData, "newInvoice");
    });
});
// Sự kiện nhấn nút "Quản lý người dùng"
document.querySelectorAll(".button-user-management").forEach(button => {
    button.addEventListener("click", () => {
        // Lấy dữ liệu từ localStorage (hoặc backend API)
        let userManagementData = JSON.parse(localStorage.getItem("userManagementData")) || [];

        // Nếu chưa có dữ liệu, hiển thị thông báo "Chưa có tài khoản nào"
        if (userManagementData.length === 0) {
            userManagementData = []; // Khởi tạo mảng rỗng
        }

        // Mở modal với dữ liệu thực tế
        openModal(userManagementData, "userManagement");
    });
});
// Sự kiện nút cấu hình hệ thống
document.querySelectorAll(".button-system-config").forEach(button => {
    button.addEventListener("click", () => {
        // Lấy dữ liệu cấu hình từ localStorage hoặc tạo mặc định
        const systemConfigData = JSON.parse(localStorage.getItem("systemConfig")) || {
            systemName: "Quản Lý Hệ Thống",
            adminEmail: "admin@system.com",
            language: "vi",
            timeZone: "UTC+7",
            maintenanceMode: "off",
            maxUsers: 100
        };

        // Gọi hàm mở modal và điền dữ liệu
        openModal(systemConfigData, "systemConfig");
    });
});
// Sự kiện nút nhật ký hoạt động
document.querySelectorAll(".button-activity-log").forEach(button => {
    button.addEventListener("click", () => {
        const activityLogData = {
            logs: [
                { time: "2023-11-22 10:30", user: "admin", action: "Đăng nhập", result: "Thành công", note: "" },
                { time: "2023-11-22 11:00", user: "staff1", action: "Xóa sản phẩm", result: "Thành công", note: "Đã xóa sản phẩm ID: 123" },
                { time: "2023-11-22 12:00", user: "admin", action: "Cập nhật cấu hình", result: "Thành công", note: "Đổi ngôn ngữ sang Tiếng Anh" },
            ],
        };
        openModal(activityLogData, "activityLog");
    });
});
// Sự kiện nhấn nút "Thêm Khuyến Mãi"
document.querySelectorAll(".button-add-promotion").forEach(button => {
    button.addEventListener("click", () => {
        openModal(null, "promotion"); // Mở modal thêm khuyến mãi
    });
});
// Xử lý khi nhấn "Lưu" trong form thêm khuyến mãi
document.getElementById("promotionForm").addEventListener("submit", function (e) {
    e.preventDefault(); // Ngăn chặn hành vi submit mặc định

    // Lấy dữ liệu từ form
    const promotionName = document.getElementById("promotionName").value;
    const promotionStartDate = document.getElementById("startDate").value;
    const promotionEndDate = document.getElementById("endDate").value;
    const promotionDiscount = document.getElementById("discount").value;

    // Kiểm tra dữ liệu
    if (!promotionName || !promotionStartDate || !promotionEndDate || !promotionDiscount) {
        alert("Vui lòng nhập đầy đủ thông tin!");
        return;
    }

    // Thêm khuyến mãi vào bảng
    const promotionTable = document.querySelector(".promotion-table tbody");
    const newRow = document.createElement("tr");
    newRow.innerHTML = `
        <td>${promotionName}</td>
        <td style="text-align: center">${promotionStartDate} - ${promotionEndDate}</td>
        <td>${promotionDiscount}%</td>
        <td>
            <button class="edit-btn" onclick="openModal({promoTitle: '', promoDiscount: 0, promoStart: '', promoEnd: ''}, 'editPromotion')">Sửa</button>
            <button class="delete-btn" onclick="openModal({promoTitle: ''}, 'deletePromotion')">Xóa</button>
        </td>
    `;

    promotionTable.appendChild(newRow); // Thêm dòng mới vào bảng

    // Đặt lại form và đóng modal
    document.getElementById("promotionForm").reset();
    closeModal("promotion");

    // Thông báo thành công
    alert("Khuyến mãi đã được thêm thành công!");
});
// ----------------------------suppliers---------------------------
function viewDetails(transactionId) {
    alert(`Chi tiết giao dịch ${transactionId}`);
}
document.addEventListener("DOMContentLoaded", () => {
    const modal = document.createElement("div");
    modal.id = "detailModal";
    modal.style.display = "none"; // Ẩn modal ban đầu
    modal.innerHTML = `
        <div class="modal-content">
            <span class="close-btn">&times;</span>
            <h2>Chi tiết nhà cung cấp</h2>
            <div id="modal-body"></div>
        </div>
    `;
    document.body.appendChild(modal);

    const closeModal = () => {
        modal.style.display = "none";
        document.body.style.overflow = "auto";
    };

    // Gắn sự kiện cho nút "X" trong modal chi tiết
    modal.querySelector(".close-btn").addEventListener("click", closeModal);

    // Đóng modal khi nhấn bên ngoài nội dung
    modal.addEventListener("click", (e) => {
        if (e.target === modal) {
            closeModal();
        }
    });

    // Gắn sự kiện hiển thị modal cho các nút "view"
    document.querySelectorAll(".action-btn.view").forEach((button) => {
        button.addEventListener("click", () => {
            const row = button.closest("tr");
            const supplierId = row.children[0].textContent;
            const supplierName = row.children[1].textContent;
            const rating = row.children[2].textContent;
            const priority = row.children[3].textContent;
            const totalErrors = row.children[4].textContent;
            const responseTime = row.children[5].textContent;

            const modalBody = document.querySelector("#modal-body");
            modalBody.innerHTML = `
                <p><strong>Mã nhà cung cấp:</strong> ${supplierId}</p>
                <p><strong>Tên nhà cung cấp:</strong> ${supplierName}</p>
                <p><strong>Điểm đánh giá:</strong> ${rating}</p>
                <p><strong>Hạng ưu tiên:</strong> ${priority}</p>
                <p><strong>Tổng số lỗi:</strong> ${totalErrors}</p>
                <p><strong>Thời gian phản hồi:</strong> ${responseTime}</p>
            `;

            modal.style.display = "block";
            document.body.style.overflow = "hidden"; // Tắt cuộn trang
        });
    });
});

document.addEventListener("DOMContentLoaded", () => {
    const editModal = document.getElementById("editModal");
    const editForm = document.getElementById("editForm");
    const closeModalBtn = document.querySelector("#editModal .close-btn");
    let currentRow = null; // Biến lưu hàng hiện tại được chỉnh sửa
    // Hàm hiển thị thông báo thành công
    const showSuccessToast = (message) => {
        const toast = document.createElement("div");
        toast.className = "toast-success";
        toast.textContent = message;

        // Thêm thông báo vào trang
        document.body.appendChild(toast);

        // Tự động ẩn thông báo sau 3 giây
        setTimeout(() => {
            toast.style.opacity = "0"; // Hiệu ứng mờ dần
            setTimeout(() => {
                toast.remove(); // Xóa khỏi DOM
            }, 500); // Đợi hiệu ứng mờ hoàn tất
        }, 3000);
    };
    // Mở modal chỉnh sửa
    document.querySelectorAll(".action-btn.edit").forEach((button) => {
        button.addEventListener("click", () => {
            editModal.style.display = "flex";
            document.body.style.overflow = "hidden";

            // Lấy dữ liệu từ hàng
            currentRow = button.closest("tr");
            const supplierName = currentRow.children[1].textContent;
            const rating = currentRow.children[2].textContent.split(" ")[0]; // Lấy điểm đánh giá
            const priority = currentRow.children[3].textContent;
            const errors = currentRow.children[4].textContent;
            const responseTime = currentRow.children[5].textContent;

            // Điền dữ liệu vào form
            editForm.supplierName.value = supplierName;
            editForm.rating.value = rating;
            editForm.priority.value = priority;
            editForm.errors.value = errors;
            editForm.responseTime.value = responseTime;
        });
    });

    // Lưu thay đổi
    editForm.addEventListener("submit", (e) => {
        e.preventDefault(); // Ngăn chặn reload trang

        // Lấy giá trị từ form
        const updatedName = editForm.supplierName.value;
        const updatedRating = editForm.rating.value;
        const updatedPriority = editForm.priority.value;
        const updatedErrors = editForm.errors.value;
        const updatedResponseTime = editForm.responseTime.value;

        // Cập nhật hàng hiện tại
        currentRow.children[1].textContent = updatedName;
        currentRow.children[2].innerHTML = `<span class="rating">${updatedRating}</span> ⭐`;
        currentRow.children[3].textContent = updatedPriority;
        currentRow.children[4].textContent = updatedErrors;
        currentRow.children[5].textContent = updatedResponseTime;

        // Đóng modal
        editModal.style.display = "none";
        document.body.style.overflow = "auto";
        alert("Thông tin đã được cập nhật!");
    });

    // Đóng modal
    closeModalBtn.addEventListener("click", () => {
        editModal.style.display = "none";
        document.body.style.overflow = "auto";
    });

    // Đóng modal khi nhấn bên ngoài nội dung
    editModal.addEventListener("click", (e) => {
        if (e.target === editModal) {
            editModal.style.display = "none";
            document.body.style.overflow = "auto";
        }
    });
});
//-------------------------------------------------
document.addEventListener("DOMContentLoaded", () => {
    // Modal 1
    const addModal1 = document.getElementById("addModal1");
    const addForm1 = document.getElementById("addForm1");
    const closeAddModal1 = document.getElementById("closeAddModal1");
    const addButton1 = document.getElementById("addButton1");
    const productTable1 = document.querySelector(".table-reponsive1 table tbody");

    // Hiển thị modal 1
    addButton1.addEventListener("click", () => {
        addModal1.style.display = "flex";
    });

    // Đóng modal 1
    closeAddModal1.addEventListener("click", () => {
        addModal1.style.display = "none";
        addForm1.reset();
    });

    // Đóng modal khi nhấn bên ngoài modal
    window.addEventListener("click", (event) => {
        if (event.target === addModal1) {
            addModal1.style.display = "none";
            addForm1.reset();
        }
    });

    // Thêm sản phẩm vào bảng trong modal 1
    addForm1.addEventListener("submit", (e) => {
        e.preventDefault(); // Ngăn reload trang

        const name = addForm1.productName.value.trim();
        const code = addForm1.productCode.value.trim();
        const type = addForm1.productType.value.trim();
        const origin = addForm1.productOrigin.value.trim();
        const status = addForm1.productStatus.value;

        const newRow = document.createElement("tr");
        newRow.innerHTML = `
            <td>${name}</td>
            <td>${code}</td>
            <td>${type}</td>
            <td>${origin}</td>
            <td>
                <button class="button-description">Xem chi tiết</button>
            </td>
            <td>
                <span class="status ${status === "Còn Hàng" ? "blue" : "red"}"></span>
                ${status}
            </td>
            <td>
                <button class="button-delete">Xóa</button>
            </td>
        `;

        productTable1.appendChild(newRow);

        // Thêm sự kiện "Xóa"
        const deleteButton = newRow.querySelector(".button-delete");
        deleteButton.addEventListener("click", () => {
            newRow.remove();
            alert("Sản phẩm đã được xóa!");
        });

        // Reset và đóng modal
        addModal1.style.display = "none";
        addForm1.reset();
    });

    // Xóa sản phẩm đã tồn tại
    document.querySelectorAll(".button-delete").forEach((button) => {
        button.addEventListener("click", (event) => {
            const row = event.target.closest("tr");
            row.remove();
            alert("Sản phẩm đã được xóa!");
        });
    });

    // Modal 2
    const addModal2 = document.getElementById("addModal");
    const addForm2 = document.getElementById("addForm");
    const closeAddModal2 = document.getElementById("closeAddModal");
    const addButton2 = document.getElementById("addButton");
    const productTable2 = document.querySelector(".table-reponsive table tbody");

    addButton2.addEventListener("click", () => {
        addModal2.style.display = "flex";
    });

    closeAddModal2.addEventListener("click", () => {
        addModal2.style.display = "none";
        addForm2.reset();
    });

    window.addEventListener("click", (event) => {
        if (event.target === addModal2) {
            addModal2.style.display = "none";
            addForm2.reset();
        }
    });

    addForm2.addEventListener("submit", (e) => {
        e.preventDefault();

        const name = addForm2.productName.value.trim();
        const code = addForm2.productCode.value.trim();
        const type = addForm2.productType.value.trim();
        const origin = addForm2.productOrigin.value.trim();
        const status = addForm2.productStatus.value;

        const newRow = document.createElement("tr");
        newRow.innerHTML = `
            <td>${name}</td>
            <td>${code}</td>
            <td>${type}</td>
            <td>${origin}</td>
            <td>
                <button class="button-description">Xem chi tiết</button>
            </td>
            <td>
                <span class="status ${status === "Còn Hàng" ? "blue" : "red"}"></span>
                ${status}
            </td>
            <td>
                <button class="button-delete">Xóa</button>
            </td>
        `;

        productTable2.appendChild(newRow);

        const deleteButton = newRow.querySelector(".button-delete");
        deleteButton.addEventListener("click", () => {
            newRow.remove();
            alert("Sản phẩm đã được xóa!");
        });

        addModal2.style.display = "none";
        addForm2.reset();
    });

    document.querySelectorAll(".button-delete").forEach((button) => {
        button.addEventListener("click", (event) => {
            const row = event.target.closest("tr");
            row.remove();
            alert("Sản phẩm đã được xóa!");
        });
    });
});
// Thông báo 
document.addEventListener("DOMContentLoaded", () => {
    const notificationBell = document.getElementById("notificationBell");
    const notificationDropdown = document.getElementById("notificationDropdown");

    // Hiển thị / ẩn form khi click chuông
    notificationBell.addEventListener("click", (e) => {
        e.stopPropagation(); // Ngăn sự kiện click lan ra ngoài
        const isDropdownVisible = notificationDropdown.style.display === "block";
        notificationDropdown.style.display = isDropdownVisible ? "none" : "block";
    });

    // Ẩn form khi click ra ngoài
    document.addEventListener("click", (e) => {
        if (notificationDropdown.style.display === "block") {
            notificationDropdown.style.display = "none";
        }
    });

    // Ngăn click vào bên trong form không đóng form
    notificationDropdown.addEventListener("click", (e) => {
        e.stopPropagation();
    });
    window.addEventListener("scroll", () => {
        notificationDropdown.style.display = "none";
    });
});
// Dữ liệu khách hàng (mô phỏng)
const customers = [
    { id: 'VIP001', name: 'Nguyễn Phương Mai', email: 'phuongmai@gmail.com', phone: '0901234567', address: '15 Nguyễn Trãi, TP.HCM', registerDate: '2020-06-10' },
    { id: 'VIP002', name: 'Trần Quang Huy', email: 'quanghuy88@gmail.com', phone: '0912345678', address: '40 Lý Thường Kiệt, Hà Nội', registerDate: '2021-03-05' },
    { id: 'VIP003', name: 'Lê Thanh Tú', email: 'thanhtu95@gmail.com', phone: '0987654321', address: '12 Phan Đình Phùng, Đà Nẵng', registerDate: '2019-11-25' },
    { id: 'VIP004', name: 'Vũ Minh Tuấn', email: 'minhtuan85@gmail.com', phone: '0978765432', address: '68 Nguyễn Văn Cừ, Hà Nội', registerDate: '2022-01-20' },
    { id: 'VIP005', name: 'Phan Thị Thảo', email: 'phanthithao@gmail.com', phone: '0908765432', address: '100 Hoàng Quốc Việt, TP.HCM', registerDate: '2020-07-30' },
    { id: 'VIP006', name: 'Nguyễn Quang Hảo', email: 'quanghao92@gmail.com', phone: '0912345679', address: '45 Lý Thường Kiệt, TP.HCM', registerDate: '2020-08-05' },
    { id: 'VIP007', name: 'Trần Minh Tuấn', email: 'minhtuan89@gmail.com', phone: '0934345678', address: '32 Nguyễn Thái Học, Hà Nội', registerDate: '2021-02-15' },
    { id: 'VIP008', name: 'Phan Thị Thu Hà', email: 'thanhtuha94@gmail.com', phone: '0917564345', address: '45 Nguyễn Trãi, Đà Nẵng', registerDate: '2021-05-12' },
    { id: 'VIP009', name: 'Nguyễn Thanh Tùng', email: 'thanhtung90@gmail.com', phone: '0971234567', address: '34 Trần Phú, TP.HCM', registerDate: '2020-11-25' },
    { id: 'VIP010', name: 'Vũ Hoàng Nam', email: 'hoangnam92@gmail.com', phone: '0909876543', address: '55 Đào Duy Anh, Hà Nội', registerDate: '2021-01-12' },
    { id: 'VIP011', name: 'Nguyễn Thanh Hương', email: 'thanhuong93@gmail.com', phone: '0976789123', address: '20 Bạch Đằng, TP.HCM', registerDate: '2021-06-18' },
    { id: 'VIP012', name: 'Trần Đức Anh', email: 'ducanh90@gmail.com', phone: '0986123456', address: '12 Trần Phú, Hà Nội', registerDate: '2020-12-25' },
    { id: 'VIP013', name: 'Phạm Minh Quang', email: 'minhquang88@gmail.com', phone: '0912345670', address: '80 Nguyễn Trãi, TP.HCM', registerDate: '2021-02-08' },
    { id: 'VIP014', name: 'Võ Minh Tâm', email: 'minhtam95@gmail.com', phone: '0902345678', address: '15 Lê Lợi, TP.HCM', registerDate: '2020-08-19' },
    { id: 'VIP015', name: 'Lê Hồng Sơn', email: 'hongson96@gmail.com', phone: '0974321567', address: '28 Trần Hưng Đạo, Hà Nội', registerDate: '2021-09-14' },
];
const orders = [
    { orderId: '#ORD001', customerName: 'Nguyễn Minh Khoa', address: '123 Đường ABC, TP.HCM', date: '12/11/2023', paymentMethod: 'Chuyển khoản', status: 'Chờ xử lý' },
    { orderId: '#ORD002', customerName: 'Trần Thị Lan Anh', address: '456 Đường XYZ, Hà Nội', date: '10/11/2023', paymentMethod: 'Tiền mặt', status: 'Chờ xử lý' },
    { orderId: '#ORD003', customerName: 'Ngô Văn Dũng', address: '789 Đường MNO, Đà Nẵng', date: '09/11/2023', paymentMethod: 'Ví điện tử', status: 'Đã thanh toán' },
    { orderId: '#ORD004', customerName: 'Lê Thị Bích Ngọc', address: '101 Đường PQR, Cần Thơ', date: '05/11/2023', paymentMethod: 'Chuyển khoản', status: 'Đang giao hàng' },
    { orderId: '#ORD005', customerName: 'Hoàng Văn Sơn', address: '202 Đường STU, Hải Phòng', date: '03/11/2023', paymentMethod: 'Tiền mặt', status: 'Đang giao hàng' },
    { orderId: '#ORD006', customerName: 'Phạm Văn Bình', address: '303 Đường VWX, TP.HCM', date: '02/11/2023', paymentMethod: 'Ví điện tử', status: 'Đã thanh toán' },
    { orderId: '#ORD007', customerName: 'Phạm Văn Toàn', address: '404 Đường YZ, Đà Nẵng', date: '02/11/2023', paymentMethod: 'Chuyển khoản', status: 'Đã thanh toán' },
    { orderId: '#ORD008', customerName: 'Phạm Văn Huy', address: '505 Đường ABC, Hà Nội', date: '02/11/2023', paymentMethod: 'Tiền mặt', status: 'Đã hủy' },
    { orderId: '#ORD009', customerName: 'Bùi Lệ Huyên', address: '606 Đường DEF, TP.HCM', date: '02/11/2023', paymentMethod: 'Ví điện tử', status: 'Đã thanh toán' },
    { orderId: '#ORD010', customerName: 'Phạm Văn Bình', address: '707 Đường GHI, Cần Thơ', date: '02/11/2023', paymentMethod: 'Chuyển khoản', status: 'Đã hủy' },
    // Thêm nhiều đơn hàng nếu cần
];

const customersPerPage = 7;  // Số khách hàng hiển thị trên mỗi trang
const ordersPerPage = 5;
let currentPage = 1;        // Trang hiện tại

// Hàm hiển thị khách hàng theo trang
function displayCustomers(page) {
    const start = (page - 1) * customersPerPage;
    const end = start + customersPerPage;
    const customersToShow = customers.slice(start, end);
    const customerList = document.getElementById('customer-list');

    customerList.innerHTML = '';  // Xóa danh sách cũ

    customersToShow.forEach(customer => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${customer.id}</td>
            <td>${customer.name}</td>
            <td style="text-align: center">${customer.email}</td>
            <td style="text-align: center">${customer.phone}</td>
            <td style="text-align: center">${customer.address}</td>
            <td style="text-align: center">${customer.registerDate}</td>
            <td style="text-align: center">
                <button class="button-product-detail">Xem chi tiết</button>
            </td>
        `;
        customerList.appendChild(row);
    });
    
    // Cập nhật các nút trang
    updatePagination(page);
}
// Hàm hiển thị đơn hàng
function displayOrders(page) {
    const start = (page - 1) * ordersPerPage;
    const end = start + ordersPerPage;
    const ordersToShow = orders.slice(start, end);
    const orderList = document.getElementById('orderList');

    orderList.innerHTML = '';  // Xóa danh sách cũ

    ordersToShow.forEach(order => {
        const row = document.createElement('tr');
        
        row.innerHTML = `
            <td>${order.orderId}</td>
            <td>${order.customerName}</td>
            <td>${order.address}</td>
            <td>${order.date}</td>
            <td>
                <!-- Nút Xem chi tiết hóa đơn -->
                <button class="button-product-order">Xem chi tiết</button>
            </td>
            <td>${order.paymentMethod}</td>
            <td class="status">
                <div class="status-dot" style="background-color: ${getOrderStatusColor(order.status)}"></div>
                <span class="status-text">${order.status}</span>
            </td>
        `;
        
        orderList.appendChild(row);
    });
}
// Hàm lấy màu của trạng thái đơn hàng
function getOrderStatusColor(status) {
    switch (status) {
        case 'Chờ xử lý': return 'orange';
        case 'Đang giao hàng': return 'blue';
        case 'Đã thanh toán': return 'green';
        case 'Đã hủy': return 'red';
        default: return 'black';
    }
}
// Hàm sắp xếp danh sách khách hàng theo ngày đăng ký hoặc số điện thoại
function sortCustomers(criteria) {
    let sortedCustomers = [...customers]; // Sao chép danh sách khách hàng ban đầu

    if (criteria === 'date') {
        sortedCustomers.sort((a, b) => new Date(a.registerDate) - new Date(b.registerDate)); // Sắp xếp theo ngày đăng ký
    } else if (criteria === 'phone') {
        sortedCustomers.sort((a, b) => a.phone.localeCompare(b.phone)); // Sắp xếp theo số điện thoại
    }

    // Hiển thị khách hàng đã sắp xếp
    displayCustomers(sortedCustomers.slice((currentPage - 1) * customersPerPage, currentPage * customersPerPage));
}

// Hàm cập nhật các nút phân trang
function updatePagination(page) {
    const totalCustomersPages = Math.ceil(customers.length / customersPerPage);
    const totalOrdersPages = Math.ceil(orders.length / ordersPerPage);
    const totalPages = Math.max(totalCustomersPages, totalOrdersPages);
    for (let i = 1; i <= totalPages; i++) {
        const pageNum = document.getElementById(`page-${i}`);
        if (i === page) {
            pageNum.classList.add('active');
        } else {
            pageNum.classList.remove('active');
        }
    }
}

// Hàm thay đổi trang
function changePage(direction) {
    if (direction === 'prev' && currentPage > 1) {
        currentPage--;
    } else if (direction === 'next' && currentPage < Math.ceil(customers.length / customersPerPage)) {
        currentPage++;
    }
    displayCustomers(currentPage);
    displayOrders(currentPage);
}

// Hàm chuyển đến trang cụ thể
function goToPage(page) {
    currentPage = page;
    displayCustomers(currentPage);
    displayOrders(currentPage);
}

// Khởi tạo trang ban đầu
displayCustomers(currentPage);
displayOrders(currentPage);
// -------------------------------trang don hang----------------------------

