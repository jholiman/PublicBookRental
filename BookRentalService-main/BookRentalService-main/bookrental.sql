-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2022 at 03:19 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `BID` int(10) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Author` varchar(255) NOT NULL,
  `Synopsis` varchar(450) NOT NULL,
  `ISBN` varchar(13) NOT NULL,
  `Copies` tinyint(1) NOT NULL,
  `Cover` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`BID`, `Title`, `Author`, `Synopsis`, `ISBN`, `Copies`, `Cover`) VALUES
(1, 'Harry Potter and the Sorcerer\'s Stone', 'JK Rowling', 'The first novel in the Harry Potter series, a boy learns on his eleventh birthday that he is the orphaned son of two powerful wizards and possesses unique magical powers of his own. He is summoned from his life as an unwanted child to become a student at Hogwarts, an English boarding school for wizards. There, he meets several friends who become his closest allies and help him discover the truth about his parents\' mysterious deaths.', '9780747532743', 3, 'images/1.png'),
(2, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Set in the Jazz Age on Long Island, the novel depicts narrator Nick Carraway\'s interactions with mysterious millionaire Jay Gatsby and Gatsby\'s obsession to reunite with his former lover, Daisy Buchanan.', '979874527482', 2, 'images/2.png'),
(3, 'The Kite Runner', 'Khaled Hosseini', 'The unforgettable, heartbreaking story of the unlikely friendship between a wealthy boy and the son of his father’s servant, caught in the tragic sweep of history, The Kite Runner transports readers to Afghanistan at a tense and crucial moment of change and destruction.', '9781594631931', 3, 'images/3.png'),
(4, 'Lord of the Flies', 'Khaled Hosseini', 'At the dawn of the next world war, a plane crashes on an uncharted island, stranding a group of schoolboys. At first, with no adult supervision, their freedom is something to celebrate. This far from civilization they can do anything they want. Anything. But as order collapses, as strange howls echo in the night, as terror begins its reign, the hope of adventure seems as far removed from reality as the hope of being rescued.', '9780399501487', 2, 'images/4.png'),
(5, 'The Fellowship of the Ring', 'J.R.R. Tolkien', 'The Fellowship of the Ring, the first volume in the trilogy, tells of the fateful power of the One Ring. It begins a magnificent tale of adventure that will plunge the members of the Fellowship of the Ring into a perilous quest and set the stage for the ultimate clash between the powers of good and evil.', '9780358380238', 3, 'images/5.png'),
(6, 'Eragon', 'Christopher Paolini', 'When fifteen-year-old Eragon finds a polished blue stone in the forest, he thinks it is the lucky discovery of a poor farm boy. But when the stone brings a dragon hatchling, Eragon soon realizes he has stumbled upon a legacy nearly as old as the Empire itself.', '9780375826696', 2, 'images/6.png'),
(7, 'The Lightning Thief', 'Rick Riordan', 'Percy Jackson is a good kid, but he can\'t seem to focus on his schoolwork or control his temper. And lately, being away at boarding school is only getting worse-Percy could have sworn his pre-algebra teacher turned into a monster and tried to kill him.', '9780786856299', 3, 'images/7.png'),
(8, 'No Country For Old Men', 'Cormac McCarthy', 'One day, a good old boy named Llewellyn Moss finds a pickup truck surrounded by a bodyguard of dead men. A load of heroin and two million dollars in cash are still in the back. When Moss takes the money, he sets off a chain reaction of catastrophic violence that not even the law–in the person of aging, disillusioned Sheriff Bell–can contain.', '9780375706677', 5, 'images/8.png'),
(9, 'The Martian', 'Andy Weir', 'Six days ago, astronaut Mark Watney became one of the first people to walk on Mars. Now, he’s sure he’ll be the first person to die there.After a dust storm nearly kills him and forces his crew to evacuate while thinking him dead, Mark finds himself stranded and completely alone with no way to even signal Earth that he’s alive—and even if he could get word out, his supplies would be gone long before a rescue could arrive. ', '9780804139021', 1, 'images/9.png'),
(10, 'Oh, the Places You\'ll Go!', 'Dr. Seuss', 'From soaring to high heights and seeing great sights to being left in a Lurch on a prickle-ly perch, Dr. Seuss addresses life’s ups and downs with his trademark humorous verse and whimsical illustrations.', '9780679847366', 3, 'images/10.png'),
(11, 'Mockingjay: The Hunger Games', 'Suzanne Collins', 'Katniss Everdeen, girl on fire, has survived, even though her home has been destroyed. Gale has escaped. Katniss’ family is safe. Peeta has been captured by the Capitol. District 13 really does exist. There are rebels. There are new leaders. A revolution is unfolding. ', '9780545663267', 2, 'images/11.png'),
(12, 'The 48 Laws of Power', 'Robert Greene', 'In the book that People magazine proclaimed “beguiling” and “fascinating,” Robert Greene and Joost Elffers have distilled three thousand years of the history of power into 48 essential laws by drawing from the philosophies of Machiavelli, Sun Tzu, and Carl Von Clausewitz and also from the lives of figures ranging from Henry Kissinger to P.T. Barnum.', '9781804221563', 2, 'images/12.png');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `uid` int(10) NOT NULL,
  `bid` int(10) NOT NULL,
  `RentDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `ReturnDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `UID` int(10) NOT NULL,
  `Total` decimal(10,0) NOT NULL,
  `CurrentDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment_info`
--

CREATE TABLE `payment_info` (
  `CardNumber` varchar(255) NOT NULL,
  `CVV` varchar(255) NOT NULL,
  `CardName` varchar(255) NOT NULL,
  `MonthExp` tinyint(4) NOT NULL,
  `YearExp` year(4) NOT NULL,
  `UID` int(10) NOT NULL,
  `State` varchar(255) NOT NULL,
  `Street` varchar(255) NOT NULL,
  `ZipCode` int(10) NOT NULL,
  `FullName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UID` int(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `State_S` varchar(255) DEFAULT NULL,
  `Street_S` varchar(255) DEFAULT NULL,
  `ZipCode_S` int(10) DEFAULT NULL,
  `FullName_S` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UID`, `email`, `pwd`, `State_S`, `Street_S`, `ZipCode_S`, `FullName_S`) VALUES
(4, 'Thien.Joseph7846', '123', NULL, NULL, NULL, NULL),
(5, 'Thien.Joseph7846@gmail.com', 'L6Ya@BK6n2LtPz', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`BID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD KEY `UID_orders` (`uid`),
  ADD KEY `BID_orders` (`bid`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD KEY `UID_Payment` (`UID`);

--
-- Indexes for table `payment_info`
--
ALTER TABLE `payment_info`
  ADD KEY `PaymentInfo` (`UID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `BID_orders` FOREIGN KEY (`bid`) REFERENCES `books` (`BID`),
  ADD CONSTRAINT `UID_orders` FOREIGN KEY (`uid`) REFERENCES `user` (`UID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `UID_Payment` FOREIGN KEY (`UID`) REFERENCES `user` (`UID`);

--
-- Constraints for table `payment_info`
--
ALTER TABLE `payment_info`
  ADD CONSTRAINT `PaymentInfo` FOREIGN KEY (`UID`) REFERENCES `user` (`UID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
