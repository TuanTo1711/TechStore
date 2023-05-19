CREATE DATABASE TechStore
go
USE TechStore
go

CREATE TABLE Users
(
    id INT PRIMARY KEY IDENTITY,
    email NVARCHAR(255),
    [name] NVARCHAR(50),
    [password] NVARCHAR(MAX),
    create_at DATETIME,
    update_at DATETIME,
    delete_at DATETIME,
    [point] FLOAT
)

CREATE TABLE Cart (
    cart_id INT PRIMARY KEY IDENTITY,
    user_id INT,
    product_id BIGINT,
    quantity INT,
    CONSTRAINT FK_cart_user FOREIGN KEY (user_id) REFERENCES [Users] (id),
    CONSTRAINT FK_cart_product FOREIGN KEY (product_id) REFERENCES Product (id)
)


CREATE TABLE Category
(
    id NVARCHAR(255) PRIMARY KEY,
    [description] NVARCHAR(MAX),
)

CREATE TABLE Product
(
    id BIGINT PRIMARY KEY NOT NULL,
    [name] NVARCHAR(255),
    category_id NVARCHAR(255),
    price MONEY,
    sale_off INT,
    create_at DATETIME2,
    update_at DATETIME2,
    -- FOREIGN KEY (category_id) REFERENCES Category(id)
)

CREATE TABLE Comment
(
    id BIGINT PRIMARY KEY  NOT NULL,
    product_id BIGINT ,
    [name] NVARCHAR(255),
    content NVARCHAR(MAX),
    rating int,
    FOREIGN KEY (product_id) REFERENCES Product(id)
)

-- Thêm dữ liệu vào bảng Category
INSERT INTO Category (id, [description])
VALUES ('laptop', 'Laptop category'),
       ('mobile', 'Mobile category');


-- Thêm dữ liệu vào bảng Product
INSERT INTO Product (id, [name], category_id, price, sale_off, create_at, update_at)
VALUES (1, 'Laptop A', 'laptop', 1000, 10, '2023-05-18', '2023-05-18'),
       (2, 'Mobile B', 'mobile', 500, 5, '2023-05-18', '2023-05-18');

-- Thêm dữ liệu vào bảng Comment
INSERT INTO Comment (id, product_id, [name], content, rating)
VALUES (1, 1, 'User1', 'Great laptop!', 5),
       (2, 2, 'User2', 'Nice mobile!', 4);

INSERT INTO Users (id, email, [name], [password], create_at, update_at, delete_at, [point])
VALUES
    (1, 'user1@example.com', 'Yuuta', '123', GETDATE(), GETDATE(), NULL, 100.0),
    (2, 'user2@example.com', 'Rin', '123', GETDATE(), GETDATE(), NULL, 200.0),
    (3, 'user3@example.com', 'Khoi', '123', GETDATE(), GETDATE(), NULL, 300.0),
    (4, 'user4@example.com', 'Cuong', '123', GETDATE(), GETDATE(), NULL, 400.0),
    (5, 'user5@example.com', 'Seele', '123', GETDATE(), GETDATE(), NULL, 500.0),
    (6, 'user6@example.com', 'Bryonya', '123', GETDATE(), GETDATE(), NULL, 600.0),
    (7, 'user7@example.com', 'Honkai', '123', GETDATE(), GETDATE(), NULL, 700.0),
    (8, 'user8@example.com', 'Wibu', '123', GETDATE(), GETDATE(), NULL, 800.0);



SELECT * FROM Comment
SELECT * FROM Users
DROP DATABASE TechStore

