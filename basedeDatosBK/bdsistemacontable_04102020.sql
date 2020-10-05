-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-10-2020 a las 05:23:04
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
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `catelectrodomesticos`
--

INSERT INTO `catelectrodomesticos` (`CatElectId`, `CatElectMarca`, `CatElectModelo`, `CatElectDescripcion`, `CatElectFechaIngreso`, `CatElectCosto`, `CatElectEstado`, `updated_at`, `created_at`) VALUES
(1, 'Sony', 'Lavadora', 'Lavadora de ropa, color blanca.', '2020-05-13', 300, 1, '2020-10-03', '2020-09-06');

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
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `catequipocomputo`
--

INSERT INTO `catequipocomputo` (`catEquipoCompId`, `catEquipoModelo`, `catEquipoNumeroSerie`, `catEquipoMarca`, `catEquipoTamanioAlmacenamiento`, `TipoMemoriaRAM`, `catEquipoCantidadRAM`, `catEquipoTipoSO`, `catEquipoFechaCompra`, `catEquipoCostoEquipo`, `CatEquipoEstado`, `updated_at`, `created_at`) VALUES
(1, '20EV002JUS', '001002003004005', 'LENOVO', '250Gb, SSD', 'DDR4', '16Gb', 'WINDOWS 10 Pro', '0000-00-00', 0, 2, '2020-10-03', NULL),
(2, '20EV002JUS', '001002003004005', 'LENOVO', '250Gb, SSD', 'DDR4', '16Gb', 'WINDOWS 10 Pro', '0000-00-00', 250.5, 1, '2020-10-03', NULL),
(4, 'inspiron', 'MY1235678', 'HP', '250Gb', 'DDR4', '8Gb', 'windows10', '2020-06-10', 230, 1, '2020-10-03', '2020-09-06');

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
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `catimpresoras`
--

INSERT INTO `catimpresoras` (`catImpresorasId`, `catImpresorasMarca`, `catImpresoraModelo`, `catImpresoraTipoToner`, `catImpresoraDescripcion`, `catImpresoraFechaIngreso`, `catImpresoraCosto`, `CatImpresoraEstado`, `updated_at`, `created_at`) VALUES
(1, 'Canon', 'MF4770N', '3500BN001', 'NEGRO, MULTIFUNCIONAL, CON ACCESO A RED LAN CABLE E INALAMBRICO', '2019-10-16', NULL, 1, '2020-10-03', NULL),
(2, 'Epson', 'MYL12345678', '128', 'Color negro, conectado por red inalambrica', '2020-06-09', 250, 2, '2020-10-03', '2020-09-06');

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
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `catterreno`
--

