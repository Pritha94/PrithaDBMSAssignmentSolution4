-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 11, 2022 at 07:24 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travelonthego`
--

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `Passenger_name` varchar(255) NOT NULL,
  `Category` varchar(255) NOT NULL,
  `Gender` varchar(255) NOT NULL,
  `Boarding_City` varchar(255) NOT NULL,
  `Destination_City` varchar(255) NOT NULL,
  `Distance` int(11) NOT NULL,
  `Bus_Type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`Passenger_name`, `Category`, `Gender`, `Boarding_City`, `Destination_City`, `Distance`, `Bus_Type`) VALUES
('Sejal', 'AC', 'F', 'Bengaluru', 'Chennai', 350, 'Sleeper'),
('Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', 700, 'Sitting'),
('Pallavi', 'AC', 'F', 'Panaji', 'Bengaluru', 600, 'Sleeper'),
('Khusboo', 'AC', 'F', 'Chennai', 'Mumbai', 1500, 'Sleeper'),
('Udit', 'Non-AC', 'M', 'Trivandrum', 'panaji', 1000, 'Sleeper'),
('Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500, 'Sitting'),
('Hemant', 'Non-AC', 'M', 'panaji', 'Mumbai', 700, 'Sleeper'),
('Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500, 'Sitting'),
('Piyush', 'AC', 'M', 'Pune', 'Nagpur', 700, 'Sitting');

-- --------------------------------------------------------

--
-- Table structure for table `price`
--

CREATE TABLE `price` (
  `Bus_Type` varchar(255) NOT NULL,
  `Distance` int(11) NOT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `price`
--

INSERT INTO `price` (`Bus_Type`, `Distance`, `Price`) VALUES
('Sleeper', 350, 770),
('Sleeper', 500, 1100),
('Sleeper', 600, 1320),
('Sleeper', 700, 1540),
('Sleeper', 1000, 2200),
('Sleeper', 1200, 2640),
('Sleeper', 1500, 2700),
('Sitting', 500, 620),
('Sitting', 600, 744),
('Sitting', 700, 868),
('Sitting', 1000, 1240),
('Sitting', 1200, 1488),
('Sitting', 1500, 1860);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

select * from passenger;

select * from price;

--3. How many female and how many male passengers travelled for a minimum distance of 600 KM s?

SELECT COUNT(CASE WHEN (`Gender`) = 'F' THEN 1 END) Female FROM passenger WHERE Distance >=600;
SELECT COUNT(CASE when (`Gender`)='M' THEN 1 END) MALE FROM passenger WHERE Distance>=600



--4. Find the minimum ticket price for Sleeper Bus.

SELECT MIN(price) FROM price WHERE Bus_Type = 'sleeper';


--5. Select passenger names whose names start with character 'S'.

SELECT * FROM passenger WHERE Passenger_name LIKE 's%';


--6. Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output.

SELECT Passenger_name , p1.Boarding_City, p1.Destination_city, p1.Bus_Type, p2.Price FROM passenger p1, price p2 WHERE p1.Distance = p2.Distance and p1.Bus_type = p2.Bus_type;


--7. What is the passenger name and his/her ticket price who travelled in Sitting bus for a distance of 1000 KMs. 

SELECT p1.Passenger_name, p1.Boarding_city, p1.Destination_city, p1.Bus_type, p2.Price FROM passenger p1, price p2 WHERE p1.Distance = 1000 and p1.Bus_type = 'Sitting' and p1.Distance = 1000 and p1.Bus_type = 'Sitting';


--8. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?

SELECT DISTINCT p1.Passenger_name, p1.Boarding_city as Destination_city, p1.Destination_city as Boardng_city, p1.Bus_type, p2.Price FROM passenger p1, price p2 WHERE Passenger_name = 'Pallavi' and p1.Distance = p2.Distance;


--9.List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order

SELECT DISTINCT distance FROM passenger ORDER BY Distance desc;


--10. Display the passenger name and percentage of distance travelled by that passenger from the total distance travelled by all passengers without using user variables.
SELECT Passenger_name, Distance * 100.0/ (SELECT SUM(Distance) FROM passenger)FROM passenger GROUP BY Distance;


--9. Create a view to see all passengers who travelled in AC Bus.

CREATE VIEW p_view AS SELECT * FROM passenger WHERE Category = 'AC';
SELECT * FROM p_view;
