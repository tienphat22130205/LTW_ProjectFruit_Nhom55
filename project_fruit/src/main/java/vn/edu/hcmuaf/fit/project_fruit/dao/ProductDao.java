package vn.edu.hcmuaf.fit.project_fruit.dao;

import vn.edu.hcmuaf.fit.project_fruit.dao.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductDao {
    private static Map<Integer, Product> data = new HashMap<>();
    static {
        data.put(1, new Product(1, "Đào Tiên Úc", "https://product.hstatic.net/200000377165/product/2_80e45e5fab694f23be4a9de53bb299b8_2a81d44d80e3458f8261ac40c2e5d94e_large.jpg", 120000, "4.5", "Còn hàng", "Đào nhập khẩu từ Úc, ngọt và giòn", "Giảm 10%", 50, "Úc", "2024-07-08", "7 ngày"));
        data.put(2, new Product(2, "Dâu Tây Hàn Quốc", "https://product.hstatic.net/200000377165/product/2412_2dc46776674d59855da235d05f2955cb_9399553596a84021848258dadb907502_e41ed83ed9284dbaa00a93a565de61a0_large.jpg", 150000, "4.7", "Còn hàng", "Dâu Tây nhập khẩu, tươi ngon và ngọt", "Giảm 15%", 30, "Hàn Quốc", "2024-07-09", "5 ngày"));
        data.put(3, new Product(3, "Táo Envy Mỹ", "https://product.hstatic.net/200000377165/product/h2_e1f733ee5af841e09cd9e2b173d17d03_3c6e56e080c04303a3e0fe0c159f2809_large.png", 180000, "4.8", "Còn hàng", "Táo Envy giòn và ngọt từ Mỹ", "Giảm 20%", 40, "Mỹ", "2024-07-10", "10 ngày"));
        data.put(4, new Product(4, "Nho Xanh Úc", "https://product.hstatic.net/200000377165/product/artboard_9_634c45fd46794152af01066b2281919f_large.png", 200000, "4.9", "Còn hàng", "Nho Xanh tươi giòn từ Úc", "Giảm 10%", 25, "Úc", "2024-07-11", "14 ngày"));
        data.put(5, new Product(5, "Lê Nam Phi", "https://product.hstatic.net/200000377165/product/2-copy_d40947a5bb3140b2b9521ae45ff1eadb_large.jpg", 140000, "4.6", "Còn hàng", "Lê nhập khẩu tươi ngọt từ Nam Phi", "Giảm 12%", 50, "Nam Phi", "2024-07-12", "7 ngày"));
        data.put(6, new Product(6, "Mận Hà Nội", "https://product.hstatic.net/200000377165/product/h1_fb20c20fd56b4e669c60edf1ecbf45ef_large.jpg", 60000, "4.2", "Còn hàng", "Mận tươi ngon đặc sản Hà Nội", "Giảm 5%", 100, "Việt Nam", "2024-07-13", "3 ngày"));
        data.put(7, new Product(7, "Ổi Nữ Hoàng", "https://product.hstatic.net/200000377165/product/2-copy_0c056c72665b42a3af0fdc1ee3399950_large.jpg", 45000, "4.3", "Còn hàng", "Ổi Nữ Hoàng đặc sản Việt Nam", "Giảm 8%", 150, "Việt Nam", "2024-07-14", "4 ngày"));
        data.put(8, new Product(8, "Dưa Lưới Nhật", "https://product.hstatic.net/200000377165/product/artboard_5_eeab0354fbc14da79f41138ea0e3b24e_large.png", 120000, "4.8", "Còn hàng", "Dưa lưới thơm ngọt nhập khẩu từ Nhật", "Giảm 10%", 60, "Nhật Bản", "2024-07-15", "7 ngày"));
        data.put(9, new Product(9, "Xoài Cát Hòa Lộc", "https://product.hstatic.net/200000377165/product/2-copy_e6e51b74ebde4ee68eafc473a1a0514c_large.jpg", 80000, "4.7", "Còn hàng", "Xoài cát đặc sản Hòa Lộc", "Giảm 5%", 80, "Việt Nam", "2024-07-16", "10 ngày"));
        data.put(10, new Product(10, "Mít Thái", "https://product.hstatic.net/200000377165/product/e4b4fc3baf2840659f7ba0bf77434781_e92956c1b38f48e78c60f995de03c6b5_large.jpeg", 70000, "4.5", "Còn hàng", "Mít thái tươi ngon, thơm ngọt", "Giảm 8%", 70, "Thái Lan", "2024-07-17", "6 ngày"));
        data.put(11, new Product(11, "Cam Sành Miền Tây", "https://product.hstatic.net/200000377165/product/h1_39f811b7135d42d283ba8c9977b845ad_large.jpg", 50000, "4.4", "Còn hàng", "Cam Sành đặc sản Miền Tây", "Giảm 10%", 90, "Việt Nam", "2024-07-18", "5 ngày"));
        data.put(12, new Product(12, "Thanh Long Ruột Đỏ", "https://product.hstatic.net/200000377165/product/artboard_1_5bb02a1624244a199d79b1cc61c78c28_large.png", 65000, "4.6", "Còn hàng", "Thanh long ruột đỏ tươi ngon", "Giảm 15%", 80, "Việt Nam", "2024-07-19", "7 ngày"));
        data.put(13, new Product(13, "Chuối Cau Lào", "https://product.hstatic.net/200000377165/product/artboard_1_be017f29f55e44d58462b82000b9fa63_large.png", 40000, "4.1", "Còn hàng", "Chuối cau đặc sản Lào", "Giảm 5%", 120, "Lào", "2024-07-20", "5 ngày"));
        data.put(14, new Product(14, "Cherry Canada", "https://product.hstatic.net/200000377165/product/artboard_8_c43fd711ab2f40439b3e5477a71cfe5f_4593c2b0550f4d81ab6cc612af99e429_large.png", 250000, "4.9", "Còn hàng", "Cherry đỏ tươi ngon nhập khẩu từ Canada", "Giảm 20%", 30, "Canada", "2024-07-21", "10 ngày"));
        data.put(15, new Product(15, "Kiwi Xanh New Zealand", "https://product.hstatic.net/200000377165/product/artboard_9_e38fdd03e82c42d19862983514e17fad_large.png", 170000, "4.8", "Còn hàng", "Kiwi xanh thơm ngon nhập khẩu", "Giảm 15%", 40, "New Zealand", "2024-07-22", "14 ngày"));

    }
    public List<Product> getAll(){
        return new ArrayList<>(data.values());
    }
    public Product getById(int id){
        return data.get(id);
    }
}
