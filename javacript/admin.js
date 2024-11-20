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

document.querySelectorAll(".button-product-detail").forEach(button => {
    button.addEventListener("click", () => {
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
    });
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
        const userManagementData = [
            { username: "admin1", role: "Super Admin" },
            { username: "staff1", role: "Nhân viên" }
        ];
        openModal(userManagementData, "userManagement");
    });
});
// ----------------------------suppliers---------------------------
function viewDetails(transactionId) {
    alert(`Chi tiết giao dịch ${transactionId}`);
  }
  document.addEventListener("DOMContentLoaded", () => {
    // Tạo Modal để hiển thị chi tiết
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
  
    document.querySelector(".close-btn").addEventListener("click", closeModal);
  
    
    modal.addEventListener("click", (e) => {
      if (e.target === modal) {
        closeModal();
      }
    });
  
   
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
  

