document.addEventListener("DOMContentLoaded", function () {
    const cartItemsContainer = document.getElementById("cart-items");
    const cartEmptyMessage = document.getElementById("cart-empty-message");
    const totalPriceElement = document.getElementById("total-price");
    const minimumWarning = document.getElementById("minimum-warning");
    const checkoutButton = document.getElementById("checkout-button");
    const deliveryAsap = document.getElementById("delivery-asap");
    const deliverySchedule = document.getElementById("delivery-schedule");
    const asapInfo = document.getElementById("asap-info");
    const scheduleInfo = document.getElementById("schedule-info");

    // Sản phẩm mẫu để thêm vào giỏ hàng
    const sampleProduct = {
        name: "Dâu tây Đà Lạt",
        price: 150000,
        quantity: 3,
        imageUrl: "./img/dau.jpg" // Thay bằng đường dẫn ảnh thực tế
    };
    const sampleProduct1 = {
        name: "Táo Bình Thuận",
        price: 30000,
        quantity: 10,
        imageUrl: "./img/tao.jpg" // Thay bằng đường dẫn ảnh thực tế
    };

    // Hàm thêm sản phẩm vào giỏ hàng
    function addProductToCart(product) {
        // Ẩn thông báo giỏ hàng trống
        cartEmptyMessage.style.display = "none";

        // Tạo HTML cho sản phẩm
        const productElement = document.createElement("div");
        productElement.classList.add("cart-item");
        productElement.innerHTML = `
            <div class="product-image">
                <img src="${product.imageUrl}" alt="${product.name}">
            </div>
            <div class="product-info">
                <h4>${product.name}</h4>
                <p>${product.price.toLocaleString()}₫</p>
                <div class="quantity-controls">
                    <button class="decrease">-</button>
                    <span class="quantity">${product.quantity}</span>
                    <button class="increase">+</button>
                </div>
                <p><strong>Tổng:</strong> ${(product.price * product.quantity).toLocaleString()}₫</p>
            </div>
            <button class="remove-item">Xóa</button>
        `;

        // Thêm sản phẩm vào container
        cartItemsContainer.appendChild(productElement);

        // Cập nhật tổng tiền và trạng thái thanh toán
        updateTotalPrice();
    }

    // Hàm cập nhật tổng tiền
    function updateTotalPrice() {
        const items = cartItemsContainer.getElementsByClassName("cart-item");
        let total = 0;
        Array.from(items).forEach(item => {
            const price = parseInt(item.querySelector(".product-info p").textContent.replace("₫", "").replace(",", ""));
            const quantity = parseInt(item.querySelector(".quantity").textContent);
            total += price * quantity;
        });

        totalPriceElement.textContent = total.toLocaleString() + "₫";

        // Kiểm tra điều kiện tối thiểu để thanh toán
        if (total >= 100000) {
            minimumWarning.style.display = "none";
            checkoutButton.disabled = false;
            checkoutButton.classList.add("enabled");
        } else {
            minimumWarning.style.display = "block";
            checkoutButton.disabled = true;
            checkoutButton.classList.remove("enabled");
        }
    }

    // Hàm ẩn/hiện form chọn thời gian khi thay đổi lựa chọn giao hàng
    function toggleDeliveryOptions() {
        if (deliveryAsap.checked) {
            asapInfo.style.display = "block";
            scheduleInfo.style.display = "none";
        } else if (deliverySchedule.checked) {
            asapInfo.style.display = "none";
            scheduleInfo.style.display = "block";
        }
    }

    // Gán sự kiện thay đổi cho radio button giao hàng
    deliveryAsap.addEventListener("change", toggleDeliveryOptions);
    deliverySchedule.addEventListener("change", toggleDeliveryOptions);

    // Gọi hàm để thêm sản phẩm mẫu vào giỏ hàng
    addProductToCart(sampleProduct);
    addProductToCart(sampleProduct1)
});

