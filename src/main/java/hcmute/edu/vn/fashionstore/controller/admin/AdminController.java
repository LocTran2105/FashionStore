package hcmute.edu.vn.fashionstore.controller.admin;

import hcmute.edu.vn.fashionstore.entity.Product;
import hcmute.edu.vn.fashionstore.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin") // Gốc đường dẫn là /admin
public class AdminController {

    @Autowired
    private ProductRepository productRepository;

    // 1. Vào trang chủ hệ thống: Nhận cả /admin và /admin/dashboard
    @GetMapping({"", "/", "/dashboard"})
    public String showDashboard() {
        return "admin/dashboard"; // Gọi file dashboard.html
    }

    // 2. Vào trang sản phẩm: Nhận /admin/products
    @GetMapping("/products")
    public String showProducts(Model model) {
        List<Product> products = productRepository.findAll();
        model.addAttribute("products", products);
        return "admin/products"; // Gọi file products.html
    }
}