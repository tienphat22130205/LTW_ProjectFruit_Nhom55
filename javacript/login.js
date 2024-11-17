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
        const accountSection = document.querySelector(".account");
        accountSection.classList.add("logged-in");

        // Thêm avatar người dùng
        const avatarImg = document.createElement("img");
        avatarImg.src = "./img/anhdaidien.jpg"; // Đường dẫn ảnh đại diện
        avatarImg.alt = "Avatar";
        avatarImg.classList.add("avatar");
        accountSection.appendChild(avatarImg);

         // Hiển thị tên người dùng trong dropdown
         document.getElementById("userNameDisplay").textContent = userName;

         // Hiển thị dropdown khi nhấp vào avatar
         avatarImg.addEventListener("click", toggleUserMenu);
         
        alert(`Chào mừng ${userName}!`);
    } else {
        // Hiển thị thông báo lỗi nếu thông tin không đúng
        errorMessage.style.display = "block";
        document.getElementById("email").value = "";
        document.getElementById("password").value = "";
    }
}