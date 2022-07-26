-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 26 juil. 2022 à 06:02
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `weetube`
--

-- --------------------------------------------------------

--
-- Structure de la table `action`
--

DROP TABLE IF EXISTS `action`;
CREATE TABLE IF NOT EXISTS `action` (
  `ID` int(255) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  `statut` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `action`
--

INSERT INTO `action` (`ID`, `libelle`, `statut`) VALUES
(1, 'Ajouter', 0),
(2, 'Supprimer', 0),
(3, 'Modifier', 0),
(4, 'Like', 0),
(5, 'dislike', 0),
(6, 'bannir', 0);

-- --------------------------------------------------------

--
-- Structure de la table `action_utilisateur`
--

DROP TABLE IF EXISTS `action_utilisateur`;
CREATE TABLE IF NOT EXISTS `action_utilisateur` (
  `ID_action` int(255) NOT NULL,
  `ID_video` int(255) DEFAULT NULL,
  `ID_categorie` int(255) DEFAULT NULL,
  `ID_role` int(255) DEFAULT NULL,
  `ID_chaine` int(255) DEFAULT NULL,
  `ID_playlist` int(255) DEFAULT NULL,
  `ID_commentaire` int(255) DEFAULT NULL,
  `ID_utilisateur` int(255) NOT NULL,
  KEY `ID_action` (`ID_action`),
  KEY `action_categorie` (`ID_categorie`),
  KEY `action_chaine` (`ID_chaine`),
  KEY `action_commentaire` (`ID_commentaire`),
  KEY `action_playlist` (`ID_playlist`),
  KEY `action_role` (`ID_role`),
  KEY `action_utilisateur` (`ID_utilisateur`),
  KEY `action_video` (`ID_video`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `ID` int(255) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  `statut` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`ID`, `libelle`, `statut`) VALUES
(1, 'Sport', 0),
(2, 'Fantastique', 0),
(3, 'Nature', 0),
(4, 'Informatique', 0),
(5, 'Cuisine', 0),
(6, 'Jeux-Vidéos', 0);

-- --------------------------------------------------------

--
-- Structure de la table `chaine`
--

DROP TABLE IF EXISTS `chaine`;
CREATE TABLE IF NOT EXISTS `chaine` (
  `ID` int(255) NOT NULL AUTO_INCREMENT,
  `ID_utilisateur` int(255) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `banniere` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `statut` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `chaine_utilisateur` (`ID_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `chaine_video`
--

DROP TABLE IF EXISTS `chaine_video`;
CREATE TABLE IF NOT EXISTS `chaine_video` (
  `ID_chaine` int(255) NOT NULL,
  `ID_video` int(255) NOT NULL,
  `date` date DEFAULT NULL,
  KEY `ajouter_chaine` (`ID_chaine`),
  KEY `ajouter_video` (`ID_video`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_utilisateur` int(255) NOT NULL,
  `ID_video` int(255) NOT NULL,
  `contenu` varchar(255) DEFAULT NULL,
  `date_creation` date DEFAULT NULL,
  `date_publication` date DEFAULT NULL,
  `statut` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `commentaire_video` (`ID_video`),
  KEY `commentaire_utilisateur` (`ID_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
CREATE TABLE IF NOT EXISTS `playlist` (
  `ID` int(255) NOT NULL AUTO_INCREMENT,
  `ID_video` int(255) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `statut` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `playlist_video` (`ID_video`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `ID` int(255) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  `statut` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`ID`, `libelle`, `statut`) VALUES
(1, 'Super-Admin', 0),
(2, 'Créateur', 0),
(3, 'Visiteur', 0);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `ID` int(255) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `pseudo` varchar(255) DEFAULT NULL,
  `mdp` varchar(255) DEFAULT NULL,
  `statut` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`ID`, `nom`, `prenom`, `mail`, `pseudo`, `mdp`, `statut`) VALUES
(1, 'Sanchez', 'Mathieu', 'demo-weetube@mail.fr', 'Mathieu', '$2y$10$fb20P85RUeRPWBZUBMdsD.VdfUIzlmYOjkRpdCa8eNQ1cXnRyE2wO', NULL),
(2, 'Jean', 'Michel', 'user2@mail.fr', 'JM', '$2y$10$P7swsIUmmtZnfPUFyVVmeuQIHOlHVFmi7TbWyX57f5wQ1r0Y4o9/6', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur_role`
--

DROP TABLE IF EXISTS `utilisateur_role`;
CREATE TABLE IF NOT EXISTS `utilisateur_role` (
  `ID_utilisateur` int(255) NOT NULL,
  `ID_role` int(255) NOT NULL,
  KEY `avoir_utilisateur` (`ID_utilisateur`),
  KEY `avoir_role` (`ID_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur_video`
--

DROP TABLE IF EXISTS `utilisateur_video`;
CREATE TABLE IF NOT EXISTS `utilisateur_video` (
  `ID_utilisateur` int(255) NOT NULL,
  `ID_video` int(255) NOT NULL,
  `date` date DEFAULT NULL,
  KEY `consulter_utilisateur` (`ID_utilisateur`),
  KEY `consulter_video` (`ID_video`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `video`
--

DROP TABLE IF EXISTS `video`;
CREATE TABLE IF NOT EXISTS `video` (
  `ID` int(255) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) DEFAULT NULL,
  `description` longtext,
  `date_creation` date DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `duree` varchar(255) DEFAULT NULL,
  `statut` tinyint(1) DEFAULT NULL,
  `etat` tinyint(1) DEFAULT NULL,
  `miniature` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `video`
--

INSERT INTO `video` (`ID`, `titre`, `description`, `date_creation`, `slug`, `duree`, `statut`, `etat`, `miniature`) VALUES
(1, 'vidéo 1', 'la description de la vidéo 1', '2022-07-21', 'video_2.mp4', '13:48', 0, 0, 'illustration1.png');

-- --------------------------------------------------------

--
-- Structure de la table `video_categorie`
--

DROP TABLE IF EXISTS `video_categorie`;
CREATE TABLE IF NOT EXISTS `video_categorie` (
  `ID_video` int(255) NOT NULL,
  `ID_categorie` int(255) NOT NULL,
  KEY `appartenir_video` (`ID_video`),
  KEY `appartenir_categorie` (`ID_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `action_utilisateur`
--
ALTER TABLE `action_utilisateur`
  ADD CONSTRAINT `ID_action` FOREIGN KEY (`ID_action`) REFERENCES `action` (`ID`),
  ADD CONSTRAINT `action_categorie` FOREIGN KEY (`ID_categorie`) REFERENCES `categorie` (`ID`),
  ADD CONSTRAINT `action_chaine` FOREIGN KEY (`ID_chaine`) REFERENCES `chaine` (`ID`),
  ADD CONSTRAINT `action_commentaire` FOREIGN KEY (`ID_commentaire`) REFERENCES `commentaire` (`ID`),
  ADD CONSTRAINT `action_playlist` FOREIGN KEY (`ID_playlist`) REFERENCES `playlist` (`ID`),
  ADD CONSTRAINT `action_role` FOREIGN KEY (`ID_role`) REFERENCES `role` (`ID`),
  ADD CONSTRAINT `action_utilisateur` FOREIGN KEY (`ID_utilisateur`) REFERENCES `utilisateur` (`ID`),
  ADD CONSTRAINT `action_video` FOREIGN KEY (`ID_video`) REFERENCES `video` (`ID`);

--
-- Contraintes pour la table `chaine`
--
ALTER TABLE `chaine`
  ADD CONSTRAINT `chaine_utilisateur` FOREIGN KEY (`ID_utilisateur`) REFERENCES `utilisateur` (`ID`);

--
-- Contraintes pour la table `chaine_video`
--
ALTER TABLE `chaine_video`
  ADD CONSTRAINT `ajouter_chaine` FOREIGN KEY (`ID_chaine`) REFERENCES `chaine` (`ID`),
  ADD CONSTRAINT `ajouter_video` FOREIGN KEY (`ID_video`) REFERENCES `video` (`ID`);

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `commentaire_utilisateur` FOREIGN KEY (`ID_utilisateur`) REFERENCES `utilisateur` (`ID`),
  ADD CONSTRAINT `commentaire_video` FOREIGN KEY (`ID_video`) REFERENCES `video` (`ID`);

--
-- Contraintes pour la table `playlist`
--
ALTER TABLE `playlist`
  ADD CONSTRAINT `playlist_video` FOREIGN KEY (`ID_video`) REFERENCES `video` (`ID`);

--
-- Contraintes pour la table `utilisateur_role`
--
ALTER TABLE `utilisateur_role`
  ADD CONSTRAINT `avoir_role` FOREIGN KEY (`ID_role`) REFERENCES `role` (`ID`),
  ADD CONSTRAINT `avoir_utilisateur` FOREIGN KEY (`ID_utilisateur`) REFERENCES `utilisateur` (`ID`);

--
-- Contraintes pour la table `utilisateur_video`
--
ALTER TABLE `utilisateur_video`
  ADD CONSTRAINT `consulter_utilisateur` FOREIGN KEY (`ID_utilisateur`) REFERENCES `utilisateur` (`ID`),
  ADD CONSTRAINT `consulter_video` FOREIGN KEY (`ID_video`) REFERENCES `video` (`ID`);

--
-- Contraintes pour la table `video_categorie`
--
ALTER TABLE `video_categorie`
  ADD CONSTRAINT `appartenir_categorie` FOREIGN KEY (`ID_categorie`) REFERENCES `categorie` (`ID`),
  ADD CONSTRAINT `appartenir_video` FOREIGN KEY (`ID_video`) REFERENCES `video` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
