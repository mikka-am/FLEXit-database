-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2022 at 06:19 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `464_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `CityID` int(9) NOT NULL,
  `CityName` varchar(150) NOT NULL,
  `ProvStatID` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`CityID`, `CityName`, `ProvStatID`) VALUES
(800000000, 'Burnaby', 900000000),
(800000001, 'Maui', 900000001),
(800000002, 'Vancouver', 900000000),
(800000003, 'New York', 900000002),
(800000004, 'San Andreas', 900000003),
(800000005, 'London', 900000004);

-- --------------------------------------------------------

--
-- Table structure for table `contentcreator`
--

CREATE TABLE `contentcreator` (
  `CreatorID` int(9) NOT NULL,
  `UserID` int(9) NOT NULL,
  `CreatorShopName` varchar(500) NOT NULL DEFAULT 'CreatorID',
  `CreatorShopLanguage` enum('English CA','English US','English UK','French','Spanish') DEFAULT 'English US',
  `CreatorShopAddress` varchar(200) NOT NULL,
  `CreatorCityID` int(9) NOT NULL,
  `CreatorProvStatID` int(9) NOT NULL,
  `CreatorCountryID` bigint(10) NOT NULL,
  `CreatorShopPZcode` varchar(11) NOT NULL,
  `CreatorShopCurrency` enum('CAD','USD','GBP') NOT NULL,
  `CreatorJobType` enum('Full-time','Part-time') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contentcreator`
--

INSERT INTO `contentcreator` (`CreatorID`, `UserID`, `CreatorShopName`, `CreatorShopLanguage`, `CreatorShopAddress`, `CreatorCityID`, `CreatorProvStatID`, `CreatorCountryID`, `CreatorShopPZcode`, `CreatorShopCurrency`, `CreatorJobType`) VALUES
(200000000, 100000002, 'DancewithNikki', 'English CA', '8945 Beta Ave', 800000000, 900000000, 1000000000, 'V7P1L4', 'CAD', 'Part-time'),
(200000001, 100000000, 'OilCelebPaintings', 'English US', '289 Coastal Cove', 800000001, 900000001, 1000000001, '97794', 'USD', 'Full-time'),
(200000002, 100000003, 'DCCollectibles', 'English US', '1007 Mountain Drive', 800000003, 900000002, 1000000001, '10001', 'USD', 'Part-time'),
(200000003, 100000004, 'Shanbookmarks', 'English US', '265 Harlen Way', 800000004, 900000003, 1000000001, '95249', 'USD', 'Full-time'),
(200000004, 100000005, 'instrumentdesignart', 'English UK', '926 Mill Road', 800000005, 900000004, 1000000002, 'NW456KS', 'GBP', 'Full-time');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `CountryID` bigint(10) NOT NULL,
  `CountryName` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`CountryID`, `CountryName`) VALUES
