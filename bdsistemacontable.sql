-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-08-2020 a las 10:23:07
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
  `CatElectFechaIngreso` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catequipocomputo`
--

CREATE TABLE `catequipocomputo` (
  `catEquipoCompId` int(11) NOT NULL,
  `catEquipoModelo` text NOT NULL,
  `catEquipoNumeroSerie` text NOT NULL,
  `catEquipoMarca` text NOT NULL,
  `catEquipoTamañoAlmacenamiento` text NOT NULL,
  `TipoMemoriaRAM` text NOT NULL,
  `catEquipoCantidadRAM` text NOT NULL,
  `catEquipoTipoSO` text NOT NULL,
  `catEquipoFechaCompra` date NOT NULL,
  `catEquipoCostoEquipo` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `catImpresoraFechaIngreso` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catterreno`
--

CREATE TABLE `catterreno` (
  `catTerrenoId` int(11) NOT NULL,
  `catTerrenoPropietario` text NOT NULL,
  `catTerrenoArea` text NOT NULL,
  `catTerrenoFechaCompra` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `catterreno`
--

INSERT INTO `catterreno` (`catTerrenoId`, `catTerrenoPropietario`, `catTerrenoArea`, `catTerrenoFechaCompra`) VALUES
(1, 'Tesoros de Dios', '150mts cuadrados, área de Equinoterapia', '2018-11-14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cattipocuentaactivofijo`
--

CREATE TABLE `cattipocuentaactivofijo` (
  `idActivofijo` int(11) NOT NULL,
  `descripcionActivoFjo` text NOT NULL,
  `vidaUtilActivoFijo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Catalogo de Tipo de cuentas de activo fijo';

--
-- Volcado de datos para la tabla `cattipocuentaactivofijo`
--

INSERT INTO `cattipocuentaactivofijo` (`idActivofijo`, `descripcionActivoFjo`, `vidaUtilActivoFijo`) VALUES
(1, 'Electrodomesticos', 60),
(2, 'Impresoras', 60),
(3, 'Vehiculos', 60);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cattipocuentaactivofijos`
--

CREATE TABLE `cattipocuentaactivofijos` (
  `idActivofijo` int(10) UNSIGNED NOT NULL,
  `descripcionActivoFjo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `vidaUtilActivoFijo` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `catVehiculoAño` text NOT NULL,
  `catVehiculoCilindro` text NOT NULL,
  `catVehiculoServicio` text NOT NULL,
  `catVehiculoPropietario` text NOT NULL,
  `catVehiculoFechaCompra` date NOT NULL,
  `catVehiculoCosto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Allan', 'tecnologia@tesorosdedios.org', NULL, '$2y$10$t/P8vLpce1DTK48NQ/8yxe8flJIE1fpUFRwODoJwW8Kh80Kms/49G', '5GRr17HFqYwTOGx6Xd7lltfHNYzbR00V7kCZmFyoQFVmolvf6Sz1RP0o4d97', '2020-08-17 04:52:20', '2020-08-17 04:52:20');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `catelectrodomesticos`
--
ALTER TABLE `catelectrodomesticos`
  ADD PRIMARY KEY (`CatElectId`);

--
-- Indices de la tabla `catequipocomputo`
--
ALTER TABLE `catequipocomputo`
  ADD PRIMARY KEY (`catEquipoCompId`);

--
-- Indices de la tabla `catimpresoras`
--
ALTER TABLE `catimpresoras`
  ADD PRIMARY KEY (`catImpresorasId`);

--
-- Indices de la tabla `catterreno`
--
ALTER TABLE `catterreno`
  ADD PRIMARY KEY (`catTerrenoId`);

--
-- Indices de la tabla `cattipocuentaactivofijo`
--
ALTER TABLE `cattipocuentaactivofijo`
  ADD PRIMARY KEY (`idActivofijo`);

--
-- Indices de la tabla `cattipocuentaactivofijos`
--
ALTER TABLE `cattipocuentaactivofijos`
  ADD PRIMARY KEY (`idActivofijo`);

--
-- Indices de la tabla `catvehiculo`
--
ALTER TABLE `catvehiculo`
  ADD PRIMARY KEY (`catVehiculoId`);

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
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `catelectrodomesticos`
--
ALTER TABLE `catelectrodomesticos`
  MODIFY `CatElectId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `catequipocomputo`
--
ALTER TABLE `catequipocomputo`
  MODIFY `catEquipoCompId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `catimpresoras`
--
ALTER TABLE `catimpresoras`
  MODIFY `catImpresorasId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `catterreno`
--
ALTER TABLE `catterreno`
  MODIFY `catTerrenoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cattipocuentaactivofijo`
--
ALTER TABLE `cattipocuentaactivofijo`
  MODIFY `idActivofijo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cattipocuentaactivofijos`
--
ALTER TABLE `cattipocuentaactivofijos`
  MODIFY `idActivofijo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `catvehiculo`
--
ALTER TABLE `catvehiculo`
  MODIFY `catVehiculoId` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
