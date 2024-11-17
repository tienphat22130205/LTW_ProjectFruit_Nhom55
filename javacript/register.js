function register(event) {
  event.preventDefault();
  const username = document.getElementById("username").value;
  const email = document.getElementById("email").value;
  const password = document.getElementById("password").value;
  const confirmPassword = document.getElementById("confirm-password").value;

  if (password !== confirmPassword) {
      alert("Mật khẩu không khớp!");
      return;
  }

  // Lưu thông tin người dùng vào Local Storage
  localStorage.setItem("userName", username);
  localStorage.setItem("userEmail", email);
  localStorage.setItem("userPassword", password);

  alert("Đăng ký thành công!");
  window.location.href = "index.html"; // Chuyển hướng về trang chủ sau khi đăng ký thành công
}