(1000000000, 'Canada'),
(1000000002, 'UK'),
(1000000001, 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `DonationID` int(9) NOT NULL,
  `PostID` bigint(12) NOT NULL,
  `CreditCardNumber` bigint(16) NOT NULL,
  `DonationAmount` decimal(6,2) NOT NULL,
  `DonationTimeStamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`DonationID`, `PostID`, `CreditCardNumber`, `DonationAmount`, `DonationTimeStamp`) VALUES
(700000000, 600000000001, 3152685214698324, '1.50', '2021-07-20 13:07:53'),
(700000001, 600000000000, 8945159715648799, '1000.00', '2021-07-19 14:02:08'),
(700000002, 600000000004, 6652335789554892, '1500.00', '2021-08-01 15:56:03');

-- --------------------------------------------------------

--
-- Table structure for table `friend`
--

CREATE TABLE `friend` (
  `UserID` int(9) NOT NULL,
  `FriendID` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `friend`
--

INSERT INTO `friend` (`UserID`, `FriendID`) VALUES
(100000000, 100000002),
(100000001, 100000000),
(100000001, 100000002),
(100000003, 100000002),
(100000003, 100000005);

-- --------------------------------------------------------

--
-- Table structure for table `paymentinformation`
--

CREATE TABLE `paymentinformation` (
  `CreditCardNumber` bigint(16) NOT NULL,
  `UserID` int(9) NOT NULL,
  `NameofCardholder` varchar(100) NOT NULL,
  `ExpirationDate` int(4) NOT NULL,
  `CVC` smallint(3) NOT NULL,
  `BillAddress` varchar(200) NOT NULL,
  `BillCityID` int(9) NOT NULL,
  `BillProvStatID` int(9) NOT NULL,
  `BillCountryID` bigint(10) NOT NULL,
  `BillPZcode` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paymentinformation`
--

INSERT INTO `paymentinformation` (`CreditCardNumber`, `UserID`, `NameofCardholder`, `ExpirationDate`, `CVC`, `BillAddress`, `BillCityID`, `BillProvStatID`, `BillCountryID`, `BillPZcode`) VALUES
(3152685214698324, 100000001, 'Patrick Bateman', 1022, 963, '2564 W 4th Ave', 800000002, 900000000, 1000000000, 'V8C 4N2'),
(6652335789554892, 100000003, 'Alfred Pennyworth', 1121, 652, '1007 Mountain Drive', 800000003, 900000003, 1000000001, '10001'),
(8945159715648799, 100000000, 'Jane Doe', 1225, 845, '289 Coastal Cove', 800000001, 900000001, 1000000000, '97794');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `PostID` bigint(12) NOT NULL,
  `CreatorID` int(9) NOT NULL,
  `PostComment` varchar(100) DEFAULT NULL,
  `PostMediaType` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`PostID`, `CreatorID`, `PostComment`, `PostMediaType`) VALUES
