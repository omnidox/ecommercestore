CREATE TABLE `User` (
    `UserID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Fname` VARCHAR(255) NOT NULL,
    `Mname` VARCHAR(255) NOT NULL,
    `Lname` VARCHAR(255) NOT NULL,
    `Password` CHAR(60) NOT NULL,
    -- Use CHAR instead of VARCHAR for fixed-length strings
    `phone_number` VARCHAR(20) NOT NULL,
    `user_name` VARCHAR(255) NOT NULL,
    `country` VARCHAR(255) NOT NULL,
    `state` CHAR(2) NOT NULL,
    -- Use CHAR for US state abbreviations
    `Zip_Code` CHAR(10) DEFAULT 'NA',
    `Street_Number` CHAR(10) DEFAULT 'NA',
    `Street_Name` VARCHAR(255) DEFAULT 'NA',
    `City` VARCHAR(255) DEFAULT 'NA',
    `Apt_No` CHAR(10) DEFAULT 'NA',
    `user_img_url` VARCHAR(255),
    PRIMARY KEY (`UserID`),
    UNIQUE KEY `user_name_unique` (`user_name`) -- Add a unique key for the user_name column
);

CREATE TABLE `Admin` (
    `Admin_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `User_id_FK` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`Admin_ID`),
    FOREIGN KEY (`User_id_FK`) REFERENCES `User` (`UserID`)
);

CREATE TABLE `Owner` (
    `OwnerID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `UserID_FK` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`OwnerID`),
    FOREIGN KEY (`UserID_FK`) REFERENCES `User` (`UserID`)
);

CREATE TABLE `Employee` (
    `Employee_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id_FK` INT UNSIGNED NOT NULL,
    `SSN` CHAR(9) NOT NULL,
    -- Use CHAR for fixed-length strings
    `owner_ID_FK` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`Employee_ID`),
    FOREIGN KEY (`user_id_FK`) REFERENCES `User` (`UserID`),
    FOREIGN KEY (`owner_ID_FK`) REFERENCES `Owner` (`OwnerID`)
);

CREATE TABLE `Buyer` (
    `BuyerID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `UserID_FK` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`BuyerID`),
    FOREIGN KEY (`UserID_FK`) REFERENCES `User` (`UserID`)
);

CREATE TABLE `admin_manage_user` (
    `Admin_id_fk` INT UNSIGNED NOT NULL,
    `User_ID_FK` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`Admin_id_fk`, `User_ID_FK`),
    FOREIGN KEY (`Admin_id_fk`) REFERENCES `Admin` (`Admin_ID`),
    FOREIGN KEY (`User_ID_FK`) REFERENCES `User` (`UserID`)
);

CREATE TABLE `Product_Category` (
    `Category_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    -- Add AUTO_INCREMENT to Category_ID
    `Name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`Category_ID`)
);

CREATE TABLE `Product` (
    `Product_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Product_Description` TEXT,
    -- TEXT data type does not require a length parameter
    `Name` VARCHAR(255) NOT NULL,
    `img_url` VARCHAR(255) NOT NULL DEFAULT 'Insert_Image_url',
    -- Change default value to a non-empty string
    `Rating` CHAR(2) NOT NULL DEFAULT 'NA',
    -- Use CHAR for fixed-length strings and update default value
    `Price` DECIMAL(10, 2) NOT NULL DEFAULT '0.00',
    `Quantity` INT(10) NOT NULL DEFAULT '0',
    `Prod_Cat_ID_FK` INT UNSIGNED NOT NULL,
    `OwnerID_FK` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`Product_ID`),
    FOREIGN KEY (`Prod_Cat_ID_FK`) REFERENCES `Product_Category` (`Category_ID`),
    FOREIGN KEY (`OwnerID_FK`) REFERENCES `Owner` (`OwnerID`)
);

CREATE TABLE `user_views_product` (
    `Product_id_FK` INT UNSIGNED NOT NULL,
    `User_ID_FK` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`Product_id_FK`, `User_ID_FK`),
    FOREIGN KEY (`Product_id_FK`) REFERENCES `Product` (`Product_ID`),
    FOREIGN KEY (`User_ID_FK`) REFERENCES `User` (`UserID`)
);

CREATE TABLE `Order` (
    `OrderID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Total_cost` INT NOT NULL,
    `Price_after_tax` INT NOT NULL,
    `Price_before_tax` INT NOT NULL,
    `Tax_calculated` INT NOT NULL,
    `Timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    `Country` VARCHAR(255) NOT NULL,
    -- Specify the length of VARCHAR columns
    `State` VARCHAR(255) NOT NULL,
    `Zip_code` CHAR(6) NOT NULL,
    -- Use CHAR for fixed-length strings
    PRIMARY KEY (`OrderID`)
);

