package hcmute.edu.vn.fashionstore.repository;

import hcmute.edu.vn.fashionstore.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
    // Chỉ cần kế thừa JpaRepository là Spring tự động viết sẵn lệnh SELECT, INSERT, UPDATE cho bạn!
}