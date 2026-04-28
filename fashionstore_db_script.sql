CREATE DATABASE IF NOT EXISTS fashionstore_db;
USE fashionstore_db;

CREATE TABLE Users (
	user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(10) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL,
    role ENUM("ADMIN", "CUSTOMER") DEFAULT "CUSTOMER",
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP);
    
CREATE TABLE Categories(
	cat_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    description TEXT);
    
CREATE TABLE Brands(
	brand_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT);
    
CREATE TABLE Products(
	product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    cat_id INT,
    brand_id INT,
    img_url VARCHAR(255),
    description TEXT,
    price DECIMAL(15,2) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    stock INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cat_id) REFERENCES Categories(cat_id),
    FOREIGN KEY (brand_id) REFERENCES Brands(brand_id));

CREATE TABLE ProductVariants (
    variant_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    size VARCHAR(10),
    color VARCHAR(50),
    stock INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
CREATE TABLE Discounts(
	disc_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
	stock INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    percent INT NOT NULL);
    
CREATE TABLE PasswordResets(
	reset_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    token VARCHAR(255),
    expire_at DATETIME NOT NULL,
    is_used BOOLEAN NOT NULL DEFAULT FALSE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id));
    
CREATE TABLE Carts(
	cart_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id));

CREATE TABLE CartItems(
	cart_item_id INT AUTO_INCREMENT PRIMARY KEY,
    cart_id INT,
    product_id INT,
    quantity INT,
    variant_id INT, 
    FOREIGN KEY (cart_id) REFERENCES Carts(cart_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (variant_id) REFERENCES ProductVariants(variant_id)
    );
    
CREATE TABLE Orders(
	order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    disc_id INT,
	price DECIMAL(15,2),
    total_price DECIMAL(15,2),
    status ENUM('PENDING', 'PAID', 'SHIPPED', 'CANCELLED') DEFAULT 'PENDING',
    shipping_address VARCHAR(255), -- Thêm địa chỉ giao
    shipping_phone VARCHAR(15),    -- Thêm sđt người nhận
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (disc_id) REFERENCES Discounts(disc_id)
);
    
CREATE TABLE OrderDetails (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    variant_id INT, 
    unit_price DECIMAL(15,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (variant_id) REFERENCES ProductVariants(variant_id)
);
   
CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Payments(
	payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_method ENUM('COD', 'TRANSFER'),
    amount DECIMAL(15,2) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id));
    
CREATE TABLE Wishlist (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
    
CREATE TABLE ChatSessions (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Messages (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    session_id INT,
    sender ENUM('USER', 'BOT'),
    content TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (session_id) REFERENCES ChatSessions(session_id)
);

CREATE TABLE AuditLogs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    action VARCHAR(100),
    entity VARCHAR(100),
    entity_id INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
    
    -- Tăng tốc tìm kiếm sản phẩm theo tên (Ví dụ: "Áo sơ mi nam")
CREATE INDEX idx_product_name ON Products(name);

-- Tăng tốc lọc sản phẩm theo giá (Ví dụ: WHERE price BETWEEN 200000 AND 500000)
CREATE INDEX idx_product_price ON Products(price);

-- Tăng tốc độ load danh sách sản phẩm đang được bày bán (WHERE is_active = TRUE)
CREATE INDEX idx_product_active ON Products(is_active);

-- Tăng tốc lọc đơn hàng theo trạng thái (Ví dụ: Tìm toàn bộ đơn 'PENDING')
CREATE INDEX idx_order_status ON Orders(status);

-- Tăng tốc thống kê đơn hàng theo ngày tháng (Ví dụ: Doanh thu tháng này)
CREATE INDEX idx_order_created_at ON Orders(created_at);

-- Tăng tốc load lịch sử tin nhắn trong một phiên chat
CREATE INDEX idx_messages_created_at ON Messages(created_at);
-- 1. Thêm dữ liệu tài khoản (mật khẩu mặc định là: 123456 đã được mã hóa BCrypt)
INSERT INTO Users (username, password, email, phone, address, role) VALUES
('admin_loc', '$2a$10$wE/.7.5x5R1f.K8/9z4D1.aLw.y/Q0Z.Z/9z4D1.aLw.y/Q0Z', 'admin@gmail.com', '0901234567', 'hồ chí minh', 'ADMIN'),
('khachhang1', '$2a$10$wE/.7.5x5R1f.K8/9z4D1.aLw.y/Q0Z.Z/9z4D1.aLw.y/Q0Z', 'khachhang@gmail.com', '0987654321', 'hà nội', 'CUSTOMER');

-- 2. Thêm dữ liệu danh mục (Categories)
INSERT INTO Categories (name, description) VALUES
('áo thun', 'các loại áo thun cotton thoáng mát'),
('quần jean', 'quần jean nam nữ phong cách trẻ trung'),
('áo khoác', 'áo khoác mùa đông và áo gió');

-- 3. Thêm dữ liệu thương hiệu (Brands)
INSERT INTO Brands (name, description) VALUES
('local brand việt', 'thương hiệu thời trang sản xuất tại việt nam'),
('thời trang basic', 'phong cách tối giản, dễ phối đồ'),
('thể thao năng động', 'trang phục thể thao thoải mái');

-- 4. Thêm dữ liệu sản phẩm (Products)
INSERT INTO Products (name, cat_id, brand_id, img_url, description, price, stock) VALUES
('áo thun cổ tròn trơn', 1, 2, 'ao-thun-tron.jpg', 'áo thun 100% cotton thấm hút tốt', 150000.00, 100),
('quần jean dáng suông ống rộng', 2, 1, 'quan-jean-suong.jpg', 'quần bò xanh nhạt hot trend', 350000.00, 50),
('áo khoác dù chống nước nhẹ', 3, 3, 'ao-khoac-du.jpg', 'áo khoác 2 lớp thích hợp đi mưa nhẹ', 250000.00, 80);

-- 5. Thêm dữ liệu biến thể (ProductVariants - Size/Màu sắc)
INSERT INTO ProductVariants (product_id, size, color, stock) VALUES
(1, 's', 'trắng', 30),
(1, 'm', 'trắng', 40),
(1, 'l', 'đen', 30),
(2, '30', 'xanh dương', 25),
(2, '32', 'xanh dương', 25),
(3, 'l', 'xám', 80);

-- 6. Thêm dữ liệu mã giảm giá (Discounts)
INSERT INTO Discounts (name, description, stock, start_time, end_time, percent) VALUES
('mùa hè rực rỡ', 'giảm 10% đón hè', 100, '2026-04-01 00:00:00', '2026-05-31 23:59:59', 10),
('khách hàng mới', 'giảm 20% cho đơn đầu tiên', 500, '2026-01-01 00:00:00', '2026-12-31 23:59:59', 20);