CREATE TABLE `Product_Page` (
    `Page_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`Page_ID`)
);

CREATE TABLE `Previous_order_page` (
    `Page_order_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Buyer_ID_FK` INT UNSIGNED NOT NULL,
    `Total_Cost` DECIMAL(10, 2) DEFAULT 0.00,
    -- Specify number of digits and decimal places
    `OrderID_FK` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`Page_order_ID`),
    FOREIGN KEY (`Buyer_ID_FK`) REFERENCES `Buyer` (`BuyerID`),
    FOREIGN KEY (`OrderID_FK`) REFERENCES `Order` (`OrderID`)
);

CREATE TABLE `EMP_Ship_Orders` (
    `EMP_ID_FK` INT UNSIGNED NOT NULL,
    `ORDER_ID_FK` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`EMP_ID_FK`, `ORDER_ID_FK`),
    FOREIGN KEY (`EMP_ID_FK`) REFERENCES `Employee` (`Employee_ID`),
    FOREIGN KEY (`ORDER_ID_FK`) REFERENCES `Order` (`OrderID`)
);

CREATE TABLE `EMP_Manage_Order_Page` (
    `EMP_ID_FK` INT UNSIGNED NOT NULL,
    `ORDER_page_ID_FK` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`EMP_ID_FK`, `ORDER_page_ID_FK`),
    FOREIGN KEY (`EMP_ID_FK`) REFERENCES `Employee` (`Employee_ID`),
    FOREIGN KEY (`ORDER_page_ID_FK`) REFERENCES `previous_order_Page` (`Page_order_ID`)
);

CREATE TABLE `Shopping_Cart` (
    `Buyer_ID_FK` INT UNSIGNED NOT NULL,
    `SC_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Total_Cost` DECIMAL(20, 2) NOT NULL DEFAULT '0.00',
    `Prod_Key_FK` INT UNSIGNED NOT NULL,
    `Quantity` INT UNSIGNED NOT NULL DEFAULT '1',
    PRIMARY KEY (`SC_ID`),
    FOREIGN KEY (`Buyer_ID_FK`) REFERENCES `User` (`UserID`),
    FOREIGN KEY (`Prod_Key_FK`) REFERENCES `Product` (`Product_ID`)
);

CREATE TABLE `Employee_Buyer_Relation` (
    `Employee_ID_FK` INT UNSIGNED NOT NULL,
    `Buyer_ID_FK` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`Employee_ID_FK`, `Buyer_ID_FK`),
    FOREIGN KEY (`Employee_ID_FK`) REFERENCES `Employee` (`Employee_ID`),
    FOREIGN KEY (`Buyer_ID_FK`) REFERENCES `Buyer` (`BuyerID`)
);

CREATE TABLE `Buyer_buys_product` (
    `Product_ID_FK` INT UNSIGNED NOT NULL,
    `Buyer_ID_FK` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`Product_ID_FK`, `Buyer_ID_FK`),
    FOREIGN KEY (`Product_ID_FK`) REFERENCES `Product` (`Product_ID`),
    FOREIGN KEY (`Buyer_ID_FK`) REFERENCES `Buyer` (`BuyerID`)
);

CREATE TABLE `Invoice` (
    `Invoice_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Order_ID_FK` INT UNSIGNED NOT NULL,
    `Buyer_ID_FK` INT UNSIGNED NOT NULL,
    `Product_key_FK` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`Invoice_ID`),
    FOREIGN KEY (`Order_ID_FK`) REFERENCES `Order` (`OrderID`),
    FOREIGN KEY (`Buyer_ID_FK`) REFERENCES `Buyer` (`BuyerID`),
    FOREIGN KEY (`Product_key_FK`) REFERENCES `Product` (`Product_ID`)
);



CREATE TABLE `Order_per_page` (
    `Order_Page_ID_FK` INT UNSIGNED NOT NULL,
    `Order_ID_FK` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`Order_Page_ID_FK`, `Order_ID_FK`),
    FOREIGN KEY (`Order_Page_ID_FK`) REFERENCES `Previous_order_page` (`Page_order_ID`),
    FOREIGN KEY (`Order_ID_FK`) REFERENCES `Order` (`OrderID`)
);

CREATE TABLE `Purchased_By` (
    `Buyer_ID_FK` INT UNSIGNED NOT NULL,
    `Product_ID_FK` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`Buyer_ID_FK`, `Product_ID_FK`),
    FOREIGN KEY (`Buyer_ID_FK`) REFERENCES `Buyer` (`BuyerID`),
    FOREIGN KEY (`Product_ID_FK`) REFERENCES `Product` (`Product_ID`)
);

CREATE TABLE `Cart_Contents_Fill` (
    `Product_ID_FK` INT UNSIGNED NOT NULL,
    `Buyer_ID_FK` INT UNSIGNED NOT NULL,
    `Cart_ID_FK` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`Cart_ID_FK`),
    FOREIGN KEY (`Product_ID_FK`) REFERENCES `Product` (`Product_ID`),
    FOREIGN KEY (`Buyer_ID_FK`) REFERENCES `Buyer` (`BuyerID`)
);

CREATE TABLE `Product_Per_Page` (
    `Product_Page_ID_FK` INT UNSIGNED NOT NULL,
    `Product_ID_FK` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`Product_Page_ID_FK`, `Product_ID_FK`),
    FOREIGN KEY (`Product_Page_ID_FK`) REFERENCES `Product_Page` (`Page_ID`),
    FOREIGN KEY (`Product_ID_FK`) REFERENCES `Product` (`Product_ID`)
);

CREATE TABLE `Product_Per_Order` (
    `Order_ID_FK` INT UNSIGNED NOT NULL,
    `Product_ID_FK` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`Order_ID_FK`, `Product_ID_FK`),
    FOREIGN KEY (`Order_ID_FK`) REFERENCES `Order` (`OrderID`),
    FOREIGN KEY (`Product_ID_FK`) REFERENCES `Product` (`Product_ID`)
);