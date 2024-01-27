-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-11-2023 a las 05:37:48
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `banco`
--
CREATE DATABASE IF NOT EXISTS `banco` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `banco`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `CI` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `ciudad` varchar(20) DEFAULT NULL,
  `departamento` varchar(40) DEFAULT NULL,
  `telefono_fijo` varchar(25) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `ocupacion` varchar(35) DEFAULT NULL,
  `monto_de_ingreso` int(11) DEFAULT NULL,
  `recibo_de_sueldo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`CI`, `nombre`, `apellido`, `direccion`, `ciudad`, `departamento`, `telefono_fijo`, `celular`, `ocupacion`, `monto_de_ingreso`, `recibo_de_sueldo`) VALUES
(43679782, 'Juan', 'Bentancor', 'Wilson fereira', 'Young', 'Rio Negro', '45676096', '92726246', 'Programador', 80000, 0),
(53892031, 'Jose', 'Garcia', 'Dr.hererra', 'Paysandu', 'Paysandu', '45763289', '99328643', 'Abogado', 120000, 1),
(55998353, 'Yeremy', 'Schanzenbach', 'flores ', 'Young', 'Rio negro', '45678976', '92120845', 'teniente de la marina', 60000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_servicio`
--

CREATE TABLE `cliente_servicio` (
  `IDT` int(11) NOT NULL,
  `ci` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `cliente_servicio`
--

INSERT INTO `cliente_servicio` (`IDT`, `ci`, `id`, `fecha`) VALUES
(10, 55998353, 1, '2023-11-20 04:33:58'),
(11, 53892031, 5, '2023-11-20 04:34:04'),
(12, 55998353, 9, '2023-11-20 04:34:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `usuario` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`usuario`, `contrasena`) VALUES
('root', 'root');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `ID` int(11) NOT NULL,
  `nombre_de_servicios` varchar(80) NOT NULL,
  `Nrecibo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`ID`, `nombre_de_servicios`, `Nrecibo`) VALUES
(1, 'Prestamo ', 1),
(5, 'Caja de seguridad', 0),
(9, 'Alquiler', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CI`);

--
-- Indices de la tabla `cliente_servicio`
--
ALTER TABLE `cliente_servicio`
  ADD PRIMARY KEY (`IDT`),
  ADD KEY `ci` (`ci`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`usuario`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente_servicio`
--
ALTER TABLE `cliente_servicio`
  MODIFY `IDT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente_servicio`
--
ALTER TABLE `cliente_servicio`
  ADD CONSTRAINT `cliente_servicio_ibfk_1` FOREIGN KEY (`ci`) REFERENCES `cliente` (`CI`),
  ADD CONSTRAINT `cliente_servicio_ibfk_2` FOREIGN KEY (`id`) REFERENCES `servicios` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
