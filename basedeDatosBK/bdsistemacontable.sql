-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-10-2020 a las 05:13:57
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
(1, 'Sony', 'Lavadora', 'Lavadora de ropa, color blanca.', '2020-05-13', 300, 0, '2020-09-06', '2020-09-06');

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
(1, '20EV002JUS', '001002003004005', 'LENOVO', '250Gb, SSD', 'DDR4', '16Gb', 'WINDOWS 10 Pro', '0000-00-00', 0, 0, NULL, NULL),
(2, '20EV002JUS', '001002003004005', 'LENOVO', '250Gb, SSD', 'DDR4', '16Gb', 'WINDOWS 10 Pro', '0000-00-00', 250.5, 0, NULL, NULL),
(4, 'inspiron', 'MY1235678', 'HP', '250Gb', 'DDR4', '8Gb', 'windows10', '2020-06-10', 230, 0, '2020-09-06', '2020-09-06');

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
(1, 'Canon', 'MF4770N', '3500BN001', 'NEGRO, MULTIFUNCIONAL, CON ACCESO A RED LAN CABLE E INALAMBRICO', '2019-10-16', NULL, 0, NULL, NULL),
(2, 'Epson', 'MYL12345678', '128', 'Color negro, conectado por red inalambrica', '2020-06-09', 250, 0, '2020-09-06', '2020-09-06');

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
(2, 'Tesoros de Dios', '200mts Cuadrados', '2020-01-22', 2000, 0, '2020-09-05', '2020-09-05'),
(3, 'Tesoros de Dios', '100mts Cuadrados', '2019-09-18', 1500, 0, '2020-09-05', '2020-09-05'),
(4, 'Tesoros de Dios', '100 mts Cuadrados', '2020-05-14', 500, 0, '2020-09-22', '2020-09-22');

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
(6, 'Tecnologia', 60, 0, '2020-10-01', '2020-09-22'),
(16, 'Electrodomesticos', 60, 0, '2020-10-01', '2020-09-28'),
(17, 'Terreno', 120, 0, '2020-10-01', '2020-10-01');

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
(1, 'Bus', 'Coaster', 'Blanco', 'CUMIN', 'BLANCO', '456789', 12, 'Diésel', 'PRIVADO', '2010', '8', 'PARA ESTUDIANTES Y FAMILIAS', 'TESOROS DE DIOS', '2019-12-10', '2500', 0, '2020-09-06', '2020-09-06');

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
  MODIFY `CatElectId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `catequipocomputo`
--
ALTER TABLE `catequipocomputo`
  MODIFY `catEquipoCompId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `catimpresoras`
--
ALTER TABLE `catimpresoras`
  MODIFY `catImpresorasId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `catterreno`
--
ALTER TABLE `catterreno`
  MODIFY `catTerrenoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
