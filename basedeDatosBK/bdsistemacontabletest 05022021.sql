-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2021 at 09:31 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bdsistemacontabletest`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPdetalleactivo_estadoAlta_busqueda` (IN `mes` TEXT, IN `anio` TEXT)  BEGIN
    SELECT
        `QUERYALTA`.`CATEGORIA`,
        `QUERYALTA`.`DETALLE_ACTIVO`,
        `QUERYALTA`.`FECHA_BAJA`,
        `QUERYALTA`.`FECHA_RECIBIDA`,
        `QUERYALTA`.`COSTO`,
        `QUERYALTA`.`VIDA_UTIL`,
        `QUERYALTA`.`MESES`,
        `QUERYALTA`.`depreciacionMensual`,
        `QUERYALTA`.`depreciacionAcumulada`,
        `QUERYALTA`.`saldoEnLibro`
    FROM
        (
        SELECT
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `CATEGORIA`,
            `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectDescripcion` AS `DETALLE_ACTIVO`,
            `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso` AS `FECHA_RECIBIDA`,
            `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto` AS `COSTO`,
            `bdsistemacontabletest`.`catelectrodomesticos`.`updated_at` AS `FECHA_BAJA`,
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `VIDA_UTIL`,
            `calculoMes`(
                CURDATE(), `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso`) AS `MESES`,
                `depreciacionMensual`(
                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                    `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`
                ) AS `depreciacionMensual`,
                `depreciacionAcumulativa`(
                    `calculoMes`(
                        CURDATE(), `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso`),
                        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                        `depreciacionMensual`(
                            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                            `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`
                        )
                    ) AS `depreciacionAcumulada`,
                    `saldoEnLibro`(
                        `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`,
                        `depreciacionAcumulativa`(
                            `calculoMes`(
                                CURDATE(), `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso`),
                                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                `depreciacionMensual`(
                                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                    `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`
                                )
                            )
                        ) AS `saldoEnLibro`
                    FROM
                        (
                            `bdsistemacontabletest`.`catelectrodomesticos`
                        JOIN `bdsistemacontabletest`.`cattipocuentaactivofijo`
                        )
                    WHERE
                        (
                            `bdsistemacontabletest`.`catelectrodomesticos`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectEstado` <> 2
                        )
                    UNION ALL
                SELECT
                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `CATEGORIA`,
                    `bdsistemacontabletest`.`catequipocomputo`.`catEquipoMarca` AS `DETALLE_ACTIVO`,
                    `bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra` AS `FECHA_RECIBIDA`,
                    `bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo` AS `COSTO`,
                    `bdsistemacontabletest`.`catequipocomputo`.`updated_at` AS `FECHA_BAJA`,
                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `VIDA_UTIL`,
                    `calculoMes`(
                        CURDATE(), `bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra`) AS `MESES`,
                        `depreciacionMensual`(
                            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                            `bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`
                        ) AS `depreciacionMensual`,
                        `depreciacionAcumulativa`(
                            `calculoMes`(
                                CURDATE(), `bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra`),
                                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                `depreciacionMensual`(
                                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                    `bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`
                                )
                            ) AS `depreciacionAcumulada`,
                            `saldoEnLibro`(
                                `bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`,
                                `depreciacionAcumulativa`(
                                    `calculoMes`(
                                        CURDATE(), `bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra`),
                                        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                        `depreciacionMensual`(
                                            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                            `bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`
                                        )
                                    )
                                ) AS `saldoEnLibro`
                            FROM
                                (
                                    `bdsistemacontabletest`.`catequipocomputo`
                                JOIN `bdsistemacontabletest`.`cattipocuentaactivofijo`
                                )
                            WHERE
                                (
                                    `bdsistemacontabletest`.`catequipocomputo`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontabletest`.`catequipocomputo`.`CatEquipoEstado` <> 2
                                )
                            UNION ALL
                        SELECT
                            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `CATEGORIA`,
                            `bdsistemacontabletest`.`catimpresoras`.`catImpresorasMarca` AS `DETALLE_ACTIVO`,
                            `bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso` AS `FECHA_RECIBIDA`,
                            `bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto` AS `COSTO`,
                            `bdsistemacontabletest`.`catimpresoras`.`updated_at` AS `FECHA_BAJA`,
                            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `VIDA_UTIL`,
                            `calculoMes`(
                                CURDATE(), `bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso`) AS `MESES`,
                                `depreciacionMensual`(
                                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                    `bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`
                                ) AS `depreciacionMensual`,
                                `depreciacionAcumulativa`(
                                    `calculoMes`(
                                        CURDATE(), `bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso`),
                                        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                        `depreciacionMensual`(
                                            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                            `bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`
                                        )
                                    ) AS `depreciacionAcumulada`,
                                    `saldoEnLibro`(
                                        `bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`,
                                        `depreciacionAcumulativa`(
                                            `calculoMes`(
                                                CURDATE(), `bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso`),
                                                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                `depreciacionMensual`(
                                                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                    `bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`
                                                )
                                            )
                                        ) AS `saldoEnLibro`
                                    FROM
                                        (
                                            `bdsistemacontabletest`.`catimpresoras`
                                        JOIN `bdsistemacontabletest`.`cattipocuentaactivofijo`
                                        )
                                    WHERE
                                        (
                                            `bdsistemacontabletest`.`catimpresoras`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontabletest`.`catimpresoras`.`CatImpresoraEstado` <> 2
                                        )
                                    UNION ALL
                                SELECT
                                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `CATEGORIA`,
                                    `bdsistemacontabletest`.`catvehiculo`.`catVehiculoModelo` AS `DETALLE_ACTIVO`,
                                    `bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra` AS `FECHA_RECIBIDA`,
                                    `bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto` AS `COSTO`,
                                    `bdsistemacontabletest`.`catvehiculo`.`updated_at` AS `FECHA_BAJA`,
                                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `VIDA_UTIL`,
                                    `calculoMes`(
                                        CURDATE(), `bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra`) AS `MESES`,
                                        `depreciacionMensual`(
                                            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                            `bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`
                                        ) AS `depreciacionMensual`,
                                        `depreciacionAcumulativa`(
                                            `calculoMes`(
                                                CURDATE(), `bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra`),
                                                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                `depreciacionMensual`(
                                                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                    `bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`
                                                )
                                            ) AS `depreciacionAcumulada`,
                                            `saldoEnLibro`(
                                                `bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`,
                                                `depreciacionAcumulativa`(
                                                    `calculoMes`(
                                                        CURDATE(), `bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra`),
                                                        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                        `depreciacionMensual`(
                                                            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                            `bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`
                                                        )
                                                    )
                                                ) AS `saldoEnLibro`
                                            FROM
                                                (
                                                    `bdsistemacontabletest`.`catvehiculo`
                                                JOIN `bdsistemacontabletest`.`cattipocuentaactivofijo`
                                                )
                                            WHERE
                                                (
                                                    `bdsistemacontabletest`.`catvehiculo`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontabletest`.`catvehiculo`.`catVehiculoEstado` <> 2
                                                )
                                            UNION ALL
                                        SELECT
                                            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `CATEGORIA`,
                                            `bdsistemacontabletest`.`catterreno`.`catTerrenoPropietario` AS `DETALLE_ACTIVO`,
                                            `bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra` AS `FECHA_RECIBIDA`,
                                            `bdsistemacontabletest`.`catterreno`.`catterrenoCosto` AS `COSTO`,
                                            `bdsistemacontabletest`.`catterreno`.`updated_at` AS `FECHA_BAJA`,
                                            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `VIDA_UTIL`,
                                            `calculoMes`(
                                                CURDATE(), `bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra`) AS `MESES`,
                                                `depreciacionMensual`(
                                                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                    `bdsistemacontabletest`.`catterreno`.`catterrenoCosto`
                                                ) AS `depreciacionMensual`,
                                                `depreciacionAcumulativa`(
                                                    `calculoMes`(
                                                        CURDATE(), `bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra`),
                                                        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                        `depreciacionMensual`(
                                                            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                            `bdsistemacontabletest`.`catterreno`.`catterrenoCosto`
                                                        )
                                                    ) AS `depreciacionAcumulada`,
                                                    `saldoEnLibro`(
                                                        `bdsistemacontabletest`.`catterreno`.`catterrenoCosto`,
                                                        `depreciacionAcumulativa`(
                                                            `calculoMes`(
                                                                CURDATE(), `bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra`),
                                                                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                                `depreciacionMensual`(
                                                                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                                    `bdsistemacontabletest`.`catterreno`.`catterrenoCosto`
                                                                )
                                                            )
                                                        ) AS `saldoEnLibro`
                                                    FROM
                                                        (
                                                            `bdsistemacontabletest`.`catterreno`
                                                        JOIN `bdsistemacontabletest`.`cattipocuentaactivofijo`
                                                        )
                                                    WHERE
                                                        (
                                                            `bdsistemacontabletest`.`catterreno`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontabletest`.`catterreno`.`CatTerrenoEstado` <> 2
                                                        )
                                                    ) AS `QUERYALTA`
                                                WHERE
                                                    MONTH(`QUERYALTA`.`FECHA_RECIBIDA`) = mes AND YEAR(`QUERYALTA`.`FECHA_RECIBIDA`) = anio;
                                                END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPdetalleactivo_estadobajas_busqueda` (IN `mes` TEXT CHARSET utf8, IN `anio` TEXT CHARSET utf8)  SELECT
    `QUERYBAJA`.`CATEGORIA`,
    `QUERYBAJA`.`DETALLE_ACTIVO`,
    `QUERYBAJA`.`FECHA_BAJA`,
    `QUERYBAJA`.`FECHA_RECIBIDA`,
    `QUERYBAJA`.`COSTO`,
    `QUERYBAJA`.`VIDA_UTIL`,
    `QUERYBAJA`.`MESES`,
    `QUERYBAJA`.`depreciacionMensual`,
    `QUERYBAJA`.`depreciacionAcumulada`,
    `QUERYBAJA`.`saldoEnLibro`
FROM
(SELECT
    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `CATEGORIA`,
    `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectDescripcion` AS `DETALLE_ACTIVO`,
    `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso` AS `FECHA_RECIBIDA`,
    `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto` AS `COSTO`,
    `bdsistemacontabletest`.`catelectrodomesticos`.`updated_at` AS `FECHA_BAJA`,
    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `VIDA_UTIL`,
    `calculoMes`(
        CURDATE(), `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso`) AS `MESES`,
        `depreciacionMensual`(
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
            `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`
        ) AS `depreciacionMensual`,
        `depreciacionAcumulativa`(
            `calculoMes`(
                CURDATE(), `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso`),
                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                `depreciacionMensual`(
                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                    `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`
                )
            ) AS `depreciacionAcumulada`,
            `saldoEnLibro`(
                `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`,
                `depreciacionAcumulativa`(
                    `calculoMes`(
                        CURDATE(), `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso`),
                        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                        `depreciacionMensual`(
                            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                            `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`
                        )
                    )
                ) AS `saldoEnLibro`
            FROM
                (
                    `bdsistemacontabletest`.`catelectrodomesticos`
                JOIN `bdsistemacontabletest`.`cattipocuentaactivofijo`
                )
            WHERE
                (
                    `bdsistemacontabletest`.`catelectrodomesticos`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectEstado` <> 1
                )
                UNION ALL
        SELECT
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `CATEGORIA`,
            `bdsistemacontabletest`.`catequipocomputo`.`catEquipoMarca` AS `DETALLE_ACTIVO`,
            `bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra` AS `FECHA_RECIBIDA`,
            `bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo` AS `COSTO`,
            `bdsistemacontabletest`.`catequipocomputo`.`updated_at` AS `FECHA_BAJA`,
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `VIDA_UTIL`,
            `calculoMes`(
                CURDATE(), `bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra`) AS `MESES`,
                `depreciacionMensual`(
                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                    `bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`
                ) AS `depreciacionMensual`,
                `depreciacionAcumulativa`(
                    `calculoMes`(
                        CURDATE(), `bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra`),
                        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                        `depreciacionMensual`(
                            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                            `bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`
                        )
                    ) AS `depreciacionAcumulada`,
                    `saldoEnLibro`(
                        `bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`,
                        `depreciacionAcumulativa`(
                            `calculoMes`(
                                CURDATE(), `bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra`),
                                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                `depreciacionMensual`(
                                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                    `bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`
                                )
                            )
                        ) AS `saldoEnLibro`
                    FROM
                        (
                            `bdsistemacontabletest`.`catequipocomputo`
                        JOIN `bdsistemacontabletest`.`cattipocuentaactivofijo`
                        )
                    WHERE
                        (
                            `bdsistemacontabletest`.`catequipocomputo`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontabletest`.`catequipocomputo`.`CatEquipoEstado` <> 1
                        )
                        UNION ALL
                SELECT
                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `CATEGORIA`,
                    `bdsistemacontabletest`.`catimpresoras`.`catImpresorasMarca` AS `DETALLE_ACTIVO`,
                    `bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso` AS `FECHA_RECIBIDA`,
                    `bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto` AS `COSTO`,
                    `bdsistemacontabletest`.`catimpresoras`.`updated_at` AS `FECHA_BAJA`,
                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `VIDA_UTIL`,
                    `calculoMes`(
                        CURDATE(), `bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso`) AS `MESES`,
                        `depreciacionMensual`(
                            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                            `bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`
                        ) AS `depreciacionMensual`,
                        `depreciacionAcumulativa`(
                            `calculoMes`(
                                CURDATE(), `bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso`),
                                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                `depreciacionMensual`(
                                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                    `bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`
                                )
                            ) AS `depreciacionAcumulada`,
                            `saldoEnLibro`(
                                `bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`,
                                `depreciacionAcumulativa`(
                                    `calculoMes`(
                                        CURDATE(), `bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso`),
                                        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                        `depreciacionMensual`(
                                            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                            `bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`
                                        )
                                    )
                                ) AS `saldoEnLibro`
                            FROM
                                (
                                    `bdsistemacontabletest`.`catimpresoras`
                                JOIN `bdsistemacontabletest`.`cattipocuentaactivofijo`
                                )
                            WHERE
                                (
                                    `bdsistemacontabletest`.`catimpresoras`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontabletest`.`catimpresoras`.`CatImpresoraEstado` <> 1
                                )
                                UNION ALL
                        SELECT
                            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `CATEGORIA`,
                            `bdsistemacontabletest`.`catvehiculo`.`catVehiculoModelo` AS `DETALLE_ACTIVO`,
                            `bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra` AS `FECHA_RECIBIDA`,
                            `bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto` AS `COSTO`,
                            `bdsistemacontabletest`.`catvehiculo`.`updated_at` AS `FECHA_BAJA`,
                            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `VIDA_UTIL`,
                            `calculoMes`(
                                CURDATE(), `bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra`) AS `MESES`,
                                `depreciacionMensual`(
                                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                    `bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`
                                ) AS `depreciacionMensual`,
                                `depreciacionAcumulativa`(
                                    `calculoMes`(
                                        CURDATE(), `bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra`),
                                        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                        `depreciacionMensual`(
                                            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                            `bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`
                                        )
                                    ) AS `depreciacionAcumulada`,
                                    `saldoEnLibro`(
                                        `bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`,
                                        `depreciacionAcumulativa`(
                                            `calculoMes`(
                                                CURDATE(), `bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra`),
                                                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                `depreciacionMensual`(
                                                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                    `bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`
                                                )
                                            )
                                        ) AS `saldoEnLibro`
                                    FROM
                                        (
                                            `bdsistemacontabletest`.`catvehiculo`
                                        JOIN `bdsistemacontabletest`.`cattipocuentaactivofijo`
                                        )
                                    WHERE
                                        (
                                            `bdsistemacontabletest`.`catvehiculo`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontabletest`.`catvehiculo`.`catVehiculoEstado` <> 1
                                        )
                                        UNION ALL
                                SELECT
                                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `CATEGORIA`,
                                    `bdsistemacontabletest`.`catterreno`.`catTerrenoPropietario` AS `DETALLE_ACTIVO`,
                                    `bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra` AS `FECHA_RECIBIDA`,
                                    `bdsistemacontabletest`.`catterreno`.`catterrenoCosto` AS `COSTO`,
                                    `bdsistemacontabletest`.`catterreno`.`updated_at` AS `FECHA_BAJA`,
                                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `VIDA_UTIL`,
                                    `calculoMes`(
                                        CURDATE(), `bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra`) AS `MESES`,
                                        `depreciacionMensual`(
                                            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                            `bdsistemacontabletest`.`catterreno`.`catterrenoCosto`
                                        ) AS `depreciacionMensual`,
                                        `depreciacionAcumulativa`(
                                            `calculoMes`(
                                                CURDATE(), `bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra`),
                                                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                `depreciacionMensual`(
                                                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                    `bdsistemacontabletest`.`catterreno`.`catterrenoCosto`
                                                )
                                            ) AS `depreciacionAcumulada`,
                                            `saldoEnLibro`(
                                                `bdsistemacontabletest`.`catterreno`.`catterrenoCosto`,
                                                `depreciacionAcumulativa`(
                                                    `calculoMes`(
                                                        CURDATE(), `bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra`),
                                                        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                        `depreciacionMensual`(
                                                            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                            `bdsistemacontabletest`.`catterreno`.`catterrenoCosto`
                                                        )
                                                    )
                                                ) AS `saldoEnLibro`
                                            FROM
                                                (
                                                    `bdsistemacontabletest`.`catterreno`
                                                JOIN `bdsistemacontabletest`.`cattipocuentaactivofijo`
                                                )
                                            WHERE
                                                (
                                                    `bdsistemacontabletest`.`catterreno`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontabletest`.`catterreno`.`CatTerrenoEstado` <> 1
                                                )
 ) AS `QUERYBAJA`
  WHERE
                                                MONTH(`QUERYBAJA`.`FECHA_BAJA`) = mes AND YEAR(`QUERYBAJA`.`FECHA_BAJA`) = anio$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPgenerarReporteFecha` (IN `fecha` DATE)  BEGIN
SELECT  `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `CATEGORIA`,
        `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectDescripcion` AS `DETALLE_ACTIVO`,
        `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso` AS `FECHA_RECIBIDA`,
        `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto` AS `COSTO`,
        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `VIDA_UTIL`,
        `calculoMes`(
            fecha,
            `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso`
        ) AS `MESES`,
        `depreciacionMensual`(
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
            `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`
        ) AS `depreciacionMensual`,
        `depreciacionAcumulativa`(
            `calculoMes`(
                fecha,
                `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso`
            ),
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
            `depreciacionMensual`(
                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`
            )
        ) AS `depreciacionAcumulada`,
        `saldoEnLibro`(
            `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`,
            `depreciacionAcumulativa`(
                `calculoMes`(
                    fecha,
                    `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso`
                ),
                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                `depreciacionMensual`(
                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                    `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`
                )
            )
        ) AS `saldoEnLibro`
    FROM
        (
            `bdsistemacontabletest`.`catelectrodomesticos`
        JOIN `bdsistemacontabletest`.`cattipocuentaactivofijo`
        )
    WHERE
        (`bdsistemacontabletest`.`catelectrodomesticos`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectEstado` <> 2)
    UNION ALL
SELECT
    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,
    `bdsistemacontabletest`.`catequipocomputo`.`catEquipoMarca` AS `CatEquipoMarca`,
    `bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra` AS `CatequipoFechaCompra`,
    `bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo` AS `catEquipoCostoEquipo`,
    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,
    `calculoMes`(
        fecha,
        `bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra`
    ) AS `MESES`,
    `depreciacionMensual`(
        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
        `bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`
    ) AS `depreciacionMensual`,
    `depreciacionAcumulativa`(
        `calculoMes`(
            fecha,
            `bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra`
        ),
        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
        `depreciacionMensual`(
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
            `bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`
        )
    ) AS `depreciacionAcumulada`,
    `saldoEnLibro`(
        `bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`,
        `depreciacionAcumulativa`(
            `calculoMes`(
                fecha,
                `bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra`
            ),
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
            `depreciacionMensual`(
                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                `bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`
            )
        )
    ) AS `saldoEnLibro`
FROM
    (
        `bdsistemacontabletest`.`catequipocomputo`
    JOIN `bdsistemacontabletest`.`cattipocuentaactivofijo`
    )
WHERE
    (`bdsistemacontabletest`.`catequipocomputo`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontabletest`.`catequipocomputo`.`CatEquipoEstado` <> 2)
UNION ALL
SELECT
    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,
    `bdsistemacontabletest`.`catimpresoras`.`catImpresorasMarca` AS `catImpresorasMarca`,
    `bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso` AS `catImpresoraFechaIngreso`,
    `bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto` AS `catimpresoraCosto`,
    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,
    `calculoMes`(
        fecha,
        `bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso`
    ) AS `MESES`,
    `depreciacionMensual`(
        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
        `bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`
    ) AS `depreciacionMensual`,
    `depreciacionAcumulativa`(
        `calculoMes`(
            fecha,
            `bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso`
        ),
        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
        `depreciacionMensual`(
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
            `bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`
        )
    ) AS `depreciacionAcumulada`,
    `saldoEnLibro`(
        `bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`,
        `depreciacionAcumulativa`(
            `calculoMes`(
                fecha,
                `bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso`
            ),
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
            `depreciacionMensual`(
                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                `bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`
            )
        )
    ) AS `saldoEnLibro`
FROM
    (
        `bdsistemacontabletest`.`catimpresoras`
    JOIN `bdsistemacontabletest`.`cattipocuentaactivofijo`
    )
WHERE
    (`bdsistemacontabletest`.`catimpresoras`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontabletest`.`catimpresoras`.`CatImpresoraEstado` <> 2)
UNION ALL
SELECT
    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,
    `bdsistemacontabletest`.`catvehiculo`.`catVehiculoModelo` AS `catvehiculoModelo`,
    `bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra` AS `catvehiculoFechaCompra`,
    `bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto` AS `catVehiculoCosto`,
    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,
    `calculoMes`(
        fecha,
        `bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra`
    ) AS `MESES`,
    `depreciacionMensual`(
        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
        `bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`
    ) AS `depreciacionMensual`,
    `depreciacionAcumulativa`(
        `calculoMes`(
            fecha,
            `bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra`
        ),
        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
        `depreciacionMensual`(
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
            `bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`
        )
    ) AS `depreciacionAcumulada`,
    `saldoEnLibro`(
        `bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`,
        `depreciacionAcumulativa`(
            `calculoMes`(
                fecha,
                `bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra`
            ),
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
            `depreciacionMensual`(
                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                `bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`
            )
        )
    ) AS `saldoEnLibro`
FROM
    (
        `bdsistemacontabletest`.`catvehiculo`
    JOIN `bdsistemacontabletest`.`cattipocuentaactivofijo`
    )
WHERE
    (`bdsistemacontabletest`.`catvehiculo`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontabletest`.`catvehiculo`.`catVehiculoEstado` <> 2)
UNION ALL
SELECT
    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,
    `bdsistemacontabletest`.`catterreno`.`catTerrenoPropietario` AS `catTerrenoPropietario`,
    `bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra` AS `catterrenoFechaCompra`,
    `bdsistemacontabletest`.`catterreno`.`catterrenoCosto` AS `catterrenoCosto`,
    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,
    `calculoMes`(
        fecha,
        `bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra`
    ) AS `MESES`,
    `depreciacionMensual`(
        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
        `bdsistemacontabletest`.`catterreno`.`catterrenoCosto`
    ) AS `depreciacionMensual`,
    `depreciacionAcumulativa`(
        `calculoMes`(
            fecha,
            `bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra`
        ),
        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
        `depreciacionMensual`(
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
            `bdsistemacontabletest`.`catterreno`.`catterrenoCosto`
        )
    ) AS `depreciacionAcumulada`,
    `saldoEnLibro`(
        `bdsistemacontabletest`.`catterreno`.`catterrenoCosto`,
        `depreciacionAcumulativa`(
            `calculoMes`(
                fecha,
                `bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra`
            ),
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
            `depreciacionMensual`(
                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                `bdsistemacontabletest`.`catterreno`.`catterrenoCosto`
            )
        )
    ) AS `saldoEnLibro`
FROM
    (
        `bdsistemacontabletest`.`catterreno`
    JOIN `bdsistemacontabletest`.`cattipocuentaactivofijo`
    )
WHERE
    (`bdsistemacontabletest`.`catterreno`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontabletest`.`catterreno`.`CatTerrenoEstado` <> 2) ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPrptconsolidadocategoriaactivofijo` ()  NO SQL
select `activo`.`CATEGORIA` AS `CATEGORIA`,`activo`.`DETALLE_ACTIVO` AS `DETALLE_ACTIVO`,sum(`activo`.`COSTO`) AS `COSTO`,sum(`activo`.`depreciacionMensual`) AS `DEPRECIACIONTOTALMENSUAL`,sum(`activo`.`depreciacionAcumulada`) AS `DEPRECIACIONTOTALACUMULADA`,sum(`activo`.`saldoEnLibro`) AS `SALDOTOTALLIBRO` from (select `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `CATEGORIA`,`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectDescripcion` AS `DETALLE_ACTIVO`,`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso` AS `FECHA_RECIBIDA`,`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto` AS `COSTO`,`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `VIDA_UTIL`,`calculoMes`(curdate(),`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso`) AS `MESES`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`))) AS `saldoEnLibro` from (`bdsistemacontabletest`.`catelectrodomesticos` join `bdsistemacontabletest`.`cattipocuentaactivofijo`) where `bdsistemacontabletest`.`catelectrodomesticos`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` and `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectEstado` <> 2 union all select `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`bdsistemacontabletest`.`catequipocomputo`.`catEquipoMarca` AS `CatEquipoMarca`,`bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra` AS `CatequipoFechaCompra`,`bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo` AS `catEquipoCostoEquipo`,`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra`) AS `MESES`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`))) AS `saldoEnLibro` from (`bdsistemacontabletest`.`catequipocomputo` join `bdsistemacontabletest`.`cattipocuentaactivofijo`) where `bdsistemacontabletest`.`catequipocomputo`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` and `bdsistemacontabletest`.`catequipocomputo`.`CatEquipoEstado` <> 2 union all select `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`bdsistemacontabletest`.`catimpresoras`.`catImpresorasMarca` AS `catImpresorasMarca`,`bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso` AS `catImpresoraFechaIngreso`,`bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto` AS `catimpresoraCosto`,`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso`) AS `MESES`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`))) AS `saldoEnLibro` from (`bdsistemacontabletest`.`catimpresoras` join `bdsistemacontabletest`.`cattipocuentaactivofijo`) where `bdsistemacontabletest`.`catimpresoras`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` and `bdsistemacontabletest`.`catimpresoras`.`CatImpresoraEstado` <> 2 union all select `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`bdsistemacontabletest`.`catvehiculo`.`catVehiculoModelo` AS `catvehiculoModelo`,`bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra` AS `catvehiculoFechaCompra`,`bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto` AS `catVehiculoCosto`,`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra`) AS `MESES`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`))) AS `saldoEnLibro` from (`bdsistemacontabletest`.`catvehiculo` join `bdsistemacontabletest`.`cattipocuentaactivofijo`) where `bdsistemacontabletest`.`catvehiculo`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` and `bdsistemacontabletest`.`catvehiculo`.`catVehiculoEstado` <> 2 union all select `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`bdsistemacontabletest`.`catterreno`.`catTerrenoPropietario` AS `catTerrenoPropietario`,`bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra` AS `catterrenoFechaCompra`,`bdsistemacontabletest`.`catterreno`.`catterrenoCosto` AS `catterrenoCosto`,`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra`) AS `MESES`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catterreno`.`catterrenoCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catterreno`.`catterrenoCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`bdsistemacontabletest`.`catterreno`.`catterrenoCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catterreno`.`catterrenoCosto`))) AS `saldoEnLibro` from (`bdsistemacontabletest`.`catterreno` join `bdsistemacontabletest`.`cattipocuentaactivofijo`) where `bdsistemacontabletest`.`catterreno`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` and `bdsistemacontabletest`.`catterreno`.`CatTerrenoEstado` <> 2) `activo` group by `activo`.`CATEGORIA`,`activo`.`DETALLE_ACTIVO` with rollup$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPrptdetalleactivo_estadoactivo` ()  NO SQL
select `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `CATEGORIA`,`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectDescripcion` AS `DETALLE_ACTIVO`,`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso` AS `FECHA_RECIBIDA`,`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto` AS `COSTO`,`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `VIDA_UTIL`,`calculoMes`(curdate(),`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso`) AS `MESES`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`))) AS `saldoEnLibro` from (`bdsistemacontabletest`.`catelectrodomesticos` join `bdsistemacontabletest`.`cattipocuentaactivofijo`) where `bdsistemacontabletest`.`catelectrodomesticos`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` and `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectEstado` <> 2 union all select `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`bdsistemacontabletest`.`catequipocomputo`.`catEquipoMarca` AS `CatEquipoMarca`,`bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra` AS `CatequipoFechaCompra`,`bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo` AS `catEquipoCostoEquipo`,`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra`) AS `MESES`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`))) AS `saldoEnLibro` from (`bdsistemacontabletest`.`catequipocomputo` join `bdsistemacontabletest`.`cattipocuentaactivofijo`) where `bdsistemacontabletest`.`catequipocomputo`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` and `bdsistemacontabletest`.`catequipocomputo`.`CatEquipoEstado` <> 2 union all select `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`bdsistemacontabletest`.`catimpresoras`.`catImpresorasMarca` AS `catImpresorasMarca`,`bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso` AS `catImpresoraFechaIngreso`,`bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto` AS `catimpresoraCosto`,`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso`) AS `MESES`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`))) AS `saldoEnLibro` from (`bdsistemacontabletest`.`catimpresoras` join `bdsistemacontabletest`.`cattipocuentaactivofijo`) where `bdsistemacontabletest`.`catimpresoras`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` and `bdsistemacontabletest`.`catimpresoras`.`CatImpresoraEstado` <> 2 union all select `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`bdsistemacontabletest`.`catvehiculo`.`catVehiculoModelo` AS `catvehiculoModelo`,`bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra` AS `catvehiculoFechaCompra`,`bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto` AS `catVehiculoCosto`,`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra`) AS `MESES`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`))) AS `saldoEnLibro` from (`bdsistemacontabletest`.`catvehiculo` join `bdsistemacontabletest`.`cattipocuentaactivofijo`) where `bdsistemacontabletest`.`catvehiculo`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` and `bdsistemacontabletest`.`catvehiculo`.`catVehiculoEstado` <> 2 union all select `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`bdsistemacontabletest`.`catterreno`.`catTerrenoPropietario` AS `catTerrenoPropietario`,`bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra` AS `catterrenoFechaCompra`,`bdsistemacontabletest`.`catterreno`.`catterrenoCosto` AS `catterrenoCosto`,`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra`) AS `MESES`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catterreno`.`catterrenoCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catterreno`.`catterrenoCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`bdsistemacontabletest`.`catterreno`.`catterrenoCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catterreno`.`catterrenoCosto`))) AS `saldoEnLibro` from (`bdsistemacontabletest`.`catterreno` join `bdsistemacontabletest`.`cattipocuentaactivofijo`) where `bdsistemacontabletest`.`catterreno`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` and `bdsistemacontabletest`.`catterreno`.`CatTerrenoEstado` <> 2$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPrptdetalleactivo_estadobajas` ()  NO SQL
select `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `CATEGORIA`,`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectDescripcion` AS `DETALLE_ACTIVO`,`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso` AS `FECHA_RECIBIDA`,`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto` AS `COSTO`,`bdsistemacontabletest`.`catelectrodomesticos`.`updated_at` AS `FECHA_BAJA`,`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `VIDA_UTIL`,`calculoMes`(curdate(),`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso`) AS `MESES`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`))) AS `saldoEnLibro` from (`bdsistemacontabletest`.`catelectrodomesticos` join `bdsistemacontabletest`.`cattipocuentaactivofijo`) where `bdsistemacontabletest`.`catelectrodomesticos`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` and `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectEstado` <> 1 union all select `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`bdsistemacontabletest`.`catequipocomputo`.`catEquipoMarca` AS `CatEquipoMarca`,`bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra` AS `CatequipoFechaCompra`,`bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo` AS `catEquipoCostoEquipo`,`bdsistemacontabletest`.`catequipocomputo`.`updated_at` AS `FECHA_BAJA`,`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra`) AS `MESES`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`))) AS `saldoEnLibro` from (`bdsistemacontabletest`.`catequipocomputo` join `bdsistemacontabletest`.`cattipocuentaactivofijo`) where `bdsistemacontabletest`.`catequipocomputo`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` and `bdsistemacontabletest`.`catequipocomputo`.`CatEquipoEstado` <> 1 union all select `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`bdsistemacontabletest`.`catimpresoras`.`catImpresorasMarca` AS `catImpresorasMarca`,`bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso` AS `catImpresoraFechaIngreso`,`bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto` AS `catimpresoraCosto`,`bdsistemacontabletest`.`catimpresoras`.`updated_at` AS `FECHA_BAJA`,`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso`) AS `MESES`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`))) AS `saldoEnLibro` from (`bdsistemacontabletest`.`catimpresoras` join `bdsistemacontabletest`.`cattipocuentaactivofijo`) where `bdsistemacontabletest`.`catimpresoras`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` and `bdsistemacontabletest`.`catimpresoras`.`CatImpresoraEstado` <> 1 union all select `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`bdsistemacontabletest`.`catvehiculo`.`catVehiculoModelo` AS `catvehiculoModelo`,`bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra` AS `catvehiculoFechaCompra`,`bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto` AS `catVehiculoCosto`,`bdsistemacontabletest`.`catvehiculo`.`updated_at` AS `FECHA_BAJA`,`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra`) AS `MESES`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`))) AS `saldoEnLibro` from (`bdsistemacontabletest`.`catvehiculo` join `bdsistemacontabletest`.`cattipocuentaactivofijo`) where `bdsistemacontabletest`.`catvehiculo`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` and `bdsistemacontabletest`.`catvehiculo`.`catVehiculoEstado` <> 1 union all select `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`bdsistemacontabletest`.`catterreno`.`catTerrenoPropietario` AS `catTerrenoPropietario`,`bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra` AS `catterrenoFechaCompra`,`bdsistemacontabletest`.`catterreno`.`catterrenoCosto` AS `catterrenoCosto`,`bdsistemacontabletest`.`catterreno`.`updated_at` AS `FECHA_BAJA`,`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra`) AS `MESES`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catterreno`.`catterrenoCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catterreno`.`catterrenoCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`bdsistemacontabletest`.`catterreno`.`catterrenoCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catterreno`.`catterrenoCosto`))) AS `saldoEnLibro` from (`bdsistemacontabletest`.`catterreno` join `bdsistemacontabletest`.`cattipocuentaactivofijo`) where `bdsistemacontabletest`.`catterreno`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` and `bdsistemacontabletest`.`catterreno`.`CatTerrenoEstado` <> 1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPRptdetallecategoriaactivofijo` (IN `fecha` DATE)  BEGIN
	SELECT
    `activo`.`CATEGORIA` AS `CATEGORIA`,
    `activo`.`DETALLE_ACTIVO` AS `DETALLE_ACTIVO`,
    SUM(`activo`.`COSTO`) AS `COSTO`,
    SUM(`activo`.`depreciacionMensual`) AS `DEPRECIACIONTOTALMENSUAL`,
    SUM(`activo`.`depreciacionAcumulada`) AS `DEPRECIACIONTOTALACUMULADA`,
    SUM(`activo`.`saldoEnLibro`) AS `SALDOTOTALLIBRO`
