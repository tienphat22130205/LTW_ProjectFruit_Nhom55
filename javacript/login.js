function login() {
    const email = document.getElementById("email").value;
    const password = document.getElementById("password").value;
    const errorMessage = document.getElementById("error-message");
    const loginForm = document.getElementById("loginForm");

    // Thông tin tài khoản admin
    const adminEmail = "nhom55@gmail.com";
    const adminPassword = "nhom55";

    // Lấy thông tin người dùng từ Local Storage
    const storedEmail = localStorage.getItem("userEmail");
    const storedPassword = localStorage.getItem("userPassword");
    const userName = localStorage.getItem("userName");

    if (email === adminEmail && password === adminPassword) {
        // Chuyển hướng đến trang Admin
        loginForm.style.display = "none";
        setTimeout(() => {
            window.location.href = "admin.html";
        }, 500);
    } else if (email === storedEmail && password === storedPassword) {
        // Đăng nhập người dùng thường thành công
        loginForm.style.display = "none";
        localStorage.setItem("isLoggedIn", true); // Lưu trạng thái đăng nhập

        // Hiển thị avatar và tên người dùng
        updateUserHeader(userName);

        alert(`Chào mừng ${userName}!`);
    } else {
        // Hiển thị thông báo lỗi nếu thông tin không đúng
        errorMessage.style.display = "block";
        document.getElementById("email").value = "";
        document.getElementById("password").value = "";
    }
}

function updateUserHeader(userName) {
    const accountSection = document.querySelector(".account");
    accountSection.innerHTML = `
        <img src="./img/anhdaidien.jpg" alt="Avatar" class="avatar" style="width: 30px; height: 30px; border-radius: 50%; cursor: pointer;">
        <span>${userName}</span>
    `;

    // Hiển thị menu dropdown khi nhấp vào avatar
    const avatarImg = accountSection.querySelector(".avatar");
    avatarImg.addEventListener("click", toggleUserMenu);
    document.querySelector('.account img').style.display = "block";
}

function toggleUserMenu() {
    const userMenu = document.getElementById("userMenu");
    userMenu.style.display = userMenu.style.display === "block" ? "none" : "block";
}

// Kiểm tra trạng thái đăng nhập khi tải trang
function checkLoginStatus() {
    const isLoggedIn = localStorage.getItem("isLoggedIn") === "true";
    const userName = localStorage.getItem("userName");

    if (isLoggedIn && userName) {
        updateUserHeader(userName);
    }
}

// Đăng xuất
function logout() {
    localStorage.removeItem("isLoggedIn");
    window.location.href = "index.html"; // Quay về trang chủ sau khi đăng xuất
}

// Gọi hàm kiểm tra trạng thái khi trang được tải
window.addEventListener("DOMContentLoaded", checkLoginStatus);
