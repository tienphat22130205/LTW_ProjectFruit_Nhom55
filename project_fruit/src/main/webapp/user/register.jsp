<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- ===== CSS ===== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/register.css">

    <!-- ===== BOX ICONS ===== -->
    <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>

    <title>Login form responsive</title>
</head>

<body>
<div class="l-form">
    <div class="shape1"></div>
    <div class="shape2"></div>

    <div class="form">
        <img src="${pageContext.request.contextPath}/assets/img/authentication.svg" alt="Background 1">

        <form action="" class="form__content">
            <h1 class="form__title">VitaminFruit</h1>

            <div class="form__div form__div-one">
                <div class="form__icon">
                    <i class='bx bx-user-circle'></i>
                </div>

                <div class="form__div-input">
                    <label for="" class="form__label">Tên đầy đủ</label>
                    <input type="text" class="form__input" required>
                </div>
            </div>

            <div class="form__div">
                <div class="form__icon">
                    <i class='bx bx-envelope'></i>
                </div>

                <div class="form__div-input">
                    <label for="" class="form__label">Email</label>
                    <input type="email" class="form__input" required>
                </div>
            </div>

            <div class="form__div">
                <div class="form__icon">
                    <i class='bx bx-lock'></i>
                </div>

                <div class="form__div-input">
                    <label for="" class="form__label">Mật khẩu</label>
                    <input type="password" class="form__input" required>
                </div>
            </div>

            <div class="form__div">
                <div class="form__icon">
                    <i class='bx bx-lock'></i>
                </div>

                <div class="form__div-input">
                    <label for="" class="form__label">Xác nhận mật khẩu</label>
                    <input type="password" class="form__input" required>
                </div>
            </div>

            <input type="submit" class="form__button" value="Đăng Ký">

            <div class="register">
                <p>Đã có tài khoản?</p>
                <a href="${pageContext.request.contextPath}/user/login.jsp">Đăng Nhập</a>
            </div>
            <div class="form__social">
                <span class="form__social-text">Đăng ký bằng</span>

                <a href="#" class="form__social-icon"><i class='bx bxl-facebook' ></i></a>
                <a href="#" class="form__social-icon"><i class='bx bxl-google' ></i></a>
                <a href="#" class="form__social-icon"><i class='bx bxl-instagram' ></i></a>
            </div>
        </form>
    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/formlogin.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>

</html>
