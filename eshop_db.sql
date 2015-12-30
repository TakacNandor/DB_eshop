-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Hostiteľ: 127.0.0.1
-- Čas generovania: St 30.Dec 2015, 16:06
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
-- Štruktúra tabuľky pre tabuľku `kosik`
--

CREATE TABLE `kosik` (
  `id_products_orders` int(100) NOT NULL,
  `id_order` int(100) NOT NULL,
  `id_product` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `loged_user`
--

CREATE TABLE `loged_user` (
  `loged_user_id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sťahujem dáta pre tabuľku `loged_user`
--

INSERT INTO `loged_user` (`loged_user_id`, `user_id`) VALUES
(37, 1);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `order_tab`
--

CREATE TABLE `order_tab` (
  `id_order` int(100) NOT NULL,
  `id_product` int(100) NOT NULL,
  `id_user` int(100) NOT NULL,
  `count` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `product`
--

CREATE TABLE `product` (
  `id_product` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_desc` text NOT NULL,
  `price` bigint(255) NOT NULL,
  `count` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sťahujem dáta pre tabuľku `product`
--

INSERT INTO `product` (`id_product`, `product_name`, `product_desc`, `price`, `count`) VALUES
(1, 'motyka', 'nastroj pre zahradkarov', 15, 20),
(3, 'penis', 'na sukanie', 1, 15),
(4, 'hrable', 'poziva sa na hrabanie listia', 15, 25),
(5, 'kosacka', 'motorova kosacka', 200, 4),
(6, 'furik', 'treba ho tlacit', 50, 8),
(13, 'noznice', 'na strihanie', 5, 40),
(14, 'pila', 'pili sa s tym drevo', 12, 9),
(15, 'vidly', 'na zbieranie sena', 5, 35);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `user`
--

CREATE TABLE `user` (
  `id_user` int(100) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `privilege` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sťahujem dáta pre tabuľku `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `privilege`) VALUES
(1, 'nandy', '123456', 1),
(2, 'pokustreti', 'treti', 0),
(3, 'dasd', 'dad', 0),
(13, 'Vilo', 'Oliv', 0),
(14, 'Ima', 'Ami', 0),
(15, 'Dominika', 'Akinimod', 0);

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `kosik`
--
ALTER TABLE `kosik`
  ADD PRIMARY KEY (`id_products_orders`),
  ADD KEY `id_order` (`id_order`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexy pre tabuľku `loged_user`
--
ALTER TABLE `loged_user`
  ADD PRIMARY KEY (`loged_user_id`),
  ADD KEY `user_id` (`user_id`);

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
-- Indexy pre tabuľku `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `kosik`
--
ALTER TABLE `kosik`
  MODIFY `id_products_orders` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pre tabuľku `loged_user`
--
ALTER TABLE `loged_user`
  MODIFY `loged_user_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT pre tabuľku `order_tab`
--
ALTER TABLE `order_tab`
  MODIFY `id_order` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pre tabuľku `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pre tabuľku `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Obmedzenie pre exportované tabuľky
--

--
-- Obmedzenie pre tabuľku `kosik`
--
ALTER TABLE `kosik`
  ADD CONSTRAINT `kosik_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`),
  ADD CONSTRAINT `kosik_ibfk_2` FOREIGN KEY (`id_order`) REFERENCES `order_tab` (`id_order`);

--
-- Obmedzenie pre tabuľku `loged_user`
--
ALTER TABLE `loged_user`
  ADD CONSTRAINT `loged_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`);

--
-- Obmedzenie pre tabuľku `order_tab`
--
ALTER TABLE `order_tab`
  ADD CONSTRAINT `order_tab_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `order_tab_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `kosik` (`id_product`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
