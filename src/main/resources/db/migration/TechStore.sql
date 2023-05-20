-- Tạo bảng Customer
CREATE TABLE Customer
(
    customer_id   INT PRIMARY KEY,
    name          NVARCHAR(255),
    email         NVARCHAR(255),
    phone         NVARCHAR(20),
    address       NVARCHAR(255),
    reward_points INT,
    created_at    DATETIME,
    updated_at    DATETIME
);

-- Tạo bảng Category
CREATE TABLE Category
(
    category_id INT PRIMARY KEY,
    name        NVARCHAR(255)
);

-- Tạo bảng Product
CREATE TABLE Product
(
    product_id  INT PRIMARY KEY,
    name        NVARCHAR(255),
    description NVARCHAR(MAX),
    price       DECIMAL(18, 3),
    category_id INT,
    created_at  DATETIME,
    updated_at  DATETIME,
    FOREIGN KEY (category_id) REFERENCES Category (category_id),
);

-- Tạo bảng Payment
CREATE TABLE Payment
(
    payment_id INT PRIMARY KEY,
    method     NVARCHAR(255)
);

-- Tạo bảng Shipping
CREATE TABLE Shipping
(
    shipping_id INT PRIMARY KEY,
    method      NVARCHAR(255)
);

-- Tạo bảng Order
CREATE TABLE [Order]
(
    order_id     INT PRIMARY KEY,
    customer_id  INT,
    order_date   DATETIME,
    total_amount DECIMAL(18, 3),
    payment_id   INT,
    shipping_id  INT,
    created_at   DATETIME,
    updated_at   DATETIME,
    FOREIGN KEY (customer_id) REFERENCES Customer (customer_id),
    FOREIGN KEY (payment_id) REFERENCES Payment (payment_id),
    FOREIGN KEY (shipping_id) REFERENCES Shipping (shipping_id)
);

-- Tạo bảng OrderItem
CREATE TABLE OrderItem
(
    order_item_id INT PRIMARY KEY,
    order_id      INT,
    product_id    INT,
    quantity      INT,
    price         DECIMAL(18, 2),
    FOREIGN KEY (order_id) REFERENCES [Order] (order_id),
    FOREIGN KEY (product_id) REFERENCES Product (product_id)
);

-- Tạo bảng Inventory
CREATE TABLE Inventory
(
    product_id INT PRIMARY KEY,
    quantity   INT
);

-- Tạo bảng ProductReview
CREATE TABLE ProductReview
(
    review_id   INT PRIMARY KEY,
    product_id  INT,
    customer_id INT,
    rating      INT,
    comment     NVARCHAR(MAX),
    FOREIGN KEY (product_id) REFERENCES Product (product_id),
    FOREIGN KEY (customer_id) REFERENCES Customer (customer_id)
);

-- Tạo bảng Administrator
CREATE TABLE Administrator
(
    admin_id INT PRIMARY KEY,
    name     NVARCHAR(255),
    email    NVARCHAR(255),
    phone    NVARCHAR(20)
);



-- Chèn dữ liệu vào bảng Category
-- SELECT * FROM Category
INSERT INTO Category (category_id, name)
VALUES
(1, 'iPhone'),
(2, 'Samsung'),

-- Laptop
(3, 'Mac'),
(4, 'ASUS'),

-- Sound
(5, 'Bluetooh')


-- Chèn dữ liệu vào bảng Product
INSERT INTO Product (product_id, name, description, price, category_id, created_at, updated_at)
VALUES

-- Telephone !
-- Iphone

