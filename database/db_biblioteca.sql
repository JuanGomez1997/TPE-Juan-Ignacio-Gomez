-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-10-2022 a las 19:39:48
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id_genero` int(11) NOT NULL,
  `genero` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id_genero`, `genero`) VALUES
(2, 'Ciencia Ficcion'),
(19, 'Accion'),
(20, 'Aventura'),
(21, 'Mangas'),
(22, 'Adultos'),
(23, 'Ejemplo a borrar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `autor` varchar(50) NOT NULL,
  `anio` year(4) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `id_genero` int(11) NOT NULL,
  `disponibilidad` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `nombre`, `autor`, `anio`, `descripcion`, `id_genero`, `disponibilidad`) VALUES
(3, 'Harry Potter', 'J. K. Rowling', 1997, 'Harry Potter se ha quedado huérfano y vive en casa de sus abominables tíos y del insoportable primo Dudley. Se siente muy triste y solo, hasta que un buen día recibe una carta que cambiará su vida para siempre. En ella le comunican que ha sido aceptado como alumno en el colegio i', 2, 1),
(11, 'Metro 2034', 'Dmitry Glukhovsky', 2009, 'Año 2034. Moscú se ha transformado en una ciudad fantasma. Los supervivientes se han refugiado en las profundidades de la red de metro y han creado allí una nueva civilización que no se parece en nada a las anteriores...(secuela de Metro 2033)', 2, 0),
(12, 'Proyecto Hail Mary', 'Andy Weir', 2021, 'Ryland Grace es el único superviviente en una misión desesperada. Es la última oportunidad y, si fracasa, la humanidad y la Tierra misma perecerán. Claro que, de momento, él no lo sabe. Ni siquiera puede recordar su propio nombre, y mucho menos la naturaleza de su misión o cómo llevarla a cabo.', 19, 1),
(13, 'La última cripta', 'Fernando Gamboa González', 2007, 'Ulises, el profesor y Cassie, una antropóloga mejicana que conoció en Honduras, empiezan una aventura, no exenta de dificultades, que les lleva a Tombuctú, después de atravesar parte del desierto del Sahara, donde encontrarán un pergamino escondido en una caja de 700 años de antigüedad.', 19, 0),
(14, 'Kama-sutra', 'Vatsiaiana', 1901, 'Se trate de un compendio de información sexual de varias épocas', 22, 1),
(15, 'One Punch Man Capitulo 1', 'One, Yusuke Murata', 2009, 'Cuando trata de asesinar a una niña, Saitama llega y la salva. El monstruo se presenta como Vaccine Man, y afirma que existe para erradicar a la humanidad por la contaminación de la Tierra. Se transforma en un monstruo gigante, pero Saitama lo destruye con un solo golpe.', 21, 1),
(16, 'ejemplo a borrar 1', 'aaa', 2022, 'sfdsf', 23, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(250) NOT NULL,
  `contrasenia` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `contrasenia`) VALUES
(1, 'admin', '$2y$10$9tr03HCvxzqQ2BGyqZeN3O.Oce9CLjz/PK4zAAtwH1MrASdneYWtu');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id_genero`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_genero_fk` (`id_genero`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `id_genero_fk` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
