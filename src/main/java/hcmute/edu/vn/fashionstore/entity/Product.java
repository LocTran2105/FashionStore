package hcmute.edu.vn.fashionstore.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.math.BigDecimal;

@Entity
@Table(name = "Products")
@Getter
@Setter
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id")
    private Integer productId;

    private String name;

    @Column(name = "img_url")
    private String imgUrl;

    private String description;
    private BigDecimal price;
    private Integer stock;

    @Column(name = "is_active")
    private Boolean isActive;

    // Tạm thời chưa map khóa ngoại cat_id và brand_id để bạn dễ test trước
}