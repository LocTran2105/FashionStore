package hcmute.edu.vn.fashionstore.repository;

import hcmute.edu.vn.fashionstore.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable; // <-- ĐẢM BẢO DÒNG NÀY PHẢI ĐÚNG
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
    // Chỉ cần kế thừa JpaRepository là Spring tự động viết sẵn lệnh SELECT, INSERT, UPDATE cho bạn!
    @Query("SELECT p FROM Product p WHERE p.name LIKE %:keyword% AND (:isActive IS NULL OR p.isActive = :isActive)")
    Page<Product> searchAndFilter(@Param("keyword") String keyword, @Param("isActive") Boolean isActive, Pageable pageable);
}