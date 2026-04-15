package hcmute.edu.vn.fashionstore.controller.api;

import hcmute.edu.vn.fashionstore.entity.Product;
import hcmute.edu.vn.fashionstore.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController // Quan trọng: Đánh dấu đây là REST API, tự động trả về JSON
@RequestMapping("/api/products")
public class ProductApiController {

    @Autowired
    private ProductRepository productRepository;

    // [POST] API Thêm sản phẩm mới
    @PostMapping
    public ResponseEntity<?> addProduct(@RequestBody Product product) {
        try {
            // Lưu xuống DB
            Product savedProduct = productRepository.save(product);
            // Trả về JSON thông báo thành công kèm data vừa lưu
            return ResponseEntity.ok(savedProduct);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Lỗi khi thêm sản phẩm: " + e.getMessage());
        }
    }
}