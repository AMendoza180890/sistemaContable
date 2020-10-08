-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-10-2020 a las 06:03:11
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdsistemacontable`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catelectrodomesticos`
--

CREATE TABLE `catelectrodomesticos` (
  `CatElectId` int(11) NOT NULL,
  `CatElectMarca` text NOT NULL,
  `CatElectModelo` text NOT NULL,
  `CatElectDescripcion` text NOT NULL,
  `CatElectFechaIngreso` date NOT NULL,
  `CatElectCosto` int(11) DEFAULT NULL,
  `CatElectEstado` int(11) NOT NULL,
  `idActivofijo` int(11) NOT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `catelectrodomesticos`
--

INSERT INTO `catelectrodomesticos` (`CatElectId`, `CatElectMarca`, `CatElectModelo`, `CatElectDescripcion`, `CatElectFechaIngreso`, `CatElectCosto`, `CatElectEstado`, `idActivofijo`, `updated_at`, `created_at`) VALUES
(1, 'Sony', 'Lavadora', 'Lavadora de ropa, color blanca.', '2020-05-13', 300, 1, 1, '2020-10-03', '2020-09-06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catequipocomputo`
--

CREATE TABLE `catequipocomputo` (
  `catEquipoCompId` int(11) NOT NULL,
  `catEquipoModelo` text NOT NULL,
  `catEquipoNumeroSerie` text NOT NULL,
  `catEquipoMarca` text NOT NULL,
  `catEquipoTamanioAlmacenamiento` text NOT NULL,
  `TipoMemoriaRAM` text NOT NULL,
  `catEquipoCantidadRAM` text NOT NULL,
  `catEquipoTipoSO` text NOT NULL,
  `catEquipoFechaCompra` date NOT NULL,
  `catEquipoCostoEquipo` float NOT NULL,
  `CatEquipoEstado` int(11) NOT NULL,
  `idActivofijo` int(11) NOT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `catequipocomputo`
--

INSERT INTO `catequipocomputo` (`catEquipoCompId`, `catEquipoModelo`, `catEquipoNumeroSerie`, `catEquipoMarca`, `catEquipoTamanioAlmacenamiento`, `TipoMemoriaRAM`, `catEquipoCantidadRAM`, `catEquipoTipoSO`, `catEquipoFechaCompra`, `catEquipoCostoEquipo`, `CatEquipoEstado`, `idActivofijo`, `updated_at`, `created_at`) VALUES
(1, '20EV002JUS', '001002003004005', 'LENOVO', '250Gb, SSD', 'DDR4', '16Gb', 'windows10', '2020-10-06', 4500, 1, 3, '2020-10-08', NULL),
(2, '20EV002JUS', '001002003004005', 'LENOVO', '250Gb, SSD', 'DDR4', '16Gb', 'WINDOWS 10 Pro', '0000-00-00', 250.5, 1, 3, '2020-10-08', NULL),
(4, 'inspiron', 'MY1235678', 'HP', '250Gb', 'DDR4', '8Gb', 'windows10', '2020-06-10', 230, 1, 3, '2020-10-03', '2020-09-06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catestado`
--

CREATE TABLE `catestado` (
  `id` int(11) NOT NULL,
  `catEstadoDescripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `catestado`
--

INSERT INTO `catestado` (`id`, `catEstadoDescripcion`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catimpresoras`
--

CREATE TABLE `catimpresoras` (
  `catImpresorasId` int(11) NOT NULL,
  `catImpresorasMarca` text NOT NULL,
  `catImpresoraModelo` text NOT NULL,
  `catImpresoraTipoToner` text NOT NULL,
  `catImpresoraDescripcion` text NOT NULL,
  `catImpresoraFechaIngreso` date NOT NULL,
  `catImpresoraCosto` int(11) DEFAULT NULL,
  `CatImpresoraEstado` int(11) NOT NULL,
  `idActivofijo` int(11) NOT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `catimpresoras`
--

INSERT INTO `catimpresoras` (`catImpresorasId`, `catImpresorasMarca`, `catImpresoraModelo`, `catImpresoraTipoToner`, `catImpresoraDescripcion`, `catImpresoraFechaIngreso`, `catImpresoraCosto`, `CatImpresoraEstado`, `idActivofijo`, `updated_at`, `created_at`) VALUES
(1, 'Canon', 'MF4770N', '3500BN001', 'NEGRO, MULTIFUNCIONAL, CON ACCESO A RED LAN CABLE E INALAMBRICO', '2019-10-16', 350, 1, 1, '2020-10-08', NULL),
(2, 'Epson', 'MYL12345678', '128', 'Color negro, conectado por red inalambrica', '2020-06-09', 250, 2, 1, '2020-10-03', '2020-09-06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catterreno`
--

CREATE TABLE `catterreno` (
  `catTerrenoId` int(11) NOT NULL,
  `catTerrenoPropietario` text NOT NULL,
  `catTerrenoArea` text NOT NULL,
  `catTerrenoFechaCompra` date NOT NULL,
  `catterrenoCosto` int(11) DEFAULT NULL,
  `CatTerrenoEstado` int(11) NOT NULL,
  `catTerrenoNumeroCatastral` text NOT NULL,
  `idActivofijo` int(11) NOT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `catterreno`
--

INSERT INTO `catterreno` (`catTerrenoId`, `catTerrenoPropietario`, `catTerrenoArea`, `catTerrenoFechaCompra`, `catterrenoCosto`, `CatTerrenoEstado`, `catTerrenoNumeroCatastral`, `idActivofijo`, `updated_at`, `created_at`) VALUES
(2, 'Tesoros de Dios', '200mts Cuadrados', '2020-01-22', 2000, 2, '', 1, '2020-10-03', '2020-09-05'),
(3, 'Casa Bradley', '100mts Cuadrados', '2019-09-18', 1500, 1, '', 1, '2020-10-06', '2020-09-05'),
(4, 'Tesoros de Dios', '100 mts Cuadrados', '2020-05-14', 500, 2, '', 1, '2020-09-22', '2020-09-22'),
(5, 'Tesoros de Dios', '300 mts Cuadrados', '2020-10-03', 500, 1, '', 1, '2020-10-04', '2020-10-04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cattipocuentaactivofijo`
--

CREATE TABLE `cattipocuentaactivofijo` (
  `idActivofijo` int(11) NOT NULL,
  `ActivoFijoCodigoDescripcion` text NOT NULL,
  `descripcionActivoFjo` text NOT NULL,
  `vidaUtilActivoFijo` int(11) NOT NULL,
  `CatTipoCuentaActivoEstado` int(11) NOT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Catalogo de Tipo de cuentas de activo fijo';

--
-- Volcado de datos para la tabla `cattipocuentaactivofijo`
--

INSERT INTO `cattipocuentaactivofijo` (`idActivofijo`, `ActivoFijoCodigoDescripcion`, `descripcionActivoFjo`, `vidaUtilActivoFijo`, `CatTipoCuentaActivoEstado`, `updated_at`, `created_at`) VALUES
(1, '121100', 'Terreno', 0, 1, '2020-10-06', '2020-09-22'),
(2, '121200', 'Instalaciones', 120, 1, '2020-10-06', '2020-09-28'),
(3, '121300', 'Equipo Computo', 24, 1, '2020-10-06', '2020-10-01'),
(4, '121400', 'Mobiliario y Equipo de oficina', 60, 1, '2020-10-06', '2020-10-06'),
(5, '121500', 'Vehiculos', 60, 1, '2020-10-06', '2020-10-06'),
(6, '121600', 'Otros Activos', 0, 1, '2020-10-06', '2020-10-06'),
(7, '121700', 'Mobiliario y Equipo Docentes', 60, 1, '2020-10-06', '2020-10-06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catvehiculo`
--

CREATE TABLE `catvehiculo` (
  `catVehiculoId` int(11) NOT NULL,
  `catVehiculoTipo` text NOT NULL,
  `catVehiculoModelo` text NOT NULL,
  `catVehiculoColor` text NOT NULL,
  `catVehiculoMotor` text NOT NULL,
  `catVehiculoChasis` text NOT NULL,
  `catVehiculoVIM` text NOT NULL,
  `catVehiculoCantPasajeros` int(11) NOT NULL,
  `catVehiculoCombustible` text NOT NULL,
  `catVehiculoUso` text NOT NULL,
  `catVehiculoAnio` text NOT NULL,
  `catVehiculoCilindro` text NOT NULL,
  `catVehiculoServicio` text NOT NULL,
  `catVehiculoPropietario` text NOT NULL,
  `catVehiculoFechaCompra` date NOT NULL,
  `catVehiculoCosto` text NOT NULL,
  `catVehiculoEstado` int(11) NOT NULL,
  `catVehiculoPlaca` text NOT NULL,
  `idActivofijo` int(11) NOT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `catvehiculo`
--

INSERT INTO `catvehiculo` (`catVehiculoId`, `catVehiculoTipo`, `catVehiculoModelo`, `catVehiculoColor`, `catVehiculoMotor`, `catVehiculoChasis`, `catVehiculoVIM`, `catVehiculoCantPasajeros`, `catVehiculoCombustible`, `catVehiculoUso`, `catVehiculoAnio`, `catVehiculoCilindro`, `catVehiculoServicio`, `catVehiculoPropietario`, `catVehiculoFechaCompra`, `catVehiculoCosto`, `catVehiculoEstado`, `catVehiculoPlaca`, `idActivofijo`, `updated_at`, `created_at`) VALUES
(1, 'Bus', 'Coaster', 'Blanco', 'CUMIN', 'BLANCO', '456789', 12, 'Diésel', 'PRIVADO', '2010', '8', 'PARA ESTUDIANTES Y FAMILIAS', 'TESOROS DE DIOS', '2019-12-10', '2500', 1, '', 5, '2020-10-06', '2020-09-06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_08_30_055338_create_cattipocuentaactivofijos_table', 2),
(5, '2020_08_30_074746_catterreno', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('tecnologia@tesorosdedios.org', '$2y$10$1lG2aYPVKgQ9YCYGDhTFWObNTQEknfVybO5//XbY5xGP/aRDbxQEq', '2020-10-03 22:32:31');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `rptdetalleactivo_estadoactivo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `rptdetalleactivo_estadoactivo` (
`CATEGORIA` mediumtext
,`DETALLE_ACTIVO` mediumtext
,`FECHA_RECIBIDA` date
,`COSTO` mediumtext
,`VIDA_UTIL` int(11)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Allan', 'tecnologia@tesorosdedios.org', NULL, '$2y$10$t/P8vLpce1DTK48NQ/8yxe8flJIE1fpUFRwODoJwW8Kh80Kms/49G', 'U6MtoEhsu9BA6ZVgS0DmMki9B2rizCF8805iwimrV3B7u66Khzi8IvAqva8v', 1, '2020-08-17 04:52:20', '2020-08-17 04:52:20'),
(2, 'Wendy', 'wendy@tesorosdedios.org', NULL, '$2y$10$gLBNTIuZi0djmGP2CG2SZeW8K/mA7cktnamh3sh.G1dU3plRQlEKO', NULL, 1, '2020-10-03 06:00:00', '2020-10-05 03:41:17');

-- --------------------------------------------------------

--
-- Estructura para la vista `rptdetalleactivo_estadoactivo`
--
DROP TABLE IF EXISTS `rptdetalleactivo_estadoactivo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rptdetalleactivo_estadoactivo`  AS  select `cattipocuentaactivofijo`.`descripcionActivoFjo` AS `CATEGORIA`,`catelectrodomesticos`.`CatElectDescripcion` AS `DETALLE_ACTIVO`,`catelectrodomesticos`.`CatElectFechaIngreso` AS `FECHA_RECIBIDA`,`catelectrodomesticos`.`CatElectCosto` AS `COSTO`,`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `VIDA_UTIL` from (`catelectrodomesticos` join `cattipocuentaactivofijo`) where `catelectrodomesticos`.`idActivofijo` = `cattipocuentaactivofijo`.`idActivofijo` and `catelectrodomesticos`.`CatElectEstado` <> 2 union all select `cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`catequipocomputo`.`catEquipoMarca` AS `CatEquipoMarca`,`catequipocomputo`.`catEquipoFechaCompra` AS `CatequipoFechaCompra`,`catequipocomputo`.`catEquipoCostoEquipo` AS `catEquipoCostoEquipo`,`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo` from (`catequipocomputo` join `cattipocuentaactivofijo`) where `catequipocomputo`.`idActivofijo` = `cattipocuentaactivofijo`.`idActivofijo` and `catequipocomputo`.`CatEquipoEstado` <> 2 union all select `cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`catimpresoras`.`catImpresorasMarca` AS `catImpresorasMarca`,`catimpresoras`.`catImpresoraFechaIngreso` AS `catImpresoraFechaIngreso`,`catimpresoras`.`catImpresoraCosto` AS `catimpresoraCosto`,`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo` from (`catimpresoras` join `cattipocuentaactivofijo`) where `catimpresoras`.`idActivofijo` = `cattipocuentaactivofijo`.`idActivofijo` and `catimpresoras`.`CatImpresoraEstado` <> 2 union all select `cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`catvehiculo`.`catVehiculoModelo` AS `catvehiculoModelo`,`catvehiculo`.`catVehiculoFechaCompra` AS `catvehiculoFechaCompra`,`catvehiculo`.`catVehiculoCosto` AS `catVehiculoCosto`,`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo` from (`catvehiculo` join `cattipocuentaactivofijo`) where `catvehiculo`.`idActivofijo` = `cattipocuentaactivofijo`.`idActivofijo` and `catvehiculo`.`catVehiculoEstado` <> 2 union all select `cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`catterreno`.`catTerrenoPropietario` AS `catTerrenoPropietario`,`catterreno`.`catTerrenoFechaCompra` AS `catterrenoFechaCompra`,`catterreno`.`catterrenoCosto` AS `catterrenoCosto`,`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo` from (`catterreno` join `cattipocuentaactivofijo`) where `catterreno`.`idActivofijo` = `cattipocuentaactivofijo`.`idActivofijo` and `catterreno`.`CatTerrenoEstado` <> 2 ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `catelectrodomesticos`
--
ALTER TABLE `catelectrodomesticos`
  ADD PRIMARY KEY (`CatElectId`),
  ADD KEY `CatElectEstado` (`CatElectEstado`),
  ADD KEY `idActivofijo` (`idActivofijo`);

--
-- Indices de la tabla `catequipocomputo`
--
ALTER TABLE `catequipocomputo`
  ADD PRIMARY KEY (`catEquipoCompId`),
  ADD KEY `CatEquipoEstado` (`CatEquipoEstado`),
  ADD KEY `idActivofijo` (`idActivofijo`);

--
-- Indices de la tabla `catestado`
--
ALTER TABLE `catestado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `catimpresoras`
--
ALTER TABLE `catimpresoras`
  ADD PRIMARY KEY (`catImpresorasId`),
  ADD KEY `CatImpresoraEstado` (`CatImpresoraEstado`),
  ADD KEY `idActivofijo` (`idActivofijo`);

--
-- Indices de la tabla `catterreno`
--
ALTER TABLE `catterreno`
  ADD PRIMARY KEY (`catTerrenoId`),
  ADD KEY `CatTerrenoEstado` (`CatTerrenoEstado`),
  ADD KEY `idActivofijo` (`idActivofijo`);

--
-- Indices de la tabla `cattipocuentaactivofijo`
--
ALTER TABLE `cattipocuentaactivofijo`
  ADD PRIMARY KEY (`idActivofijo`),
  ADD KEY `CatTipoCuentaActivoEstado` (`CatTipoCuentaActivoEstado`);

--
-- Indices de la tabla `catvehiculo`
--
ALTER TABLE `catvehiculo`
  ADD PRIMARY KEY (`catVehiculoId`),
  ADD KEY `catVehiculoEstado` (`catVehiculoEstado`),
  ADD KEY `idActivofijo` (`idActivofijo`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `estado` (`estado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `catelectrodomesticos`
--
ALTER TABLE `catelectrodomesticos`
  MODIFY `CatElectId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `catequipocomputo`
--
ALTER TABLE `catequipocomputo`
  MODIFY `catEquipoCompId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `catestado`
--
ALTER TABLE `catestado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `catimpresoras`
--
ALTER TABLE `catimpresoras`
  MODIFY `catImpresorasId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `catterreno`
--
ALTER TABLE `catterreno`
  MODIFY `catTerrenoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cattipocuentaactivofijo`
--
ALTER TABLE `cattipocuentaactivofijo`
  MODIFY `idActivofijo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `catvehiculo`
--
ALTER TABLE `catvehiculo`
  MODIFY `catVehiculoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `catelectrodomesticos`
--
ALTER TABLE `catelectrodomesticos`
  ADD CONSTRAINT `catelectrodomesticos_ibfk_1` FOREIGN KEY (`CatElectEstado`) REFERENCES `catestado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `catelectrodomesticos_ibfk_2` FOREIGN KEY (`idActivofijo`) REFERENCES `cattipocuentaactivofijo` (`idActivofijo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `catequipocomputo`
--
ALTER TABLE `catequipocomputo`
  ADD CONSTRAINT `catequipocomputo_ibfk_1` FOREIGN KEY (`CatEquipoEstado`) REFERENCES `catestado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `catequipocomputo_ibfk_2` FOREIGN KEY (`idActivofijo`) REFERENCES `cattipocuentaactivofijo` (`idActivofijo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `catimpresoras`
--
ALTER TABLE `catimpresoras`
  ADD CONSTRAINT `catimpresoras_ibfk_1` FOREIGN KEY (`CatImpresoraEstado`) REFERENCES `catestado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `catimpresoras_ibfk_2` FOREIGN KEY (`idActivofijo`) REFERENCES `cattipocuentaactivofijo` (`idActivofijo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `catterreno`
--
ALTER TABLE `catterreno`
  ADD CONSTRAINT `catterreno_ibfk_1` FOREIGN KEY (`CatTerrenoEstado`) REFERENCES `catestado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `catterreno_ibfk_2` FOREIGN KEY (`idActivofijo`) REFERENCES `cattipocuentaactivofijo` (`idActivofijo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cattipocuentaactivofijo`
--
ALTER TABLE `cattipocuentaactivofijo`
  ADD CONSTRAINT `cattipocuentaactivofijo_ibfk_1` FOREIGN KEY (`CatTipoCuentaActivoEstado`) REFERENCES `catestado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `catvehiculo`
--
ALTER TABLE `catvehiculo`
  ADD CONSTRAINT `catvehiculo_ibfk_1` FOREIGN KEY (`catVehiculoEstado`) REFERENCES `catestado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `catvehiculo_ibfk_2` FOREIGN KEY (`idActivofijo`) REFERENCES `cattipocuentaactivofijo` (`idActivofijo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`estado`) REFERENCES `catestado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