(600000000000, 200000000, 'Top 5 Popular Ballet Spins', NULL),
(600000000001, 200000001, 'Tried some new techniques for my Marilyn painting - prints for this are up in my shop :)', NULL),
(600000000002, 200000002, 'Top 5 Batman fight scenes', NULL),
(600000000003, 200000003, 'Book review: Harry Potter and the Prisoner of Azkaban', NULL),
(600000000004, 200000004, 'Money by Pink Floyd: Bass Tutorial', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `productlisting`
--

CREATE TABLE `productlisting` (
  `ProductID` int(9) NOT NULL,
  `CreatorID` int(9) NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `ProductImage` mediumblob DEFAULT NULL,
  `ProductPrice` decimal(9,2) NOT NULL,
  `ProductDescription` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productlisting`
--

INSERT INTO `productlisting` (`ProductID`, `CreatorID`, `ProductName`, `ProductImage`, `ProductPrice`, `ProductDescription`) VALUES
(300000000, 200000000, 'Street Tee', NULL, '12.99', 'A baggy tee with vibrant and modern pop-art designs. Comes in black or grey.'),
(300000001, 200000001, 'MarilynMonroe', NULL, '400.00', 'Marilyn Monroe painting using oil paints on 18x24 inch Canvas'),
(300000002, 200000002, 'Batman Figurine', NULL, '299.99', 'Batman standing from Dark Knight movie'),
(300000003, 200000003, 'Official Art Bookmark', NULL, '17.99', 'Laminated bookmark: print is official art from Book 1'),
(300000004, 200000004, 'Embroidered Guitar Strap', NULL, '49.99', 'Hand stitched Dark Side of the Moon logo on black leather strap');

-- --------------------------------------------------------

--
-- Table structure for table `provstat`
--

CREATE TABLE `provstat` (
  `ProvStatID` int(9) NOT NULL,
  `ProvStatName` varchar(150) NOT NULL,
  `CountryID` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `provstat`
--

INSERT INTO `provstat` (`ProvStatID`, `ProvStatName`, `CountryID`) VALUES
(900000000, 'British Columbia', 1000000000),
(900000001, 'Hawaii', 1000000001),
(900000002, 'New York', 1000000001),
(900000003, 'California', 1000000001),
(900000004, 'London', 1000000002);

-- --------------------------------------------------------

--
-- Table structure for table `purchaseorder`
--

CREATE TABLE `purchaseorder` (
  `OrderID` int(9) NOT NULL,
  `UserID` int(9) NOT NULL,
  `OrderDate` datetime NOT NULL,
  `OrderTotalPayAmt` decimal(14,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchaseorder`
--

INSERT INTO `purchaseorder` (`OrderID`, `UserID`, `OrderDate`, `OrderTotalPayAmt`) VALUES
(400000000, 100000001, '2021-07-19 11:57:06', '412.99'),
(400000001, 100000000, '2021-07-20 09:30:45', '25.98'),
(400000002, 100000003, '2021-07-31 13:15:30', '67.98');

-- --------------------------------------------------------

--
-- Table structure for table `purchaseorderdetails`
--

CREATE TABLE `purchaseorderdetails` (
  `OrderID` int(9) NOT NULL,
  `ProductID` int(9) NOT NULL,
  `ProductQuantity` int(4) NOT NULL
) ;

--
-- Dumping data for table `purchaseorderdetails`
--

INSERT INTO `purchaseorderdetails` (`OrderID`, `ProductID`, `ProductQuantity`) VALUES
(400000000, 300000000, 1),
(400000000, 300000001, 1),
(400000001, 300000000, 2),
(400000002, 300000003, 1),
(400000002, 300000004, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shippingsummary`
--

CREATE TABLE `shippingsummary` (
  `ShippingID` int(9) NOT NULL,
  `OrderID` int(9) NOT NULL,
  `ShippingFee` decimal(5,2) NOT NULL,
  `SameBillAddress` enum('Yes','No') DEFAULT 'Yes',
  `ShippingAddress` varchar(200) DEFAULT NULL,
  `ShippingCityID` int(9) DEFAULT NULL,
  `ShippingProvStatID` int(9) DEFAULT NULL,
  `ShippingCountryID` bigint(10) DEFAULT NULL,
  `ShippingPZCode` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shippingsummary`
--

INSERT INTO `shippingsummary` (`ShippingID`, `OrderID`, `ShippingFee`, `SameBillAddress`, `ShippingAddress`, `ShippingCityID`, `ShippingProvStatID`, `ShippingCountryID`, `ShippingPZCode`) VALUES
(500000000, 400000000, '20.00', 'Yes', NULL, NULL, NULL, NULL, NULL),
(500000001, 400000001, '20.00', 'Yes', NULL, NULL, NULL, NULL, NULL),
(500000002, 400000002, '45.00', 'No', '8945 Beta Ave', 800000000, 900000000, 1000000000, 'V7P1L4');

-- --------------------------------------------------------

--
-- Table structure for table `useraccount`
--

CREATE TABLE `useraccount` (
  `UserID` int(9) NOT NULL,
  `UserHandle` varchar(100) NOT NULL,
  `UserFirstName` varchar(100) DEFAULT NULL,
  `UserLastName` varchar(100) DEFAULT NULL,
  `UserEmail` varchar(100) NOT NULL,
  `UserPhoneNumber` varchar(10) DEFAULT NULL,
  `UserGender` enum('Male','Female','Other','Prefer not to say') DEFAULT NULL,
  `UserPassword` varchar(100) NOT NULL
) ;

--
-- Dumping data for table `useraccount`
--

INSERT INTO `useraccount` (`UserID`, `UserHandle`, `UserFirstName`, `UserLastName`, `UserEmail`, `UserPhoneNumber`, `UserGender`, `UserPassword`) VALUES
(100000000, 'creatoralpha', 'Jane', 'Doe', 'janedoe@gmail.com', '6041234567', 'Female', 'whyiamtired'),
(100000001, 'iamedgyy123', 'Patrick', 'Bateman', 'pbatemanvp@gmail.com', '7789156154', 'Male', 'veryybored456'),
(100000002, 'nikkidances', 'Nikki', 'Malt', 'nikkim@gmail.com', '7785332121', 'Female', 'dance4lyfe'),
(100000003, 'batmanluv', 'Alfred', 'Pennyworth', 'thebutler@gmail.com', '7182286267', 'Male', 'myherobatman'),
(100000004, 'shanbooks', 'Darren', 'Shan', 'vampireking@hotmail.com', '2099678552', 'Male', 'liveoffbloodlol'),
(100000005, 'pinkfloydfan324', 'Georgina', 'Lewis', 'progrockguru@gmail.com', '7901156154', 'Female', 'rockmusicislife482');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`CityID`),
  ADD KEY `fk_has_provstat` (`ProvStatID`);

--
-- Indexes for table `contentcreator`
--
ALTER TABLE `contentcreator`
  ADD PRIMARY KEY (`CreatorID`),
  ADD UNIQUE KEY `UserID` (`UserID`),
  ADD KEY `create_City` (`CreatorCityID`),
  ADD KEY `create_ProvStat` (`CreatorProvStatID`),
  ADD KEY `create_Country` (`CreatorCountryID`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`CountryID`),
  ADD UNIQUE KEY `CountryName` (`CountryName`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`DonationID`),
  ADD KEY `fk_has_PostID` (`PostID`),
  ADD KEY `fk_has_CreditCardNumber` (`CreditCardNumber`);

--
-- Indexes for table `friend`
--
ALTER TABLE `friend`
  ADD PRIMARY KEY (`UserID`,`FriendID`),
  ADD KEY `fk_has_Friend` (`FriendID`),
  ADD KEY `idx_friend` (`UserID`);

--
-- Indexes for table `paymentinformation`
--
ALTER TABLE `paymentinformation`
  ADD PRIMARY KEY (`CreditCardNumber`),
  ADD KEY `fk_has_UserCC` (`UserID`),
  ADD KEY `bill_city` (`BillCityID`),
  ADD KEY `bill_ProvStat` (`BillProvStatID`),
  ADD KEY `bill_Country` (`BillCountryID`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`PostID`),
  ADD KEY `fk_has_CreatorPost` (`CreatorID`),
  ADD KEY `idx_post` (`PostID`);

--
-- Indexes for table `productlisting`
--
ALTER TABLE `productlisting`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `fk_has_ContentCreator` (`CreatorID`);

--
-- Indexes for table `provstat`
--
ALTER TABLE `provstat`
  ADD PRIMARY KEY (`ProvStatID`),
  ADD UNIQUE KEY `ProvStatName` (`ProvStatName`),
  ADD KEY `fk_has_country` (`CountryID`);

--
-- Indexes for table `purchaseorder`
--
ALTER TABLE `purchaseorder`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `fk_has_UserPurchase` (`UserID`),
  ADD KEY `idx_order` (`OrderID`);

--
-- Indexes for table `purchaseorderdetails`
--
ALTER TABLE `purchaseorderdetails`
  ADD PRIMARY KEY (`OrderID`,`ProductID`),
  ADD KEY `fk_has_ProductPurchase` (`ProductID`),
  ADD KEY `idx_orderdetails` (`OrderID`,`ProductID`);

--
-- Indexes for table `shippingsummary`
--
ALTER TABLE `shippingsummary`
  ADD PRIMARY KEY (`ShippingID`),
  ADD KEY `fk_has_Order` (`OrderID`),
  ADD KEY `ship_city` (`ShippingCityID`),
  ADD KEY `ship_provstat` (`ShippingProvStatID`),
  ADD KEY `ship_country` (`ShippingCountryID`);

--
-- Indexes for table `useraccount`
--
ALTER TABLE `useraccount`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `unique_user` (`UserHandle`),
  ADD UNIQUE KEY `unique_email` (`UserEmail`),
  ADD KEY `idx_user` (`UserHandle`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `CityID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=800000006;

--
-- AUTO_INCREMENT for table `contentcreator`
--
ALTER TABLE `contentcreator`
  MODIFY `CreatorID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200000005;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `CountryID` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000000003;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `DonationID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=700000003;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `PostID` bigint(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=600000000005;

--
-- AUTO_INCREMENT for table `productlisting`
--
ALTER TABLE `productlisting`
  MODIFY `ProductID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=300000005;

--
-- AUTO_INCREMENT for table `provstat`
--
ALTER TABLE `provstat`
  MODIFY `ProvStatID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=900000005;

--
-- AUTO_INCREMENT for table `purchaseorder`
--
ALTER TABLE `purchaseorder`
  MODIFY `OrderID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=400000003;

--
-- AUTO_INCREMENT for table `shippingsummary`
--
ALTER TABLE `shippingsummary`
  MODIFY `ShippingID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=500000003;

--
-- AUTO_INCREMENT for table `useraccount`
--
ALTER TABLE `useraccount`
  MODIFY `UserID` int(9) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `fk_has_provstat` FOREIGN KEY (`ProvStatID`) REFERENCES `provstat` (`ProvStatID`);

--
-- Constraints for table `contentcreator`
--
ALTER TABLE `contentcreator`
  ADD CONSTRAINT `create_City` FOREIGN KEY (`CreatorCityID`) REFERENCES `city` (`CityID`),
  ADD CONSTRAINT `create_Country` FOREIGN KEY (`CreatorCountryID`) REFERENCES `country` (`CountryID`),
  ADD CONSTRAINT `create_ProvStat` FOREIGN KEY (`CreatorProvStatID`) REFERENCES `provstat` (`ProvStatID`),
  ADD CONSTRAINT `fk_has_UserAccount` FOREIGN KEY (`UserID`) REFERENCES `useraccount` (`UserID`);

--
-- Constraints for table `donations`
--
ALTER TABLE `donations`
  ADD CONSTRAINT `fk_has_CreditCardNumber` FOREIGN KEY (`CreditCardNumber`) REFERENCES `paymentinformation` (`CreditCardNumber`),
  ADD CONSTRAINT `fk_has_PostID` FOREIGN KEY (`PostID`) REFERENCES `post` (`PostID`);

--
-- Constraints for table `friend`
--
ALTER TABLE `friend`
  ADD CONSTRAINT `fk_has_Friend` FOREIGN KEY (`FriendID`) REFERENCES `useraccount` (`UserID`),
  ADD CONSTRAINT `fk_has_Userfriend` FOREIGN KEY (`UserID`) REFERENCES `useraccount` (`UserID`);

--
-- Constraints for table `paymentinformation`
--
ALTER TABLE `paymentinformation`
  ADD CONSTRAINT `bill_Country` FOREIGN KEY (`BillCountryID`) REFERENCES `country` (`CountryID`),
  ADD CONSTRAINT `bill_ProvStat` FOREIGN KEY (`BillProvStatID`) REFERENCES `provstat` (`ProvStatID`),
  ADD CONSTRAINT `bill_city` FOREIGN KEY (`BillCityID`) REFERENCES `city` (`CityID`),
  ADD CONSTRAINT `fk_has_UserCC` FOREIGN KEY (`UserID`) REFERENCES `useraccount` (`UserID`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `fk_has_CreatorPost` FOREIGN KEY (`CreatorID`) REFERENCES `contentcreator` (`CreatorID`);

--
-- Constraints for table `productlisting`
--
ALTER TABLE `productlisting`
  ADD CONSTRAINT `fk_has_ContentCreator` FOREIGN KEY (`CreatorID`) REFERENCES `contentcreator` (`CreatorID`);

--
-- Constraints for table `provstat`
--
ALTER TABLE `provstat`
  ADD CONSTRAINT `fk_has_country` FOREIGN KEY (`CountryID`) REFERENCES `country` (`CountryID`);

--
-- Constraints for table `purchaseorder`
--
ALTER TABLE `purchaseorder`
  ADD CONSTRAINT `fk_has_UserPurchase` FOREIGN KEY (`UserID`) REFERENCES `useraccount` (`UserID`);

--
-- Constraints for table `purchaseorderdetails`
--
ALTER TABLE `purchaseorderdetails`
  ADD CONSTRAINT `fk_has_OrderID` FOREIGN KEY (`OrderID`) REFERENCES `purchaseorder` (`OrderID`),
  ADD CONSTRAINT `fk_has_ProductPurchase` FOREIGN KEY (`ProductID`) REFERENCES `productlisting` (`ProductID`);

--
-- Constraints for table `shippingsummary`
--
ALTER TABLE `shippingsummary`
  ADD CONSTRAINT `fk_has_Order` FOREIGN KEY (`OrderID`) REFERENCES `purchaseorder` (`OrderID`),
  ADD CONSTRAINT `ship_city` FOREIGN KEY (`ShippingCityID`) REFERENCES `city` (`CityID`),
  ADD CONSTRAINT `ship_country` FOREIGN KEY (`ShippingCountryID`) REFERENCES `country` (`CountryID`),
  ADD CONSTRAINT `ship_provstat` FOREIGN KEY (`ShippingProvStatID`) REFERENCES `provstat` (`ProvStatID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
