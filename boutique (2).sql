-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 01 déc. 2025 à 12:55
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `boutique`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom_client` varchar(25) NOT NULL,
  `prenom_client` varchar(25) NOT NULL,
  `email` text NOT NULL,
  `telephone` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id_command` int NOT NULL AUTO_INCREMENT,
  `type de commande` int NOT NULL,
  `date_ commande` int NOT NULL,
  `total` int NOT NULL,
  PRIMARY KEY (`id_command`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `detail_commande`
--

DROP TABLE IF EXISTS `detail_commande`;
CREATE TABLE IF NOT EXISTS `detail_commande` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_ produit` int NOT NULL,
  `quantité` int NOT NULL,
  `sous_total` int NOT NULL,
  `id_commande` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id_produit` int NOT NULL AUTO_INCREMENT,
  `type de produit` varchar(255) NOT NULL,
  `marque de produit` varchar(400) NOT NULL,
  `prix de produit` int NOT NULL,
  `nom_produit` varchar(344) NOT NULL,
  `image_produit` varchar(255) NOT NULL,
  PRIMARY KEY (`id_produit`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id_produit`, `type de produit`, `marque de produit`, `prix de produit`, `nom_produit`, `image_produit`) VALUES
(6, 'whey protiene', 'golden body', 29, 'whey', 'https://mybody.dz/3787-thickbox_default/whey-protein.jpg'),
(7, 'BCAA', 'EAFIT', 20, 'BCAA compliment', 'https://medias.ea-pharma.digital/catalog/product/cache/42b4c7f3c13bbe4daad44b0304fa8411/b/c/bcaa411face.jpg'),
(8, 'omega3', 'omega', 10, 'omega', 'https://mybody.dz/2802/1769.jpg'),
(10, 'BIOTECHUSA', 'EAA ZERO', 17, 'EAA', 'https://www.optigura.fr/img/prods/9779/main-w500h500@2x.60073.webp'),
(0, 'BioTechUSA', 'monohydrat', 50, 'creatine ', 'https://shop.biotechusa.com/cdn/shop/products/100CreatineMonohydrate_Unflav_500g_1l.png?v=1623392653');

-- --------------------------------------------------------

--
-- Structure de la table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
CREATE TABLE IF NOT EXISTS `stocks` (
  `id_ stocks` int NOT NULL,
  `id_fournisseur` int NOT NULL,
  `id_ produit` int NOT NULL,
  `quantité` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
