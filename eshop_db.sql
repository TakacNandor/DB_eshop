-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Hostiteľ: 127.0.0.1
-- Čas generovania: Po 21.Dec 2015, 18:22
-- Verzia serveru: 10.1.8-MariaDB
-- Verzia PHP: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `eshop_db`
--

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `order_tab`
--

CREATE TABLE `order_tab` (
  `id_order` int(100) NOT NULL,
  `id_product` int(100) NOT NULL,
  `id_user` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `product`
--

CREATE TABLE `product` (
  `id_product` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_desc` text NOT NULL,
  `price` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sťahujem dáta pre tabuľku `product`
--

INSERT INTO `product` (`id_product`, `product_name`, `product_desc`, `price`) VALUES
(1, 'motyka', 'nastroj pre zahradkarov', 15),
(3, 'ryl', 'pouziva sa na rylovanie zahrady', 10),
(4, 'hrable', 'poziva sa na hrabanie listia', 15),
(5, 'kosacka', 'motorova kosacka', 200),
(6, 'furik', 'pouziva sa na furikovanie', 30);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `products_orders`
--

CREATE TABLE `products_orders` (
  `id_products_orders` int(100) NOT NULL,
  `id_order` int(100) NOT NULL,
  `id_product` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `user`
--

CREATE TABLE `user` (
  `id_user` int(100) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sťahujem dáta pre tabuľku `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`) VALUES
(1, 'nandy', '123456'),
(2, 'pokustreti', 'treti'),
(3, 'dasd', 'dad'),
(13, 'Vilo', 'Oliv'),
(14, 'Ima', 'Ami'),
(15, 'Dominika', 'Akinimod');

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `order_tab`
--
ALTER TABLE `order_tab`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_order` (`id_order`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexy pre tabuľku `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexy pre tabuľku `products_orders`
--
ALTER TABLE `products_orders`
  ADD PRIMARY KEY (`id_products_orders`),
  ADD KEY `id_order` (`id_order`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexy pre tabuľku `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `order_tab`
--
ALTER TABLE `order_tab`
  MODIFY `id_order` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pre tabuľku `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pre tabuľku `products_orders`
--
ALTER TABLE `products_orders`
  MODIFY `id_products_orders` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pre tabuľku `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Obmedzenie pre exportované tabuľky
--

--
-- Obmedzenie pre tabuľku `order_tab`
--
ALTER TABLE `order_tab`
  ADD CONSTRAINT `order_tab_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `order_tab_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products_orders` (`id_product`);

--
-- Obmedzenie pre tabuľku `products_orders`
--
ALTER TABLE `products_orders`
  ADD CONSTRAINT `products_orders_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`),
  ADD CONSTRAINT `products_orders_ibfk_2` FOREIGN KEY (`id_order`) REFERENCES `order_tab` (`id_order`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
