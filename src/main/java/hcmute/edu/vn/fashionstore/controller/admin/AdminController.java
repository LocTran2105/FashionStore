package hcmute.edu.vn.fashionstore.controller.admin;

import hcmute.edu.vn.fashionstore.entity.Product;
import hcmute.edu.vn.fashionstore.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.data.domain.Pageable;
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

    @GetMapping("/products")
    public String showProducts(
            @RequestParam(defaultValue = "0") int page, // Trang mặc định là 0
            @RequestParam(defaultValue = "5") int size, // 5 sản phẩm 1 trang
            @RequestParam(defaultValue = "") String keyword, // Từ khóa tìm kiếm
            @RequestParam(required = false) Boolean isActive, // Bộ lọc trạng thái
            Model model) {

        Pageable pageable = PageRequest.of(page, size);
        Page<Product> productPage = productRepository.searchAndFilter(keyword, isActive, pageable);

        // Đẩy dữ liệu xuống giao diện
        model.addAttribute("products", productPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", productPage.getTotalPages());
        model.addAttribute("keyword", keyword);
        model.addAttribute("isActive", isActive);

        return "admin/products";
    }
}