INSERT INTO `catterreno` (`catTerrenoId`, `catTerrenoPropietario`, `catTerrenoArea`, `catTerrenoFechaCompra`, `catterrenoCosto`, `CatTerrenoEstado`, `updated_at`, `created_at`) VALUES
(2, 'Tesoros de Dios', '200mts Cuadrados', '2020-01-22', 2000, 2, '2020-10-03', '2020-09-05'),
(3, 'Tesoros de Dios', '100mts Cuadrados', '2019-09-18', 1500, 1, '2020-10-03', '2020-09-05'),
(4, 'Tesoros de Dios', '100 mts Cuadrados', '2020-05-14', 500, 2, '2020-09-22', '2020-09-22'),
(5, 'Tesoros de Dios', '300 mts Cuadrados', '2020-10-03', 500, 1, '2020-10-04', '2020-10-04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cattipocuentaactivofijo`
--

CREATE TABLE `cattipocuentaactivofijo` (
  `idActivofijo` int(11) NOT NULL,
  `descripcionActivoFjo` text NOT NULL,
  `vidaUtilActivoFijo` int(11) NOT NULL,
  `CatTipoCuentaActivoEstado` int(11) NOT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Catalogo de Tipo de cuentas de activo fijo';

--
-- Volcado de datos para la tabla `cattipocuentaactivofijo`
--

INSERT INTO `cattipocuentaactivofijo` (`idActivofijo`, `descripcionActivoFjo`, `vidaUtilActivoFijo`, `CatTipoCuentaActivoEstado`, `updated_at`, `created_at`) VALUES
(6, 'Tecnologia', 60, 1, '2020-10-04', '2020-09-22'),
(16, 'Electrodomesticos', 60, 1, '2020-10-04', '2020-09-28'),
(17, 'Terreno', 120, 2, '2020-10-01', '2020-10-01');

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
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `catvehiculo`
--

INSERT INTO `catvehiculo` (`catVehiculoId`, `catVehiculoTipo`, `catVehiculoModelo`, `catVehiculoColor`, `catVehiculoMotor`, `catVehiculoChasis`, `catVehiculoVIM`, `catVehiculoCantPasajeros`, `catVehiculoCombustible`, `catVehiculoUso`, `catVehiculoAnio`, `catVehiculoCilindro`, `catVehiculoServicio`, `catVehiculoPropietario`, `catVehiculoFechaCompra`, `catVehiculoCosto`, `catVehiculoEstado`, `updated_at`, `created_at`) VALUES
(1, 'Bus', 'Coaster', 'Blanco', 'CUMIN', 'BLANCO', '456789', 12, 'Diésel', 'PRIVADO', '2010', '8', 'PARA ESTUDIANTES Y FAMILIAS', 'TESOROS DE DIOS', '2019-12-10', '2500', 2, '2020-10-03', '2020-09-06');

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

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `catelectrodomesticos`
--
ALTER TABLE `catelectrodomesticos`
  ADD PRIMARY KEY (`CatElectId`),
  ADD KEY `CatElectEstado` (`CatElectEstado`);

--
-- Indices de la tabla `catequipocomputo`
--
ALTER TABLE `catequipocomputo`
  ADD PRIMARY KEY (`catEquipoCompId`),
  ADD KEY `CatEquipoEstado` (`CatEquipoEstado`);

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
  ADD KEY `CatImpresoraEstado` (`CatImpresoraEstado`);

--
-- Indices de la tabla `catterreno`
--
ALTER TABLE `catterreno`
  ADD PRIMARY KEY (`catTerrenoId`),
  ADD KEY `CatTerrenoEstado` (`CatTerrenoEstado`);

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
  ADD KEY `catVehiculoEstado` (`catVehiculoEstado`);

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
  MODIFY `idActivofijo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
  ADD CONSTRAINT `catelectrodomesticos_ibfk_1` FOREIGN KEY (`CatElectEstado`) REFERENCES `catestado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `catequipocomputo`
--
ALTER TABLE `catequipocomputo`
  ADD CONSTRAINT `catequipocomputo_ibfk_1` FOREIGN KEY (`CatEquipoEstado`) REFERENCES `catestado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `catimpresoras`
--
ALTER TABLE `catimpresoras`
  ADD CONSTRAINT `catimpresoras_ibfk_1` FOREIGN KEY (`CatImpresoraEstado`) REFERENCES `catestado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `catterreno`
--
ALTER TABLE `catterreno`
  ADD CONSTRAINT `catterreno_ibfk_1` FOREIGN KEY (`CatTerrenoEstado`) REFERENCES `catestado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cattipocuentaactivofijo`
--
ALTER TABLE `cattipocuentaactivofijo`
  ADD CONSTRAINT `cattipocuentaactivofijo_ibfk_1` FOREIGN KEY (`CatTipoCuentaActivoEstado`) REFERENCES `catestado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `catvehiculo`
--
ALTER TABLE `catvehiculo`
  ADD CONSTRAINT `catvehiculo_ibfk_1` FOREIGN KEY (`catVehiculoEstado`) REFERENCES `catestado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`estado`) REFERENCES `catestado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
