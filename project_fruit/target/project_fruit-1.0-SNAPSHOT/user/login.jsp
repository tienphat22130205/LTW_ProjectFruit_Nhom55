<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- ===== CSS ===== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css">

    <!-- ===== BOX ICONS ===== -->
    <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>

    <title>Login - VitaminFruit</title>
</head>
<body>
<%--<form method="post" action="login">--%>
<div class="l-form">
    <div class="shape1"></div>
    <div class="shape2"></div>

    <div class="form">
        <img src="${pageContext.request.contextPath}/assets/img/authentication.svg" alt="Background 1">

        <form action="${pageContext.request.contextPath}/login" method="POST" class="form__content">
            <h1 class="form__title">VitaminFruit</h1>
            <div class="form__div form__div-one">
                <div class="form__icon">
                    <i class='bx bx-user-circle'></i>
                </div>

                <div class="form__div-input">
                    <label for="" class="form__label">Email</label>
                    <!-- Giữ lại email nếu đăng nhập sai -->
                    <input type="text" id="useremail" name="useremail" class="form__input"
                           value="${param.useremail != null ? param.useremail : ''}" required>
                </div>
            </div>

            <div class="form__div">
                <div class="form__icon">
                    <i class='bx bx-lock' ></i>
                </div>

                <div class="form__div-input">
                    <label for="" class="form__label">Mật khẩu</label>
                    <!-- Mật khẩu không được giữ lại khi đăng nhập sai -->
                    <input type="password" id="pass" name="pass" class="form__input" required>
                </div>
            </div>

            <!-- Thông báo lỗi đăng nhập -->
            <c:if test="${not empty errorMessage}">
                <p style="color: red; text-align: center;">${errorMessage}</p>
            </c:if>

            <a href="${pageContext.request.contextPath}/user/forgotPassword.jsp" class="form__forgot">Quên mật khẩu ?</a>

            <input type="submit" class="form__button" value="Đăng nhập">

            <div class="register">
                <p>Chưa có tài khoản?</p>
                <a href="${pageContext.request.contextPath}/user/register.jsp">Đăng Kí</a>
            </div>
            <div class="form__social">
                <span class="form__social-text">Đăng nhập bằng</span>

                <a href="#" class="form__social-icon"><i class='bx bxl-facebook' ></i></a>
                <a href="#" class="form__social-icon"><i class='bx bxl-google' ></i></a>
                <a href="#" class="form__social-icon"><i class='bx bxl-instagram' ></i></a>
            </div>
        </form>
    </div>

</div>
<%--</form>--%>

<!-- ===== MAIN JS ===== -->
<script src="${pageContext.request.contextPath}/assets/js/formlogin.js"></script>
</body>
</html>
