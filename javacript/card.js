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

  // Các sản phẩm mẫu
  const sampleProducts = [
      {
          name: "Dâu tây Đà Lạt",
          price: 161000,
          quantity: 3,
          imageUrl: "./img/traicaynhapkhau/dautaygiongmy.png"
      },
      {
          name: "Hộp quà Nguyên Cát 03",
          price: 2240000,
          quantity: 1,
          imageUrl: "./img/hqnc3.png"
      }
  ];

  // Thêm sản phẩm mẫu vào giỏ hàng
  sampleProducts.forEach(addProductToCart);

  function addProductToCart(product) {
      cartEmptyMessage.style.display = "none";

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
              <p><strong>Tổng:</strong> <span class="item-total">${(product.price * product.quantity).toLocaleString()}₫</span></p>
          </div>
          <button class="remove-item">Xóa</button>
      `;

      cartItemsContainer.appendChild(productElement);

      // Thêm sự kiện cho nút tăng/giảm số lượng
      const decreaseButton = productElement.querySelector(".decrease");
      const increaseButton = productElement.querySelector(".increase");
      const quantityElement = productElement.querySelector(".quantity");
      const itemTotalElement = productElement.querySelector(".item-total");

      decreaseButton.addEventListener("click", () => updateQuantity(product, quantityElement, itemTotalElement, -1));
      increaseButton.addEventListener("click", () => updateQuantity(product, quantityElement, itemTotalElement, 1));

      updateTotalPrice();
  }

  function updateQuantity(product, quantityElement, itemTotalElement, change) {
      product.quantity = Math.max(1, product.quantity + change);
      quantityElement.textContent = product.quantity;
      itemTotalElement.textContent = (product.price * product.quantity).toLocaleString() + "₫";
      updateTotalPrice();
  }

  function updateTotalPrice() {
    const items = cartItemsContainer.getElementsByClassName("cart-item");
    let total = 0;
    Array.from(items).forEach(item => {
        const priceText = item.querySelector(".product-info p").textContent;
        const price = parseFloat(priceText.replace(/[^\d]/g, "")); // Loại bỏ tất cả ký tự không phải số
        const quantity = parseInt(item.querySelector(".quantity").textContent);
        total += price * quantity;
    });

    totalPriceElement.textContent = total.toLocaleString("vi-VN") + "₫";

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

  function toggleDeliveryOptions() {
      asapInfo.style.display = deliveryAsap.checked ? "block" : "none";
      scheduleInfo.style.display = deliverySchedule.checked ? "block" : "none";
  }

  deliveryAsap.addEventListener("change", toggleDeliveryOptions);
  deliverySchedule.addEventListener("change", toggleDeliveryOptions);
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
    const userMenu = document.getElementById("userMenu");
    const button = document.querySelector(".account");
    const avatarImg = document.querySelector(".account .avatar");
  
    if (avatarImg) {
      // Khi đã đăng nhập (có avatar), hiển thị menu người dùng
      setPositionRelativeToButton(userMenu, button);
      userMenu.style.display = userMenu.style.display === "none" || userMenu.style.display === "" ? "block" : "none";
    } else {
      // Khi chưa đăng nhập (không có avatar), hiển thị form đăng nhập
      setPositionRelativeToButton(loginForm, button);
      loginForm.style.display = loginForm.style.display === "none" || loginForm.style.display === "" ? "block" : "none";
    }
  }
  
  // Thêm sự kiện cho avatar để mở menu người dùng
  function toggleUserMenu() {
    const userMenu = document.getElementById("userMenu");
    userMenu.style.display = userMenu.style.display === "none" || userMenu.style.display === "" ? "block" : "none";
  }
  
  // Sự kiện cho avatar
  document.querySelector(".account").addEventListener("click", toggleLoginForm);
  // Đăng xuất
  function logout() {
    // Xóa thông tin người dùng từ giao diện
    const accountSection = document.querySelector(".account");
    const avatarImg = document.querySelector(".account .avatar");
    const userMenu = document.getElementById("userMenu");
  
    if (avatarImg) {
        avatarImg.remove(); // Xóa ảnh đại diện
    }
  
    // Đặt lại trạng thái mặc định (icon tài khoản)
    accountSection.classList.remove("logged-in");
  
    // Ẩn menu người dùng
    userMenu.style.display = "none";
  
    // Hiển thị lại form đăng nhập hoặc đặt lại giao diện icon tài khoản
    alert("Bạn đã đăng xuất thành công!");
  }
  
  // Gắn sự kiện cho nút đăng xuất
  document.getElementById("logout").addEventListener("click", (event) => {
    event.preventDefault(); // Ngăn tải lại trang
    logout();
  });
  
  function toggleBranchForm() {
    closeAllForms();
    const branchForm = document.getElementById("branchSelection");
    const button = document.querySelector(".delivery");
    setPositionRelativeToButton(branchForm, button);
    branchForm.style.display = branchForm.style.display === "none" || branchForm.style.display === "" ? "block" : "none";
  }
  
  document.querySelector(".account").addEventListener("click", toggleLoginForm);
  document.querySelector(".delivery").addEventListener("click", toggleBranchForm);
  document.querySelector(".user-menu").addEventListener("click", toggleUserMenu);
  
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
  
  
  
  
  
  
