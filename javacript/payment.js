function switchTab(tabId) {
    // Xóa trạng thái "active" khỏi tất cả nội dung và tab
    document.querySelectorAll(".tab-content").forEach(tab => {
        tab.classList.remove("active");
    });
    document.querySelectorAll(".tab-navigation .tab").forEach(tab => {
        tab.classList.remove("active");
    });

    // Hiển thị nội dung tab được chọn và đặt tab đó là "active"
    document.getElementById(tabId).classList.add("active");
    document.querySelector(`.tab-navigation .tab[onclick="switchTab('${tabId}')"]`).classList.add("active");
}

function validateInfoTab() {
    const name = document.getElementById("name").value.trim();
    const email = document.getElementById("email").value.trim();
    const phone = document.getElementById("phone").value.trim();
    const deliveryMethod = document.querySelector(".delivery-method .method-option.active").textContent.trim();
    const storeBranch = document.getElementById("storeBranch") ? document.getElementById("storeBranch").value.trim() : "";
    const province = document.getElementById("province") ? document.getElementById("province").value.trim() : "";
    const district = document.getElementById("district") ? document.getElementById("district").value.trim() : "";
    const ward = document.getElementById("ward") ? document.getElementById("ward").value.trim() : "";
    const address = document.getElementById("address") ? document.getElementById("address").value.trim() : "";

    if (!name) {
        alert("Vui lòng nhập họ và tên.");
        return false;
    }

    if (!email || !/\S+@\S+\.\S+/.test(email)) {
        alert("Vui lòng nhập email hợp lệ.");
        return false;
    }

    if (!phone || !/^\d{10,11}$/.test(phone)) {
        alert("Vui lòng nhập số điện thoại hợp lệ.");
        return false;
    }

    if (deliveryMethod === "Nhận tại cửa hàng" && !storeBranch) {
        alert("Vui lòng chọn chi nhánh.");
        return false;
    }

    if (deliveryMethod === "Giao hàng tận nơi") {
        if (!province || !district || !ward || !address) {
            alert("Vui lòng điền đầy đủ thông tin giao hàng.");
            return false;
        }
    }

    return true;
}

function nextTab() {
    // Kiểm tra điều kiện của tab "Thông tin" trước khi chuyển qua tab "Thanh toán"
    if (validateInfoTab()) {
        switchTab("paymentTab");
    }
}

function goBack() {
    switchTab("infoTab"); // Quay lại tab "Thông tin"
}

function selectMethod(element, contentId) {
    // Loại bỏ trạng thái "active" khỏi tất cả phương thức
    const options = document.querySelectorAll(".method-option");
    options.forEach(option => option.classList.remove("active"));

    // Đặt trạng thái "active" cho phương thức được chọn
    element.classList.add("active");

    // Ẩn tất cả nội dung
    const contents = document.querySelectorAll(".method-content");
    contents.forEach(content => content.classList.remove("active-content"));

    // Hiển thị nội dung liên quan đến phương thức được chọn
    document.getElementById(contentId).classList.add("active-content");
}
function switchTab(tabId) {
    // Loại bỏ trạng thái "active" khỏi tất cả các tab
    document.querySelectorAll(".tab-navigation .tab").forEach(tab => {
        tab.classList.remove("active");
    });

    // Đặt trạng thái "active" cho tab được chọn
    document.querySelector(`.tab-navigation .tab[onclick="switchTab('${tabId}')"]`).classList.add("active");

    // Hiển thị nội dung của tab được chọn
    document.querySelectorAll(".tab-content").forEach(content => {
        content.classList.remove("active");
    });
    document.getElementById(tabId).classList.add("active");
}

