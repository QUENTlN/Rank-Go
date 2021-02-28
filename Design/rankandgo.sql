-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 13 jan. 2021 à 15:06
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `rankandgo`
--

-- --------------------------------------------------------

--
-- Structure de la table `medias`
--
DROP database if EXISTS `rankandgo`;
CREATE database if NOT EXISTS `rankandgo`;
use `rankandgo`;
DROP TABLE IF EXISTS `medias`;
CREATE TABLE IF NOT EXISTS `medias` (
  `index` int(11) NOT NULL,
  `IdPoster` int(11) NOT NULL,
  `Path` varchar(80) NOT NULL,
  PRIMARY KEY (`index`,`IdPoster`),
  KEY `IdPoster` (`IdPoster`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `notes`
--

DROP TABLE IF EXISTS `notes`;
CREATE TABLE IF NOT EXISTS `notes` (
  `IdUser` int(11) NOT NULL,
  `IdPoster` int(11) NOT NULL,
  `Note` int(11) NOT NULL,
  `Comment` varchar(280) NOT NULL,
  PRIMARY KEY (`IdUser`,`IdPoster`),
  KEY `IdUser` (`IdUser`,`IdPoster`),
  KEY `IdPoster` (`IdPoster`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `posters`
--

DROP TABLE IF EXISTS `posters`;
CREATE TABLE IF NOT EXISTS `posters` (
  `IdPoster` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(280) DEFAULT NULL,
  `Title` varchar(30) NOT NULL,
  `State` tinyint(1) NOT NULL,
  `CreditsAllow` int(11) NOT NULL,
  `CommentEnable` tinyint(1) NOT NULL,
  `TypeNote` enum('1To5','1To20','YesOrNot') NOT NULL,
  `IdUser` int(11) NOT NULL,
  PRIMARY KEY (`IdPoster`),
  KEY `IdUser` (`IdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `IdUser` int(11) NOT NULL AUTO_INCREMENT,
  `Credits` int(11) NOT NULL DEFAULT '5',
  `Login` varchar(20) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `medias`
--
ALTER TABLE `medias`
  ADD CONSTRAINT `medias_ibfk_1` FOREIGN KEY (`IdPoster`) REFERENCES `posters` (`IdPoster`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`IdUser`) REFERENCES `users` (`IdUser`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`IdPoster`) REFERENCES `posters` (`IdPoster`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `posters`
--
ALTER TABLE `posters`
  ADD CONSTRAINT `posters_ibfk_1` FOREIGN KEY (`IdUser`) REFERENCES `users` (`IdUser`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
