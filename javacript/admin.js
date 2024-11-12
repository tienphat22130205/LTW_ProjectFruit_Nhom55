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



