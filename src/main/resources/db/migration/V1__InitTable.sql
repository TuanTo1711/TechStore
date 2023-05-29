CREATE TABLE CUSTOMERS
(
    CUSTOMER_ID   INT IDENTITY (1,1) PRIMARY KEY,
    NAME          NVARCHAR(255) NOT NULL,
    EMAIL         NVARCHAR(255) NOT NULL,
    PASSWORD      NVARCHAR(255) NOT NULL,
    VERIFICATION  BIT           NOT NULL,
    PHONE         NVARCHAR(20),
    ADDRESS       NVARCHAR(255),
    REWARD_POINTS FLOAT,
    CREATED_AT    DATETIME DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT    DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ADMINISTRATORS
(
    ADMIN_ID   INT IDENTITY (1,1) PRIMARY KEY,
    NAME       NVARCHAR(255),
    EMAIL      NVARCHAR(255),
    PASSWORD   NVARCHAR(255),
    CREATED_AT DATETIME DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE JWT_TOKEN
(
    JWT_TOKEN_ID INT IDENTITY (1,1) PRIMARY KEY,
    TOKEN        NVARCHAR(MAX) NOT NULL,
    CREATED_AT   DATETIME DEFAULT CURRENT_TIMESTAMP,
    EXPIRED_AT   DATETIME DEFAULT DATEADD(MINUTE, 30, GETDATE()),
    CONFIRM_AT   DATETIME,
    CUSTOMER_ID  INT
);

CREATE TABLE CATEGORIES
(
    CATEGORY_ID    INT IDENTITY (1,1) PRIMARY KEY,
    CATEGORY_NAME  NVARCHAR(255),
    CATEGORY_BRAND NVARCHAR(255)
);

CREATE TABLE PRODUCTS
(
    PRODUCT_ID  INT IDENTITY (1,1) PRIMARY KEY,
    NAME        NVARCHAR(255),
    DESCRIPTION NVARCHAR(MAX),
    PRICE       DECIMAL(18, 2),
    CATEGORY_ID INT,
    CREATED_AT  DATETIME DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT  DATETIME DEFAULT CURRENT_TIMESTAMP,
    DELETE_AT   DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORIES (CATEGORY_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PAYMENTS
(
    PAYMENT_ID INT IDENTITY (1,1) PRIMARY KEY,
    METHOD     NVARCHAR(255)
);

CREATE TABLE SHIPPING
(
    SHIPPING_ID INT IDENTITY (1,1) PRIMARY KEY,
    METHOD      NVARCHAR(255)
);

CREATE TABLE ORDERS
(
    ORDER_ID     INT IDENTITY (1,1) PRIMARY KEY,
    CUSTOMER_ID  INT,
    ORDER_DATE   DATETIME,
    TOTAL_AMOUNT DECIMAL(18, 2),
    PAYMENT_ID   INT,
    SHIPPING_ID  INT,
    CREATED_AT   DATETIME DEFAULT CURRENT_TIMESTAMP,
    UPDATED_AT   DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS (CUSTOMER_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (PAYMENT_ID) REFERENCES PAYMENTS (PAYMENT_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (SHIPPING_ID) REFERENCES SHIPPING (SHIPPING_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ORDER_ITEMS
(
    ORDER_ITEM_ID INT IDENTITY (1,1) PRIMARY KEY,
    QUANTITY      INT,
    PRICE         DECIMAL(18, 2),
    PRODUCT_ID    INT,
    ORDER_ID      INT,
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS (ORDER_ID),
    FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS (PRODUCT_ID)
);

CREATE TABLE INVENTORIES
(
    PRODUCT_ID INT PRIMARY KEY,
    QUANTITY   INT
);

CREATE TABLE REVIEWS
(
    REVIEW_ID   INT IDENTITY (1,1) PRIMARY KEY,
    RATING      INT,
    COMMENT     NVARCHAR(MAX),
    PRODUCT_ID  INT,
    CUSTOMER_ID INT,
    FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS (PRODUCT_ID),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS (CUSTOMER_ID)
);