FROM
    (
    SELECT
        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `CATEGORIA`,
        `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectDescripcion` AS `DETALLE_ACTIVO`,
        `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso` AS `FECHA_RECIBIDA`,
        `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto` AS `COSTO`,
        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `VIDA_UTIL`,
        `calculoMes`(
            fecha, `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso`) AS `MESES`,
            `depreciacionMensual`(
                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`
            ) AS `depreciacionMensual`,
            `depreciacionAcumulativa`(
                `calculoMes`(
                    fecha, `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso`),
                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                    `depreciacionMensual`(
                        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                        `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`
                    )
                ) AS `depreciacionAcumulada`,
                `saldoEnLibro`(
                    `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`,
                    `depreciacionAcumulativa`(
                        `calculoMes`(
                            fecha, `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso`),
                            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                            `depreciacionMensual`(
                                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`
                            )
                        )
                    ) AS `saldoEnLibro`
                FROM
                    (
                        `bdsistemacontabletest`.`catelectrodomesticos`
                    JOIN `bdsistemacontabletest`.`cattipocuentaactivofijo`
                    )
                WHERE
                    `bdsistemacontabletest`.`catelectrodomesticos`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectEstado` <> 2
                UNION ALL
            SELECT
                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,
                `bdsistemacontabletest`.`catequipocomputo`.`catEquipoMarca` AS `CatEquipoMarca`,
                `bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra` AS `CatequipoFechaCompra`,
                `bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo` AS `catEquipoCostoEquipo`,
                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,
                `calculoMes`(
                    fecha, `bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra`) AS `MESES`,
                    `depreciacionMensual`(
                        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                        `bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`
                    ) AS `depreciacionMensual`,
                    `depreciacionAcumulativa`(
                        `calculoMes`(
                            fecha, `bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra`),
                            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                            `depreciacionMensual`(
                                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                `bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`
                            )
                        ) AS `depreciacionAcumulada`,
                        `saldoEnLibro`(
                            `bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`,
                            `depreciacionAcumulativa`(
                                `calculoMes`(
                                    fecha, `bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra`),
                                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                    `depreciacionMensual`(
                                        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                        `bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`
                                    )
                                )
                            ) AS `saldoEnLibro`
                        FROM
                            (
                                `bdsistemacontabletest`.`catequipocomputo`
                            JOIN `bdsistemacontabletest`.`cattipocuentaactivofijo`
                            )
                        WHERE
                            `bdsistemacontabletest`.`catequipocomputo`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontabletest`.`catequipocomputo`.`CatEquipoEstado` <> 2
                        UNION ALL
                    SELECT
                        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,
                        `bdsistemacontabletest`.`catimpresoras`.`catImpresorasMarca` AS `catImpresorasMarca`,
                        `bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso` AS `catImpresoraFechaIngreso`,
                        `bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto` AS `catimpresoraCosto`,
                        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,
                        `calculoMes`(
                            fecha, `bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso`) AS `MESES`,
                            `depreciacionMensual`(
                                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                `bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`
                            ) AS `depreciacionMensual`,
                            `depreciacionAcumulativa`(
                                `calculoMes`(
                                    fecha, `bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso`),
                                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                    `depreciacionMensual`(
                                        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                        `bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`
                                    )
                                ) AS `depreciacionAcumulada`,
                                `saldoEnLibro`(
                                    `bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`,
                                    `depreciacionAcumulativa`(
                                        `calculoMes`(
                                            fecha, `bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso`),
                                            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                            `depreciacionMensual`(
                                                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                `bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`
                                            )
                                        )
                                    ) AS `saldoEnLibro`
                                FROM
                                    (
                                        `bdsistemacontabletest`.`catimpresoras`
                                    JOIN `bdsistemacontabletest`.`cattipocuentaactivofijo`
                                    )
                                WHERE
                                    `bdsistemacontabletest`.`catimpresoras`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontabletest`.`catimpresoras`.`CatImpresoraEstado` <> 2
                                UNION ALL
                            SELECT
                                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,
                                `bdsistemacontabletest`.`catvehiculo`.`catVehiculoModelo` AS `catvehiculoModelo`,
                                `bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra` AS `catvehiculoFechaCompra`,
                                `bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto` AS `catVehiculoCosto`,
                                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,
                                `calculoMes`(
                                    fecha, `bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra`) AS `MESES`,
                                    `depreciacionMensual`(
                                        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                        `bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`
                                    ) AS `depreciacionMensual`,
                                    `depreciacionAcumulativa`(
                                        `calculoMes`(
                                            fecha, `bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra`),
                                            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                            `depreciacionMensual`(
                                                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                `bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`
                                            )
                                        ) AS `depreciacionAcumulada`,
                                        `saldoEnLibro`(
                                            `bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`,
                                            `depreciacionAcumulativa`(
                                                `calculoMes`(
                                                    fecha, `bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra`),
                                                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                    `depreciacionMensual`(
                                                        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                        `bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`
                                                    )
                                                )
                                            ) AS `saldoEnLibro`
                                        FROM
                                            (
                                                `bdsistemacontabletest`.`catvehiculo`
                                            JOIN `bdsistemacontabletest`.`cattipocuentaactivofijo`
                                            )
                                        WHERE
                                            `bdsistemacontabletest`.`catvehiculo`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontabletest`.`catvehiculo`.`catVehiculoEstado` <> 2
                                        UNION ALL
                                    SELECT
                                        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,
                                        `bdsistemacontabletest`.`catterreno`.`catTerrenoPropietario` AS `catTerrenoPropietario`,
                                        `bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra` AS `catterrenoFechaCompra`,
                                        `bdsistemacontabletest`.`catterreno`.`catterrenoCosto` AS `catterrenoCosto`,
                                        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,
                                        `calculoMes`(
                                            fecha, `bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra`) AS `MESES`,
                                            `depreciacionMensual`(
                                                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                `bdsistemacontabletest`.`catterreno`.`catterrenoCosto`
                                            ) AS `depreciacionMensual`,
                                            `depreciacionAcumulativa`(
                                                `calculoMes`(
                                                    fecha, `bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra`),
                                                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                    `depreciacionMensual`(
                                                        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                        `bdsistemacontabletest`.`catterreno`.`catterrenoCosto`
                                                    )
                                                ) AS `depreciacionAcumulada`,
                                                `saldoEnLibro`(
                                                    `bdsistemacontabletest`.`catterreno`.`catterrenoCosto`,
                                                    `depreciacionAcumulativa`(
                                                        `calculoMes`(
                                                            fecha, `bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra`),
                                                            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                            `depreciacionMensual`(
                                                                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                                `bdsistemacontabletest`.`catterreno`.`catterrenoCosto`
                                                            )
                                                        )
                                                    ) AS `saldoEnLibro`
                                                FROM
                                                    (
                                                        `bdsistemacontabletest`.`catterreno`
                                                    JOIN `bdsistemacontabletest`.`cattipocuentaactivofijo`
                                                    )
                                                WHERE
                                                    `bdsistemacontabletest`.`catterreno`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontabletest`.`catterreno`.`CatTerrenoEstado` <> 2
                                                ) `activo`
                                            GROUP BY
                                                `activo`.`CATEGORIA`,
                                                `activo`.`DETALLE_ACTIVO` WITH ROLLUP;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPrptdetallecategoriaactivofijoSinParametro` ()  NO SQL
