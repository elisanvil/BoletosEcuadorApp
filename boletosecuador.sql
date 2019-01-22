/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `boletosecuador`
--

CREATE DATABASE boletosecuador;
USE boletosecuador;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(10) COLLATE latin1_spanish_ci NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `nombre_usuario` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `clave` char(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  `rol` char(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY(id_usuario)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`nombre`, `nombre_usuario`, `clave`, `rol`) VALUES
('Leo Wyatt', 'lwyatt', 'wyatt123', 'administrador'),
('Ryan Wolfe', 'rwolfe', 'wolfe123', 'cliente'),
('Stella Bonasera', 'sbonasera', 'bonasera123', 'administrador'),
('Aiden Vaugier', 'avaugier', 'vaugier123', 'cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venue`
--

CREATE TABLE `venue` (
  `id_venue` int(10) COLLATE latin1_spanish_ci NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `ubicacion` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `tipo` char(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `capacidad` char(10) COLLATE latin1_spanish_ci DEFAULT NULL,
  `disponibilidad` char(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY(id_venue)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `venue`
--

INSERT INTO `venue` (`nombre`, `ubicacion`, `tipo`, `capacidad`, `disponibilidad`) VALUES
('Centro de Convenciones', 'lwyatt', 'Centro de Convenciones', 'sí'),
('Ryan Wolfe', 'rwolfe', 'wolfe123', 'cliente'),
('Stella Bonasera', 'sbonasera', 'bonasera123', 'administrador'),
('Aiden Vaugier', 'avaugier', 'vaugier123', 'cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asiento`
--

CREATE TABLE `asiento` (
  `id_asiento` int(10) COLLATE latin1_spanish_ci NOT NULL AUTO_INCREMENT,
  `categoria` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `disponibilidad` char(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  `id_venue` int(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY(id_asiento),
  FOREIGN KEY(id_venue) REFERENCES venue(id_venue)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boleto`
--

CREATE TABLE `boleto` (
  `id_boleto` int(10) COLLATE latin1_spanish_ci NOT NULL AUTO_INCREMENT,
  `precio` char(10) COLLATE latin1_spanish_ci DEFAULT NULL,
  `id_asiento` int(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY(id_boleto),
  FOREIGN KEY(id_asiento) REFERENCES asiento(id_asiento)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `id_evento` int(10) COLLATE latin1_spanish_ci NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `tipo` char(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `id_venue` int(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY(id_evento),
  FOREIGN KEY(id_venue) REFERENCES venue(id_venue)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `asiste` (
  `id_boleto` int(10) COLLATE latin1_spanish_ci NOT NULL,
  `nombre` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `tipo` char(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `id_usuario` int(10) COLLATE latin1_spanish_ci NOT NULL,
  `id_evento` int(10) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY(id_boleto),
  FOREIGN KEY(id_boleto) REFERENCES boleto(id_boleto),
  FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY(id_evento) REFERENCES evento(id_evento)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1;

-- --------------------------------------------------------


SELECT * FROM usuario;
SELECT * FROM venue;
SELECT * FROM asiento;
SELECT * FROM boleto;
SELECT * FROM evento;
SELECT * FROM asiste;

DROP DATABASE boletosecuador;

