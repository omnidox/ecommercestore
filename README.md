# **Ironmanstore2 - E-commerce Store**

## **Overview**
`Ironmanstore2` is a comprehensive e-commerce platform dedicated to Iron Man merchandise. The repository is meticulously structured to cater to both administrative functionalities and buyer interactions, ensuring a seamless shopping experience.

## **Technologies Used**
- **PHP**: The primary server-side scripting language used for web development and business logic.
- **MySQL**: The relational database management system used for storing product, user, and transaction data.

## **Admin Functionality**
The Admin section is the backbone of the store, providing essential tools for store management.

### **Key Features:**
- **Login & Dashboard**: Admins can [log in](https://github.com/omnidox/ecommercestore/blob/main/Ironmanstore2/Admin/Admin_Login.php) and access a comprehensive [dashboard](https://github.com/omnidox/ecommercestore/blob/main/Ironmanstore2/Admin/dashboard.php) for store oversight.
  
- **User Management**: Admins have the capability to [manage users](https://github.com/omnidox/ecommercestore/blob/main/Ironmanstore2/Admin/admin_user_management.php), assign roles, and even [convert users to employees](https://github.com/omnidox/ecommercestore/blob/main/Ironmanstore2/Admin/Owner_make_user_to_employee.php).
  
- **Database Management**: The [iron_man_databse.sql](https://github.com/omnidox/ecommercestore/blob/main/Ironmanstore2/Admin/iron_man_databse.sql) file provides the SQL structure for the store, ensuring data integrity and security.

- **Logout & Session Management**: Admins can securely [log out](https://github.com/omnidox/ecommercestore/blob/main/Ironmanstore2/Admin/logout.php), ensuring sessions are managed securely.

## **Buyers Functionality**
The Buyers section is designed to provide a user-friendly shopping experience.

### **Key Features:**
- **Login & Dashboard**: Buyers can [log in](https://github.com/omnidox/ecommercestore/blob/main/Ironmanstore2/Buyers/Buyer_Login.php) and view their personalized [dashboard](https://github.com/omnidox/ecommercestore/blob/main/Ironmanstore2/Buyers/dashboard.php).
  
- **Product Browsing**: A dedicated [product page](https://github.com/omnidox/ecommercestore/blob/main/Ironmanstore2/Buyers/Product_page.php) showcases available merchandise, with detailed views and descriptions.
  
- **Shopping Cart**: Buyers can add items to their [shopping cart](https://github.com/omnidox/ecommercestore/blob/main/Ironmanstore2/Buyers/shopping_cart.php) and view selected items before purchase.
  
- **Checkout**: A seamless [checkout process](https://github.com/omnidox/ecommercestore/blob/main/Ironmanstore2/Buyers/checkout.php) ensures quick and secure transactions.

- **Search**: The [search_results.php](https://github.com/omnidox/ecommercestore/blob/main/Ironmanstore2/Buyers/search_results.php) aids buyers in finding specific products.

- **Logout**: Buyers can securely [log out](https://github.com/omnidox/ecommercestore/blob/main/Ironmanstore2/Buyers/logout.php) after their shopping session.

## **Database Configuration**
For detailed database credentials and configurations, please refer to the [Database credentials.txt](https://github.com/omnidox/ecommercestore/blob/main/Ironmanstore2/Database%20credentials.txt) file. Ensure to keep this information secure and avoid public exposure.

