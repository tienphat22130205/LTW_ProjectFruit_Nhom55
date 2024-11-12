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
document.querySelector("#nav-toggle").addEventListener("change", function() {
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
                    callback: function(value) {
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
                    callback: function(value) {
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
                    callback: function(value) {
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
                    callback: function(value) {
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