select `activo`.`CATEGORIA` AS `CATEGORIA`,sum(`activo`.`COSTO`) AS `COSTO`,sum(`activo`.`depreciacionMensual`) AS `DEPRECIACIONTOTALMENSUAL`,sum(`activo`.`depreciacionAcumulada`) AS `DEPRECIACIONTOTALACUMULADA`,sum(`activo`.`saldoEnLibro`) AS `SALDOTOTALLIBRO` from (select `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `CATEGORIA`,`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectDescripcion` AS `DETALLE_ACTIVO`,`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso` AS `FECHA_RECIBIDA`,`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto` AS `COSTO`,`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `VIDA_UTIL`,`calculoMes`(curdate(),`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso`) AS `MESES`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`))) AS `saldoEnLibro` from (`bdsistemacontabletest`.`catelectrodomesticos` join `bdsistemacontabletest`.`cattipocuentaactivofijo`) where `bdsistemacontabletest`.`catelectrodomesticos`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` and `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectEstado` <> 2 union all select `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`bdsistemacontabletest`.`catequipocomputo`.`catEquipoMarca` AS `CatEquipoMarca`,`bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra` AS `CatequipoFechaCompra`,`bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo` AS `catEquipoCostoEquipo`,`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra`) AS `MESES`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`))) AS `saldoEnLibro` from (`bdsistemacontabletest`.`catequipocomputo` join `bdsistemacontabletest`.`cattipocuentaactivofijo`) where `bdsistemacontabletest`.`catequipocomputo`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` and `bdsistemacontabletest`.`catequipocomputo`.`CatEquipoEstado` <> 2 union all select `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`bdsistemacontabletest`.`catimpresoras`.`catImpresorasMarca` AS `catImpresorasMarca`,`bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso` AS `catImpresoraFechaIngreso`,`bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto` AS `catimpresoraCosto`,`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso`) AS `MESES`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`))) AS `saldoEnLibro` from (`bdsistemacontabletest`.`catimpresoras` join `bdsistemacontabletest`.`cattipocuentaactivofijo`) where `bdsistemacontabletest`.`catimpresoras`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` and `bdsistemacontabletest`.`catimpresoras`.`CatImpresoraEstado` <> 2 union all select `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`bdsistemacontabletest`.`catvehiculo`.`catVehiculoModelo` AS `catvehiculoModelo`,`bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra` AS `catvehiculoFechaCompra`,`bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto` AS `catVehiculoCosto`,`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra`) AS `MESES`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`))) AS `saldoEnLibro` from (`bdsistemacontabletest`.`catvehiculo` join `bdsistemacontabletest`.`cattipocuentaactivofijo`) where `bdsistemacontabletest`.`catvehiculo`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` and `bdsistemacontabletest`.`catvehiculo`.`catVehiculoEstado` <> 2 union all select `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`bdsistemacontabletest`.`catterreno`.`catTerrenoPropietario` AS `catTerrenoPropietario`,`bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra` AS `catterrenoFechaCompra`,`bdsistemacontabletest`.`catterreno`.`catterrenoCosto` AS `catterrenoCosto`,`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra`) AS `MESES`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catterreno`.`catterrenoCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catterreno`.`catterrenoCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`bdsistemacontabletest`.`catterreno`.`catterrenoCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra`),`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`bdsistemacontabletest`.`catterreno`.`catterrenoCosto`))) AS `saldoEnLibro` from (`bdsistemacontabletest`.`catterreno` join `bdsistemacontabletest`.`cattipocuentaactivofijo`) where `bdsistemacontabletest`.`catterreno`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` and `bdsistemacontabletest`.`catterreno`.`CatTerrenoEstado` <> 2) `activo` group by `activo`.`CATEGORIA`$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `calculoMes` (`fechaReporte` DATE, `fechaAdquisicion` DATE) RETURNS INT(11) BEGIN
	DECLARE anioAMes INT;
	DECLARE numeroMes INT; 

	SET anioAMes = 0;
	SET numeroMes = 0;
    
    SET anioAMes = (YEAR(fechaReporte) - YEAR(fechaAdquisicion)) * 12;
    SET numeroMes = (AnioAMes - MONTH(fechaAdquisicion)) + MONTH(fechaReporte);
    
    IF(numeroMes = 0)THEN 
    RETURN 0;
    ELSE
    RETURN numeroMes;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `depreciacionAcumulativa` (`mes` INT, `vidaUtil` INT, `depreciacionMensual` FLOAT(30,2)) RETURNS DECIMAL(30,2) BEGIN
	DECLARE depreciacionAcumulada DECIMAL(30,2);
    
    IF(vidaUtil >= mes) THEN
    	SET depreciacionAcumulada = depreciacionMensual * mes;
        RETURN depreciacionAcumulada;
    ELSE
    	RETURN 0;
    END IF;
    
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `depreciacionMensual` (`vidaUtil` INT, `Costo` DECIMAL(30,2)) RETURNS DECIMAL(30,2) BEGIN
	DECLARE depMensual DECIMAL(30,2);
    
    SET depMensual = 0;
    
	IF (vidaUtil = 0) THEN
    	RETURN 0;
    ELSE
    	SET depMensual = (Costo / vidaUtil);
        RETURN depMensual;
    END IF;
    
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `saldoEnLibro` (`costo` DECIMAL(30,2), `depreciacionAcumulada` DECIMAL(30,2)) RETURNS DECIMAL(30,2) BEGIN
	DECLARE saldo DECIMAL(30,2);
    
    SET saldo = costo - depreciacionAcumulada;
    
    return saldo;
    
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `catelectrodomesticos`
--

