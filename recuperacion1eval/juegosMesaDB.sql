create database juegosMesaDB;

use juegosMesaDB;

create table tusuarios(
id int auto_increment primary key,
nombre varchar(100),
email varchar(100),
fecha_registro date
);

create table tjuegos(
id int auto_increment primary key,
nombre varchar(100),
url_imagen varchar (255),
año_publicacion year,
editorial varchar (100)
);

create table tcomentarios(
id int auto_increment primary key,
comentario varchar(500),
usuario_id int,
juego_id int not null
);

INSERT INTO `tjuegos` (`id`,`nombre`, `url_imagen`, `año_publicacion`, `editorial`) VALUES ('1','Call of Duty Black Ops II', 'https://th.bing.com/th/id/OIP.9JtF169lZqURybNnJOm4hQHaEK?pid=ImgDet&rs=1', '2012', 'Treyarch y Activision.');
INSERT INTO `tjuegos` (`id`,`nombre`, `url_imagen`, `año_publicacion`, `editorial`) VALUES ('2','Resident Evil 7 Biohazard', 'https://th.bing.com/th/id/OIP.i-h80xeYHuedEuGIxMmmrQHaEK?pid=ImgDet&rs=1', '2017', 'Capcom.');
INSERT INTO `tjuegos` (`id`,`nombre`, `url_imagen`, `año_publicacion`, `editorial`) VALUES ('3','Valorant', 'https://th.bing.com/th/id/OIP.GSnO2Eie9NtsS83kIh-67QHaEK?pid=ImgDet&rs=1', '2020', 'Riot Games.');
INSERT INTO `tjuegos` (`id`,`nombre`, `url_imagen`, `año_publicacion`, `editorial`) VALUES ('4','Rocket League', 'https://www.geekqc.ca/wp-content/uploads/2017/01/rocket-league-workshop-mods.jpg', '2015', 'Psyonix.');
INSERT INTO `tjuegos` (`id`,`nombre`, `url_imagen`, `año_publicacion`, `editorial`) VALUES ('5','Bloons TD Battle 6', 'https://wallpaperaccess.com/full/5551455.jpg', '2018', 'Ninja Kiwi.');

INSERT INTO `tusuarios` (`id`,`nombre`, `email`, `fecha_registro`) VALUES ('1','Alejandro', 'Alejandro.rodriguez@gmail.com', '2023-01-01');
INSERT INTO `tusuarios` (`id`,`nombre`, `email`, `fecha_registro`) VALUES ('2','Carlos Manuel', 'Carlos.pazos@gmail.com', '2023-02-15');
INSERT INTO `tusuarios` (`id`,`nombre`, `email`, `fecha_registro`) VALUES ('3','Ainara', 'Ainara.vazquez@gmail.com', '2023-03-20');
INSERT INTO `tusuarios` (`id`,`nombre`, `email`, `fecha_registro`) VALUES ('4','Elias', 'Elias.Maira@gmail.com', '2023-04-10');
INSERT INTO `tusuarios` (`id`,`nombre`, `email`, `fecha_registro`) VALUES ('5','Anso', 'Anxo.carballeira@gmail.com', '2023-05-05');

INSERT INTO `tcomentarios` (`id`,`comentario`, `usuario_id`, `juego_id`) VALUES ('1','Juego con muchas horas necesarias para conseguir un nivel alto, idea muy original al mezclar el fútbol con los coches.', '3', '4');
INSERT INTO `tcomentarios` (`id`,`comentario`, `usuario_id`, `juego_id`) VALUES ('2','Juego de miedo para personas que buscan emociones fuertes, una gran experiencia de juego realista que te hará pasar unas horas muy entretenidas.', '5', '2');
INSERT INTO `tcomentarios` (`id`,`comentario`, `usuario_id`, `juego_id`) VALUES ('3','Shooter súper realista en primera persona apto para jugadores que buscan un juego frenético con modo campaña y multijugador muy entretenido.', '2', '1');
INSERT INTO `tcomentarios` (`id`,`comentario`, `usuario_id`, `juego_id`) VALUES ('4','Shooter en primera persona con un ambiente súper competitivo y con muchas horas necesarias para conseguir un buen nivel profesional.', '4', '3');
INSERT INTO `tcomentarios` (`id`,`comentario`, `usuario_id`, `juego_id`) VALUES ('5','Juego muy tranquilo si quieres pasar un rato explotando globos, muy entretenido con mucho contenido que te dará horas de diversión.', '1', '5');

ALTER TABLE tcomentarios add constraint fk_const1 foreign key (usuario_id) references tusuarios (id);
ALTER TABLE tcomentarios add constraint fk_const2 foreign key (juego_id) references tjuegos (id);

ALTER TABLE tcomentarios add fecha datetime;

update tcomentarios set fecha = now();