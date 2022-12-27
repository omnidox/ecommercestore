-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2022 at 07:29 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iron_man_store1`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_ID` int(10) UNSIGNED NOT NULL,
  `User_id_FK` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Admin_ID`, `User_id_FK`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_manage_user`
--

CREATE TABLE `admin_manage_user` (
  `Admin_id_fk` int(10) UNSIGNED NOT NULL,
  `User_ID_FK` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

CREATE TABLE `buyer` (
  `BuyerID` int(10) UNSIGNED NOT NULL,
  `UserID_FK` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buyer`
--

INSERT INTO `buyer` (`BuyerID`, `UserID_FK`) VALUES
(1, 5),
(5, 12),
(12, 14);

-- --------------------------------------------------------

--
-- Table structure for table `buyer_buys_product`
--

CREATE TABLE `buyer_buys_product` (
  `Product_ID_FK` int(10) UNSIGNED NOT NULL,
  `Buyer_ID_FK` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_contents_fill`
--

CREATE TABLE `cart_contents_fill` (
  `Product_ID_FK` int(10) UNSIGNED NOT NULL,
  `Buyer_ID_FK` int(10) UNSIGNED NOT NULL,
  `Cart_ID_FK` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Employee_ID` int(10) UNSIGNED NOT NULL,
  `user_id_FK` int(10) UNSIGNED NOT NULL,
  `owner_ID_FK` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Employee_ID`, `user_id_FK`, `owner_ID_FK`) VALUES
(1, 3, 1),
(2, 4, 1),
(6, 16, 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee_buyer_relation`
--

CREATE TABLE `employee_buyer_relation` (
  `Employee_ID_FK` int(10) UNSIGNED NOT NULL,
  `Buyer_ID_FK` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emp_manage_order_page`
--

CREATE TABLE `emp_manage_order_page` (
  `EMP_ID_FK` int(10) UNSIGNED NOT NULL,
  `ORDER_page_ID_FK` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emp_ship_orders`
--

CREATE TABLE `emp_ship_orders` (
  `EMP_ID_FK` int(10) UNSIGNED NOT NULL,
  `ORDER_ID_FK` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `Invoice_ID` int(10) UNSIGNED NOT NULL,
  `Order_ID_FK` int(10) UNSIGNED NOT NULL,
  `Buyer_ID_FK` int(10) UNSIGNED NOT NULL,
  `Product_key_FK` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `OrderID` int(10) UNSIGNED NOT NULL,
  `total_cost` decimal(10,2) DEFAULT NULL,
  `Price_after_tax` decimal(10,2) DEFAULT NULL,
  `price_before_tax` decimal(10,2) DEFAULT NULL,
  `tax_calculated` decimal(10,2) DEFAULT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Country` varchar(255) NOT NULL,
  `State` varchar(255) NOT NULL,
  `Zip_code` char(6) NOT NULL,
  `street_number` int(10) UNSIGNED NOT NULL,
  `street_name` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `apt_no` int(10) UNSIGNED DEFAULT NULL,
  `Buyer_ID_FK` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`OrderID`, `total_cost`, `Price_after_tax`, `price_before_tax`, `tax_calculated`, `Timestamp`, `Country`, `State`, `Zip_code`, `street_number`, `street_name`, `city`, `apt_no`, `Buyer_ID_FK`) VALUES
(14, '49.00', '53.90', '49.00', '4.90', '2022-12-19 17:55:14', 'as', 'as', '23', 23, 'we', 'we', 23, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `Order_Item_ID` int(10) UNSIGNED NOT NULL,
  `Order_ID_FK` int(10) UNSIGNED NOT NULL,
  `Prod_Key_FK` int(10) UNSIGNED NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`Order_Item_ID`, `Order_ID_FK`, `Prod_Key_FK`, `Quantity`) VALUES
(45, 14, 3, 2),
(46, 14, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `order_per_page`
--

CREATE TABLE `order_per_page` (
  `Order_Page_ID_FK` int(10) UNSIGNED NOT NULL,
  `Order_ID_FK` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `OwnerID` int(10) UNSIGNED NOT NULL,
  `UserID_FK` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`OwnerID`, `UserID_FK`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `previous_order_page`
--

CREATE TABLE `previous_order_page` (
  `Page_order_ID` int(10) UNSIGNED NOT NULL,
  `Buyer_ID_FK` int(10) UNSIGNED NOT NULL,
  `Total_Cost` decimal(10,2) DEFAULT 0.00,
  `OrderID_FK` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_ID` int(10) UNSIGNED NOT NULL,
  `Product_Description` text,
  `Name` varchar(255) NOT NULL,
  `img_url` varchar(255) NOT NULL DEFAULT 'Insert_Image_url',
  `Rating` char(2) NOT NULL DEFAULT 'NA',
  `Price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `Quantity` int(10) NOT NULL DEFAULT 0,
  `Prod_Cat_ID_FK` int(10) UNSIGNED NOT NULL,
  `OwnerID_FK` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_ID`, `Product_Description`, `Name`, `img_url`, `Rating`, `Price`, `Quantity`, `Prod_Cat_ID_FK`, `OwnerID_FK`) VALUES
(1, 'This Iron Man T-shirt is ideal for followers of the superhero. This shirt is excellent for showing off your comic book inspired style, as it has a detailed print of the Iron Man emblem on a comfy and elegant 100% cotton tee. Whether youre sitting at home or going out with pals, this T-shirt will make you look and feel like your favorite superhero.', 't-shirts', 'https://www.fitnesstotem.com/wp-content/uploads/2022/02/YL_Iron_Man_B137-001_v1_01.jpg', 'NA', '8.46', 6, 1, 1),
(2, 'These trousers are ideal for everyday wear since they are made of a light-weight, breathable fabric and feature Iron Mans trademark color scheme of red, yellow, and black. They not only look beautiful, but they are also quite comfy, making them suitable for any activity. The Iron Man Pant is ideal for going for a run, going to the gym, or simply relaxing around the home. Show off your style while experiencing the strength of Iron Man!', 'Pants', 'https://m.media-amazon.com/images/I/81euNEJrnZL._AC_UY1000_.jpg', 'NA', '33.50', 19, 1, 1),
(3, 'Our Iron Man socks will take your feet to a new level of style and comfort. Theyll look great with any outfit, so why not treat your feet to these awesome superhero as socks. and get ready to soar to new heights with these incredible Iron Man socks!', 'Socks', 'https://i5.walmartimages.com/asr/2d123c88-222d-4ab7-8401-4085105e1ead.55e54097d11f1aca35231e0ed1126e0d.jpeg', 'NA', '12.25', 14, 1, 1),
(4, 'Your feet deserve to be treated like superheros it comes with a comfortable fit and stylish style, these iron man sneakers make you feel like a superhero with all over their iron man print. these trendy made from high quality ,and the edges will embrace your inner iron man and it will keep your feet looking and feeling wonderful no matter what adventure life throa you way. ', 'Shoes', 'https://i.ytimg.com/vi/lCey7ItfAeI/maxresdefault.jpg', 'NA', '69.57', 20, 1, 1),
(5, ' We discover iron man, the perfect companion to give your beach day a personal touch made from the softest cotton feature a vibrant image of ironman plus, htey are washable and fast drying, so you can keep up with your fastest beach run ', 'Towel', 'https://i5.walmartimages.com/asr/b328e7c0-7db3-4730-b9b9-bdff51d0cfcb.8de85cb2ecf1c1ad0f3c055dd6b0fe41.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF', 'NA', '15.58', 20, 1, 1),
(6, 'Make a sttatement as iconic of tony stark with himself with this iron man hoodie! we are featuring the classic iron man mask on chest its perfect to showing of your fandom. wear it around your hwole townn while showing off your fav superpowers and this material keeps you warm no matter what the weather like', 'Hoodies', 'https://m.media-amazon.com/images/I/61fsVwkO+uL._AC_SR175,263_QL70_.jpg', 'NA', '23.25', 20, 1, 1),
(7, 'this iron man saree will make you stand out! this saree is made of a light weeight, soft fabric that feels like amazing on your skin and the pattern features vibrant a iron man print. Perfect for any casual or any special occasion it will show off your fan moment of iron man this charming and fashionalble saree ', 'Iron Man Saree', 'https://pothysdress.s3.ap-south-1.amazonaws.com/1175731436_img0.jpg', 'NA', '60.00', 20, 1, 1),
(8, 'With this incredible iron man mask, you can transform into your favorite superhero! feauturing with a sleek design and an adjustable fit, this mask is ideal for any fan, wheather for a costume or a daily look.', 'Iron Man Mask', 'https://m.media-amazon.com/images/I/81w6jjXIzJL.jpg', 'NA', '39.22', 20, 2, 1),
(9, 'Introducing ironman upper body armor! this upper body frame assemble and show off your iconic hero. upper body armor cathing with multiple adjustable buckles and secure hooks included  you won;t have to about all ill-fitting costume. make your super hero dreams comes true.', 'Iron Man Upper Body Suit', 'https://cdn.shopify.com/s/files/1/0084/7901/4974/products/ironmanmusclekid_384x.jpg?v=1638493493', 'NA', '54.00', 20, 2, 1),
(10, 'Check out our ironman pants! these are comfortable and attractive its made with fabric,cotton so, you can move, jump,run,and relax knowing it won;t tear off it comes with a vibrant colours and classic.', 'Iron Man Pants', 'http://www.yankodesign.com/images/design_news/2018/04/phil-saunders-the-concept-artist-behind-the-iron-man-suit/saunders_4.jpg', 'NA', '40.00', 20, 2, 1),
(11, 'Makes your battle-gear complete with this iron man gloves. thi sleather material make syou so comfortable and easy to wear so, you won;t have to worry about any discomfort, Show off your superhero style and get ready for action with these iron man gloves. ', 'Iron Man Gloves', 'https://i.ebayimg.com/images/g/1tEAAOSwkJ5c46ia/s-l500.jpg', 'NA', '20.00', 20, 2, 1),
(12, 'This realsitic iron man arc reactor prop is the perfect way to your costume complete! what better way to become like like \"Marvels ironman with this awesome replicaiconic arc reactor for your costume amaxzing and unique look.', 'Iron Man Arc reactor prop', 'https://m.media-amazon.com/images/I/41Jw4cA4QaL._AC_SY1000_.jpg', 'NA', '15.58', 20, 2, 1),
(13, 'introducing iron man glasses it comes blue lens with 100% UV protection to safe from harmful  rays from sunlight. when you wear it feels like will you are a real ironman  ', 'Ironman Glasses', 'https://cdn.shopify.com/s/files/1/0073/7902/5978/products/Edith_Sunglasses_Tony_Stark_Lush_Crate_Eyewear_155db580-7993-400f-82ae-f9f98a47b0be_800x.png?v=1618643104', 'NA', '30.19', 20, 2, 1),
(14, 'Introducing the ironman repulsor attachment!  it comes with the powerful arc reactor in the core and the multiple repulsor discs that easily to attach your costume. ', 'Iron Man Repulsor attachment', 'https://www.therpf.com/forums/attachments/attachment-jpg.893535/', 'NA', '48.00', 20, 2, 1),
(15, 'Introducing ironman chairs, these chairs are up to the challange, made with duarble iron and featuring a heroic ironman theme. ', 'Chairs', 'https://i.pinimg.com/736x/5f/b8/29/5fb829c73800b629963ae21eaa1946de.jpg', 'NA', '19.65', 20, 3, 1),
(16, 'This ironman bed will help you little supper hero to get a great night sleep. your child can drift off to dereamland in true heroic fashion beacause to its durable structure, the ironman bed will be the ideal location for your kids.', 'Bed', 'https://m.media-amazon.com/images/I/91xd2aSUBeL._AC_UF894,1000_QL80_.jpg', 'NA', '80.00', 20, 3, 1),
(17, 'Introducing iron man carpet featuring a awesome design that will add a bold dose of style and personality to any room. ', 'Carpet', 'https://i.ebayimg.com/images/g/bMoAAOSwstlitFL6/s-l500.jpg', 'NA', '50.00', 20, 3, 1),
(18, 'This cutain is perfect for fans of the marvel superheros! the design will wont faid after multiple washes either. you can relive ironmans heroics every time you take a shower', 'Shower Curtain', 'https://www.superheroesbedding.com/wp-content/uploads/2018/09/Marvel-Avenger-Iron-Man-Dark-Theme-Shower-Curtain.jpg', 'NA', '30.25', 20, 3, 1),
(19, 'Let your super hero shine with this stylish ironman desk! with a sleek modern design, this desk sure to make heads turn.Stay organised and in stylish with one of a kind of ironman desk.', 'Desk', 'https://rukminim1.flixcart.com/image/416/416/ji3g70w0/kid-table/d/j/2/cedar-pine-devdar-st-1-ams-tables-brown-original-imaf5xwpgh6kmzpy.jpeg?q=70', 'NA', '50.25', 20, 3, 1),
(20, 'This ironman sofa will make any living room looks like a more heroic. its made with a high-quality of fabric and featuring a vibrant colours and inviite your frnds,relatives it feels like very comfortable while sit and watch ur favourite movies,games,etc., this is the perfect way to express your style show off your favourite marvel character.', 'Sofa', 'https://cdn.vox-cdn.com/thumbor/tUi3tnvHnqozLagRbOcSQ7EYaQY=/0x0:1920x1080/1200x800/filters:focal(807x387:1113x693)/cdn.vox-cdn.com/uploads/chorus_image/image/63657725/wallpaper_2778417.0.jpg', 'NA', '100.00', 20, 3, 1),
(21, 'Iron Man is one of the most well-known comic book characters. He is a millionaire businessman who designs and utilizes armor to combat injustice. His bravery and heroism has inspired millions of admirers to be courageous and brave in the face of hardship. Iron Man has come to represent not only justice and morality, but also hope for a better tomorrow. Iron Man has become a real emblem of courage because to his distinctive red and gold suit of armor and unbreakable attitude. Today, put on the suit and join him in his struggle for justice.', 'comics', 'https://c8.alamy.com/comp/MC76D2/collection-of-the-invincible-iron-man-vintage-marvel-comic-books-MC76D2.jpg', 'NA', '55.00', 20, 4, 1),
(22, 'This Iron Man action figure is the perfect addition to any superhero movie fans collection! Crafted with high quality materials, this figure captures all the details in Iron Mans armoured suit. His iconic headpiece, arc reactor, and glowing eyes will make this figure a standout display piece for your collection. Have fun re-enacting your favorite movie moments with Iron Man and other amazing Marvel characters!', 'movies', 'https://upload.wikimedia.org/wikipedia/en/0/02/Iron_Man_%282008_film%29_poster.jpg', 'NA', '23.25', 20, 4, 1),
(23, 'Introducing the amazing Iron Man! This iconic classic has been beloved by cartoon fans for many years. His heroic adventures are inspiring, exciting, and full of action and fun. Iron Man, with his lighthearted humor and unusual technical abilities, will be a welcome addition to any cartoon collection.', 'cartoons', 'https://i.ytimg.com/vi/0dpMM8CV7D8/maxresdefault.jpg', 'NA', '25.25', 20, 4, 1),
(24, 'Kids will love to press and spin the arms to hear popular Iron Man inspired soundtracks and power up their sound with the included accessories. Enjoy hours of audio fun, as Iron Man comes to life with sound effects and music. ', 'music', 'https://m.media-amazon.com/images/I/51vJXUvN41L._SY580_.jpg', 'NA', '25.00', 20, 4, 1),
(25, 'Our Iron Man posters will look fantastic on your walls! Theyre perfect for any Iron Man fans wall, whether you want to decorate your office or game room.', 'Posters', 'https://posterspy.com/wp-content/uploads/2018/02/IM-trilogy-ricojr-rvb.png', 'NA', '12.25', 20, 4, 1),
(26, 'The thrilling, action-packed game for lovers of superheroes! you may dress up as the renowned Iron Man and blast your way through difficult stages. In the online multiplayer mode, you may also put your talents to the test against other players. ', 'Games', 'https://m.media-amazon.com/images/I/71Ujzg47ogL.jpg', 'NA', '33.25', 20, 4, 1),
(27, 'Introducing ironman stickers! These stickers, which feature characters from the comic, film, and TV series, allow you to proclaim your passion for Iron Man loud and clear  Whether you are a fan of Tony Stark or one of his robotic minions, youll love these incredible Marvel Iron Man stickers.', 'Stickers', 'https://m.media-amazon.com/images/I/812yGdgxX4L.jpg', 'NA', '10.00', 20, 4, 1),
(28, 'Are you ready for a superhero challenge?  This 200 piece jigsaw puzzle is sure to excite any Marvel fan. Featuring a full-color image of Iron Man in all his glory, this puzzle is a great way to bring some superhero excitement to your home. Challenge yourself or share it with a friend, this puzzle is sure to be an awesome addition to your Marvel collection!', 'Puzzle', 'https://i5.walmartimages.com/asr/cc6068bc-a8fe-4855-94ef-f6ccff3c65f7_1.08036ff128007057d99bf24fe4eb2863.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF', 'NA', '21.25', 20, 4, 1),
(29, 'Iron Man Candies', 'Candies', 'https://www.sell2bbnovelties.com/mm5/funko/FKO_CDY_MV1_iron-man.jpg', 'NA', '10.00', 20, 5, 1),
(30, 'Iron man Chocolate', 'Chocolates', 'https://pbs.twimg.com/media/DfRaGxGX0AAxHrm.jpg', 'NA', '20.00', 20, 5, 1),
(31, 'Iron man Cereal', 'Cereal', 'http://walyou.com/wp-content/uploads//2014/10/Iron-Man.jpg', 'NA', '5.25', 20, 5, 1),
(32, 'Iron man soup', 'Soup', 'https://images.freshop.com/00051000128959/c8de7914c207bc4dc8b76abc8f8c1767_large.png', 'NA', '6.25', 20, 5, 1),
(33, 'Iron man pastries', 'Pastries', 'https://blogclan.katecary.co.uk/wp-content/uploads/2019/11/iron-man-cake-scaled.jpg', 'NA', '7.25', 20, 5, 1),
(34, 'iron man biscuits', 'Biscuits', 'https://i.pinimg.com/originals/90/a9/c8/90a9c85e192e8cd0f999e38e7ac9809d.jpg', 'NA', '23.25', 20, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `Category_ID` int(10) UNSIGNED NOT NULL,
  `Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`Category_ID`, `Name`) VALUES
(1, 'Apparel'),
(2, 'Cosplay Items'),
(3, 'Kids Furniture'),
(4, 'Media'),
(5, 'Food');

-- --------------------------------------------------------

--
-- Table structure for table `product_page`
--

CREATE TABLE `product_page` (
  `Page_ID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_per_order`
--

CREATE TABLE `product_per_order` (
  `Order_ID_FK` int(10) UNSIGNED NOT NULL,
  `Product_ID_FK` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_per_page`
--

CREATE TABLE `product_per_page` (
  `Product_Page_ID_FK` int(10) UNSIGNED NOT NULL,
  `Product_ID_FK` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchased_by`
--

CREATE TABLE `purchased_by` (
  `Buyer_ID_FK` int(10) UNSIGNED NOT NULL,
  `Product_ID_FK` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `Buyer_ID_FK` int(10) UNSIGNED NOT NULL,
  `SC_ID` int(10) UNSIGNED NOT NULL,
  `Total_Cost` decimal(20,2) NOT NULL DEFAULT 0.00,
  `Prod_Key_FK` int(10) UNSIGNED NOT NULL,
  `Quantity` int(10) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(10) UNSIGNED NOT NULL,
  `Fname` varchar(255) NOT NULL,
  `Mname` varchar(255) NOT NULL,
  `Lname` varchar(255) NOT NULL,
  `Password` char(60) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `state` char(2) NOT NULL,
  `Zip_Code` char(10) DEFAULT 'NA',
  `Street_Number` char(10) DEFAULT 'NA',
  `Street_Name` varchar(255) DEFAULT 'NA',
  `City` varchar(255) DEFAULT 'NA',
  `Apt_No` char(10) DEFAULT 'NA',
  `user_img_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `Fname`, `Mname`, `Lname`, `Password`, `phone_number`, `user_name`, `country`, `state`, `Zip_Code`, `Street_Number`, `Street_Name`, `City`, `Apt_No`, `user_img_url`) VALUES
(1, 'John', 'S.', 'Smith', '$2y$10$7SUuky6JV/ql/kZFyiG5je6MyubVU/ErRNqvh8L1tI0Pnpda3eAWS', '123-456-7890', 'johnsmith', 'United States', 'CA', '90210', '123', 'Main St.', 'Los Angeles', '3B', 'https://example.com/johnsmith.jpg'),
(2, 'Jane', '', 'Doe', '$2y$10$7SUuky6JV/ql/kZFyiG5je6MyubVU/ErRNqvh8L1tI0Pnpda3eAWS', '123-456-7890', 'jane.doe', 'United States', 'NY', '10001', '456', 'Broadway', 'New York', '2A', 'https://example.com/janedoe.jpg'),
(3, 'Bob', '', 'Johnson', '$2y$10$7SUuky6JV/ql/kZFyiG5je6MyubVU/ErRNqvh8L1tI0Pnpda3eAWS', '123-456-7890', 'bobjohnson', 'Canada', 'ON', 'M4B 1B3', '789', 'King St.', 'Toronto', '', 'https://example.com/bobjohnson.jpg'),
(4, 'Alice', '', 'Williams', '$2y$10$7SUuky6JV/ql/kZFyiG5je6MyubVU/ErRNqvh8L1tI0Pnpda3eAWS', '123-456-7890', 'alicewilliams', 'United States', 'FL', '33401', '321', 'Ocean Dr.', 'Miami', '1C', 'https://example.com/alicewilliams.jpg'),
(5, 'Maria', '', 'Rodriguez', '$2y$10$7SUuky6JV/ql/kZFyiG5je6MyubVU/ErRNqvh8L1tI0Pnpda3eAWS', '123-456-7890', 'maria.rodriguez', 'Mexico', '', '04569', '654', 'Avenida Juárez', 'Mexico City', '', 'https://example.com/mariarodriguez.jpg'),
(12, 'Rafael', '44', 'O Hidalgo', '$2y$10$DLhETeGbEo3CfTJkMx7mfez6GuBkw42IA.Szjs5ovDPa1XAWA73Ka', '18627039110', 'rafafafa', 'United States', 'NJ', '07017', '317 Glenwo', '1', 'East Orange', '44', 'NA'),
(14, 'Rafael', 'jacob', 'O Hidalgo', '$2y$10$jAzx/wkBv3tCD.XmPEPOA.5KsOJH/zh7vLsI/EbXalRQx0MyHhaXu', '18627039110', 'fff', 'United States', 'NJ', '07017', '317 Glenwo', '1', 'East Orange', '2', 'na'),
(16, 'reeb', 'rebe', 'ergerg', '$2y$10$9hhkIZz.apzQsUysSNf3IOdxOioLL3BXzB0MMtlfIzHPqEgIm7rhm', '9856624', 'rgn', 'vd', 'dg', '156', 'gbd', 'df', 'dfh', 'fdh', 'fh'),
(18, '$fname', '$mname', '$lname', '$password', '$phone_number', '$user_name', '$country', '$s', '$zip_code', '$street_nu', '$street_name', '$city', '$apt_no', '$user_img_url'),
(20, 'Rafael3333', 'cv', 'O Hidalgo', '$2y$10$g.4XoaSlzRAJcL8GXjnSgO50u66bz2LTjHzkonZfdtCsMw6tpmQFe', '18627039110', 'johnsmithcvvcv', 'United States', 'NJ', '07017', '317 Glenwo', '1', 'East Orange', '', ''),
(21, 'Rafael', 'rere', 'O Hidalgo', '$2y$10$WElEY.OrEYN67HYdePv3WuHHXP9Uf20y03/vCeNqE8AsTam/jmaby', '18627039110', 'johnsmithrererer', 'United States', 'NJ', '07017', '317 Glenwo', '1', 'East Orange', 'rere', 'reer');

-- --------------------------------------------------------

--
-- Table structure for table `user_views_product`
--

CREATE TABLE `user_views_product` (
  `Product_id_FK` int(10) UNSIGNED NOT NULL,
  `User_ID_FK` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_ID`),
  ADD UNIQUE KEY `User_id_FK` (`User_id_FK`);

--
-- Indexes for table `admin_manage_user`
--
ALTER TABLE `admin_manage_user`
  ADD PRIMARY KEY (`Admin_id_fk`,`User_ID_FK`),
  ADD KEY `admin_manage_user_ibfk_2` (`User_ID_FK`);

--
-- Indexes for table `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`BuyerID`),
  ADD UNIQUE KEY `UserID_FK` (`UserID_FK`);

--
-- Indexes for table `buyer_buys_product`
--
ALTER TABLE `buyer_buys_product`
  ADD PRIMARY KEY (`Product_ID_FK`,`Buyer_ID_FK`),
  ADD KEY `buyer_buys_product_ibfk_2` (`Buyer_ID_FK`);

--
-- Indexes for table `cart_contents_fill`
--
ALTER TABLE `cart_contents_fill`
  ADD PRIMARY KEY (`Cart_ID_FK`),
  ADD KEY `cart_contents_fill_ibfk_1` (`Product_ID_FK`),
  ADD KEY `cart_contents_fill_ibfk_2` (`Buyer_ID_FK`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Employee_ID`),
  ADD UNIQUE KEY `user_id_FK` (`user_id_FK`),
  ADD KEY `owner_ID_FK` (`owner_ID_FK`);

--
-- Indexes for table `employee_buyer_relation`
--
ALTER TABLE `employee_buyer_relation`
  ADD PRIMARY KEY (`Employee_ID_FK`,`Buyer_ID_FK`),
  ADD KEY `employee_buyer_relation_ibfk_2` (`Buyer_ID_FK`);

--
-- Indexes for table `emp_manage_order_page`
--
ALTER TABLE `emp_manage_order_page`
  ADD PRIMARY KEY (`EMP_ID_FK`,`ORDER_page_ID_FK`),
  ADD KEY `emp_manage_order_page_ibfk_2` (`ORDER_page_ID_FK`);

--
-- Indexes for table `emp_ship_orders`
--
ALTER TABLE `emp_ship_orders`
  ADD PRIMARY KEY (`EMP_ID_FK`,`ORDER_ID_FK`),
  ADD KEY `emp_ship_orders_ibfk_2` (`ORDER_ID_FK`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`Invoice_ID`),
  ADD KEY `invoice_ibfk_1` (`Order_ID_FK`),
  ADD KEY `invoice_ibfk_2` (`Buyer_ID_FK`),
  ADD KEY `invoice_ibfk_3` (`Product_key_FK`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`Order_Item_ID`),
  ADD KEY `Order_ID_FK` (`Order_ID_FK`),
  ADD KEY `Prod_Key_FK` (`Prod_Key_FK`);

--
-- Indexes for table `order_per_page`
--
ALTER TABLE `order_per_page`
  ADD PRIMARY KEY (`Order_Page_ID_FK`,`Order_ID_FK`),
  ADD KEY `order_per_page_ibfk_2` (`Order_ID_FK`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`OwnerID`),
  ADD UNIQUE KEY `UserID_FK` (`UserID_FK`);

--
-- Indexes for table `previous_order_page`
--
ALTER TABLE `previous_order_page`
  ADD PRIMARY KEY (`Page_order_ID`),
  ADD KEY `previous_order_page_ibfk_1` (`Buyer_ID_FK`),
  ADD KEY `previous_order_page_ibfk_2` (`OrderID_FK`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`),
  ADD KEY `product_ibfk_1` (`Prod_Cat_ID_FK`),
  ADD KEY `product_ibfk_2` (`OwnerID_FK`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`Category_ID`);

--
-- Indexes for table `product_page`
--
ALTER TABLE `product_page`
  ADD PRIMARY KEY (`Page_ID`);

--
-- Indexes for table `product_per_order`
--
ALTER TABLE `product_per_order`
  ADD PRIMARY KEY (`Order_ID_FK`,`Product_ID_FK`),
  ADD KEY `product_per_order_ibfk_2` (`Product_ID_FK`);

--
-- Indexes for table `product_per_page`
--
ALTER TABLE `product_per_page`
  ADD PRIMARY KEY (`Product_Page_ID_FK`,`Product_ID_FK`),
  ADD KEY `product_per_page_ibfk_2` (`Product_ID_FK`);

--
-- Indexes for table `purchased_by`
--
ALTER TABLE `purchased_by`
  ADD PRIMARY KEY (`Buyer_ID_FK`,`Product_ID_FK`),
  ADD KEY `purchased_by_ibfk_2` (`Product_ID_FK`);

--
-- Indexes for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD PRIMARY KEY (`SC_ID`),
  ADD KEY `shopping_cart_ibfk_1` (`Buyer_ID_FK`),
  ADD KEY `shopping_cart_ibfk_2` (`Prod_Key_FK`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `user_name_unique` (`user_name`);

--
-- Indexes for table `user_views_product`
--
ALTER TABLE `user_views_product`
  ADD PRIMARY KEY (`Product_id_FK`,`User_ID_FK`),
  ADD KEY `user_views_product_ibfk_2` (`User_ID_FK`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `Admin_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `buyer`
--
ALTER TABLE `buyer`
  MODIFY `BuyerID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cart_contents_fill`
--
ALTER TABLE `cart_contents_fill`
  MODIFY `Cart_ID_FK` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `Employee_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `Invoice_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `OrderID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `Order_Item_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
  MODIFY `OwnerID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `previous_order_page`
--
ALTER TABLE `previous_order_page`
  MODIFY `Page_order_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `Product_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `Category_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_page`
--
ALTER TABLE `product_page`
  MODIFY `Page_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  MODIFY `SC_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`User_id_FK`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `admin_manage_user`
--
ALTER TABLE `admin_manage_user`
  ADD CONSTRAINT `admin_manage_user_ibfk_1` FOREIGN KEY (`Admin_id_fk`) REFERENCES `admin` (`Admin_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `admin_manage_user_ibfk_2` FOREIGN KEY (`User_ID_FK`) REFERENCES `user` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `buyer`
--
ALTER TABLE `buyer`
  ADD CONSTRAINT `fk_Buyer_User` FOREIGN KEY (`UserID_FK`) REFERENCES `user` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `buyer_buys_product`
--
ALTER TABLE `buyer_buys_product`
  ADD CONSTRAINT `buyer_buys_product_ibfk_1` FOREIGN KEY (`Product_ID_FK`) REFERENCES `product` (`Product_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `buyer_buys_product_ibfk_2` FOREIGN KEY (`Buyer_ID_FK`) REFERENCES `buyer` (`BuyerID`) ON DELETE CASCADE;

--
-- Constraints for table `cart_contents_fill`
--
ALTER TABLE `cart_contents_fill`
  ADD CONSTRAINT `cart_contents_fill_ibfk_1` FOREIGN KEY (`Product_ID_FK`) REFERENCES `product` (`Product_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_contents_fill_ibfk_2` FOREIGN KEY (`Buyer_ID_FK`) REFERENCES `buyer` (`BuyerID`) ON DELETE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`user_id_FK`) REFERENCES `user` (`UserID`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`owner_ID_FK`) REFERENCES `owner` (`OwnerID`);

--
-- Constraints for table `employee_buyer_relation`
--
ALTER TABLE `employee_buyer_relation`
  ADD CONSTRAINT `employee_buyer_relation_ibfk_1` FOREIGN KEY (`Employee_ID_FK`) REFERENCES `employee` (`Employee_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_buyer_relation_ibfk_2` FOREIGN KEY (`Buyer_ID_FK`) REFERENCES `buyer` (`BuyerID`) ON DELETE CASCADE;

--
-- Constraints for table `emp_manage_order_page`
--
ALTER TABLE `emp_manage_order_page`
  ADD CONSTRAINT `emp_manage_order_page_ibfk_1` FOREIGN KEY (`EMP_ID_FK`) REFERENCES `employee` (`Employee_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `emp_manage_order_page_ibfk_2` FOREIGN KEY (`ORDER_page_ID_FK`) REFERENCES `previous_order_page` (`Page_order_ID`) ON DELETE CASCADE;

--
-- Constraints for table `emp_ship_orders`
--
ALTER TABLE `emp_ship_orders`
  ADD CONSTRAINT `emp_ship_orders_ibfk_1` FOREIGN KEY (`EMP_ID_FK`) REFERENCES `employee` (`Employee_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `emp_ship_orders_ibfk_2` FOREIGN KEY (`ORDER_ID_FK`) REFERENCES `order` (`OrderID`) ON DELETE CASCADE;

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`Order_ID_FK`) REFERENCES `order` (`OrderID`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`Buyer_ID_FK`) REFERENCES `buyer` (`BuyerID`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`Product_key_FK`) REFERENCES `product` (`Product_ID`) ON DELETE CASCADE;

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`Order_ID_FK`) REFERENCES `order` (`OrderID`),
  ADD CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`Prod_Key_FK`) REFERENCES `product` (`Product_ID`);

--
-- Constraints for table `order_per_page`
--
ALTER TABLE `order_per_page`
  ADD CONSTRAINT `order_per_page_ibfk_1` FOREIGN KEY (`Order_Page_ID_FK`) REFERENCES `previous_order_page` (`Page_order_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_per_page_ibfk_2` FOREIGN KEY (`Order_ID_FK`) REFERENCES `order` (`OrderID`) ON DELETE CASCADE;

--
-- Constraints for table `owner`
--
ALTER TABLE `owner`
  ADD CONSTRAINT `owner_ibfk_1` FOREIGN KEY (`UserID_FK`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `previous_order_page`
--
ALTER TABLE `previous_order_page`
  ADD CONSTRAINT `previous_order_page_ibfk_1` FOREIGN KEY (`Buyer_ID_FK`) REFERENCES `buyer` (`BuyerID`) ON DELETE CASCADE,
  ADD CONSTRAINT `previous_order_page_ibfk_2` FOREIGN KEY (`OrderID_FK`) REFERENCES `order` (`OrderID`) ON DELETE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Prod_Cat_ID_FK`) REFERENCES `product_category` (`Category_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`OwnerID_FK`) REFERENCES `owner` (`OwnerID`) ON DELETE NO ACTION;

--
-- Constraints for table `product_per_order`
--
ALTER TABLE `product_per_order`
  ADD CONSTRAINT `product_per_order_ibfk_1` FOREIGN KEY (`Order_ID_FK`) REFERENCES `order` (`OrderID`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_per_order_ibfk_2` FOREIGN KEY (`Product_ID_FK`) REFERENCES `product` (`Product_ID`) ON DELETE CASCADE;

--
-- Constraints for table `product_per_page`
--
ALTER TABLE `product_per_page`
  ADD CONSTRAINT `product_per_page_ibfk_1` FOREIGN KEY (`Product_Page_ID_FK`) REFERENCES `product_page` (`Page_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_per_page_ibfk_2` FOREIGN KEY (`Product_ID_FK`) REFERENCES `product` (`Product_ID`) ON DELETE CASCADE;

--
-- Constraints for table `purchased_by`
--
ALTER TABLE `purchased_by`
  ADD CONSTRAINT `purchased_by_ibfk_1` FOREIGN KEY (`Buyer_ID_FK`) REFERENCES `buyer` (`BuyerID`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchased_by_ibfk_2` FOREIGN KEY (`Product_ID_FK`) REFERENCES `product` (`Product_ID`) ON DELETE CASCADE;

--
-- Constraints for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD CONSTRAINT `shopping_cart_ibfk_1` FOREIGN KEY (`Buyer_ID_FK`) REFERENCES `user` (`UserID`) ON DELETE CASCADE,
  ADD CONSTRAINT `shopping_cart_ibfk_2` FOREIGN KEY (`Prod_Key_FK`) REFERENCES `product` (`Product_ID`) ON DELETE CASCADE;

--
-- Constraints for table `user_views_product`
--
ALTER TABLE `user_views_product`
  ADD CONSTRAINT `user_views_product_ibfk_1` FOREIGN KEY (`Product_id_FK`) REFERENCES `product` (`Product_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_views_product_ibfk_2` FOREIGN KEY (`User_ID_FK`) REFERENCES `user` (`UserID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
