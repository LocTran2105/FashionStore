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

    // [PUT] API Cập nhật sản phẩm theo ID
    @PutMapping("/{id}")
    public ResponseEntity<?> updateProduct(@PathVariable Integer id, @RequestBody Product productDetails) {
        try {
            return productRepository.findById(id).map(product -> {
                // Cập nhật các trường (KHÔNG CÒN STOCK NỮA)
                product.setName(productDetails.getName());
                product.setPrice(productDetails.getPrice());
                product.setImgUrl(productDetails.getImgUrl());
                product.setIsActive(productDetails.getIsActive());

                // Lưu lại vào Database
                Product updatedProduct = productRepository.save(product);
                return ResponseEntity.ok(updatedProduct);
            }).orElseGet(() -> ResponseEntity.notFound().build());
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Lỗi khi cập nhật: " + e.getMessage());
        }
    }

    // [DELETE] API Xóa sản phẩm theo ID
    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteProduct(@PathVariable Integer id) {
        try {
            if (productRepository.existsById(id)) {
                productRepository.deleteById(id);
                return ResponseEntity.ok().body("Xóa thành công");
            } else {
                return ResponseEntity.notFound().build();
            }
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Lỗi khi xóa: " + e.getMessage());
        }
    }
}