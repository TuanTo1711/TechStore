create TABLE CUSTOMERS
(
    CUSTOMER_ID   INT IDENTITY (1,1) PRIMARY KEY,
    NAME          NVARCHAR(255) NOT NULL,
    EMAIL         NVARCHAR(255) NOT NULL,
    PASSWORD      NVARCHAR(255) NOT NULL,
    VERIFICATION  BIT           NOT NULL,
    [ROLE]        NVARCHAR(255) NOT NULL,
    PHONE         NVARCHAR(20),
    ADDRESS       NVARCHAR(255),
    REWARD_POINTS FLOAT,
    CREATED_AT    DATETIME DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT    DATETIME DEFAULT CURRENT_TIMESTAMP
);

create TABLE ADMINISTRATORS
(
    ADMIN_ID   INT IDENTITY (1,1) PRIMARY KEY,
    NAME       NVARCHAR(255),
    EMAIL      NVARCHAR(255),
    PASSWORD   NVARCHAR(255),
    [ROLE]     NVARCHAR(255),
    CREATED_AT DATETIME DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT DATETIME DEFAULT CURRENT_TIMESTAMP
);

create TABLE JWT_TOKEN
(
    JWT_TOKEN_ID INT IDENTITY (1,1) PRIMARY KEY,
    TOKEN        NVARCHAR(MAX) NOT NULL,
    CREATED_AT   DATETIME DEFAULT CURRENT_TIMESTAMP,
    EXPIRED_AT   DATETIME DEFAULT DATEADD(MINUTE, 30, GETDATE()),
    CONFIRM_AT   DATETIME,
    CUSTOMER_ID  INT
);

create TABLE CATEGORIES
(
    CATEGORY_ID    INT IDENTITY (1,1) PRIMARY KEY,
    CATEGORY_NAME  NVARCHAR(255),
);

create TABLE PRODUCTS
(
    PRODUCT_ID  INT IDENTITY (1,1) PRIMARY KEY,
    NAME        NVARCHAR(255),
    DESCRIPTION NVARCHAR(MAX),
    PRICE       DECIMAL(18, 2),
    CATEGORY_ID INT,
    CREATED_AT  DATETIME DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT  DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORIES (CATEGORY_ID)
        ON delete CASCADE ON update CASCADE
);

--create TABLE PAYMENTS
--(
--    PAYMENT_ID INT IDENTITY (1,1) PRIMARY KEY,
--    METHOD     NVARCHAR(255)
--);
--
--create TABLE SHIPPING
--(
--    SHIPPING_ID INT IDENTITY (1,1) PRIMARY KEY,
--    METHOD      NVARCHAR(255)
--);
--
--create TABLE ORDERS
--(
--    ORDER_ID     INT IDENTITY (1,1) PRIMARY KEY,
--    CUSTOMER_ID  INT,
--    ORDER_DATE   DATETIME,
--    TOTAL_AMOUNT DECIMAL(18, 2),
--    PAYMENT_ID   INT,
--    SHIPPING_ID  INT,
--    CREATED_AT   DATETIME DEFAULT CURRENT_TIMESTAMP,
--    UPDATED_AT   DATETIME DEFAULT CURRENT_TIMESTAMP,
--    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS (CUSTOMER_ID)
--        ON delete CASCADE ON update CASCADE,
--    FOREIGN KEY (PAYMENT_ID) REFERENCES PAYMENTS (PAYMENT_ID)
--        ON delete CASCADE ON update CASCADE,
--    FOREIGN KEY (SHIPPING_ID) REFERENCES SHIPPING (SHIPPING_ID)
--        ON delete CASCADE ON update CASCADE
--);
--
--create TABLE ORDER_ITEMS
--(
--    ORDER_ITEM_ID INT IDENTITY (1,1) PRIMARY KEY,
--    QUANTITY      INT,
--    PRICE         DECIMAL(18, 2),
--    PRODUCT_ID    INT,
--    ORDER_ID      INT,
--    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS (ORDER_ID),
--    FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS (PRODUCT_ID)
--);
--
--create TABLE INVENTORIES
--(
--    PRODUCT_ID INT PRIMARY KEY,
--    QUANTITY   INT
--);
--
--create TABLE REVIEWS
--(
--    REVIEW_ID   INT IDENTITY (1,1) PRIMARY KEY,
--    RATING      INT,
--    comment     NVARCHAR(MAX),
--    PRODUCT_ID  INT,
--    CUSTOMER_ID INT,
--    FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS (PRODUCT_ID),
--    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS (CUSTOMER_ID)
--);