// product
  // su kien trang web
  function closeAllForms() {
    document.getElementById("loginForm").style.display = "none";
    // document.getElementById("cartForm").style.display = "none";
    document.getElementById("branchSelection").style.display = "none";
  }
  
  function setPositionRelativeToButton(form, button) {
    const buttonRect = button.getBoundingClientRect();
    const offset = 20; // Khoảng cách cụ thể giữa nút và form (20px)
    form.style.position = "fixed"; // Đặt form ở vị trí cố định trên màn hình
    form.style.top = `${buttonRect.bottom + offset}px`; // Đặt form bên dưới nút và cách 20px
    form.style.left = `${buttonRect.right - form.offsetWidth - 280}px`; // Căn chỉnh viền phải của form với viền phải của nút
  }
  
  function toggleLoginForm() {
    closeAllForms();
    const loginForm = document.getElementById("loginForm");
    const button = document.querySelector(".account");
    setPositionRelativeToButton(loginForm, button);
    loginForm.style.display = loginForm.style.display === "none" || loginForm.style.display === "" ? "block" : "none";
  }
  
  function toggleBranchForm() {
    closeAllForms();
    const branchForm = document.getElementById("branchSelection");
    const button = document.querySelector(".delivery");
    setPositionRelativeToButton(branchForm, button);
    branchForm.style.display = branchForm.style.display === "none" || branchForm.style.display === "" ? "block" : "none";
  }
  
  document.querySelector(".account").addEventListener("click", toggleLoginForm);
//   document.querySelector(".cart").addEventListener("click", toggleCartForm);
  document.querySelector(".delivery").addEventListener("click", toggleBranchForm);
  
  window.onclick = function (event) {
    if (!event.target.closest('.login-form') &&
      !event.target.closest('.branch-selection') &&
      !event.target.closest('.account') && !event.target.closest('.cart') &&
      !event.target.closest('.delivery')) {
      closeAllForms();
    }
  };
  
  // Đóng form khi người dùng cuộn trang
  window.addEventListener("scroll", function () {
    closeAllForms();
  });
  

  // Hàm để đặt mục được nhấn là active
  function setActive(element) {
    // Loại bỏ lớp "active" khỏi tất cả các mục menu
    document.querySelectorAll(".menu-bar li").forEach(item => {
      item.classList.remove("active");
    });
  
    // Thêm lớp "active" vào mục cha <li> của phần tử <a> được nhấn
    element.closest("li").classList.add("active");
  }
  

  // cap nhat menu ben trai
  function closeSidebarMenu() {
    const sidebarMenu = document.getElementById("sidebarMenu");
    const menuIcon = document.getElementById("menuIcon");
    if (sidebarMenu && sidebarMenu.classList.contains("active")) {
      sidebarMenu.classList.remove("active"); // Đóng menu
      if (menuIcon) {
        menuIcon.classList.remove("fa-x");
        menuIcon.classList.add("fa-bars");
      }
    }
  }
  
  // Hàm mở/đóng menu sidebar và thay đổi icon
  function toggleSidebarMenu() {
    const sidebarMenu = document.getElementById("sidebarMenu");
    const menuIcon = document.getElementById("menuIcon");
  
    // Kiểm tra trạng thái của sidebar menu
    if (sidebarMenu.classList.contains("active")) {
      // Nếu menu đang mở, đóng menu và đổi icon về "fa-bars"
      closeSidebarMenu();
    } else {
      // Nếu menu đang đóng, mở menu và đổi icon thành "fa-x"
      sidebarMenu.classList.add("active");
      menuIcon.classList.remove("fa-bars");
      menuIcon.classList.add("fa-x");
    }
  }
  
  // Đóng menu khi nhấp ra ngoài
  window.addEventListener("click", function(event) {
    const sidebarMenu = document.getElementById("sidebarMenu");
    const isClickInsideMenu = event.target.closest("#sidebarMenu");
    const isClickMenuToggle = event.target.closest("#menuToggle");
  
    // Kiểm tra nếu người dùng nhấp ra ngoài menu và không nhấn vào menuToggle
    if (!isClickInsideMenu && !isClickMenuToggle && sidebarMenu.classList.contains("active")) {
      closeSidebarMenu();
    }
  });
  
  
  
  
  // cuộn màn hình xuống thì ẩn menu lướt lên thì hiện menu
  let lastScrollTop = 0;
  
  window.addEventListener("scroll", function () {
    const currentScroll = window.pageYOffset || document.documentElement.scrollTop;
    
    if (currentScroll > lastScrollTop) {
      // Cuộn xuống
      document.body.classList.remove("scrolled-up");
      document.body.classList.add("scrolled-down");
    } else {
      // Cuộn lên
      document.body.classList.remove("scrolled-down");
      document.body.classList.add("scrolled-up");
    }
    
    lastScrollTop = currentScroll <= 0 ? 0 : currentScroll; // Đảm bảo giá trị không bị âm
  });
  
  
  
  
  
  
  
  
  
  
  
