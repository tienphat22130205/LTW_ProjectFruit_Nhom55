
// product
var swiper = new Swiper(".product-slider", {
  loop: true,
  spaceBetween: 20,
  autoplay: {
    delay: 7500,
    disableOnInteraction: false,
  },
  breakpoints: {
    0: {
      slidesPerView: 2,
    },
    768: {
      slidesPerView: 2,
    },
    1020: {
      slidesPerView: 5,
    },
  },
});
// su kien trang web
function closeAllForms() {
  document.getElementById("loginForm").style.display = "none";
  document.getElementById("cartForm").style.display = "none";
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

function toggleCartForm() {
  closeAllForms();
  const cartForm = document.getElementById("cartForm");
  const button = document.querySelector(".cart");
  setPositionRelativeToButton(cartForm, button);
  cartForm.style.display = cartForm.style.display === "none" || cartForm.style.display === "" ? "block" : "none";
}

function toggleBranchForm() {
  closeAllForms();
  const branchForm = document.getElementById("branchSelection");
  const button = document.querySelector(".delivery");
  setPositionRelativeToButton(branchForm, button);
  branchForm.style.display = branchForm.style.display === "none" || branchForm.style.display === "" ? "block" : "none";
}

document.querySelector(".account").addEventListener("click", toggleLoginForm);
document.querySelector(".cart").addEventListener("click", toggleCartForm);
document.querySelector(".delivery").addEventListener("click", toggleBranchForm);

window.onclick = function (event) {
  if (!event.target.closest('.login-form') && !event.target.closest('.cart-form') &&
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





// back
var swiper = new Swiper(".background-slider", {
  loop: true,
  spaceBetween: 20,
  autoplay: {
    delay: 3000,
    disableOnInteraction: false,
  },
  effect: 'fade',
  speed: 1000,
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  },
  breakpoints: {
    0: {
      slidesPerView: 1,
    },
    768: {
      slidesPerView: 1,
    },
    1020: {
      slidesPerView: 1,
    },
  },
});;






// cap nhat thoi gian dem nguoc
const countdownDate = new Date().getTime() + 3 * 60 * 60 * 1000; // 3 giờ tính từ bây giờ

function updateTimer() {
  const now = new Date().getTime();
  const distance = countdownDate - now;

  // Tính giờ, phút, giây
  const hours = Math.floor(
    (distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)
  );
  const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  const seconds = Math.floor((distance % (1000 * 60)) / 1000);

  // Cập nhật nội dung hiển thị
  document.querySelector(
    ".timer div:nth-child(1)"
  ).innerHTML = `${hours}<br>Giờ`;
  document.querySelector(
    ".timer div:nth-child(2)"
  ).innerHTML = `${minutes}<br>Phút`;
  document.querySelector(
    ".timer div:nth-child(3)"
  ).innerHTML = `${seconds}<br>Giây`;

  // Kiểm tra khi hết thời gian
  if (distance < 0) {
    clearInterval(countdownInterval);
    document.querySelector(".timer").innerHTML = "Hết hạn";
  }
}

// Cập nhật đồng hồ mỗi giây
const countdownInterval = setInterval(updateTimer, 1000);




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
window.addEventListener("click", function (event) {
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

// đăng nhập để đến trang admin
function login() {
  const email = document.getElementById("email").value;
  const password = document.getElementById("password").value;
  const errorMessage = document.getElementById("error-message");
  const loginForm = document.getElementById("loginForm");

  // Thông tin tài khoản admin
  const adminEmail = "nhom55@gmail.com";
  const adminPassword = "nhom55";

  // Thông tin tài khoản người dùng thường
  const userEmail = "user@example.com"; // Thay đổi theo tài khoản người dùng thường của bạn
  const userPassword = "user123"; // Thay đổi theo mật khẩu người dùng thường của bạn

  // Kiểm tra tài khoản và mật khẩu
  if (email === adminEmail && password === adminPassword) {
      // Nếu là tài khoản admin, ẩn form, xóa thông tin và chuyển hướng đến trang Admin
      document.getElementById("email").value = ""; // Xóa thông tin email
      document.getElementById("password").value = ""; // Xóa thông tin password
      loginForm.style.display = "none"; // Ẩn form đăng nhập
      setTimeout(() => {
          window.location.href = "admin.html"; // Đường dẫn tới trang Admin
      }, 500); // Đợi 500ms trước khi chuyển hướng
  } else if (email === userEmail && password === userPassword) {
      // Nếu là tài khoản người dùng thường, ẩn form, xóa thông tin và chuyển hướng đến trang User
      document.getElementById("email").value = ""; // Xóa thông tin email
      document.getElementById("password").value = ""; // Xóa thông tin password
      loginForm.style.display = "none"; // Ẩn form đăng nhập
      setTimeout(() => {
          window.location.href = "index.html"; // Đường dẫn tới trang User (trang chủ)
      }, 500); // Đợi 500ms trước khi chuyển hướng
  } else {
      // Nếu thông tin không đúng, hiển thị thông báo lỗi và xóa nội dung trong các trường nhập
      errorMessage.style.display = "block";
      document.getElementById("email").value = "";
      document.getElementById("password").value = "";
  }
}
// loi ngo search
window.onload = function() {
  document.querySelector(".search input").value = ""; // Đảm bảo ô input bên trong thẻ .search được làm rỗng
};

// chi tiet san pham
let currentIndex = 0;
const images = document.querySelectorAll('.carousel-images img');
const thumbnails = document.querySelectorAll('.thumbnails .thumbnail');
const intervalTime = 5000;
let slideInterval;

// Show image based on index
function showImage(index) {
    images.forEach((img, i) => {
        img.classList.toggle('active', i === index);
        thumbnails[i].classList.toggle('active-thumbnail', i === index);
    });
    currentIndex = index;
}

// Next image
function nextImage() {
    const nextIndex = (currentIndex + 1) % images.length;
    showImage(nextIndex);
}

// Previous image
function prevImage() {
    const prevIndex = (currentIndex - 1 + images.length) % images.length;
    showImage(prevIndex);
}

// Thumbnail click event
thumbnails.forEach((thumbnail, index) => {
    thumbnail.addEventListener('click', () => {
        showImage(index);
        resetInterval();
    });
});

// Controls click events
document.querySelector('.next').addEventListener('click', () => {
    nextImage();
    resetInterval();
});
document.querySelector('.prev').addEventListener('click', () => {
    prevImage();
    resetInterval();
});

// Automatic slide change
function startInterval() {
    slideInterval = setInterval(nextImage, intervalTime);
}

// Reset interval when manually changing image
function resetInterval() {
    clearInterval(slideInterval);
    startInterval();
}

// Initialize
showImage(currentIndex);
startInterval();
// Get the input field and buttons
const minusButton = document.querySelector('.minus');
const plusButton = document.querySelector('.plus');
const quantityInput = document.querySelector('.quantity input');

// Add event listeners to the buttons
minusButton.addEventListener('click', () => {
    let currentValue = parseInt(quantityInput.value) || 0;
    if (currentValue > 1) {
        quantityInput.value = currentValue - 1;
    }
});

plusButton.addEventListener('click', () => {
    let currentValue = parseInt(quantityInput.value) || 0;
    quantityInput.value = currentValue + 1;
});