insert into CATEGORIES (CATEGORY_NAME)
values
('iPhone'),
('Samsung'),

-- Laptop
('Mac'),
('ASUS'),

-- Sound
('Bluetooh')




-- Chèn dữ liệu vào bảng Product
insert into PRODUCTS ( NAME, DESCRIPTION, PRICE, CATEGORY_ID, CREATED_AT, UPDATED_AT)
values

-- Telephone !
-- Iphone

(N'iPhone 14 Pro Max 128GB  | Chính hãng VN/A', N'Máy mới 100% , chính hãng Apple Việt Nam. TechStore hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam, Hộp, Sách hướng dẫn, Cây lấy sim, Cáp Lightning - Type C 1 ĐỔI 1 trong 30 ngày nếu có lỗi phần cứng nhà sản xuất. Bảo hành 12 tháng tại trung tâm bảo hành chính hãng Apple : Điện Thoại Vui ASP (Apple Authorized Service Provider)',  26440000, 1,'2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(N'iPhone 13 Pro Max 128GB  | Chính hãng VN/A', N'Máy mới 100% , chính hãng Apple Việt Nam. TechStore hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam, Hộp, Sách hướng dẫn, Cây lấy sim, Cáp Lightning - Type C 1 ĐỔI 1 trong 30 ngày nếu có lỗi phần cứng nhà sản xuất. Bảo hành 12 tháng tại trung tâm bảo hành chính hãng Apple : Điện Thoại Vui ASP (Apple Authorized Service Provider)',  24590000, 1, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(N'iPhone 11 Pro Max 128GB  | Chính hãng VN/A', N'Máy mới 100% , chính hãng Apple Việt Nam. TechStore hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam, Hộp, Sách hướng dẫn, Cây lấy sim, Cáp Lightning - Type C 1 ĐỔI 1 trong 30 ngày nếu có lỗi phần cứng nhà sản xuất. Bảo hành 12 tháng tại trung tâm bảo hành chính hãng Apple : Điện Thoại Vui ASP (Apple Authorized Service Provider)',  10280000, 1, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(N'iPhone 14  Pro Max 256GB | Chính hãng VN/A', N'Máy mới 100% , chính hãng Apple Việt Nam. TechStore hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam, Hộp, Sách hướng dẫn, Cây lấy sim, Cáp Lightning - Type C 1 ĐỔI 1 trong 30 ngày nếu có lỗi phần cứng nhà sản xuất. Bảo hành 12 tháng tại trung tâm bảo hành chính hãng Apple : Điện Thoại Vui ASP (Apple Authorized Service Provider)', 27500000, 1, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(N'iPhone 12  Pro Max 128GB | Chính hãng VN/A', N'Máy mới 100% , chính hãng Apple Việt Nam. TechStore hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam, Hộp, Sách hướng dẫn, Cây lấy sim, Cáp Lightning - Type C 1 ĐỔI 1 trong 30 ngày nếu có lỗi phần cứng nhà sản xuất. Bảo hành 12 tháng tại trung tâm bảo hành chính hãng Apple : Điện Thoại Vui ASP (Apple Authorized Service Provider', 20500000, 1, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(N'iPhone 13  Pro Max 256GB | Chính hãng VN/A', N'Máy mới 100% , chính hãng Apple Việt Nam. TechStore hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam, Hộp, Sách hướng dẫn, Cây lấy sim, Cáp Lightning - Type C 1 ĐỔI 1 trong 30 ngày nếu có lỗi phần cứng nhà sản xuất. Bảo hành 12 tháng tại trung tâm bảo hành chính hãng Apple : Điện Thoại Vui ASP (Apple Authorized Service Provider', 20500000, 1, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(N'iPhone 13  Pro Max 526GB | Chính hãng VN/A', N'Máy mới 100% , chính hãng Apple Việt Nam. TechStore hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam, Hộp, Sách hướng dẫn, Cây lấy sim, Cáp Lightning - Type C 1 ĐỔI 1 trong 30 ngày nếu có lỗi phần cứng nhà sản xuất. Bảo hành 12 tháng tại trung tâm bảo hành chính hãng Apple : Điện Thoại Vui ASP (Apple Authorized Service Provider', 27500000, 1, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),

-- Samsung

(N'Samsung Galaxy M14 5G 4GB 128GB', N'Máy mới 100% , chính hãng Samsung Việt Nam. TechStore hiện là đại lý bán lẻ uỷ quyền Samsung chính hãng VN/A của Samsung Việt Nam', 27500000, 2, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(N'Samsung Galaxy Z Flip4 128GB', N'Máy mới 100% , chính hãng Samsung Việt Nam. TechStore hiện là đại lý bán lẻ uỷ quyền Samsung chính hãng VN/A của Samsung Việt Nam', 17500000, 2, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(N'Samsung Galaxy Z Fold4', N'Máy mới 100% , chính hãng Samsung Việt Nam. TechStore hiện là đại lý bán lẻ uỷ quyền Samsung chính hãng VN/A của Samsung Việt Nam', 31760000, 2, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(N'Samsung Galaxy Z Fold3 5G', N'Máy mới 100% , chính hãng Samsung Việt Nam. TechStore hiện là đại lý bán lẻ uỷ quyền Samsung chính hãng VN/A của Samsung Việt Nam', 22990000, 2, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(N'Samsung Galaxy Z Fold4 512GB', N'Máy mới 100% , chính hãng Samsung Việt Nam. TechStore hiện là đại lý bán lẻ uỷ quyền Samsung chính hãng VN/A của Samsung Việt Nam', 31516000, 2, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),


--Laptop !
-- Mac

(N'Apple MacBook Air M1 256GB 2020 I Chính hãng Apple Việt Nam', N'Máy mới 100%, đầy đủ phụ kiện từ nhà sản xuất. Sản phẩm có mã SA/A (được Apple Việt Nam phân phối chính thức).', 18490000 , 3, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(N'Apple Macbook Air M2 2022 8GB 256GB I Chính hãng Apple Việt Nam', N'Máy mới 100%, đầy đủ phụ kiện từ nhà sản xuất. Sản phẩm có mã SA/A (được Apple Việt Nam phân phối chính thức).', 27690000, 3, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(N'Mac mini M2 2023 (8 CPU - 10 GPU - 8GB - 256GB) | Chính hãng Apple Việt Nam', N'Máy mới 100%, đầy đủ phụ kiện từ nhà sản xuất. Sản phẩm có mã SA/A (được Apple Việt Nam phân phối chính thức).', 14790000, 3, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(N'Apple Macbook Pro 13 M2 2022 8GB 256GB I Chính hãng Apple Việt Nam', N'Máy mới 100%, đầy đủ phụ kiện từ nhà sản xuất. Sản phẩm có mã SA/A (được Apple Việt Nam phân phối chính thức).', 28800000, 3, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(N'MacBook Pro 14 inch M2 Pro 2023 (10 CPU - 16 GPU - 16GB - 512GB)', N'Máy mới 100%, đầy đủ phụ kiện từ nhà sản xuất. Sản phẩm có mã SA/A (được Apple Việt Nam phân phối chính thức).', 48590000, 3, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(N'Apple Macbook Air M2 2022 16GB 256GB I Chính hãng Apple Việt Nam', N'Máy mới 100%, đầy đủ phụ kiện từ nhà sản xuất. Sản phẩm có mã SA/A (được Apple Việt Nam phân phối chính thức).', 33690000, 3, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),


-- ASUS

(N'Laptop ASUS Gaming TUF FX506LHB-HN188W', N'Nguyên hộp, đầy đủ phụ kiện từ nhà sản suất Bảo hành pin 12 tháng,Bảo hành 24 tháng tại trung tâm bảo hành Chính hãng. 1 đổi 1 trong 30 ngày nếu có lỗi phần cứng từ nhà sản xuất.', 15590000, 4, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(N'Laptop ASUS Gaming ROG Strix G15 G513RM-HQ055W', N'Nguyên hộp, đầy đủ phụ kiện từ nhà sản suất Bảo hành pin 12 tháng,Bảo hành 24 tháng tại trung tâm bảo hành Chính hãng. 1 đổi 1 trong 30 ngày nếu có lỗi phần cứng từ nhà sản xuất.', 33690000, 4, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(N'Laptop Asus Zenbook 14X UM5401QA KN209W', N'Nguyên hộp, đầy đủ phụ kiện từ nhà sản suất Bảo hành pin 12 tháng,Bảo hành 24 tháng tại trung tâm bảo hành Chính hãng. 1 đổi 1 trong 30 ngày nếu có lỗi phần cứng từ nhà sản xuất.', 18490000, 4, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(N'Laptop ASUS TUF DASH Gaming F15 FX517ZC-HN079W', N'Nguyên hộp, đầy đủ phụ kiện từ nhà sản suất Bảo hành pin 12 tháng,Bảo hành 24 tháng tại trung tâm bảo hành Chính hãng. 1 đổi 1 trong 30 ngày nếu có lỗi phần cứng từ nhà sản xuất.', 20790000, 4, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(N'Laptop Asus Vivobook X415MA-BV451W', N'Nguyên hộp, đầy đủ phụ kiện từ nhà sản suất Bảo hành pin 12 tháng,Bảo hành 24 tháng tại trung tâm bảo hành Chính hãng. 1 đổi 1 trong 30 ngày nếu có lỗi phần cứng từ nhà sản xuất.', 6900000, 4, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(N'Laptop Asus Gaming Rog Strix G15 G513IH HN015W', N'Nguyên hộp, đầy đủ phụ kiện từ nhà sản suất Bảo hành pin 12 tháng,Bảo hành 24 tháng tại trung tâm bảo hành Chính hãng. 1 đổi 1 trong 30 ngày nếu có lỗi phần cứng từ nhà sản xuất.', 33690000, 4, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),

-- Sound
-- Bluetooh
(N'Tai nghe Bluetooth Apple AirPods 2 VN/A', N'Hàng chính hãng Apple Việt Nam, Mới Hộp sạc và tai nghe, Cáp Lightning, Sách hướng dẫn, Bảo hành 12 tháng chính hãng 1 đổi 1 trong 15 ngày nếu có lỗi phần cứng từ NSX.', 2640000, 5, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(N'Tai nghe không dây Samsung Galaxy Buds2', N'Hàng chính hãng Apple Việt Nam, Mới Hộp sạc và tai nghe, Cáp Lightning, Sách hướng dẫn, Bảo hành 12 tháng chính hãng 1 đổi 1 trong 15 ngày nếu có lỗi phần cứng từ NSX.', 1390000, 5, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(N'Tai nghe Bluetooth Apple AirPods Pro 2022 | Chính hãng Apple Việt Nam', N'Hàng chính hãng Apple Việt Nam, Mới Hộp sạc và tai nghe, Cáp Lightning, Sách hướng dẫn, Bảo hành 12 tháng chính hãng 1 đổi 1 trong 15 ngày nếu có lỗi phần cứng từ NSX.', 5900000, 5, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(N'Tai nghe Bluetooth Apple AirPods 3 MagSafe | Chính hãng Apple Việt Nam', N'Hàng chính hãng Apple Việt Nam, Mới Hộp sạc và tai nghe, Cáp Lightning, Sách hướng dẫn, Bảo hành 12 tháng chính hãng 1 đổi 1 trong 15 ngày nếu có lỗi phần cứng từ NSX.', 4900000, 5, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(N'Tai nghe không dây Marshall Minor 3', N'Hàng chính hãng Apple Việt Nam, Mới Hộp sạc và tai nghe, Cáp Lightning, Sách hướng dẫn, Bảo hành 12 tháng chính hãng 1 đổi 1 trong 15 ngày nếu có lỗi phần cứng từ NSX.', 2890000, 5, '2023-05-19 10:00:00', '2023-05-19 10:00:00'),
(N'Tai nghe không dây Havit TW 967', N'Hàng chính hãng Apple Việt Nam, Mới Hộp sạc và tai nghe, Cáp Lightning, Sách hướng dẫn, Bảo hành 12 tháng chính hãng 1 đổi 1 trong 15 ngày nếu có lỗi phần cứng từ NSX.', 290000, 5, '2023-05-19 10:00:00', '2023-05-19 10:00:00');




