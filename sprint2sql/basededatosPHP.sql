-- MariaDB dump 10.19  Distrib 10.11.4-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mysitedb
-- ------------------------------------------------------
-- Server version	10.11.4-MariaDB-1~deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tcomentarios`
--

DROP TABLE IF EXISTS `tcomentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcomentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comentario` varchar(500) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `juego_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_const1` (`usuario_id`),
  KEY `fk_const2` (`juego_id`),
  CONSTRAINT `fk_const1` FOREIGN KEY (`usuario_id`) REFERENCES `tusuarios` (`id`),
  CONSTRAINT `fk_const2` FOREIGN KEY (`juego_id`) REFERENCES `tjuegos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcomentarios`
--

LOCK TABLES `tcomentarios` WRITE;
/*!40000 ALTER TABLE `tcomentarios` DISABLE KEYS */;
INSERT INTO `tcomentarios` VALUES
(1,'Juego con muchas horas necesarias para conseguir un nivel alto , idea muy original al mezclar el futbol con los coches.',3,4),
(2,'Juego de miedo para personas que buscan emociones fuertes , una gtran experiencia de juego realista que te hara pasar unas horas muy entretenidas.',5,2),
(3,'Shooter super realista en primera persona apto para jugadores que buscan un juego frenético con modo campaña y multijugador muy entretenidod.',2,1),
(4,'Shooter en primera persona con un ambiente super competitivo y con muchas horas necesarias para conseguir un buen nivel profesional.',4,3),
(5,'Juego muy tranquilo si quieres pasar un rato explotando globos, muy entretenido con mucho contenido que te dara horas de diversion.',1,5);
/*!40000 ALTER TABLE `tcomentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tjuegos`
--

DROP TABLE IF EXISTS `tjuegos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tjuegos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `url_imagen` varchar(700) DEFAULT NULL,
  `año_salida` int(11) DEFAULT NULL,
  `descripcion` varchar(9000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tjuegos`
--

LOCK TABLES `tjuegos` WRITE;
/*!40000 ALTER TABLE `tjuegos` DISABLE KEYS */;
INSERT INTO `tjuegos` VALUES
(1,'Call of Duty Black Ops \"','https://th.bing.com/th/id/OIP.9JtF169lZqURybNnJOm4hQHaEK?pid=ImgDet&rs=1',2012,'Call of Duty: Black Ops II es un videojuego de disparos en primera persona desarrollado por Treyarch y publicado por Activision. Es la novena entrega de la serie Call of Duty y se sitúa en un futuro cercano durante la Guerra Fría del siglo XXI. El juego presenta una narrativa no lineal y múltiples finales basados en las decisiones del jugador.'),
(2,'Resident Evil 7 Biohazard','https://th.bing.com/th/id/OIP.i-h80xeYHuedEuGIxMmmrQHaEK?pid=ImgDet&rs=1',2017,'Resident Evil 7: Biohazard es un videojuego de survival horror desarrollado y publicado por Capcom. La historia sigue a Ethan Winters, quien busca a su esposa desaparecida en una mansión abandonada. El juego regresa a las raíces del survival horror con una perspectiva en primera persona y una atmósfera intensa y aterradora. Los jugadores enfrentan peligrosos enemigos y resuelven acertijos para descubrir los oscuros secretos de la mansión.'),
(3,'Valorant','https://th.bing.com/th/id/OIP.GSnO2Eie9NtsS83kIh-67QHaEK?pid=ImgDet&rs=1',2020,'Valorant es un juego de disparos en primera persona táctico y multijugador en línea desarrollado y publicado por Riot Games. En el juego, los jugadores asumen el control de \"Agentes\", cada uno con habilidades únicas, y participan en partidas 5v5 donde el trabajo en equipo y la estrategia son esenciales para el éxito.'),
(4,'Rocket League','https://www.geekqc.ca/wp-content/uploads/2017/01/rocket-league-workshop-mods.jpg',2015,'Rocket League es un videojuego de deportes y conducción desarrollado y publicado por Psyonix. Combina el fútbol con vehículos propulsados por cohetes, creando una experiencia frenética y divertida. Los jugadores controlan autos que tienen la capacidad de saltar, realizar acrobacias en el aire y usar impulso para marcar goles en un campo de juego.'),
(5,'Bloons TD Battle 6','https://wallpaperaccess.com/full/5551455.jpg',2018,'Bloons TD 6 es la sexta entrega de la popular serie de juegos de defensa de torres desarrollada por Ninja Kiwi. En este juego, los jugadores deben defenderse contra oleadas de globos (bloons) utilizando una variedad de torres con diferentes habilidades y características. Los jugadores pueden desbloquear y mejorar torres, cada una con sus propias fortalezas y debilidades, para repeler a los bloons y evitar que lleguen al final del camino. El juego presenta nuevos mapas, torres y actualizaciones en comparación con las entregas anteriores, ofreciendo a los jugadores una experiencia fresca y desafiante en el género de defensa de torres.');
/*!40000 ALTER TABLE `tjuegos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tusuarios`
--

DROP TABLE IF EXISTS `tusuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tusuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `contraseña` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tusuarios`
--

LOCK TABLES `tusuarios` WRITE;
/*!40000 ALTER TABLE `tusuarios` DISABLE KEYS */;
INSERT INTO `tusuarios` VALUES
(1,'Alejandro','Rodríguez Castro','Alejandro.rodriguez@gmail.com','AlejandroRodriguez'),
(2,'Carlos Manuel','Pazos Sánchez','Carlos.pazos@gmail.com','CarlosPazos'),
(3,'Ainara ','Vazquez Teijo','Ainara.vazquez@gmail.com','AinaraVazquez'),
(4,'Elias ','Maira Manteiga','Elias.Mairagmail.com','EliasMaira'),
(5,'Anso ','Carballeira Fernández','Anxo.carballeira@gmail.com','AnxoCarballeira');
/*!40000 ALTER TABLE `tusuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-25 13:47:42
