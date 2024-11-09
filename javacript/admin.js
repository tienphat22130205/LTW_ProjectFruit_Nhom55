// Thêm một sản phẩm mẫu
function addProduct() {
    const productList = document.getElementById("product-list");
    const row = document.createElement("tr");

    row.innerHTML = `
        <td>Táo Mỹ</td>
        <td>50,000 VND/kg</td>
        <td>100 kg</td>
        <td><button onclick="deleteRow(this)">Xóa</button></td>
    `;
    productList.appendChild(row);
}

// Xóa dòng sản phẩm hoặc đơn hàng
function deleteRow(button) {
    const row = button.parentNode.parentNode;
    row.parentNode.removeChild(row);
}
