<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Đăng Ký</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="../assets/css/register.css">
</head>

<body>
<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header text-center">
                    Đăng Ký
                </div>
                <div class="card-body">
                    <form onsubmit="register(event)">
                        <div class="mb-3">
                            <label for="username" class="form-label">Họ và Tên</label>
                            <input type="text" class="form-control" id="username" placeholder="Nhập họ và tên" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" placeholder="Nhập email" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Mật Khẩu</label>
                            <input type="password" class="form-control" id="password" placeholder="Nhập mật khẩu" required>
                        </div>
                        <div class="mb-3">
                            <label for="confirm-password" class="form-label">Xác Thực Mật Khẩu</label>
                            <input type="password" class="form-control" id="confirm-password" placeholder="Nhập lại mật khẩu"
                                   required>
                        </div>
                        <div class="form-text mb-3">
                            Trang web này được bảo vệ bởi reCAPTCHA và Google
                            <a href="https://policies.google.com/privacy">Privacy Policy</a> và
                            <a href="https://policies.google.com/terms">Terms of Service</a>.
                        </div>
                        <div class="text-center my-3">Hoặc đăng ký với</div>
                        <div class="social-buttons">
                            <button class="btn btn-social btn-facebook"><i class="fa-brands fa-facebook"></i> Facebook</button>
                            <button class="btn btn-social btn-google"><i class="fa-brands fa-google"></i> Google</button>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Đăng Ký</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="../assets/js/register.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>

</html>