CREATE TABLE `catelectrodomesticos` (
  `CatElectId` int(11) NOT NULL,
  `catElectCodigo` text DEFAULT NULL,
  `CatElectMarca` text DEFAULT NULL,
  `CatElectModelo` text DEFAULT NULL,
  `CatElectDescripcion` text DEFAULT NULL,
  `CatElectFechaIngreso` date DEFAULT NULL,
  `CatElectCosto` float(11,2) DEFAULT NULL,
  `CatElectEstado` int(11) NOT NULL,
  `idActivofijo` int(11) NOT NULL,
  `catElectTipoEquipo` text DEFAULT NULL,
  `catElectObservaciones` text DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catelectrodomesticos`
--

INSERT INTO `catelectrodomesticos` (`CatElectId`, `catElectCodigo`, `CatElectMarca`, `CatElectModelo`, `CatElectDescripcion`, `CatElectFechaIngreso`, `CatElectCosto`, `CatElectEstado`, `idActivofijo`, `catElectTipoEquipo`, `catElectObservaciones`, `updated_at`, `created_at`) VALUES
(1, 'TDD0001', 'Withpool', NULL, 'FREZEER', '2013-11-20', 7500.00, 1, 4, 'FREZEER', 'Blanca, ubicada en el area de cocina', '2021-02-03', '2021-01-30'),
(2, NULL, 'FRIGIDAIRE', '', 'OASIS', '2013-02-20', 3300.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(3, NULL, 'SAMSUNG', '', 'REFRIGERADOR', '2013-02-20', 8600.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(4, NULL, 'LG', '', 'MICROONDAS', '2013-02-20', 2426.46, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(5, NULL, 'Bradley', '', 'EXTINGUIDOR', '2013-03-20', 1000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(6, NULL, 'Carolina', '', 'EXTINGUIDOR', '2013-03-20', 1000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(7, NULL, 'carolina p2', '', 'CAMA / PICTURE 6', '2014-07-20', 2206.23, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(8, NULL, 'carolina p2', '', 'CAMA / PICTURE 6', '2014-07-20', 2206.23, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(9, NULL, 'carolina p2', '', 'CAMA / PICTURE 7', '2014-07-20', 3893.34, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(10, NULL, 'carolina p2', '', 'COMEDOR / PICTURE 1', '2014-07-20', 7786.68, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(11, NULL, 'carolina p2', '', 'SOFA GRANDE / PICTURE 5', '2014-07-20', 5191.12, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(12, NULL, 'carolina p2', '', 'SOFA MEDIANO/ PICTURE 5', '2014-07-20', 5191.12, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(13, NULL, 'carolina p2', '', 'MESA BAJA / PICTURE 3', '2014-07-20', 2595.56, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(14, NULL, 'carolina p2', '', 'MESA MEDIANA / PICTURE 3', '2014-07-20', 2595.56, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(15, NULL, 'Bradley P2', '', 'ESTANTE GRANDE / PICTURE 9', '2014-07-20', 3244.45, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(16, NULL, 'Bradley P2', '', 'ESTANTE GRANDE / PICTURE 9', '2014-07-20', 3244.45, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(17, NULL, 'TRUPPER', '', 'BOMBA DE AGUA / ELECTRICA', '2015-05-20', 3345.98, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(18, NULL, '', '', '1 COCINA DE 2 QUEMADORES', '2016-02-20', 2960.69, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(19, NULL, '', '', 'MESAS BLANCAS DE PLASTICOS GRANDES', '2016-02-20', 1521.74, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(20, NULL, 'Matagalpa', '', '2 Mesa de Jardin', '2017-01-20', 2500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(21, NULL, '', '', '1 Escritorio Econimico', '2017-01-20', 2550.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(22, NULL, '', '', '1 Silla de espera', '2017-01-20', 1035.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(23, NULL, '', '', '1 Escrritorio ', '2017-01-20', 5028.75, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(24, NULL, 'Tropigas/cocina', '', 'Tanque gas de 25Lbs', '2017-01-20', 1480.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(25, NULL, 'Fisio', '', '2 colchones', '2017-02-20', 1200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(26, NULL, '', '', '1 cafetera', '2017-02-20', 1169.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(27, NULL, 'carolina p2', '', 'Piano y un adaptador para Teclado', '2016-03-20', 3755.77, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(28, NULL, '', '', 'Mueble de Cuatro Puertas / Contabilidad', '2018-01-20', 3500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(29, NULL, '', '', 'Mueble organizador 5 repisas', '2018-01-20', 2000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(30, NULL, '', '', 'Mueble organizador 5 repisas', '2018-01-20', 2000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(31, NULL, '', '', 'Mueble organizador 4 repisas', '2018-01-20', 1500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(32, NULL, '', '', 'Mueble organizador 4 repisas', '2018-01-20', 1500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(33, NULL, '', '', 'Mesa Mediana', '2018-01-20', 1000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(34, NULL, '', '', 'Mesa Grande Rectacgular', '2018-01-20', 1200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(35, NULL, '', '', 'Mesa pequena', '2018-01-20', 1000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(36, NULL, '', '', 'Escritorio de Maestra', '2018-01-20', 1800.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(37, NULL, '', '', 'Mueble organizador 4 repisas', '2018-01-20', 1500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(38, NULL, '', '', 'Mesa Pequeña', '2018-01-20', 1000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(39, NULL, '', '', 'Mueble organizador 4 repisas', '2018-01-20', 1500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(40, NULL, '', '', 'Mesa Pequeña', '2018-01-20', 1000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(41, NULL, 'ESMA/9N3/Mantenimiento', '', 'Pulidora 7\' Truper', '2018-01-20', 3407.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(42, NULL, '', '', 'Lijadora Orbitra Truper', '2018-01-20', 1341.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(43, NULL, 'Tramontina/Alcance', '', 'Mini/Refrigeradora', '2018-01-20', 4575.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(44, NULL, 'Matagalpa', '', 'Estante / Librero', '2018-01-20', 1500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(45, NULL, 'Canon / DS126621', '', 'Camara ', '2019-02-20', 13736.45, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(46, NULL, 'Mantenimiento', '', 'Escalera comercial ', '2020-09-20', 3907.33, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(47, NULL, 'Administracion/ alcance', '', '2sillas de oficina ', '2020-08-20', 5600.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(48, NULL, 'Sankey/ Alcance', '', '4Abanicos ', '2020-08-20', 5600.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(49, NULL, 'Economico/ Alcance', '', '4 Escritorio  de 1 gaveta', '2020-08-20', 6400.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(50, NULL, '', '', 'Lavadora', '2020-12-20', 17249.94, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(51, NULL, '', '', 'ESCRITORIO L ', '2012-06-01', 2000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(52, NULL, '', '', 'ESCRITORIO PEQUEÑO', '2012-06-01', 1000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(53, NULL, '', '', 'ESCRITORIO L ', '2012-06-01', 1000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(54, NULL, '', '', 'ESCRITORIO L ', '2013-01-01', 8445.05, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(55, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(56, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(57, NULL, '', '', 'SILLA DE MADERA/COMEDOR DE VIDRIO', '2012-06-01', 300.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(58, NULL, '', '', 'SILLA DE MADERA/COMEDOR DE VIDRIO', '2012-06-01', 300.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(59, NULL, '', '', 'SILLA DE MADERA/COMEDOR DE VIDRIO', '2012-06-01', 300.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(60, NULL, '', '', 'SILLA ERGONOMICA', '2012-06-01', 1500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(61, NULL, '', '', 'SILLAS MECEDORAS DE MADERA', '2012-06-01', 400.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(62, NULL, 'VIRCO', '', 'SILLA ROJA', '2012-06-01', 400.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(63, NULL, '', '', 'SOFA GRANDE', '2012-06-01', 3000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(64, NULL, '', '', 'ARCHIVERO  BLANCO', '2012-06-01', 700.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(65, NULL, '', '', 'ESTANTE DE GABINETE DE 6 PUERTAS', '2012-06-01', 4000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(66, NULL, 'SPORTNEB EVO EXPRESS', '', 'NEBULIZADOR PINGUINO', '2013-01-01', 1850.82, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(67, NULL, 'SUNRISE MEDICAL', '', 'NEBULIZADOR', '2013-01-01', 1850.82, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(68, NULL, '', '', 'NEBULIZADOR FOCA', '2013-01-01', 1850.82, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(69, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(70, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(71, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(72, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(73, NULL, '', '', 'SILLAS MECEDORAS DE MADERA', '2012-06-01', 400.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(74, NULL, '', '', 'SILLAS MECEDORAS DE MADERA', '2012-06-01', 400.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(75, NULL, '', '', 'SILLA DE MADERA/COMEDOR DE VIDRIO', '2012-06-01', 300.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(76, NULL, '', '', 'MESAS BLANCAS DE PLASTICOS GRANDES', '2012-06-01', 1000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(77, NULL, '', '', 'MESAS BLANCAS DE PLASTICOS GRANDES', '2012-06-01', 1000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(78, NULL, 'BERNINA NOVA', '', 'MAQUINAS DE COSER', '2013-01-01', 2200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(79, NULL, 'BELAIR BANTAM', '', 'MAQUINAS DE COSER', '2013-01-01', 2200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(80, NULL, 'KENMORE', '', 'MAQUINAS DE COSER', '2013-01-01', 2200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(81, NULL, 'WHITE', '', 'MAQUINAS DE COSER', '2013-01-01', 2200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(82, NULL, 'BROTHER', '', 'MAQUINAS DE COSER', '2013-01-01', 2200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(83, NULL, 'BROTHER', '', 'MAQUINAS DE COSER', '2013-01-01', 2200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(84, NULL, 'ALCO', '', 'MAQUINAS DE COSER', '2013-01-01', 2200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(85, NULL, 'JANOME', '', 'MAQUINAS DE COSER', '2013-01-01', 2200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(86, NULL, 'JONOME', '', 'MAQUINAS DE COSER', '2013-01-01', 2200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(87, NULL, 'SINGER', '', 'MAQUINAS DE COSER', '2013-01-01', 2200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(88, NULL, 'GRACE ', '', 'MONTURA COMPLETA', '0000-00-00', 17033.25, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(89, NULL, '', '', 'MONTURA INGLESA', '2012-06-01', 1200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(90, NULL, 'BROTHER', '', 'MAQUINAS DE COSER', '2013-01-01', 2200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(91, NULL, 'FRIGIDAIRE', '', 'REFRIGERADORA', '2012-06-01', 15000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(92, NULL, '', '', 'MUEBLE DE 12 COMPARTIMENTOS', '2012-06-01', 1200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(93, NULL, '', '', 'MESA DE MADERA', '2012-06-01', 1200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(94, NULL, 'SAMSUNG', '', 'MICROONDAS', '2012-06-01', 1500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(95, NULL, 'MABE', '', 'COCINA 5 QUEMADORES', '2012-06-01', 4000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(96, NULL, '', '', 'SILLA DE MADERA / COMEDOR DE VIDRIO', '2012-06-01', 300.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(97, NULL, '', '', 'SILLA DE MADERA', '2012-06-01', 300.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(98, NULL, 'Fundacion Carlos Slim', '', 'SILLA DE RUEDA', '2012-06-01', 2500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(99, NULL, 'Breezy', '', 'SILLA DE RUEDA', '2012-06-01', 2500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(100, NULL, 'Metro red', '', 'SILLA DE RUEDA', '2012-06-01', 2500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(101, NULL, 'Expectrum', '', 'SILLA DE RUEDA', '2012-06-01', 2500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(102, NULL, '', '', 'SILLA DE RUEDA', '2012-06-01', 2500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(103, NULL, '', '', 'SILLA DE RUEDA', '2012-06-01', 2500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(104, NULL, '', '', 'SILLA DE RUEDA', '2012-06-01', 2500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(105, NULL, '', '', 'SILLA DE RUEDA', '2012-06-01', 2500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(106, NULL, '', '', 'SILLA DE RUEDA', '2012-06-01', 2500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(107, NULL, 'invatare', '', 'SILLA DE RUEDA', '2012-06-01', 2500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(108, NULL, 'luke', '', 'SILLA DE RUEDA', '2012-06-01', 2500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(109, NULL, '', '', 'SILLA DE RUEDA', '2012-06-01', 2500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(110, NULL, 'medline', '', 'SILLA DE RUEDA', '2012-06-01', 2500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(111, NULL, 'invatare', '', 'SILLA DE RUEDA', '2013-01-01', 2500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(112, NULL, '', '', 'MUEBLE /19 CAJONES', '2012-06-01', 3000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(113, NULL, '', '', 'ESCRITORIO ROJO', '2012-06-01', 800.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(114, NULL, '', '', 'ESTANTE', '2012-06-01', 2000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(115, NULL, '', '', 'ROPERO DE 3 PUERTAS DE MADERA', '2012-06-01', 1500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(116, NULL, '', '', 'MESA BLANCA DE MADERA', '2012-06-01', 300.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(117, NULL, '', '', 'ESCRITORIO PEQUEÑO CAFE', '2012-06-01', 400.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(118, NULL, '', '', 'ESCALERA', '2012-06-01', 2000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(119, NULL, '', '', 'VERTICALIZADOR DE HIERRO', '2013-01-01', 5862.53, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(120, NULL, '', '', 'VERTICALIZADOR DE MADERA', '2013-01-01', 5862.53, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(121, NULL, 'FRIGIDAIRE', '', 'LAVADORA', '2012-06-01', 5000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(122, NULL, '', '', 'COMEDOR NEGRO', '2012-06-01', 2000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(123, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(124, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(125, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(126, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(127, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(128, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(129, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(130, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(131, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(132, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(133, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(134, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(135, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(136, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(137, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(138, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(139, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(140, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(141, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(142, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(143, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(144, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(145, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(146, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(147, NULL, 'VIRCO', '', 'SILLA ROJA', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(148, NULL, 'VIRCO', '', 'SILLA ROJA', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(149, NULL, '', '', 'MESAS BLANCAS DE PLASTICOS GRANDES', '2012-06-01', 1000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(150, NULL, '', '', 'MESAS BLANCAS DE PLASTICOS GRANDES', '2012-06-01', 1000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(151, NULL, '', '', 'MESAS BLANCAS DE PLASTICOS GRANDES', '2012-06-01', 1000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(152, NULL, '', '', 'MESAS BLANCAS DE PLASTICOS GRANDES', '2012-06-01', 1000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(153, NULL, '', '', 'SILLAS MECEDORAS DE MADERA', '2012-06-01', 400.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(154, NULL, '800', '', 'SILLAS MECEDORAS DE MADERA', '2013-01-01', 400.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(155, NULL, '800', '', 'SILLAS MECEDORAS DE MADERA', '2013-01-01', 400.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(156, NULL, '800', '', 'SILLAS MECEDORAS DE MADERA', '2013-01-01', 400.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(157, NULL, '800', '', 'SILLAS MECEDORAS DE MADERA', '2013-01-01', 400.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(158, NULL, '800', '', 'SILLAS MECEDORAS DE MADERA', '2013-01-01', 400.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(159, NULL, '800', '', 'SILLAS MECEDORAS DE MADERA', '2013-01-01', 400.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(160, NULL, '800', '', 'SILLAS MECEDORAS DE MADERA', '2013-01-01', 400.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(161, NULL, '', '', 'ANDARIVEL DE 4 PUNTOS', '2012-06-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(162, NULL, '', '', 'ANDARIVEL DE 4 PUNTOS', '2012-06-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(163, NULL, 'EVON', '', 'NEBULIZADOR', '2013-01-01', 1850.82, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(164, NULL, '', '', 'NEBULIZADOR', '2013-01-01', 1850.82, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(165, NULL, 'wheelchaire', '', 'SILLA DE RUEDA', '2013-01-01', 2500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(166, NULL, '', '', 'SILLA DE RUEDA', '2013-01-01', 2500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(167, NULL, '', '', 'SILLA DE RUEDA', '2013-01-01', 2500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(168, NULL, 'wheelchair', '', 'SILLA DE RUEDA', '2013-01-01', 2500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(169, NULL, '', '', 'SILLA DE RUEDA', '2013-01-01', 2500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(170, NULL, '', '', 'SILLA DE RUEDA', '2013-01-01', 2500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(171, NULL, '', '', 'VERTICALIZADOR', '2013-01-01', 5862.53, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(172, NULL, '', '', 'GRADAS GRANDE', '0000-00-00', 5004.50, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(173, NULL, 'pixi', '', 'SILLA DE RUEDA', '2013-01-01', 2500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(174, NULL, 'wheelchair', '', 'SILLA DE RUEDA', '2013-01-01', 2500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(175, NULL, '', '', 'ANDARIVEL DE 4 PUNTOS', '2012-06-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(176, NULL, '', '', 'MESA SEMIREDONDA', '2012-06-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(177, NULL, '', '', 'SILLA ERGONOMICA', '2012-06-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(178, NULL, '', '', 'MUEBLE CON 16 GABETAS', '2012-06-01', 2500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(179, NULL, '', '', 'MESA GRANDE MADERA', '2013-01-01', 2200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(180, NULL, '', '', 'MESAS BLANCAS DE PLASTICOS GRANDES', '2012-06-01', 1000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(181, NULL, '', '', 'MESA SEMIREDONDA', '2012-06-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(182, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(183, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(184, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(185, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(186, NULL, '', '', 'MUEBLE GRANDE CON SEPARADORES', '2012-06-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(187, NULL, '', '', 'MUEBLE MEDIANO CON SEPARADORES', '2012-06-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(188, NULL, '', '', 'MUEBLE DE 10 COMPARTIMIENTOS', '2012-06-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(189, NULL, '', '', 'MESA SEMIREDONDA', '2013-01-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(190, NULL, '', '', 'SILLA ERGONOMICA', '2012-06-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(191, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(192, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(193, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(194, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(195, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(196, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(197, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(198, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(199, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(200, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(201, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(202, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(203, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(204, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(205, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(206, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(207, NULL, '', '', 'MESAS BLANCAS DE PLASTICOS GRANDES', '2012-06-01', 1000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(208, NULL, '', '', 'MESA SEMIREDONDA', '2012-06-01', 800.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(209, NULL, '', '', 'ANDARIVEL DE 4 PUNTOS', '2012-06-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(210, NULL, '', '', 'ANDARIVEL DE 4 PUNTOS', '2012-06-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(211, NULL, '', '', 'ANDARIVEL DE 4 PUNTOS', '2012-06-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(212, NULL, '', '', 'ANDARIVEL DE 4 PUNTOS', '2012-06-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(213, NULL, '', '', 'ANDARIVEL DE 4 PUNTOS', '2012-06-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(214, NULL, '', '', 'ANDARIVEL DE 4 PUNTOS', '2012-06-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(215, NULL, '', '', 'ANDARIVEL DE 4 PUNTOS', '2012-06-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(216, NULL, '', '', 'ANDARIVEL DE 4 PUNTOS', '2012-06-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(217, NULL, '', '', 'ANDARIVEL CON ASIENTO', '2012-06-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(218, NULL, '', '', 'ANDARIVEL CON ASIENTO', '2012-06-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(219, NULL, 'wemzly', '', 'ANDARIVEL DE 4 PUNTOS', '2012-06-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(220, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(221, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(222, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(223, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(224, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(225, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(226, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(227, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(228, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(229, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(230, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(231, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(232, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(233, NULL, '', '', 'ANDARIVEL', '2012-06-01', 300.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(234, NULL, 'Nova', '', 'ANDARIVEL TRICICLO', '2013-01-01', 600.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(235, NULL, 'Nova', '', 'ANDARIVEL TRICICLO', '2013-01-01', 600.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(236, NULL, '', '', 'PAR DE MULETA NINO', '2012-06-01', 300.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(237, NULL, '', '', 'PAR DE MULETA NINO', '2012-06-01', 300.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(238, NULL, '', '', 'PAR DE MULETA NINO', '2012-06-01', 300.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(239, NULL, '', '', 'PAR DE MULETA NINO', '2012-06-01', 300.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(240, NULL, '', '', 'PAR DE MULETA ADOLESCENTE', '2012-06-01', 300.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(241, NULL, '', '', 'PAR DE MULETA ADOLESCENTE', '2012-06-01', 300.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(242, NULL, '', '', 'PAR DE MULETA ADOLESCENTE', '2012-06-01', 300.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(243, NULL, '', '', 'PAR DE BASTON', '2012-06-01', 300.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(244, NULL, '', '', 'PAR DE BASTON', '2012-06-01', 300.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(245, NULL, '', '', 'UN BASTON', '2012-06-01', 300.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(246, NULL, '', '', 'COCHE PARA BEBE', '2013-01-01', 600.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(247, NULL, '', '', 'COCHE PARA BEBE', '2013-01-01', 600.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(248, NULL, '', '', 'ANDARIVEL', '2012-06-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(249, NULL, '', '', 'COCHE TRES RUEDAS', '2012-06-01', 1000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(250, NULL, '', '', 'VERTICALIZADOR', '2013-01-01', 5862.53, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(251, NULL, '', '', 'MUEBLE DE 10 COMPARTIMIENTOS', '2012-06-01', 600.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(252, NULL, '', '', 'MESAS BLANCAS DE PLASTICOS GRANDES', '2012-06-01', 1000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(253, NULL, '', '', 'MESAS BLANCAS DE PLASTICOS GRANDES', '2012-06-01', 1000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(254, NULL, '', '', 'SILLA DE CARRO', '2013-01-01', 600.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(255, NULL, '', '', 'SILLA DE CARRO', '2013-01-01', 600.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(256, NULL, '', '', 'SILLA DE CARRO', '2013-01-01', 600.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(257, NULL, '', '', 'SILLA DE CARRO', '2013-01-01', 600.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(258, NULL, '', '', 'SILLA DE CARRO', '2013-01-01', 600.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(259, NULL, '', '', 'SILLA DE CARRO', '2013-01-01', 600.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(260, NULL, '', '', 'SILLA DE CARRO', '2013-01-01', 600.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(261, NULL, '', '', 'SILLA DE CARRO', '2013-01-01', 600.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(262, NULL, '', '', 'SILLA DE CARRO', '2013-01-01', 600.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(263, NULL, '', '', 'SILLA DE CARRO', '2013-01-01', 600.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(264, NULL, '', '', 'SILLA DE CARRO', '2013-01-01', 600.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(265, NULL, '', '', 'RIN DE MADERA', '2012-06-01', 800.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(266, NULL, '', '', 'PAINT ZOOM', '2012-06-01', 2000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(267, NULL, 'cruuser', '', 'SILLA DE RUEDA', '2012-06-01', 1000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(268, NULL, 'janaya', '', 'SILLA DE RUEDA', '2012-06-01', 1000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(269, NULL, '', '', 'SILLA DE RUEDA', '2012-06-01', 1000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(270, NULL, 'cause for hope', '', 'SILLA DE RUEDA', '2012-06-01', 1000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(271, NULL, 'mason', '', 'SILLA DE RUEDA', '2012-06-01', 1000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(272, NULL, '', '', 'SILLA DE RUEDA', '2012-06-01', 1000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(273, NULL, '', '', 'SILLA ERGONOMICA', '2012-06-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(274, NULL, '', '', 'ANDARIVEL', '2012-06-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(275, NULL, '', '', 'ANDARIVEL', '2012-06-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(276, NULL, 'Nova', '', 'ANDARIVEL TRICICLO', '2012-06-01', 1500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(277, NULL, 'Nova', '', 'ANDARIVEL TRICICLO', '2013-01-01', 600.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(278, NULL, '', '', 'ANDARIVEL', '2012-06-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(279, NULL, 'SCHUCO/INC.', '', 'COMPRESOR DE AIRE', '2012-06-01', 2000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(280, NULL, 'TRUPER PROFESIONAL', '', 'TALADRO', '2012-06-01', 800.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(281, NULL, 'QUICK/GRIP', '', 'PRENSA MAUAL', '2012-06-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(282, NULL, 'WOLFCRAFT', '', 'PRENSA MANUAL', '2012-06-01', 500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(283, NULL, 'BEST vALUE', '', 'CORTADORA DE AZULEJOS ', '2012-06-01', 300.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(284, NULL, '', '', 'ANDARIVEL', '0000-00-00', 3000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(285, NULL, '', '', 'SILLA DE RUEDA', '0000-00-00', 2500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(286, NULL, '', '', 'SILLA DE RUEDA', '0000-00-00', 2500.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(287, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(288, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(289, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(290, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(291, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(292, NULL, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(293, NULL, '', '', 'SILLA DE MADERA/COMEDOR DE VIDRIO', '2012-06-01', 300.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(294, NULL, '', '', 'ESCALERA DE ALUMINIO GRANDE', '2012-06-01', 3000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(295, NULL, '', '', 'CARRETILLA', '2012-06-01', 400.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(296, NULL, '', '', 'ESCRITORIO DE MADERA DE 3 GABETA', '2012-06-01', 400.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(297, NULL, '', '', 'RAMPA METALICA', '2012-06-01', 8000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(298, NULL, '', '', 'MONTURA  ', '2012-06-01', 1200.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(299, NULL, '', '', 'MUEBLE DE MATERIALES', '2012-06-01', 3000.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(300, NULL, '', '', 'ESTANTES DE REJAS METALICOS', '2012-06-01', 400.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(301, NULL, 'TRUPER', '', 'BOMBA DE AGUA / ELECTRICA', '2014-04-06', 3714.49, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(302, NULL, 'MILWAUKEE', '', 'SIERRA CIRCULAR 7/1/4 15A 120 MILWAUKE', '2014-01-07', 4980.64, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(303, NULL, 'POULAN PRO', '', 'CORTAGRAMA GAS 4.50HP 20\' P0450N20S', '2014-01-07', 6037.20, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(304, NULL, '', '', 'ANDARIVEL', '2014-01-07', 4879.65, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(305, NULL, '', '', 'ANDARIVEL', '2014-01-07', 4879.65, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(306, NULL, 'RIFTON', '', 'VERTICALIZADOR/PLASTICO', '2014-01-07', 7916.46, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(307, NULL, '', '', 'PAR DE MULETA', '2015-11-17', 889.46, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(308, NULL, '', '', 'PAR DE MULETA', '2015-11-17', 889.46, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(309, NULL, '', '', 'PAR DE MULETA', '2015-11-17', 889.46, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(310, NULL, '', '', 'PAR DE MULETA', '2015-11-17', 889.46, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(311, NULL, 'HANDI WORKS', '', 'ESCALERA DE ALUMINIO PEQUEÑA', '2016-01-18', 499.90, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(312, NULL, '', '', 'PAR DE MULETA ADOLESCENTE', '2012-06-01', 300.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(313, NULL, '', '', 'PAR DE MULETA ADOLESCENTE', '2012-06-01', 300.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(314, NULL, '', '', 'UNA MULETA', '2012-06-01', 300.00, 1, 4, NULL, NULL, '2021-01-30', '2021-01-30'),
(315, NULL, '', '', 'BATERIA 3 - EVALUACIONES', '2015-03-20', 95943.73, 1, 7, NULL, NULL, '2021-01-31', '2021-01-31'),
(316, NULL, 'KENMORE', '', 'REFRIGERADORA', '2016-12-20', 8204.75, 1, 7, NULL, NULL, '2021-01-31', '2021-01-31'),
(317, NULL, 'Liftware Level Carrying Case', '', 'cuchara adaptada', '2017-02-20', 5752.81, 1, 7, NULL, NULL, '2021-01-31', '2021-01-31'),
(318, NULL, 'Liftware Level Carrying Case', '', 'cuchara adaptada', '2017-02-20', 5752.81, 1, 7, NULL, NULL, '2021-01-31', '2021-01-31'),
(319, NULL, '', '', '1 Casco, 1 Cinturon y un chaleco', '2017-02-20', 12310.72, 1, 7, NULL, NULL, '2021-01-31', '2021-01-31'),
(320, NULL, 'TRUPER', '', 'CALADORA/CIERRA', '2017-11-20', 1757.18, 1, 7, NULL, NULL, '2021-01-31', '2021-01-31'),
(321, NULL, 'STDH', '', 'TALADRO - ROTAMARTILLO 1/2 800W', '2017-11-20', 2667.80, 1, 7, NULL, NULL, '2021-01-31', '2021-01-31'),
(322, NULL, 'TRUPER', '', 'ESMERIL DE BANCO', '2017-11-20', 1498.58, 1, 7, NULL, NULL, '2021-01-31', '2021-01-31'),
(323, NULL, 'Oaster', '', 'Microodas', '2018-02-20', 3090.00, 1, 7, NULL, NULL, '2021-01-31', '2021-01-31'),
(324, NULL, 'Truper Profecional Roti -18AZ', '', 'Rotamartillo Inalambrico/ Taladro', '2018-03-20', 2938.02, 1, 7, NULL, NULL, '2021-01-31', '2021-01-31'),
(325, NULL, 'Truper', '', 'Compresor lubricado y manguera', '2018-03-20', 5642.07, 1, 7, NULL, NULL, '2021-01-31', '2021-01-31'),
(326, NULL, 'Atlas', '', 'cocina', '2018-03-20', 9581.79, 1, 7, NULL, NULL, '2021-01-31', '2021-01-31'),
(327, NULL, 'Craftsman', '', 'Motosierra', '2018-11-20', 6273.53, 1, 7, NULL, NULL, '2021-01-31', '2021-01-31'),
(328, NULL, 'Mr7j2ll/A/', '', 'Ipad', '2019-02-20', 13635.87, 1, 7, NULL, NULL, '2021-01-31', '2021-01-31'),
(329, NULL, '', '', 'Corta Cesped', '2019-02-20', 7499.95, 1, 7, NULL, NULL, '2021-01-31', '2021-01-31'),
(330, NULL, '', '', 'OTOSCOPIO', '2015-08-07', 1778.88, 1, 7, NULL, NULL, '2021-01-31', '2021-01-31'),
(331, NULL, '', '', 'OTOSCOPIO', '2015-08-07', 1778.88, 1, 7, NULL, NULL, '2021-01-31', '2021-01-31');

-- --------------------------------------------------------

--
-- Table structure for table `catequipocomputo`
--

CREATE TABLE `catequipocomputo` (
  `catEquipoCompId` int(11) NOT NULL,
  `catEquipoComputoCodigo` text DEFAULT NULL,
  `catEquipoModelo` text DEFAULT NULL,
  `catEquipoNumeroSerie` text DEFAULT NULL,
  `catEquipoMarca` text DEFAULT NULL,
  `catEquipoTamanioAlmacenamiento` text DEFAULT NULL,
  `TipoMemoriaRAM` text DEFAULT NULL,
  `catEquipoCantidadRAM` text DEFAULT NULL,
  `catEquipoTipoSO` text DEFAULT NULL,
  `catEquipoFechaCompra` date DEFAULT NULL,
  `catEquipoCostoEquipo` float(11,2) DEFAULT NULL,
  `CatEquipoEstado` int(11) NOT NULL,
  `idActivofijo` int(11) NOT NULL,
  `catEquipoComputoTipoEquipo` text DEFAULT NULL,
  `catEquipoComputoObservaciones` text DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catequipocomputo`
--

INSERT INTO `catequipocomputo` (`catEquipoCompId`, `catEquipoComputoCodigo`, `catEquipoModelo`, `catEquipoNumeroSerie`, `catEquipoMarca`, `catEquipoTamanioAlmacenamiento`, `TipoMemoriaRAM`, `catEquipoCantidadRAM`, `catEquipoTipoSO`, `catEquipoFechaCompra`, `catEquipoCostoEquipo`, `CatEquipoEstado`, `idActivofijo`, `catEquipoComputoTipoEquipo`, `catEquipoComputoObservaciones`, `updated_at`, `created_at`) VALUES
(1, NULL, 'Swam/Equino', NULL, 'SWANN', NULL, NULL, NULL, NULL, '2018-01-20', 9999.00, 1, 3, NULL, NULL, '2021-02-03', '2021-01-31'),
(2, NULL, '15r210dx', 'CND5197FR8Laptop', 'HP', '671 GB', 'DDR4', '6 GB', 'windows10', '2018-01-20', 13500.00, 1, 3, NULL, NULL, '2021-02-02', '2021-01-31'),
(3, NULL, '316SN6W', '', '', '', '', '', '', '2018-01-20', 13500.00, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(4, NULL, 'RTL8723BRNF', '', '', '', '', '', '', '2018-02-20', 12648.80, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(5, NULL, 'ZF802512Voo15A', '', '', '', '', '', '', '2018-09-20', 12823.20, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(6, NULL, 'BENQ', '17088111', 'BENQ', NULL, NULL, NULL, NULL, '2019-06-20', 17399.99, 1, 3, NULL, NULL, '2021-02-03', '2021-01-31'),
(7, NULL, 'ASUS', 'J8NOCX05', 'ASUS', '', '', '', 'windows 10', '2019-06-20', 27860.80, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(8, NULL, 'Kingston', NULL, 'KINGSTON', '16 GB', NULL, NULL, NULL, '2019-06-20', 1892.86, 1, 3, NULL, NULL, '2021-02-02', '2021-01-31'),
(9, NULL, 'MFFZDA', 'WX71E1924YLW', '', '', '', '', '', '2019-08-20', 2130.57, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(10, NULL, 'E6440 NotebookPC', 'MSIP-CMM-E2K-P386001', '', '', '', '', '', '2019-09-20', 14698.00, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(11, NULL, '', '', '', '', '', '', '', '2019-07-20', 12541.50, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(12, NULL, 'INSPIRON', 'H6N9N63', 'DELL', '120 GB', 'DDR4', '4 GB', 'windows10', '2020-11-20', 1998.39, 1, 3, NULL, NULL, '2021-02-02', '2021-01-31'),
(13, NULL, 'INSPIRON', '4YY9N63', 'DELL', '120 GB', 'DDR4', '4 GB', 'windows10', '2020-11-20', 19980.40, 1, 3, NULL, NULL, '2021-02-02', '2021-01-31'),
(14, NULL, 'INSPIRON', 'DD8BN63', 'DELL', '120 GB', 'DDR4', '4 GB', 'windows10', '2020-11-20', 19980.40, 1, 3, NULL, NULL, '2021-02-02', '2021-01-31'),
(15, NULL, 'INSPIRON', '8TSGN63', 'DELL', '120 GB', 'DDR4', '4 GB', 'windows10', '2020-11-20', 19980.40, 1, 3, NULL, NULL, '2021-02-02', '2021-01-31'),
(16, NULL, 'INSPIRON', '6DNKN63', 'DELL', '120 GB', 'DDR4', '4 GB', 'windows10', '2020-11-20', 19980.40, 1, 3, NULL, NULL, '2021-02-02', '2021-01-31'),
(17, NULL, 'INSPIRON', '3WSGN63', 'DELL', '120 GB', 'DDR4', '4 GB', 'windows10', '2020-11-20', 19980.40, 1, 3, NULL, NULL, '2021-02-02', '2021-01-31'),
(18, NULL, 'INSPIRON', 'JYSGN63', 'DELL', '120 GB', 'DDR4', '4 GB', 'windows10', '2020-11-20', 19980.40, 1, 3, NULL, NULL, '2021-02-02', '2021-01-31'),
(19, NULL, 'INSPIRON', '6H7KN63', 'DELL', 'DELL', 'DDR4', '4 GB', 'windows10', '2020-11-20', 19980.40, 1, 3, NULL, NULL, '2021-02-02', '2021-01-31'),
(20, NULL, 'Ideapad3', 'JVHFC1', 'LENOVO', '1 TB', 'DDR4', '4 GB', 'windows10', '2020-11-20', 23393.90, 1, 3, NULL, NULL, '2021-02-02', '2021-01-31'),
(21, NULL, 'SAMSUNG', 'HYUE91HC901417E', 'SAMSUNG', '', '', '', '', '2013-01-01', 13881.10, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(22, NULL, 'ACER', 'NUSH7AA004305227D01601', 'ACER', '', '', '', '', '2013-08-02', 4940.29, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(23, NULL, 'FELLOW', 'CRC 57277', 'FELLOW', '', '', '', '', '2013-01-01', 2685.16, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(24, NULL, 'SCOTCH', '102306', 'SCOTCH', '', '', '', '', '2012-06-01', 800.00, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(25, NULL, 'CASIO', 'V032CBAF11-164582', 'CASIO', '', '', '', '', '2013-01-01', 20509.20, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(26, NULL, 'SONY HANDYCAM', '', 'SONY', '', '', '', '', '2013-10-08', 5711.15, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(27, NULL, 'apple', 'F5XK86R5DFHW', 'apple', '', '', '', 'IOS 9.5', '2013-08-02', 9905.41, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(28, NULL, 'TELSTAR', '', 'TESTLAR', '', '', '', '', '2012-06-01', 2500.00, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(29, NULL, 'apple', 'DYTJVM2TDFHW', 'apple', '', '', '', 'IOS 9.5', '2013-08-02', 9905.41, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(30, NULL, '', '', '', '', '', '', '', '2012-06-01', 1000.00, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(31, NULL, '', '', '', '', '', '', '', '2012-06-01', 500.00, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(32, NULL, '', '', '', '', '', '', '', '2012-06-01', 1500.00, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(33, NULL, 'DYNAVOX', '175661', 'DYNAVOX', '', '', '', '', '2012-06-01', 20000.00, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(34, NULL, 'apple', 'DYTKWP0WDFHW', 'apple', '', '', '', 'IOS 9.5', '2014-01-13', 10116.80, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(35, NULL, 'apple', 'F5RLMBL3DKPH', 'apple', '', '', '', 'IOS 9.5', '2014-01-13', 10116.80, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(36, NULL, '', '', '', '', '', '', '', '2012-06-01', 8000.00, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(37, NULL, 'HP', '3CR337024W', 'HP', '', '', '', '', '2014-03-01', 14250.30, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(38, NULL, 'HP', '3CR337028K', 'HP', '', '', '', '', '2014-03-01', 14250.30, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(39, NULL, 'DELL', '', 'DELL', '', '', '', '', '2014-04-01', 10265.00, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(40, NULL, 'DELL', '', 'DELL', '', '', '', '', '2014-04-01', 8981.84, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(41, NULL, 'ASUS', 'E2N0CX619075095', 'ASUS', '', '', '', '', '2014-06-01', 11267.50, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(42, NULL, 'LOREX', '', 'LOREX', '', '', '', 'LOREX', '2014-07-01', 9198.85, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(43, NULL, 'CANON', '', 'CANON', '', '', '', '', '2014-09-18', 17205.60, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(44, NULL, 'CANON', '892063007477', 'CANON', '', '', '', '', '2015-02-17', 4993.75, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31'),
(45, NULL, 'SWANN', '28054041140437', 'SWANN', '', '', '', 'SWANN', '2015-07-01', 11999.00, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31');

-- --------------------------------------------------------

--
-- Table structure for table `catestado`
--

CREATE TABLE `catestado` (
  `id` int(11) NOT NULL,
  `catEstadoDescripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catestado`
--

INSERT INTO `catestado` (`id`, `catEstadoDescripcion`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Table structure for table `catimpresoras`
--

CREATE TABLE `catimpresoras` (
  `catImpresorasId` int(11) NOT NULL,
  `catImpresoraCodigo` text DEFAULT NULL,
  `catImpresorasMarca` text DEFAULT NULL,
  `catImpresoraModelo` text DEFAULT NULL,
  `catImpresoraTipoToner` text DEFAULT NULL,
  `catImpresoraDescripcion` text DEFAULT NULL,
  `catImpresoraFechaIngreso` date DEFAULT NULL,
  `catImpresoraCosto` float(11,2) DEFAULT NULL,
  `CatImpresoraEstado` int(11) NOT NULL,
  `idActivofijo` int(11) NOT NULL,
  `catImpresoraTipoEquipo` text DEFAULT NULL,
  `catImpresoraObservaciones` text DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catimpresoras`
--

INSERT INTO `catimpresoras` (`catImpresorasId`, `catImpresoraCodigo`, `catImpresorasMarca`, `catImpresoraModelo`, `catImpresoraTipoToner`, `catImpresoraDescripcion`, `catImpresoraFechaIngreso`, `catImpresoraCosto`, `CatImpresoraEstado`, `idActivofijo`, `catImpresoraTipoEquipo`, `catImpresoraObservaciones`, `updated_at`, `created_at`) VALUES
(1, NULL, 'Epson', 'L5190', NULL, 'X5NQ015151', '2019-11-20', 10175.70, 1, 3, 'Impresora', 'Impresora negra, impirime y copia a color y negro', '2021-02-03', '2021-01-31'),
(2, NULL, 'Laser canon image class', 'D1620', '', '2SN14907', '2020-12-20', 21150.00, 1, 3, NULL, NULL, '2021-01-31', '2021-01-31');

-- --------------------------------------------------------

--
-- Table structure for table `catterreno`
--

CREATE TABLE `catterreno` (
  `catTerrenoId` int(11) NOT NULL,
  `catTerrenoPropietario` text DEFAULT NULL,
  `catTerrenoArea` text DEFAULT NULL,
  `catTerrenoFechaCompra` date DEFAULT NULL,
  `catterrenoCosto` float(11,2) DEFAULT NULL,
  `CatTerrenoEstado` int(11) NOT NULL,
  `catTerrenoNumeroCatastral` text DEFAULT NULL,
  `idActivofijo` int(11) NOT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catterreno`
--

INSERT INTO `catterreno` (`catTerrenoId`, `catTerrenoPropietario`, `catTerrenoArea`, `catTerrenoFechaCompra`, `catterrenoCosto`, `CatTerrenoEstado`, `catTerrenoNumeroCatastral`, `idActivofijo`, `updated_at`, `created_at`) VALUES
(1, 'LOTE DE 1500 VRS2 ', '', '2013-01-01', 237902.00, 1, '', 1, '2021-01-30', '2021-01-30'),
(2, '2 LOTES, (228.99M2 / 231.72M2', '', '2013-01-01', 32301.00, 1, '', 1, '2021-01-30', '2021-01-30'),
(3, 'LOTE DE 2500.233 VRS2', '', '2013-01-01', 489788.00, 1, '', 1, '2021-01-30', '2021-01-30'),
(4, 'LOTE DE 924.373 VRS2', '', '2013-01-20', 175928.00, 1, '', 1, '2021-01-30', '2021-01-30'),
(5, 'LOTE DE 2500 VRS2', '', '2013-01-20', 489788.00, 1, '', 1, '2021-01-30', '2021-01-30'),
(6, 'Tramites de Terreno Carolina', '', '2015-01-20', 125650.00, 1, '', 1, '2021-01-30', '2021-01-30'),
(7, 'LOTE DE 1,762,530 METRO CUADRADO', '', '2016-06-20', 427842.00, 1, '', 1, '2021-01-30', '2021-01-30'),
(8, 'Gastos legales de terreno - Anticpos ', '', '2016-12-20', 19814.00, 1, '', 1, '2021-01-30', '2021-01-30'),
(9, 'Fusion de terrenos', '', '2019-11-20', 3911.00, 1, '', 1, '2021-01-30', '2021-01-30'),
(10, 'EDIFICIO BRADLEY', '', '2013-01-20', 1489390.00, 1, '', 8, '2021-03-01', '2021-03-01'),
(11, 'EDIFICIO CAROLINA', '', '2013-01-20', 2571390.00, 1, '', 8, '2021-03-01', '2021-03-01'),
(12, 'ESTABLOS DE CABALLOS', '', '2014-01-20', 50043.00, 1, '', 8, '2021-03-01', '2021-03-01'),
(13, 'PASILLO CON RAMPA', '', '2014-05-20', 73687.00, 1, '', 8, '2021-03-01', '2021-03-01'),
(14, 'TECHO SOBRE EL PASILLO', '', '2014-07-20', 65178.00, 1, '', 8, '2021-03-01', '2021-03-01'),
(15, 'Sistema de Drenaje', '', '2015-10-20', 207334.00, 1, '', 8, '2021-03-01', '2021-03-01'),
(16, 'Materiales Escalera/ Canasta & Parales', '', '2016-01-20', 4085.00, 1, '', 8, '2021-03-01', '2021-03-01'),
(17, 'Materiales Escalera/ Canasta & Parales', '', '2016-02-01', 2000.00, 1, '', 8, '2021-03-01', '2021-03-01'),
(18, 'Picadero y establo', '', '2019-05-20', 3107560.00, 1, '', 8, '2021-03-01', '2021-03-01');

-- --------------------------------------------------------

--
-- Table structure for table `cattipocuentaactivofijo`
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
-- Dumping data for table `cattipocuentaactivofijo`
--

INSERT INTO `cattipocuentaactivofijo` (`idActivofijo`, `ActivoFijoCodigoDescripcion`, `descripcionActivoFjo`, `vidaUtilActivoFijo`, `CatTipoCuentaActivoEstado`, `updated_at`, `created_at`) VALUES
(1, '121100', 'Terreno', 0, 1, '2020-10-06', '2020-09-22'),
(2, '121200', 'Instalaciones', 120, 1, '2020-10-06', '2020-09-28'),
(3, '121300', 'Equipo Computo', 24, 1, '2020-10-06', '2020-10-01'),
(4, '121400', 'Mobiliario y Equipo de oficina', 60, 1, '2020-10-06', '2020-10-06'),
(5, '121500', 'Vehiculos', 60, 1, '2020-10-06', '2020-10-06'),
(6, '121600', 'Otros Activos', 0, 1, '2020-10-06', '2020-10-06'),
(7, '121700', 'Mobiliario y Equipo Docentes', 60, 1, '2020-10-06', '2020-10-06'),
(8, '121800', 'Edificio', 120, 1, '2021-01-31', '2021-01-31');

-- --------------------------------------------------------

--
-- Table structure for table `catvehiculo`
--

CREATE TABLE `catvehiculo` (
  `catVehiculoId` int(11) NOT NULL,
  `catVehiculoTipo` text DEFAULT NULL,
  `catVehiculoModelo` text DEFAULT NULL,
  `catVehiculoColor` text DEFAULT NULL,
  `catVehiculoMotor` text DEFAULT NULL,
  `catVehiculoChasis` text DEFAULT NULL,
  `catVehiculoVIM` text DEFAULT NULL,
  `catVehiculoCantPasajeros` int(11) DEFAULT NULL,
  `catVehiculoCombustible` text DEFAULT NULL,
  `catVehiculoUso` text DEFAULT NULL,
  `catVehiculoAnio` text DEFAULT NULL,
  `catVehiculoCilindro` text DEFAULT NULL,
  `catVehiculoServicio` text DEFAULT NULL,
  `catVehiculoPropietario` text DEFAULT NULL,
  `catVehiculoFechaCompra` date DEFAULT NULL,
  `catVehiculoCosto` float(11,2) DEFAULT NULL,
  `catVehiculoEstado` int(11) NOT NULL,
  `catVehiculoPlaca` text DEFAULT NULL,
  `idActivofijo` int(11) NOT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catvehiculo`
--

INSERT INTO `catvehiculo` (`catVehiculoId`, `catVehiculoTipo`, `catVehiculoModelo`, `catVehiculoColor`, `catVehiculoMotor`, `catVehiculoChasis`, `catVehiculoVIM`, `catVehiculoCantPasajeros`, `catVehiculoCombustible`, `catVehiculoUso`, `catVehiculoAnio`, `catVehiculoCilindro`, `catVehiculoServicio`, `catVehiculoPropietario`, `catVehiculoFechaCompra`, `catVehiculoCosto`, `catVehiculoEstado`, `catVehiculoPlaca`, `idActivofijo`, `updated_at`, `created_at`) VALUES
(1, 'CARRO', 'TOYOTA YARIS SEDAN', 'BLANCO', '', '', 'JTDBW113500037292', 0, 'GASOLINA', '', '', '', '', 'TESOROS DE DIOS', '2013-05-20', 133650.00, 1, 'M061837', 5, '2021-01-31', '2021-01-31'),
(2, 'BUS COASTER', 'TOYOTA COASTER', 'BLANCO', '', '', 'JTGFB518501073139', 0, 'DIESEL', '', '', '', '', 'TESOROS DE DIOS', '2015-09-20', 1676449.88, 1, 'M241069', 5, '2021-01-31', '2021-01-31'),
(3, 'BUS COASTER', 'TOYOTA COASTER', 'BLANCO', '', '', 'JTGFB518201073227', 0, 'DIESEL', '', '', '', '', 'TESOROS DE DIOS', '2015-09-20', 1676449.88, 1, 'M241070', 5, '2021-01-31', '2021-01-31'),
(4, 'Camioneta Prado', 'TOYOTA', 'Verde Oscuro', '', '', 'Jtebk29jx00001467', 0, 'DIESEL', '', '', '', '', 'TESOROS DE DIOS', '2018-06-20', 416459.41, 1, 'M072564', 5, '2021-01-31', '2021-01-31'),
(5, 'CAMIONETA', 'MAHINDRA SCORPIO DOBLE CABINA 4WD', 'PLATEADA', '', '', '', 0, 'DIESEL', '', '', '', '', 'TESOROS DE DIOS', '2012-11-30', 510190.19, 1, 'M190657', 5, '2021-01-31', '2021-01-31');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_08_30_055338_create_cattipocuentaactivofijos_table', 2),
(5, '2020_08_30_074746_catterreno', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('tecnologia@tesorosdedios.org', '$2y$10$1lG2aYPVKgQ9YCYGDhTFWObNTQEknfVybO5//XbY5xGP/aRDbxQEq', '2020-10-03 22:32:31');

-- --------------------------------------------------------

--
-- Stand-in structure for view `rptconsolidadocategoriaactivofijo`
-- (See below for the actual view)
--
CREATE TABLE `rptconsolidadocategoriaactivofijo` (
`CATEGORIA` longtext
,`DETALLE_ACTIVO` mediumtext
,`COSTO` double(19,2)
,`DEPRECIACIONTOTALMENSUAL` decimal(52,2)
,`DEPRECIACIONTOTALACUMULADA` decimal(52,2)
,`SALDOTOTALLIBRO` decimal(52,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `rptdetalleactivo_estadoactivo`
-- (See below for the actual view)
--
CREATE TABLE `rptdetalleactivo_estadoactivo` (
`CATEGORIA` mediumtext
,`DETALLE_ACTIVO` mediumtext
,`FECHA_RECIBIDA` date
,`COSTO` float(11,2)
,`VIDA_UTIL` int(11)
,`MESES` int(11)
,`depreciacionMensual` decimal(30,2)
,`depreciacionAcumulada` decimal(30,2)
,`saldoEnLibro` decimal(30,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `rptdetalleactivo_estadobajas`
-- (See below for the actual view)
--
CREATE TABLE `rptdetalleactivo_estadobajas` (
`CATEGORIA` mediumtext
,`DETALLE_ACTIVO` mediumtext
,`FECHA_RECIBIDA` date
,`COSTO` float(11,2)
,`FECHA_BAJA` date
,`VIDA_UTIL` int(11)
,`MESES` int(11)
,`depreciacionMensual` decimal(30,2)
,`depreciacionAcumulada` decimal(30,2)
,`saldoEnLibro` decimal(30,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `rptdetallecategoriaactiofijo`
-- (See below for the actual view)
--
CREATE TABLE `rptdetallecategoriaactiofijo` (
`CATEGORIA` mediumtext
,`COSTO` double(19,2)
,`DEPRECIACIONTOTALMENSUAL` decimal(52,2)
,`DEPRECIACIONTOTALACUMULADA` decimal(52,2)
,`SALDOTOTALLIBRO` decimal(52,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
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
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Allan', 'tecnologia@tesorosdedios.org', NULL, '$2y$10$t/P8vLpce1DTK48NQ/8yxe8flJIE1fpUFRwODoJwW8Kh80Kms/49G', 'duLXs9UeJHjRKYYLb4uYkUJK702sE1eXsY8wQVBsygoipuvlf13WKpkWNvJI', 1, '2020-08-17 04:52:20', '2020-08-17 04:52:20'),
(2, 'Wendy', 'wendy@tesorosdedios.org', NULL, '$2y$10$gLBNTIuZi0djmGP2CG2SZeW8K/mA7cktnamh3sh.G1dU3plRQlEKO', NULL, 1, '2020-10-03 06:00:00', '2020-10-05 03:41:17'),
(3, 'Bernarda Salgado', 'administrador@tesorosdedios.org', NULL, '$2y$10$QFURSzi.XMdPhYp7dnHKG.4yHVy9Wq04H.YDD0tJBGrmoPpbaTvVe', NULL, 2, '2020-10-11 06:00:00', '2020-10-12 02:30:34');

-- --------------------------------------------------------

--
-- Structure for view `rptconsolidadocategoriaactivofijo`
--
DROP TABLE IF EXISTS `rptconsolidadocategoriaactivofijo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rptconsolidadocategoriaactivofijo`  AS  select `activo`.`CATEGORIA` AS `CATEGORIA`,`activo`.`DETALLE_ACTIVO` AS `DETALLE_ACTIVO`,sum(`activo`.`COSTO`) AS `COSTO`,sum(`activo`.`depreciacionMensual`) AS `DEPRECIACIONTOTALMENSUAL`,sum(`activo`.`depreciacionAcumulada`) AS `DEPRECIACIONTOTALACUMULADA`,sum(`activo`.`saldoEnLibro`) AS `SALDOTOTALLIBRO` from (select `cattipocuentaactivofijo`.`descripcionActivoFjo` AS `CATEGORIA`,`catelectrodomesticos`.`CatElectDescripcion` AS `DETALLE_ACTIVO`,`catelectrodomesticos`.`CatElectFechaIngreso` AS `FECHA_RECIBIDA`,`catelectrodomesticos`.`CatElectCosto` AS `COSTO`,`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `VIDA_UTIL`,`calculoMes`(curdate(),`catelectrodomesticos`.`CatElectFechaIngreso`) AS `MESES`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catelectrodomesticos`.`CatElectCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catelectrodomesticos`.`CatElectFechaIngreso`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catelectrodomesticos`.`CatElectCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`catelectrodomesticos`.`CatElectCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catelectrodomesticos`.`CatElectFechaIngreso`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catelectrodomesticos`.`CatElectCosto`))) AS `saldoEnLibro` from (`catelectrodomesticos` join `cattipocuentaactivofijo`) where `catelectrodomesticos`.`idActivofijo` = `cattipocuentaactivofijo`.`idActivofijo` and `catelectrodomesticos`.`CatElectEstado` <> 2 union all select `cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`catequipocomputo`.`catEquipoMarca` AS `CatEquipoMarca`,`catequipocomputo`.`catEquipoFechaCompra` AS `CatequipoFechaCompra`,`catequipocomputo`.`catEquipoCostoEquipo` AS `catEquipoCostoEquipo`,`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`catequipocomputo`.`catEquipoFechaCompra`) AS `MESES`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catequipocomputo`.`catEquipoCostoEquipo`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catequipocomputo`.`catEquipoFechaCompra`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catequipocomputo`.`catEquipoCostoEquipo`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`catequipocomputo`.`catEquipoCostoEquipo`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catequipocomputo`.`catEquipoFechaCompra`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catequipocomputo`.`catEquipoCostoEquipo`))) AS `saldoEnLibro` from (`catequipocomputo` join `cattipocuentaactivofijo`) where `catequipocomputo`.`idActivofijo` = `cattipocuentaactivofijo`.`idActivofijo` and `catequipocomputo`.`CatEquipoEstado` <> 2 union all select `cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`catimpresoras`.`catImpresorasMarca` AS `catImpresorasMarca`,`catimpresoras`.`catImpresoraFechaIngreso` AS `catImpresoraFechaIngreso`,`catimpresoras`.`catImpresoraCosto` AS `catimpresoraCosto`,`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`catimpresoras`.`catImpresoraFechaIngreso`) AS `MESES`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catimpresoras`.`catImpresoraCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catimpresoras`.`catImpresoraFechaIngreso`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catimpresoras`.`catImpresoraCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`catimpresoras`.`catImpresoraCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catimpresoras`.`catImpresoraFechaIngreso`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catimpresoras`.`catImpresoraCosto`))) AS `saldoEnLibro` from (`catimpresoras` join `cattipocuentaactivofijo`) where `catimpresoras`.`idActivofijo` = `cattipocuentaactivofijo`.`idActivofijo` and `catimpresoras`.`CatImpresoraEstado` <> 2 union all select `cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`catvehiculo`.`catVehiculoModelo` AS `catvehiculoModelo`,`catvehiculo`.`catVehiculoFechaCompra` AS `catvehiculoFechaCompra`,`catvehiculo`.`catVehiculoCosto` AS `catVehiculoCosto`,`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`catvehiculo`.`catVehiculoFechaCompra`) AS `MESES`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catvehiculo`.`catVehiculoCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catvehiculo`.`catVehiculoFechaCompra`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catvehiculo`.`catVehiculoCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`catvehiculo`.`catVehiculoCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catvehiculo`.`catVehiculoFechaCompra`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catvehiculo`.`catVehiculoCosto`))) AS `saldoEnLibro` from (`catvehiculo` join `cattipocuentaactivofijo`) where `catvehiculo`.`idActivofijo` = `cattipocuentaactivofijo`.`idActivofijo` and `catvehiculo`.`catVehiculoEstado` <> 2 union all select `cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`catterreno`.`catTerrenoPropietario` AS `catTerrenoPropietario`,`catterreno`.`catTerrenoFechaCompra` AS `catterrenoFechaCompra`,`catterreno`.`catterrenoCosto` AS `catterrenoCosto`,`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`catterreno`.`catTerrenoFechaCompra`) AS `MESES`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catterreno`.`catterrenoCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catterreno`.`catTerrenoFechaCompra`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catterreno`.`catterrenoCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`catterreno`.`catterrenoCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catterreno`.`catTerrenoFechaCompra`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catterreno`.`catterrenoCosto`))) AS `saldoEnLibro` from (`catterreno` join `cattipocuentaactivofijo`) where `catterreno`.`idActivofijo` = `cattipocuentaactivofijo`.`idActivofijo` and `catterreno`.`CatTerrenoEstado` <> 2) `activo` group by `activo`.`CATEGORIA`,`activo`.`DETALLE_ACTIVO` with rollup ;

-- --------------------------------------------------------

--
-- Structure for view `rptdetalleactivo_estadoactivo`
--
DROP TABLE IF EXISTS `rptdetalleactivo_estadoactivo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rptdetalleactivo_estadoactivo`  AS  select `cattipocuentaactivofijo`.`descripcionActivoFjo` AS `CATEGORIA`,`catelectrodomesticos`.`CatElectDescripcion` AS `DETALLE_ACTIVO`,`catelectrodomesticos`.`CatElectFechaIngreso` AS `FECHA_RECIBIDA`,`catelectrodomesticos`.`CatElectCosto` AS `COSTO`,`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `VIDA_UTIL`,`calculoMes`(curdate(),`catelectrodomesticos`.`CatElectFechaIngreso`) AS `MESES`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catelectrodomesticos`.`CatElectCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catelectrodomesticos`.`CatElectFechaIngreso`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catelectrodomesticos`.`CatElectCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`catelectrodomesticos`.`CatElectCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catelectrodomesticos`.`CatElectFechaIngreso`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catelectrodomesticos`.`CatElectCosto`))) AS `saldoEnLibro` from (`catelectrodomesticos` join `cattipocuentaactivofijo`) where `catelectrodomesticos`.`idActivofijo` = `cattipocuentaactivofijo`.`idActivofijo` and `catelectrodomesticos`.`CatElectEstado` <> 2 union all select `cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`catequipocomputo`.`catEquipoMarca` AS `CatEquipoMarca`,`catequipocomputo`.`catEquipoFechaCompra` AS `CatequipoFechaCompra`,`catequipocomputo`.`catEquipoCostoEquipo` AS `catEquipoCostoEquipo`,`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`catequipocomputo`.`catEquipoFechaCompra`) AS `MESES`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catequipocomputo`.`catEquipoCostoEquipo`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catequipocomputo`.`catEquipoFechaCompra`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catequipocomputo`.`catEquipoCostoEquipo`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`catequipocomputo`.`catEquipoCostoEquipo`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catequipocomputo`.`catEquipoFechaCompra`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catequipocomputo`.`catEquipoCostoEquipo`))) AS `saldoEnLibro` from (`catequipocomputo` join `cattipocuentaactivofijo`) where `catequipocomputo`.`idActivofijo` = `cattipocuentaactivofijo`.`idActivofijo` and `catequipocomputo`.`CatEquipoEstado` <> 2 union all select `cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`catimpresoras`.`catImpresorasMarca` AS `catImpresorasMarca`,`catimpresoras`.`catImpresoraFechaIngreso` AS `catImpresoraFechaIngreso`,`catimpresoras`.`catImpresoraCosto` AS `catimpresoraCosto`,`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`catimpresoras`.`catImpresoraFechaIngreso`) AS `MESES`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catimpresoras`.`catImpresoraCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catimpresoras`.`catImpresoraFechaIngreso`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catimpresoras`.`catImpresoraCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`catimpresoras`.`catImpresoraCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catimpresoras`.`catImpresoraFechaIngreso`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catimpresoras`.`catImpresoraCosto`))) AS `saldoEnLibro` from (`catimpresoras` join `cattipocuentaactivofijo`) where `catimpresoras`.`idActivofijo` = `cattipocuentaactivofijo`.`idActivofijo` and `catimpresoras`.`CatImpresoraEstado` <> 2 union all select `cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`catvehiculo`.`catVehiculoModelo` AS `catvehiculoModelo`,`catvehiculo`.`catVehiculoFechaCompra` AS `catvehiculoFechaCompra`,`catvehiculo`.`catVehiculoCosto` AS `catVehiculoCosto`,`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`catvehiculo`.`catVehiculoFechaCompra`) AS `MESES`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catvehiculo`.`catVehiculoCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catvehiculo`.`catVehiculoFechaCompra`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catvehiculo`.`catVehiculoCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`catvehiculo`.`catVehiculoCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catvehiculo`.`catVehiculoFechaCompra`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catvehiculo`.`catVehiculoCosto`))) AS `saldoEnLibro` from (`catvehiculo` join `cattipocuentaactivofijo`) where `catvehiculo`.`idActivofijo` = `cattipocuentaactivofijo`.`idActivofijo` and `catvehiculo`.`catVehiculoEstado` <> 2 union all select `cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`catterreno`.`catTerrenoPropietario` AS `catTerrenoPropietario`,`catterreno`.`catTerrenoFechaCompra` AS `catterrenoFechaCompra`,`catterreno`.`catterrenoCosto` AS `catterrenoCosto`,`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`catterreno`.`catTerrenoFechaCompra`) AS `MESES`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catterreno`.`catterrenoCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catterreno`.`catTerrenoFechaCompra`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catterreno`.`catterrenoCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`catterreno`.`catterrenoCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catterreno`.`catTerrenoFechaCompra`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catterreno`.`catterrenoCosto`))) AS `saldoEnLibro` from (`catterreno` join `cattipocuentaactivofijo`) where `catterreno`.`idActivofijo` = `cattipocuentaactivofijo`.`idActivofijo` and `catterreno`.`CatTerrenoEstado` <> 2 ;

-- --------------------------------------------------------

--
-- Structure for view `rptdetalleactivo_estadobajas`
--
DROP TABLE IF EXISTS `rptdetalleactivo_estadobajas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rptdetalleactivo_estadobajas`  AS  select `cattipocuentaactivofijo`.`descripcionActivoFjo` AS `CATEGORIA`,`catelectrodomesticos`.`CatElectDescripcion` AS `DETALLE_ACTIVO`,`catelectrodomesticos`.`CatElectFechaIngreso` AS `FECHA_RECIBIDA`,`catelectrodomesticos`.`CatElectCosto` AS `COSTO`,`catelectrodomesticos`.`updated_at` AS `FECHA_BAJA`,`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `VIDA_UTIL`,`calculoMes`(curdate(),`catelectrodomesticos`.`CatElectFechaIngreso`) AS `MESES`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catelectrodomesticos`.`CatElectCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catelectrodomesticos`.`CatElectFechaIngreso`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catelectrodomesticos`.`CatElectCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`catelectrodomesticos`.`CatElectCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catelectrodomesticos`.`CatElectFechaIngreso`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catelectrodomesticos`.`CatElectCosto`))) AS `saldoEnLibro` from (`catelectrodomesticos` join `cattipocuentaactivofijo`) where `catelectrodomesticos`.`idActivofijo` = `cattipocuentaactivofijo`.`idActivofijo` and `catelectrodomesticos`.`CatElectEstado` <> 1 union all select `cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`catequipocomputo`.`catEquipoMarca` AS `CatEquipoMarca`,`catequipocomputo`.`catEquipoFechaCompra` AS `CatequipoFechaCompra`,`catequipocomputo`.`catEquipoCostoEquipo` AS `catEquipoCostoEquipo`,`catequipocomputo`.`updated_at` AS `FECHA_BAJA`,`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`catequipocomputo`.`catEquipoFechaCompra`) AS `MESES`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catequipocomputo`.`catEquipoCostoEquipo`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catequipocomputo`.`catEquipoFechaCompra`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catequipocomputo`.`catEquipoCostoEquipo`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`catequipocomputo`.`catEquipoCostoEquipo`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catequipocomputo`.`catEquipoFechaCompra`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catequipocomputo`.`catEquipoCostoEquipo`))) AS `saldoEnLibro` from (`catequipocomputo` join `cattipocuentaactivofijo`) where `catequipocomputo`.`idActivofijo` = `cattipocuentaactivofijo`.`idActivofijo` and `catequipocomputo`.`CatEquipoEstado` <> 1 union all select `cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`catimpresoras`.`catImpresorasMarca` AS `catImpresorasMarca`,`catimpresoras`.`catImpresoraFechaIngreso` AS `catImpresoraFechaIngreso`,`catimpresoras`.`catImpresoraCosto` AS `catimpresoraCosto`,`catimpresoras`.`updated_at` AS `FECHA_BAJA`,`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`catimpresoras`.`catImpresoraFechaIngreso`) AS `MESES`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catimpresoras`.`catImpresoraCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catimpresoras`.`catImpresoraFechaIngreso`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catimpresoras`.`catImpresoraCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`catimpresoras`.`catImpresoraCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catimpresoras`.`catImpresoraFechaIngreso`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catimpresoras`.`catImpresoraCosto`))) AS `saldoEnLibro` from (`catimpresoras` join `cattipocuentaactivofijo`) where `catimpresoras`.`idActivofijo` = `cattipocuentaactivofijo`.`idActivofijo` and `catimpresoras`.`CatImpresoraEstado` <> 1 union all select `cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`catvehiculo`.`catVehiculoModelo` AS `catvehiculoModelo`,`catvehiculo`.`catVehiculoFechaCompra` AS `catvehiculoFechaCompra`,`catvehiculo`.`catVehiculoCosto` AS `catVehiculoCosto`,`catvehiculo`.`updated_at` AS `FECHA_BAJA`,`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`catvehiculo`.`catVehiculoFechaCompra`) AS `MESES`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catvehiculo`.`catVehiculoCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catvehiculo`.`catVehiculoFechaCompra`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catvehiculo`.`catVehiculoCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`catvehiculo`.`catVehiculoCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catvehiculo`.`catVehiculoFechaCompra`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catvehiculo`.`catVehiculoCosto`))) AS `saldoEnLibro` from (`catvehiculo` join `cattipocuentaactivofijo`) where `catvehiculo`.`idActivofijo` = `cattipocuentaactivofijo`.`idActivofijo` and `catvehiculo`.`catVehiculoEstado` <> 1 union all select `cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`catterreno`.`catTerrenoPropietario` AS `catTerrenoPropietario`,`catterreno`.`catTerrenoFechaCompra` AS `catterrenoFechaCompra`,`catterreno`.`catterrenoCosto` AS `catterrenoCosto`,`catterreno`.`updated_at` AS `FECHA_BAJA`,`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`catterreno`.`catTerrenoFechaCompra`) AS `MESES`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catterreno`.`catterrenoCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catterreno`.`catTerrenoFechaCompra`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catterreno`.`catterrenoCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`catterreno`.`catterrenoCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catterreno`.`catTerrenoFechaCompra`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catterreno`.`catterrenoCosto`))) AS `saldoEnLibro` from (`catterreno` join `cattipocuentaactivofijo`) where `catterreno`.`idActivofijo` = `cattipocuentaactivofijo`.`idActivofijo` and `catterreno`.`CatTerrenoEstado` <> 1 ;

-- --------------------------------------------------------

--
-- Structure for view `rptdetallecategoriaactiofijo`
--
DROP TABLE IF EXISTS `rptdetallecategoriaactiofijo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rptdetallecategoriaactiofijo`  AS  select `activo`.`CATEGORIA` AS `CATEGORIA`,sum(`activo`.`COSTO`) AS `COSTO`,sum(`activo`.`depreciacionMensual`) AS `DEPRECIACIONTOTALMENSUAL`,sum(`activo`.`depreciacionAcumulada`) AS `DEPRECIACIONTOTALACUMULADA`,sum(`activo`.`saldoEnLibro`) AS `SALDOTOTALLIBRO` from (select `cattipocuentaactivofijo`.`descripcionActivoFjo` AS `CATEGORIA`,`catelectrodomesticos`.`CatElectDescripcion` AS `DETALLE_ACTIVO`,`catelectrodomesticos`.`CatElectFechaIngreso` AS `FECHA_RECIBIDA`,`catelectrodomesticos`.`CatElectCosto` AS `COSTO`,`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `VIDA_UTIL`,`calculoMes`(curdate(),`catelectrodomesticos`.`CatElectFechaIngreso`) AS `MESES`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catelectrodomesticos`.`CatElectCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catelectrodomesticos`.`CatElectFechaIngreso`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catelectrodomesticos`.`CatElectCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`catelectrodomesticos`.`CatElectCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catelectrodomesticos`.`CatElectFechaIngreso`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catelectrodomesticos`.`CatElectCosto`))) AS `saldoEnLibro` from (`catelectrodomesticos` join `cattipocuentaactivofijo`) where `catelectrodomesticos`.`idActivofijo` = `cattipocuentaactivofijo`.`idActivofijo` and `catelectrodomesticos`.`CatElectEstado` <> 2 union all select `cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`catequipocomputo`.`catEquipoMarca` AS `CatEquipoMarca`,`catequipocomputo`.`catEquipoFechaCompra` AS `CatequipoFechaCompra`,`catequipocomputo`.`catEquipoCostoEquipo` AS `catEquipoCostoEquipo`,`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`catequipocomputo`.`catEquipoFechaCompra`) AS `MESES`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catequipocomputo`.`catEquipoCostoEquipo`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catequipocomputo`.`catEquipoFechaCompra`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catequipocomputo`.`catEquipoCostoEquipo`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`catequipocomputo`.`catEquipoCostoEquipo`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catequipocomputo`.`catEquipoFechaCompra`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catequipocomputo`.`catEquipoCostoEquipo`))) AS `saldoEnLibro` from (`catequipocomputo` join `cattipocuentaactivofijo`) where `catequipocomputo`.`idActivofijo` = `cattipocuentaactivofijo`.`idActivofijo` and `catequipocomputo`.`CatEquipoEstado` <> 2 union all select `cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`catimpresoras`.`catImpresorasMarca` AS `catImpresorasMarca`,`catimpresoras`.`catImpresoraFechaIngreso` AS `catImpresoraFechaIngreso`,`catimpresoras`.`catImpresoraCosto` AS `catimpresoraCosto`,`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`catimpresoras`.`catImpresoraFechaIngreso`) AS `MESES`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catimpresoras`.`catImpresoraCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catimpresoras`.`catImpresoraFechaIngreso`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catimpresoras`.`catImpresoraCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`catimpresoras`.`catImpresoraCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catimpresoras`.`catImpresoraFechaIngreso`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catimpresoras`.`catImpresoraCosto`))) AS `saldoEnLibro` from (`catimpresoras` join `cattipocuentaactivofijo`) where `catimpresoras`.`idActivofijo` = `cattipocuentaactivofijo`.`idActivofijo` and `catimpresoras`.`CatImpresoraEstado` <> 2 union all select `cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`catvehiculo`.`catVehiculoModelo` AS `catvehiculoModelo`,`catvehiculo`.`catVehiculoFechaCompra` AS `catvehiculoFechaCompra`,`catvehiculo`.`catVehiculoCosto` AS `catVehiculoCosto`,`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`catvehiculo`.`catVehiculoFechaCompra`) AS `MESES`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catvehiculo`.`catVehiculoCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catvehiculo`.`catVehiculoFechaCompra`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catvehiculo`.`catVehiculoCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`catvehiculo`.`catVehiculoCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catvehiculo`.`catVehiculoFechaCompra`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catvehiculo`.`catVehiculoCosto`))) AS `saldoEnLibro` from (`catvehiculo` join `cattipocuentaactivofijo`) where `catvehiculo`.`idActivofijo` = `cattipocuentaactivofijo`.`idActivofijo` and `catvehiculo`.`catVehiculoEstado` <> 2 union all select `cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,`catterreno`.`catTerrenoPropietario` AS `catTerrenoPropietario`,`catterreno`.`catTerrenoFechaCompra` AS `catterrenoFechaCompra`,`catterreno`.`catterrenoCosto` AS `catterrenoCosto`,`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,`calculoMes`(curdate(),`catterreno`.`catTerrenoFechaCompra`) AS `MESES`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catterreno`.`catterrenoCosto`) AS `depreciacionMensual`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catterreno`.`catTerrenoFechaCompra`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catterreno`.`catterrenoCosto`)) AS `depreciacionAcumulada`,`saldoEnLibro`(`catterreno`.`catterrenoCosto`,`depreciacionAcumulativa`(`calculoMes`(curdate(),`catterreno`.`catTerrenoFechaCompra`),`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`depreciacionMensual`(`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,`catterreno`.`catterrenoCosto`))) AS `saldoEnLibro` from (`catterreno` join `cattipocuentaactivofijo`) where `catterreno`.`idActivofijo` = `cattipocuentaactivofijo`.`idActivofijo` and `catterreno`.`CatTerrenoEstado` <> 2) `activo` group by `activo`.`CATEGORIA` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catelectrodomesticos`
--
ALTER TABLE `catelectrodomesticos`
  ADD PRIMARY KEY (`CatElectId`),
  ADD KEY `CatElectEstado` (`CatElectEstado`),
  ADD KEY `idActivofijo` (`idActivofijo`);

--
-- Indexes for table `catequipocomputo`
--
ALTER TABLE `catequipocomputo`
  ADD PRIMARY KEY (`catEquipoCompId`),
  ADD KEY `CatEquipoEstado` (`CatEquipoEstado`),
  ADD KEY `idActivofijo` (`idActivofijo`);

--
-- Indexes for table `catestado`
--
ALTER TABLE `catestado`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catimpresoras`
--
ALTER TABLE `catimpresoras`
  ADD PRIMARY KEY (`catImpresorasId`),
  ADD KEY `CatImpresoraEstado` (`CatImpresoraEstado`),
  ADD KEY `idActivofijo` (`idActivofijo`);

--
-- Indexes for table `catterreno`
--
ALTER TABLE `catterreno`
  ADD PRIMARY KEY (`catTerrenoId`),
  ADD KEY `CatTerrenoEstado` (`CatTerrenoEstado`),
  ADD KEY `idActivofijo` (`idActivofijo`);

--
-- Indexes for table `cattipocuentaactivofijo`
--
ALTER TABLE `cattipocuentaactivofijo`
  ADD PRIMARY KEY (`idActivofijo`),
  ADD KEY `CatTipoCuentaActivoEstado` (`CatTipoCuentaActivoEstado`);

--
-- Indexes for table `catvehiculo`
--
ALTER TABLE `catvehiculo`
  ADD PRIMARY KEY (`catVehiculoId`),
  ADD KEY `catVehiculoEstado` (`catVehiculoEstado`),
  ADD KEY `idActivofijo` (`idActivofijo`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `estado` (`estado`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `catelectrodomesticos`
--
ALTER TABLE `catelectrodomesticos`
  MODIFY `CatElectId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=332;

--
-- AUTO_INCREMENT for table `catequipocomputo`
--
ALTER TABLE `catequipocomputo`
  MODIFY `catEquipoCompId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `catestado`
--
ALTER TABLE `catestado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `catimpresoras`
--
ALTER TABLE `catimpresoras`
  MODIFY `catImpresorasId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `catterreno`
--
ALTER TABLE `catterreno`
  MODIFY `catTerrenoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `cattipocuentaactivofijo`
--
ALTER TABLE `cattipocuentaactivofijo`
  MODIFY `idActivofijo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `catvehiculo`
--
ALTER TABLE `catvehiculo`
  MODIFY `catVehiculoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `catelectrodomesticos`
--
ALTER TABLE `catelectrodomesticos`
  ADD CONSTRAINT `catelectrodomesticos_ibfk_1` FOREIGN KEY (`CatElectEstado`) REFERENCES `catestado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `catelectrodomesticos_ibfk_2` FOREIGN KEY (`idActivofijo`) REFERENCES `cattipocuentaactivofijo` (`idActivofijo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catequipocomputo`
--
ALTER TABLE `catequipocomputo`
  ADD CONSTRAINT `catequipocomputo_ibfk_1` FOREIGN KEY (`CatEquipoEstado`) REFERENCES `catestado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `catequipocomputo_ibfk_2` FOREIGN KEY (`idActivofijo`) REFERENCES `cattipocuentaactivofijo` (`idActivofijo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catimpresoras`
--
ALTER TABLE `catimpresoras`
  ADD CONSTRAINT `catimpresoras_ibfk_1` FOREIGN KEY (`CatImpresoraEstado`) REFERENCES `catestado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `catimpresoras_ibfk_2` FOREIGN KEY (`idActivofijo`) REFERENCES `cattipocuentaactivofijo` (`idActivofijo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catterreno`
--
ALTER TABLE `catterreno`
  ADD CONSTRAINT `catterreno_ibfk_1` FOREIGN KEY (`CatTerrenoEstado`) REFERENCES `catestado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `catterreno_ibfk_2` FOREIGN KEY (`idActivofijo`) REFERENCES `cattipocuentaactivofijo` (`idActivofijo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cattipocuentaactivofijo`
--
ALTER TABLE `cattipocuentaactivofijo`
  ADD CONSTRAINT `cattipocuentaactivofijo_ibfk_1` FOREIGN KEY (`CatTipoCuentaActivoEstado`) REFERENCES `catestado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catvehiculo`
--
ALTER TABLE `catvehiculo`
  ADD CONSTRAINT `catvehiculo_ibfk_1` FOREIGN KEY (`catVehiculoEstado`) REFERENCES `catestado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `catvehiculo_ibfk_2` FOREIGN KEY (`idActivofijo`) REFERENCES `cattipocuentaactivofijo` (`idActivofijo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`estado`) REFERENCES `catestado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
