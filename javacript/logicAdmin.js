// Khởi tạo danh sách tài khoản
let users = [];

// Hàm lưu dữ liệu vào Local Storage
function saveToLocalStorage() {
    localStorage.setItem("users", JSON.stringify(users));
}

// Hàm tải dữ liệu từ Local Storage
function loadFromLocalStorage() {
    const storedUsers = localStorage.getItem("users");
    users = storedUsers ? JSON.parse(storedUsers) : [];
}
// Hàm hiển thị danh sách tài khoản trên bảng
function renderUserTable() {
    const userTableBody = document.getElementById("userTableBody");
    userTableBody.innerHTML = ""; // Xóa nội dung cũ

    if (users.length === 0) {
        // Nếu danh sách trống, hiển thị thông báo
        const row = document.createElement("tr");
        row.innerHTML = `<td colspan="3" style="text-align: center; color: #888;">Chưa có tài khoản nào</td>`;
        userTableBody.appendChild(row);
    } else {
        // Hiển thị danh sách tài khoản
        users.forEach((user, index) => {
            const row = document.createElement("tr");
            row.innerHTML = `
                <td>${user.username}</td>
                <td>${user.role}</td>
                <td>
                    <button class="btn-edit" onclick="editUser(${index})">Sửa</button>
                    <button class="btn-delete" onclick="deleteUser(${index})">Xóa</button>
                </td>
            `;
            userTableBody.appendChild(row);
        });
    }
}

// Hàm thêm tài khoản mới
function addUser() {
    const username = document.getElementById("usernameInput").value.trim();
    const role = document.getElementById("userRoleInput").value;

    if (!username) {
        alert("Tên tài khoản không được để trống!");
        return;
    }

    // Kiểm tra tài khoản đã tồn tại
    if (users.some((user) => user.username.toLowerCase() === username.toLowerCase())) {
        alert("Tên tài khoản đã tồn tại!");
        return;
    }

    // Thêm tài khoản vào danh sách
    users.push({ username, role });
    saveToLocalStorage(); // Lưu trạng thái vào Local Storage
    renderUserTable(); // Cập nhật bảng
    alert("Tài khoản mới đã được thêm!");

    // Reset form
    document.getElementById("usernameInput").value = "";
    document.getElementById("userRoleInput").value = "admin";
}

// Hàm sửa tài khoản
function editUser(index) {
    const user = users[index];
    document.getElementById("usernameInput").value = user.username;
    document.getElementById("userRoleInput").value = user.role;

    // Lưu trạng thái chỉnh sửa
    document.getElementById("usernameInput").dataset.editIndex = index; // Gắn chỉ số tài khoản đang sửa
    alert("Đang chỉnh sửa tài khoản. Sau khi chỉnh sửa, nhấn Lưu để cập nhật.");
}

// Hàm xóa tài khoản
function deleteUser(index) {
    if (confirm("Bạn có chắc chắn muốn xóa tài khoản này?")) {
        users.splice(index, 1); // Xóa tài khoản khỏi danh sách
        saveToLocalStorage(); // Lưu trạng thái vào Local Storage
        renderUserTable(); // Cập nhật bảng
    }
}

// Hàm lưu thay đổi (sau khi thêm, sửa hoặc xóa)
function saveChanges() {
    saveToLocalStorage(); // Lưu toàn bộ danh sách vào Local Storage
    renderUserTable(); // Đảm bảo bảng hiển thị đúng
    alert("Các thay đổi đã được lưu!");
}

// Khởi tạo dữ liệu khi tải trang
window.onload = () => {
    console.log("Dữ liệu từ Local Storage:", localStorage.getItem("users"));
    console.log("Biến users sau khi load:", users);
};