(1, N'iPhone 14 Pro Max 128GB  | Chính hãng VN/A', N'Máy mới 100% , chính hãng Apple Việt Nam. TechStore hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam, Hộp, Sách hướng dẫn, Cây lấy sim, Cáp Lightning - Type C 1 ĐỔI 1 trong 30 ngày nếu có lỗi phần cứng nhà sản xuất. Bảo hành 12 tháng tại trung tâm bảo hành chính hãng Apple : Điện Thoại Vui ASP (Apple Authorized Service Provider)',  26440000, 1, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(2, N'iPhone 13 Pro Max 128GB  | Chính hãng VN/A', N'Máy mới 100% , chính hãng Apple Việt Nam. TechStore hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam, Hộp, Sách hướng dẫn, Cây lấy sim, Cáp Lightning - Type C 1 ĐỔI 1 trong 30 ngày nếu có lỗi phần cứng nhà sản xuất. Bảo hành 12 tháng tại trung tâm bảo hành chính hãng Apple : Điện Thoại Vui ASP (Apple Authorized Service Provider)',  24590000, 1, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(3, N'iPhone 11 Pro Max 128GB  | Chính hãng VN/A', N'Máy mới 100% , chính hãng Apple Việt Nam. TechStore hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam, Hộp, Sách hướng dẫn, Cây lấy sim, Cáp Lightning - Type C 1 ĐỔI 1 trong 30 ngày nếu có lỗi phần cứng nhà sản xuất. Bảo hành 12 tháng tại trung tâm bảo hành chính hãng Apple : Điện Thoại Vui ASP (Apple Authorized Service Provider)',  10280000, 1, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(4, N'iPhone 14  Pro Max 256GB | Chính hãng VN/A', N'Máy mới 100% , chính hãng Apple Việt Nam. TechStore hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam, Hộp, Sách hướng dẫn, Cây lấy sim, Cáp Lightning - Type C 1 ĐỔI 1 trong 30 ngày nếu có lỗi phần cứng nhà sản xuất. Bảo hành 12 tháng tại trung tâm bảo hành chính hãng Apple : Điện Thoại Vui ASP (Apple Authorized Service Provider)', 27500000, 1, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(5, N'iPhone 12  Pro Max 128GB | Chính hãng VN/A', N'Máy mới 100% , chính hãng Apple Việt Nam. TechStore hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam, Hộp, Sách hướng dẫn, Cây lấy sim, Cáp Lightning - Type C 1 ĐỔI 1 trong 30 ngày nếu có lỗi phần cứng nhà sản xuất. Bảo hành 12 tháng tại trung tâm bảo hành chính hãng Apple : Điện Thoại Vui ASP (Apple Authorized Service Provider', 20500000, 1, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(6, N'iPhone 13  Pro Max 256GB | Chính hãng VN/A', N'Máy mới 100% , chính hãng Apple Việt Nam. TechStore hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam, Hộp, Sách hướng dẫn, Cây lấy sim, Cáp Lightning - Type C 1 ĐỔI 1 trong 30 ngày nếu có lỗi phần cứng nhà sản xuất. Bảo hành 12 tháng tại trung tâm bảo hành chính hãng Apple : Điện Thoại Vui ASP (Apple Authorized Service Provider', 20500000, 1, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(7, N'iPhone 13  Pro Max 526GB | Chính hãng VN/A', N'Máy mới 100% , chính hãng Apple Việt Nam. TechStore hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam, Hộp, Sách hướng dẫn, Cây lấy sim, Cáp Lightning - Type C 1 ĐỔI 1 trong 30 ngày nếu có lỗi phần cứng nhà sản xuất. Bảo hành 12 tháng tại trung tâm bảo hành chính hãng Apple : Điện Thoại Vui ASP (Apple Authorized Service Provider', 27500000, 1, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),

-- Samsung

(8,  N'Samsung Galaxy M14 5G 4GB 128GB', N'Máy mới 100% , chính hãng Samsung Việt Nam. TechStore hiện là đại lý bán lẻ uỷ quyền Samsung chính hãng VN/A của Samsung Việt Nam', 27500000, 2, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(9,  N'Samsung Galaxy Z Flip4 128GB', N'Máy mới 100% , chính hãng Samsung Việt Nam. TechStore hiện là đại lý bán lẻ uỷ quyền Samsung chính hãng VN/A của Samsung Việt Nam', 17500000, 2, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(10, N'Samsung Galaxy Z Fold4', N'Máy mới 100% , chính hãng Samsung Việt Nam. TechStore hiện là đại lý bán lẻ uỷ quyền Samsung chính hãng VN/A của Samsung Việt Nam', 31760000, 2, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(11, N'Samsung Galaxy Z Fold3 5G', N'Máy mới 100% , chính hãng Samsung Việt Nam. TechStore hiện là đại lý bán lẻ uỷ quyền Samsung chính hãng VN/A của Samsung Việt Nam', 22990000, 2, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(12, N'Samsung Galaxy Z Fold4 512GB', N'Máy mới 100% , chính hãng Samsung Việt Nam. TechStore hiện là đại lý bán lẻ uỷ quyền Samsung chính hãng VN/A của Samsung Việt Nam', 31516000, 2, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),


--Laptop !
-- Mac

(13, N'Apple MacBook Air M1 256GB 2020 I Chính hãng Apple Việt Nam', N'Máy mới 100%, đầy đủ phụ kiện từ nhà sản xuất. Sản phẩm có mã SA/A (được Apple Việt Nam phân phối chính thức).', 18490000 , 3, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(14, N'Apple Macbook Air M2 2022 8GB 256GB I Chính hãng Apple Việt Nam', N'Máy mới 100%, đầy đủ phụ kiện từ nhà sản xuất. Sản phẩm có mã SA/A (được Apple Việt Nam phân phối chính thức).', 27690000, 3, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(15, N'Mac mini M2 2023 (8 CPU - 10 GPU - 8GB - 256GB) | Chính hãng Apple Việt Nam', N'Máy mới 100%, đầy đủ phụ kiện từ nhà sản xuất. Sản phẩm có mã SA/A (được Apple Việt Nam phân phối chính thức).', 14790000, 3, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(16, N'Apple Macbook Pro 13 M2 2022 8GB 256GB I Chính hãng Apple Việt Nam', N'Máy mới 100%, đầy đủ phụ kiện từ nhà sản xuất. Sản phẩm có mã SA/A (được Apple Việt Nam phân phối chính thức).', 28800000, 3, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(17, N'MacBook Pro 14 inch M2 Pro 2023 (10 CPU - 16 GPU - 16GB - 512GB)', N'Máy mới 100%, đầy đủ phụ kiện từ nhà sản xuất. Sản phẩm có mã SA/A (được Apple Việt Nam phân phối chính thức).', 48590000, 3, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(18, N'Apple Macbook Air M2 2022 16GB 256GB I Chính hãng Apple Việt Nam', N'Máy mới 100%, đầy đủ phụ kiện từ nhà sản xuất. Sản phẩm có mã SA/A (được Apple Việt Nam phân phối chính thức).', 33690000, 3, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),


-- ASUS

(19, N'Laptop ASUS Gaming TUF FX506LHB-HN188W', N'Nguyên hộp, đầy đủ phụ kiện từ nhà sản suất Bảo hành pin 12 tháng,Bảo hành 24 tháng tại trung tâm bảo hành Chính hãng. 1 đổi 1 trong 30 ngày nếu có lỗi phần cứng từ nhà sản xuất.', 15590000, 4, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(20, N'Laptop ASUS Gaming ROG Strix G15 G513RM-HQ055W', N'Nguyên hộp, đầy đủ phụ kiện từ nhà sản suất Bảo hành pin 12 tháng,Bảo hành 24 tháng tại trung tâm bảo hành Chính hãng. 1 đổi 1 trong 30 ngày nếu có lỗi phần cứng từ nhà sản xuất.', 33690000, 4, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(21, N'Laptop Asus Zenbook 14X UM5401QA KN209W', N'Nguyên hộp, đầy đủ phụ kiện từ nhà sản suất Bảo hành pin 12 tháng,Bảo hành 24 tháng tại trung tâm bảo hành Chính hãng. 1 đổi 1 trong 30 ngày nếu có lỗi phần cứng từ nhà sản xuất.', 18490000, 4, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(22, N'Laptop ASUS TUF DASH Gaming F15 FX517ZC-HN079W', N'Nguyên hộp, đầy đủ phụ kiện từ nhà sản suất Bảo hành pin 12 tháng,Bảo hành 24 tháng tại trung tâm bảo hành Chính hãng. 1 đổi 1 trong 30 ngày nếu có lỗi phần cứng từ nhà sản xuất.', 20790000, 4, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(23, N'Laptop Asus Vivobook X415MA-BV451W', N'Nguyên hộp, đầy đủ phụ kiện từ nhà sản suất Bảo hành pin 12 tháng,Bảo hành 24 tháng tại trung tâm bảo hành Chính hãng. 1 đổi 1 trong 30 ngày nếu có lỗi phần cứng từ nhà sản xuất.', 6900000, 4, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(24, N'Laptop Asus Gaming Rog Strix G15 G513IH HN015W', N'Nguyên hộp, đầy đủ phụ kiện từ nhà sản suất Bảo hành pin 12 tháng,Bảo hành 24 tháng tại trung tâm bảo hành Chính hãng. 1 đổi 1 trong 30 ngày nếu có lỗi phần cứng từ nhà sản xuất.', 33690000, 4, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),

-- Sound
-- Bluetooh
(25, N'Tai nghe Bluetooth Apple AirPods 2 VN/A', N'Hàng chính hãng Apple Việt Nam, Mới Hộp sạc và tai nghe, Cáp Lightning, Sách hướng dẫn, Bảo hành 12 tháng chính hãng 1 đổi 1 trong 15 ngày nếu có lỗi phần cứng từ NSX.', 2640000, 5, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(26, N'Tai nghe không dây Samsung Galaxy Buds2', N'Hàng chính hãng Apple Việt Nam, Mới Hộp sạc và tai nghe, Cáp Lightning, Sách hướng dẫn, Bảo hành 12 tháng chính hãng 1 đổi 1 trong 15 ngày nếu có lỗi phần cứng từ NSX.', 1390000, 5, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(27, N'Tai nghe Bluetooth Apple AirPods Pro 2022 | Chính hãng Apple Việt Nam', N'Hàng chính hãng Apple Việt Nam, Mới Hộp sạc và tai nghe, Cáp Lightning, Sách hướng dẫn, Bảo hành 12 tháng chính hãng 1 đổi 1 trong 15 ngày nếu có lỗi phần cứng từ NSX.', 5900000, 5, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(28, N'Tai nghe Bluetooth Apple AirPods 3 MagSafe | Chính hãng Apple Việt Nam', N'Hàng chính hãng Apple Việt Nam, Mới Hộp sạc và tai nghe, Cáp Lightning, Sách hướng dẫn, Bảo hành 12 tháng chính hãng 1 đổi 1 trong 15 ngày nếu có lỗi phần cứng từ NSX.', 4900000, 5, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(29, N'Tai nghe không dây Marshall Minor 3', N'Hàng chính hãng Apple Việt Nam, Mới Hộp sạc và tai nghe, Cáp Lightning, Sách hướng dẫn, Bảo hành 12 tháng chính hãng 1 đổi 1 trong 15 ngày nếu có lỗi phần cứng từ NSX.', 2890000, 5, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(30, N'Tai nghe không dây Havit TW 967', N'Hàng chính hãng Apple Việt Nam, Mới Hộp sạc và tai nghe, Cáp Lightning, Sách hướng dẫn, Bảo hành 12 tháng chính hãng 1 đổi 1 trong 15 ngày nếu có lỗi phần cứng từ NSX.', 290000, 5, '2023-05-19 10:00:00', '2023-05-19 10:00:00');


-- Customer

INSERT INTO Customer (customer_id, name, email, phone, address, reward_points, created_at, updated_at)
VALUES
    (1, 'user', 'user123@gmail.com', '0123456789', N'346 TP 11 Thanh Pho Ho Chi Minh' , 300 , GETDATE(), GETDATE())


-- Admin

INSERT INTO Administrator (admin_id, name, email, phone)
VALUES
    (1, 'admin', 'admin123@gmail.com', '0123456789')



