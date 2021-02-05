-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2021 at 09:52 PM
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
  `CatElectMarca` text NOT NULL,
  `CatElectModelo` text NOT NULL,
  `CatElectDescripcion` text NOT NULL,
  `CatElectFechaIngreso` date NOT NULL,
  `CatElectCosto` float(11,2) DEFAULT NULL,
  `CatElectEstado` int(11) NOT NULL,
  `idActivofijo` int(11) NOT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catelectrodomesticos`
--

INSERT INTO `catelectrodomesticos` (`CatElectId`, `CatElectMarca`, `CatElectModelo`, `CatElectDescripcion`, `CatElectFechaIngreso`, `CatElectCosto`, `CatElectEstado`, `idActivofijo`, `updated_at`, `created_at`) VALUES
(1, 'Withpool', '', 'FREZEER', '2013-11-20', 7500.00, 1, 4, '2021-01-30', '2021-01-30'),
(2, 'FRIGIDAIRE', '', 'OASIS', '2013-02-20', 3300.00, 1, 4, '2021-01-30', '2021-01-30'),
(3, 'SAMSUNG', '', 'REFRIGERADOR', '2013-02-20', 8600.00, 1, 4, '2021-01-30', '2021-01-30'),
(4, 'LG', '', 'MICROONDAS', '2013-02-20', 2426.46, 1, 4, '2021-01-30', '2021-01-30'),
(5, 'Bradley', '', 'EXTINGUIDOR', '2013-03-20', 1000.00, 1, 4, '2021-01-30', '2021-01-30'),
(6, 'Carolina', '', 'EXTINGUIDOR', '2013-03-20', 1000.00, 1, 4, '2021-01-30', '2021-01-30'),
(7, 'carolina p2', '', 'CAMA / PICTURE 6', '2014-07-20', 2206.23, 1, 4, '2021-01-30', '2021-01-30'),
(8, 'carolina p2', '', 'CAMA / PICTURE 6', '2014-07-20', 2206.23, 1, 4, '2021-01-30', '2021-01-30'),
(9, 'carolina p2', '', 'CAMA / PICTURE 7', '2014-07-20', 3893.34, 1, 4, '2021-01-30', '2021-01-30'),
(10, 'carolina p2', '', 'COMEDOR / PICTURE 1', '2014-07-20', 7786.68, 1, 4, '2021-01-30', '2021-01-30'),
(11, 'carolina p2', '', 'SOFA GRANDE / PICTURE 5', '2014-07-20', 5191.12, 1, 4, '2021-01-30', '2021-01-30'),
(12, 'carolina p2', '', 'SOFA MEDIANO/ PICTURE 5', '2014-07-20', 5191.12, 1, 4, '2021-01-30', '2021-01-30'),
(13, 'carolina p2', '', 'MESA BAJA / PICTURE 3', '2014-07-20', 2595.56, 1, 4, '2021-01-30', '2021-01-30'),
(14, 'carolina p2', '', 'MESA MEDIANA / PICTURE 3', '2014-07-20', 2595.56, 1, 4, '2021-01-30', '2021-01-30'),
(15, 'Bradley P2', '', 'ESTANTE GRANDE / PICTURE 9', '2014-07-20', 3244.45, 1, 4, '2021-01-30', '2021-01-30'),
(16, 'Bradley P2', '', 'ESTANTE GRANDE / PICTURE 9', '2014-07-20', 3244.45, 1, 4, '2021-01-30', '2021-01-30'),
(17, 'TRUPPER', '', 'BOMBA DE AGUA / ELECTRICA', '2015-05-20', 3345.98, 1, 4, '2021-01-30', '2021-01-30'),
(18, '', '', '1 COCINA DE 2 QUEMADORES', '2016-02-20', 2960.69, 1, 4, '2021-01-30', '2021-01-30'),
(19, '', '', 'MESAS BLANCAS DE PLASTICOS GRANDES', '2016-02-20', 1521.74, 1, 4, '2021-01-30', '2021-01-30'),
(20, 'Matagalpa', '', '2 Mesa de Jardin', '2017-01-20', 2500.00, 1, 4, '2021-01-30', '2021-01-30'),
(21, '', '', '1 Escritorio Econimico', '2017-01-20', 2550.00, 1, 4, '2021-01-30', '2021-01-30'),
(22, '', '', '1 Silla de espera', '2017-01-20', 1035.00, 1, 4, '2021-01-30', '2021-01-30'),
(23, '', '', '1 Escrritorio ', '2017-01-20', 5028.75, 1, 4, '2021-01-30', '2021-01-30'),
(24, 'Tropigas/cocina', '', 'Tanque gas de 25Lbs', '2017-01-20', 1480.00, 1, 4, '2021-01-30', '2021-01-30'),
(25, 'Fisio', '', '2 colchones', '2017-02-20', 1200.00, 1, 4, '2021-01-30', '2021-01-30'),
(26, '', '', '1 cafetera', '2017-02-20', 1169.00, 1, 4, '2021-01-30', '2021-01-30'),
(27, 'carolina p2', '', 'Piano y un adaptador para Teclado', '2016-03-20', 3755.77, 1, 4, '2021-01-30', '2021-01-30'),
(28, '', '', 'Mueble de Cuatro Puertas / Contabilidad', '2018-01-20', 3500.00, 1, 4, '2021-01-30', '2021-01-30'),
(29, '', '', 'Mueble organizador 5 repisas', '2018-01-20', 2000.00, 1, 4, '2021-01-30', '2021-01-30'),
(30, '', '', 'Mueble organizador 5 repisas', '2018-01-20', 2000.00, 1, 4, '2021-01-30', '2021-01-30'),
(31, '', '', 'Mueble organizador 4 repisas', '2018-01-20', 1500.00, 1, 4, '2021-01-30', '2021-01-30'),
(32, '', '', 'Mueble organizador 4 repisas', '2018-01-20', 1500.00, 1, 4, '2021-01-30', '2021-01-30'),
(33, '', '', 'Mesa Mediana', '2018-01-20', 1000.00, 1, 4, '2021-01-30', '2021-01-30'),
(34, '', '', 'Mesa Grande Rectacgular', '2018-01-20', 1200.00, 1, 4, '2021-01-30', '2021-01-30'),
(35, '', '', 'Mesa pequena', '2018-01-20', 1000.00, 1, 4, '2021-01-30', '2021-01-30'),
(36, '', '', 'Escritorio de Maestra', '2018-01-20', 1800.00, 1, 4, '2021-01-30', '2021-01-30'),
(37, '', '', 'Mueble organizador 4 repisas', '2018-01-20', 1500.00, 1, 4, '2021-01-30', '2021-01-30'),
(38, '', '', 'Mesa Pequeña', '2018-01-20', 1000.00, 1, 4, '2021-01-30', '2021-01-30'),
(39, '', '', 'Mueble organizador 4 repisas', '2018-01-20', 1500.00, 1, 4, '2021-01-30', '2021-01-30'),
(40, '', '', 'Mesa Pequeña', '2018-01-20', 1000.00, 1, 4, '2021-01-30', '2021-01-30'),
(41, 'ESMA/9N3/Mantenimiento', '', 'Pulidora 7\' Truper', '2018-01-20', 3407.00, 1, 4, '2021-01-30', '2021-01-30'),
(42, '', '', 'Lijadora Orbitra Truper', '2018-01-20', 1341.00, 1, 4, '2021-01-30', '2021-01-30'),
(43, 'Tramontina/Alcance', '', 'Mini/Refrigeradora', '2018-01-20', 4575.00, 1, 4, '2021-01-30', '2021-01-30'),
(44, 'Matagalpa', '', 'Estante / Librero', '2018-01-20', 1500.00, 1, 4, '2021-01-30', '2021-01-30'),
(45, 'Canon / DS126621', '', 'Camara ', '2019-02-20', 13736.45, 1, 4, '2021-01-30', '2021-01-30'),
(46, 'Mantenimiento', '', 'Escalera comercial ', '2020-09-20', 3907.33, 1, 4, '2021-01-30', '2021-01-30'),
(47, 'Administracion/ alcance', '', '2sillas de oficina ', '2020-08-20', 5600.00, 1, 4, '2021-01-30', '2021-01-30'),
(48, 'Sankey/ Alcance', '', '4Abanicos ', '2020-08-20', 5600.00, 1, 4, '2021-01-30', '2021-01-30'),
(49, 'Economico/ Alcance', '', '4 Escritorio  de 1 gaveta', '2020-08-20', 6400.00, 1, 4, '2021-01-30', '2021-01-30'),
(50, '', '', 'Lavadora', '2020-12-20', 17249.94, 1, 4, '2021-01-30', '2021-01-30'),
(51, '', '', 'ESCRITORIO L ', '2012-06-01', 2000.00, 1, 4, '2021-01-30', '2021-01-30'),
(52, '', '', 'ESCRITORIO PEQUEÑO', '2012-06-01', 1000.00, 1, 4, '2021-01-30', '2021-01-30'),
(53, '', '', 'ESCRITORIO L ', '2012-06-01', 1000.00, 1, 4, '2021-01-30', '2021-01-30'),
(54, '', '', 'ESCRITORIO L ', '2013-01-01', 8445.05, 1, 4, '2021-01-30', '2021-01-30'),
(55, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(56, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(57, '', '', 'SILLA DE MADERA/COMEDOR DE VIDRIO', '2012-06-01', 300.00, 1, 4, '2021-01-30', '2021-01-30'),
(58, '', '', 'SILLA DE MADERA/COMEDOR DE VIDRIO', '2012-06-01', 300.00, 1, 4, '2021-01-30', '2021-01-30'),
(59, '', '', 'SILLA DE MADERA/COMEDOR DE VIDRIO', '2012-06-01', 300.00, 1, 4, '2021-01-30', '2021-01-30'),
(60, '', '', 'SILLA ERGONOMICA', '2012-06-01', 1500.00, 1, 4, '2021-01-30', '2021-01-30'),
(61, '', '', 'SILLAS MECEDORAS DE MADERA', '2012-06-01', 400.00, 1, 4, '2021-01-30', '2021-01-30'),
(62, 'VIRCO', '', 'SILLA ROJA', '2012-06-01', 400.00, 1, 4, '2021-01-30', '2021-01-30'),
(63, '', '', 'SOFA GRANDE', '2012-06-01', 3000.00, 1, 4, '2021-01-30', '2021-01-30'),
(64, '', '', 'ARCHIVERO  BLANCO', '2012-06-01', 700.00, 1, 4, '2021-01-30', '2021-01-30'),
(65, '', '', 'ESTANTE DE GABINETE DE 6 PUERTAS', '2012-06-01', 4000.00, 1, 4, '2021-01-30', '2021-01-30'),
(66, 'SPORTNEB EVO EXPRESS', '', 'NEBULIZADOR PINGUINO', '2013-01-01', 1850.82, 1, 4, '2021-01-30', '2021-01-30'),
(67, 'SUNRISE MEDICAL', '', 'NEBULIZADOR', '2013-01-01', 1850.82, 1, 4, '2021-01-30', '2021-01-30'),
(68, '', '', 'NEBULIZADOR FOCA', '2013-01-01', 1850.82, 1, 4, '2021-01-30', '2021-01-30'),
(69, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(70, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(71, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(72, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(73, '', '', 'SILLAS MECEDORAS DE MADERA', '2012-06-01', 400.00, 1, 4, '2021-01-30', '2021-01-30'),
(74, '', '', 'SILLAS MECEDORAS DE MADERA', '2012-06-01', 400.00, 1, 4, '2021-01-30', '2021-01-30'),
(75, '', '', 'SILLA DE MADERA/COMEDOR DE VIDRIO', '2012-06-01', 300.00, 1, 4, '2021-01-30', '2021-01-30'),
(76, '', '', 'MESAS BLANCAS DE PLASTICOS GRANDES', '2012-06-01', 1000.00, 1, 4, '2021-01-30', '2021-01-30'),
(77, '', '', 'MESAS BLANCAS DE PLASTICOS GRANDES', '2012-06-01', 1000.00, 1, 4, '2021-01-30', '2021-01-30'),
(78, 'BERNINA NOVA', '', 'MAQUINAS DE COSER', '2013-01-01', 2200.00, 1, 4, '2021-01-30', '2021-01-30'),
(79, 'BELAIR BANTAM', '', 'MAQUINAS DE COSER', '2013-01-01', 2200.00, 1, 4, '2021-01-30', '2021-01-30'),
(80, 'KENMORE', '', 'MAQUINAS DE COSER', '2013-01-01', 2200.00, 1, 4, '2021-01-30', '2021-01-30'),
(81, 'WHITE', '', 'MAQUINAS DE COSER', '2013-01-01', 2200.00, 1, 4, '2021-01-30', '2021-01-30'),
(82, 'BROTHER', '', 'MAQUINAS DE COSER', '2013-01-01', 2200.00, 1, 4, '2021-01-30', '2021-01-30'),
(83, 'BROTHER', '', 'MAQUINAS DE COSER', '2013-01-01', 2200.00, 1, 4, '2021-01-30', '2021-01-30'),
(84, 'ALCO', '', 'MAQUINAS DE COSER', '2013-01-01', 2200.00, 1, 4, '2021-01-30', '2021-01-30'),
(85, 'JANOME', '', 'MAQUINAS DE COSER', '2013-01-01', 2200.00, 1, 4, '2021-01-30', '2021-01-30'),
(86, 'JONOME', '', 'MAQUINAS DE COSER', '2013-01-01', 2200.00, 1, 4, '2021-01-30', '2021-01-30'),
(87, 'SINGER', '', 'MAQUINAS DE COSER', '2013-01-01', 2200.00, 1, 4, '2021-01-30', '2021-01-30'),
(88, 'GRACE ', '', 'MONTURA COMPLETA', '0000-00-00', 17033.25, 1, 4, '2021-01-30', '2021-01-30'),
(89, '', '', 'MONTURA INGLESA', '2012-06-01', 1200.00, 1, 4, '2021-01-30', '2021-01-30'),
(90, 'BROTHER', '', 'MAQUINAS DE COSER', '2013-01-01', 2200.00, 1, 4, '2021-01-30', '2021-01-30'),
(91, 'FRIGIDAIRE', '', 'REFRIGERADORA', '2012-06-01', 15000.00, 1, 4, '2021-01-30', '2021-01-30'),
(92, '', '', 'MUEBLE DE 12 COMPARTIMENTOS', '2012-06-01', 1200.00, 1, 4, '2021-01-30', '2021-01-30'),
(93, '', '', 'MESA DE MADERA', '2012-06-01', 1200.00, 1, 4, '2021-01-30', '2021-01-30'),
(94, 'SAMSUNG', '', 'MICROONDAS', '2012-06-01', 1500.00, 1, 4, '2021-01-30', '2021-01-30'),
(95, 'MABE', '', 'COCINA 5 QUEMADORES', '2012-06-01', 4000.00, 1, 4, '2021-01-30', '2021-01-30'),
(96, '', '', 'SILLA DE MADERA / COMEDOR DE VIDRIO', '2012-06-01', 300.00, 1, 4, '2021-01-30', '2021-01-30'),
(97, '', '', 'SILLA DE MADERA', '2012-06-01', 300.00, 1, 4, '2021-01-30', '2021-01-30'),
(98, 'Fundacion Carlos Slim', '', 'SILLA DE RUEDA', '2012-06-01', 2500.00, 1, 4, '2021-01-30', '2021-01-30'),
(99, 'Breezy', '', 'SILLA DE RUEDA', '2012-06-01', 2500.00, 1, 4, '2021-01-30', '2021-01-30'),
(100, 'Metro red', '', 'SILLA DE RUEDA', '2012-06-01', 2500.00, 1, 4, '2021-01-30', '2021-01-30'),
(101, 'Expectrum', '', 'SILLA DE RUEDA', '2012-06-01', 2500.00, 1, 4, '2021-01-30', '2021-01-30'),
(102, '', '', 'SILLA DE RUEDA', '2012-06-01', 2500.00, 1, 4, '2021-01-30', '2021-01-30'),
(103, '', '', 'SILLA DE RUEDA', '2012-06-01', 2500.00, 1, 4, '2021-01-30', '2021-01-30'),
(104, '', '', 'SILLA DE RUEDA', '2012-06-01', 2500.00, 1, 4, '2021-01-30', '2021-01-30'),
(105, '', '', 'SILLA DE RUEDA', '2012-06-01', 2500.00, 1, 4, '2021-01-30', '2021-01-30'),
(106, '', '', 'SILLA DE RUEDA', '2012-06-01', 2500.00, 1, 4, '2021-01-30', '2021-01-30'),
(107, 'invatare', '', 'SILLA DE RUEDA', '2012-06-01', 2500.00, 1, 4, '2021-01-30', '2021-01-30'),
(108, 'luke', '', 'SILLA DE RUEDA', '2012-06-01', 2500.00, 1, 4, '2021-01-30', '2021-01-30'),
(109, '', '', 'SILLA DE RUEDA', '2012-06-01', 2500.00, 1, 4, '2021-01-30', '2021-01-30'),
(110, 'medline', '', 'SILLA DE RUEDA', '2012-06-01', 2500.00, 1, 4, '2021-01-30', '2021-01-30'),
(111, 'invatare', '', 'SILLA DE RUEDA', '2013-01-01', 2500.00, 1, 4, '2021-01-30', '2021-01-30'),
(112, '', '', 'MUEBLE /19 CAJONES', '2012-06-01', 3000.00, 1, 4, '2021-01-30', '2021-01-30'),
(113, '', '', 'ESCRITORIO ROJO', '2012-06-01', 800.00, 1, 4, '2021-01-30', '2021-01-30'),
(114, '', '', 'ESTANTE', '2012-06-01', 2000.00, 1, 4, '2021-01-30', '2021-01-30'),
(115, '', '', 'ROPERO DE 3 PUERTAS DE MADERA', '2012-06-01', 1500.00, 1, 4, '2021-01-30', '2021-01-30'),
(116, '', '', 'MESA BLANCA DE MADERA', '2012-06-01', 300.00, 1, 4, '2021-01-30', '2021-01-30'),
(117, '', '', 'ESCRITORIO PEQUEÑO CAFE', '2012-06-01', 400.00, 1, 4, '2021-01-30', '2021-01-30'),
(118, '', '', 'ESCALERA', '2012-06-01', 2000.00, 1, 4, '2021-01-30', '2021-01-30'),
(119, '', '', 'VERTICALIZADOR DE HIERRO', '2013-01-01', 5862.53, 1, 4, '2021-01-30', '2021-01-30'),
(120, '', '', 'VERTICALIZADOR DE MADERA', '2013-01-01', 5862.53, 1, 4, '2021-01-30', '2021-01-30'),
(121, 'FRIGIDAIRE', '', 'LAVADORA', '2012-06-01', 5000.00, 1, 4, '2021-01-30', '2021-01-30'),
(122, '', '', 'COMEDOR NEGRO', '2012-06-01', 2000.00, 1, 4, '2021-01-30', '2021-01-30'),
(123, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(124, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(125, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(126, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(127, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(128, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(129, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(130, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(131, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(132, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(133, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(134, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(135, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(136, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(137, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(138, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(139, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(140, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(141, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(142, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(143, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(144, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(145, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(146, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(147, 'VIRCO', '', 'SILLA ROJA', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(148, 'VIRCO', '', 'SILLA ROJA', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(149, '', '', 'MESAS BLANCAS DE PLASTICOS GRANDES', '2012-06-01', 1000.00, 1, 4, '2021-01-30', '2021-01-30'),
(150, '', '', 'MESAS BLANCAS DE PLASTICOS GRANDES', '2012-06-01', 1000.00, 1, 4, '2021-01-30', '2021-01-30'),
(151, '', '', 'MESAS BLANCAS DE PLASTICOS GRANDES', '2012-06-01', 1000.00, 1, 4, '2021-01-30', '2021-01-30'),
(152, '', '', 'MESAS BLANCAS DE PLASTICOS GRANDES', '2012-06-01', 1000.00, 1, 4, '2021-01-30', '2021-01-30'),
(153, '', '', 'SILLAS MECEDORAS DE MADERA', '2012-06-01', 400.00, 1, 4, '2021-01-30', '2021-01-30'),
(154, '800', '', 'SILLAS MECEDORAS DE MADERA', '2013-01-01', 400.00, 1, 4, '2021-01-30', '2021-01-30'),
(155, '800', '', 'SILLAS MECEDORAS DE MADERA', '2013-01-01', 400.00, 1, 4, '2021-01-30', '2021-01-30'),
(156, '800', '', 'SILLAS MECEDORAS DE MADERA', '2013-01-01', 400.00, 1, 4, '2021-01-30', '2021-01-30'),
(157, '800', '', 'SILLAS MECEDORAS DE MADERA', '2013-01-01', 400.00, 1, 4, '2021-01-30', '2021-01-30'),
(158, '800', '', 'SILLAS MECEDORAS DE MADERA', '2013-01-01', 400.00, 1, 4, '2021-01-30', '2021-01-30'),
(159, '800', '', 'SILLAS MECEDORAS DE MADERA', '2013-01-01', 400.00, 1, 4, '2021-01-30', '2021-01-30'),
(160, '800', '', 'SILLAS MECEDORAS DE MADERA', '2013-01-01', 400.00, 1, 4, '2021-01-30', '2021-01-30'),
(161, '', '', 'ANDARIVEL DE 4 PUNTOS', '2012-06-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(162, '', '', 'ANDARIVEL DE 4 PUNTOS', '2012-06-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(163, 'EVON', '', 'NEBULIZADOR', '2013-01-01', 1850.82, 1, 4, '2021-01-30', '2021-01-30'),
(164, '', '', 'NEBULIZADOR', '2013-01-01', 1850.82, 1, 4, '2021-01-30', '2021-01-30'),
(165, 'wheelchaire', '', 'SILLA DE RUEDA', '2013-01-01', 2500.00, 1, 4, '2021-01-30', '2021-01-30'),
(166, '', '', 'SILLA DE RUEDA', '2013-01-01', 2500.00, 1, 4, '2021-01-30', '2021-01-30'),
(167, '', '', 'SILLA DE RUEDA', '2013-01-01', 2500.00, 1, 4, '2021-01-30', '2021-01-30'),
(168, 'wheelchair', '', 'SILLA DE RUEDA', '2013-01-01', 2500.00, 1, 4, '2021-01-30', '2021-01-30'),
(169, '', '', 'SILLA DE RUEDA', '2013-01-01', 2500.00, 1, 4, '2021-01-30', '2021-01-30'),
(170, '', '', 'SILLA DE RUEDA', '2013-01-01', 2500.00, 1, 4, '2021-01-30', '2021-01-30'),
(171, '', '', 'VERTICALIZADOR', '2013-01-01', 5862.53, 1, 4, '2021-01-30', '2021-01-30'),
(172, '', '', 'GRADAS GRANDE', '0000-00-00', 5004.50, 1, 4, '2021-01-30', '2021-01-30'),
(173, 'pixi', '', 'SILLA DE RUEDA', '2013-01-01', 2500.00, 1, 4, '2021-01-30', '2021-01-30'),
(174, 'wheelchair', '', 'SILLA DE RUEDA', '2013-01-01', 2500.00, 1, 4, '2021-01-30', '2021-01-30'),
(175, '', '', 'ANDARIVEL DE 4 PUNTOS', '2012-06-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(176, '', '', 'MESA SEMIREDONDA', '2012-06-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(177, '', '', 'SILLA ERGONOMICA', '2012-06-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(178, '', '', 'MUEBLE CON 16 GABETAS', '2012-06-01', 2500.00, 1, 4, '2021-01-30', '2021-01-30'),
(179, '', '', 'MESA GRANDE MADERA', '2013-01-01', 2200.00, 1, 4, '2021-01-30', '2021-01-30'),
(180, '', '', 'MESAS BLANCAS DE PLASTICOS GRANDES', '2012-06-01', 1000.00, 1, 4, '2021-01-30', '2021-01-30'),
(181, '', '', 'MESA SEMIREDONDA', '2012-06-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(182, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(183, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(184, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(185, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(186, '', '', 'MUEBLE GRANDE CON SEPARADORES', '2012-06-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(187, '', '', 'MUEBLE MEDIANO CON SEPARADORES', '2012-06-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(188, '', '', 'MUEBLE DE 10 COMPARTIMIENTOS', '2012-06-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(189, '', '', 'MESA SEMIREDONDA', '2013-01-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(190, '', '', 'SILLA ERGONOMICA', '2012-06-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(191, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(192, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(193, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(194, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(195, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(196, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(197, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(198, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(199, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(200, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(201, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(202, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(203, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(204, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(205, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(206, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(207, '', '', 'MESAS BLANCAS DE PLASTICOS GRANDES', '2012-06-01', 1000.00, 1, 4, '2021-01-30', '2021-01-30'),
(208, '', '', 'MESA SEMIREDONDA', '2012-06-01', 800.00, 1, 4, '2021-01-30', '2021-01-30'),
(209, '', '', 'ANDARIVEL DE 4 PUNTOS', '2012-06-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(210, '', '', 'ANDARIVEL DE 4 PUNTOS', '2012-06-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(211, '', '', 'ANDARIVEL DE 4 PUNTOS', '2012-06-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(212, '', '', 'ANDARIVEL DE 4 PUNTOS', '2012-06-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(213, '', '', 'ANDARIVEL DE 4 PUNTOS', '2012-06-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(214, '', '', 'ANDARIVEL DE 4 PUNTOS', '2012-06-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(215, '', '', 'ANDARIVEL DE 4 PUNTOS', '2012-06-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(216, '', '', 'ANDARIVEL DE 4 PUNTOS', '2012-06-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(217, '', '', 'ANDARIVEL CON ASIENTO', '2012-06-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(218, '', '', 'ANDARIVEL CON ASIENTO', '2012-06-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(219, 'wemzly', '', 'ANDARIVEL DE 4 PUNTOS', '2012-06-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(220, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(221, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(222, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(223, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(224, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(225, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(226, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(227, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(228, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(229, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(230, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(231, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(232, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(233, '', '', 'ANDARIVEL', '2012-06-01', 300.00, 1, 4, '2021-01-30', '2021-01-30'),
(234, 'Nova', '', 'ANDARIVEL TRICICLO', '2013-01-01', 600.00, 1, 4, '2021-01-30', '2021-01-30'),
(235, 'Nova', '', 'ANDARIVEL TRICICLO', '2013-01-01', 600.00, 1, 4, '2021-01-30', '2021-01-30'),
(236, '', '', 'PAR DE MULETA NINO', '2012-06-01', 300.00, 1, 4, '2021-01-30', '2021-01-30'),
(237, '', '', 'PAR DE MULETA NINO', '2012-06-01', 300.00, 1, 4, '2021-01-30', '2021-01-30'),
(238, '', '', 'PAR DE MULETA NINO', '2012-06-01', 300.00, 1, 4, '2021-01-30', '2021-01-30'),
(239, '', '', 'PAR DE MULETA NINO', '2012-06-01', 300.00, 1, 4, '2021-01-30', '2021-01-30'),
(240, '', '', 'PAR DE MULETA ADOLESCENTE', '2012-06-01', 300.00, 1, 4, '2021-01-30', '2021-01-30'),
(241, '', '', 'PAR DE MULETA ADOLESCENTE', '2012-06-01', 300.00, 1, 4, '2021-01-30', '2021-01-30'),
(242, '', '', 'PAR DE MULETA ADOLESCENTE', '2012-06-01', 300.00, 1, 4, '2021-01-30', '2021-01-30'),
(243, '', '', 'PAR DE BASTON', '2012-06-01', 300.00, 1, 4, '2021-01-30', '2021-01-30'),
(244, '', '', 'PAR DE BASTON', '2012-06-01', 300.00, 1, 4, '2021-01-30', '2021-01-30'),
(245, '', '', 'UN BASTON', '2012-06-01', 300.00, 1, 4, '2021-01-30', '2021-01-30'),
(246, '', '', 'COCHE PARA BEBE', '2013-01-01', 600.00, 1, 4, '2021-01-30', '2021-01-30'),
(247, '', '', 'COCHE PARA BEBE', '2013-01-01', 600.00, 1, 4, '2021-01-30', '2021-01-30'),
(248, '', '', 'ANDARIVEL', '2012-06-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(249, '', '', 'COCHE TRES RUEDAS', '2012-06-01', 1000.00, 1, 4, '2021-01-30', '2021-01-30'),
(250, '', '', 'VERTICALIZADOR', '2013-01-01', 5862.53, 1, 4, '2021-01-30', '2021-01-30'),
(251, '', '', 'MUEBLE DE 10 COMPARTIMIENTOS', '2012-06-01', 600.00, 1, 4, '2021-01-30', '2021-01-30'),
(252, '', '', 'MESAS BLANCAS DE PLASTICOS GRANDES', '2012-06-01', 1000.00, 1, 4, '2021-01-30', '2021-01-30'),
(253, '', '', 'MESAS BLANCAS DE PLASTICOS GRANDES', '2012-06-01', 1000.00, 1, 4, '2021-01-30', '2021-01-30'),
(254, '', '', 'SILLA DE CARRO', '2013-01-01', 600.00, 1, 4, '2021-01-30', '2021-01-30'),
(255, '', '', 'SILLA DE CARRO', '2013-01-01', 600.00, 1, 4, '2021-01-30', '2021-01-30'),
(256, '', '', 'SILLA DE CARRO', '2013-01-01', 600.00, 1, 4, '2021-01-30', '2021-01-30'),
(257, '', '', 'SILLA DE CARRO', '2013-01-01', 600.00, 1, 4, '2021-01-30', '2021-01-30'),
(258, '', '', 'SILLA DE CARRO', '2013-01-01', 600.00, 1, 4, '2021-01-30', '2021-01-30'),
(259, '', '', 'SILLA DE CARRO', '2013-01-01', 600.00, 1, 4, '2021-01-30', '2021-01-30'),
(260, '', '', 'SILLA DE CARRO', '2013-01-01', 600.00, 1, 4, '2021-01-30', '2021-01-30'),
(261, '', '', 'SILLA DE CARRO', '2013-01-01', 600.00, 1, 4, '2021-01-30', '2021-01-30'),
(262, '', '', 'SILLA DE CARRO', '2013-01-01', 600.00, 1, 4, '2021-01-30', '2021-01-30'),
(263, '', '', 'SILLA DE CARRO', '2013-01-01', 600.00, 1, 4, '2021-01-30', '2021-01-30'),
(264, '', '', 'SILLA DE CARRO', '2013-01-01', 600.00, 1, 4, '2021-01-30', '2021-01-30'),
(265, '', '', 'RIN DE MADERA', '2012-06-01', 800.00, 1, 4, '2021-01-30', '2021-01-30'),
(266, '', '', 'PAINT ZOOM', '2012-06-01', 2000.00, 1, 4, '2021-01-30', '2021-01-30'),
(267, 'cruuser', '', 'SILLA DE RUEDA', '2012-06-01', 1000.00, 1, 4, '2021-01-30', '2021-01-30'),
(268, 'janaya', '', 'SILLA DE RUEDA', '2012-06-01', 1000.00, 1, 4, '2021-01-30', '2021-01-30'),
(269, '', '', 'SILLA DE RUEDA', '2012-06-01', 1000.00, 1, 4, '2021-01-30', '2021-01-30'),
(270, 'cause for hope', '', 'SILLA DE RUEDA', '2012-06-01', 1000.00, 1, 4, '2021-01-30', '2021-01-30'),
(271, 'mason', '', 'SILLA DE RUEDA', '2012-06-01', 1000.00, 1, 4, '2021-01-30', '2021-01-30'),
(272, '', '', 'SILLA DE RUEDA', '2012-06-01', 1000.00, 1, 4, '2021-01-30', '2021-01-30'),
(273, '', '', 'SILLA ERGONOMICA', '2012-06-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(274, '', '', 'ANDARIVEL', '2012-06-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(275, '', '', 'ANDARIVEL', '2012-06-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(276, 'Nova', '', 'ANDARIVEL TRICICLO', '2012-06-01', 1500.00, 1, 4, '2021-01-30', '2021-01-30'),
(277, 'Nova', '', 'ANDARIVEL TRICICLO', '2013-01-01', 600.00, 1, 4, '2021-01-30', '2021-01-30'),
(278, '', '', 'ANDARIVEL', '2012-06-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(279, 'SCHUCO/INC.', '', 'COMPRESOR DE AIRE', '2012-06-01', 2000.00, 1, 4, '2021-01-30', '2021-01-30'),
(280, 'TRUPER PROFESIONAL', '', 'TALADRO', '2012-06-01', 800.00, 1, 4, '2021-01-30', '2021-01-30'),
(281, 'QUICK/GRIP', '', 'PRENSA MAUAL', '2012-06-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(282, 'WOLFCRAFT', '', 'PRENSA MANUAL', '2012-06-01', 500.00, 1, 4, '2021-01-30', '2021-01-30'),
(283, 'BEST vALUE', '', 'CORTADORA DE AZULEJOS ', '2012-06-01', 300.00, 1, 4, '2021-01-30', '2021-01-30'),
(284, '', '', 'ANDARIVEL', '0000-00-00', 3000.00, 1, 4, '2021-01-30', '2021-01-30'),
(285, '', '', 'SILLA DE RUEDA', '0000-00-00', 2500.00, 1, 4, '2021-01-30', '2021-01-30'),
(286, '', '', 'SILLA DE RUEDA', '0000-00-00', 2500.00, 1, 4, '2021-01-30', '2021-01-30'),
(287, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(288, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(289, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(290, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(291, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(292, '', '', 'SILLAS BLANCAS DE PLASTICOS ', '2012-06-01', 200.00, 1, 4, '2021-01-30', '2021-01-30'),
(293, '', '', 'SILLA DE MADERA/COMEDOR DE VIDRIO', '2012-06-01', 300.00, 1, 4, '2021-01-30', '2021-01-30'),
(294, '', '', 'ESCALERA DE ALUMINIO GRANDE', '2012-06-01', 3000.00, 1, 4, '2021-01-30', '2021-01-30'),
(295, '', '', 'CARRETILLA', '2012-06-01', 400.00, 1, 4, '2021-01-30', '2021-01-30'),
(296, '', '', 'ESCRITORIO DE MADERA DE 3 GABETA', '2012-06-01', 400.00, 1, 4, '2021-01-30', '2021-01-30'),
(297, '', '', 'RAMPA METALICA', '2012-06-01', 8000.00, 1, 4, '2021-01-30', '2021-01-30'),
(298, '', '', 'MONTURA  ', '2012-06-01', 1200.00, 1, 4, '2021-01-30', '2021-01-30'),
(299, '', '', 'MUEBLE DE MATERIALES', '2012-06-01', 3000.00, 1, 4, '2021-01-30', '2021-01-30'),
(300, '', '', 'ESTANTES DE REJAS METALICOS', '2012-06-01', 400.00, 1, 4, '2021-01-30', '2021-01-30'),
(301, 'TRUPER', '', 'BOMBA DE AGUA / ELECTRICA', '2014-04-06', 3714.49, 1, 4, '2021-01-30', '2021-01-30'),
(302, 'MILWAUKEE', '', 'SIERRA CIRCULAR 7/1/4 15A 120 MILWAUKE', '2014-01-07', 4980.64, 1, 4, '2021-01-30', '2021-01-30'),
(303, 'POULAN PRO', '', 'CORTAGRAMA GAS 4.50HP 20\' P0450N20S', '2014-01-07', 6037.20, 1, 4, '2021-01-30', '2021-01-30'),
(304, '', '', 'ANDARIVEL', '2014-01-07', 4879.65, 1, 4, '2021-01-30', '2021-01-30'),
(305, '', '', 'ANDARIVEL', '2014-01-07', 4879.65, 1, 4, '2021-01-30', '2021-01-30'),
(306, 'RIFTON', '', 'VERTICALIZADOR/PLASTICO', '2014-01-07', 7916.46, 1, 4, '2021-01-30', '2021-01-30'),
(307, '', '', 'PAR DE MULETA', '2015-11-17', 889.46, 1, 4, '2021-01-30', '2021-01-30'),
(308, '', '', 'PAR DE MULETA', '2015-11-17', 889.46, 1, 4, '2021-01-30', '2021-01-30'),
(309, '', '', 'PAR DE MULETA', '2015-11-17', 889.46, 1, 4, '2021-01-30', '2021-01-30'),
(310, '', '', 'PAR DE MULETA', '2015-11-17', 889.46, 1, 4, '2021-01-30', '2021-01-30'),
(311, 'HANDI WORKS', '', 'ESCALERA DE ALUMINIO PEQUEÑA', '2016-01-18', 499.90, 1, 4, '2021-01-30', '2021-01-30'),
(312, '', '', 'PAR DE MULETA ADOLESCENTE', '2012-06-01', 300.00, 1, 4, '2021-01-30', '2021-01-30'),
(313, '', '', 'PAR DE MULETA ADOLESCENTE', '2012-06-01', 300.00, 1, 4, '2021-01-30', '2021-01-30'),
(314, '', '', 'UNA MULETA', '2012-06-01', 300.00, 1, 4, '2021-01-30', '2021-01-30'),
(315, '', '', 'BATERIA 3 - EVALUACIONES', '2015-03-20', 95943.73, 1, 7, '2021-01-31', '2021-01-31'),
(316, 'KENMORE', '', 'REFRIGERADORA', '2016-12-20', 8204.75, 1, 7, '2021-01-31', '2021-01-31'),
(317, 'Liftware Level Carrying Case', '', 'cuchara adaptada', '2017-02-20', 5752.81, 1, 7, '2021-01-31', '2021-01-31'),
(318, 'Liftware Level Carrying Case', '', 'cuchara adaptada', '2017-02-20', 5752.81, 1, 7, '2021-01-31', '2021-01-31'),
(319, '', '', '1 Casco, 1 Cinturon y un chaleco', '2017-02-20', 12310.72, 1, 7, '2021-01-31', '2021-01-31'),
(320, 'TRUPER', '', 'CALADORA/CIERRA', '2017-11-20', 1757.18, 1, 7, '2021-01-31', '2021-01-31'),
(321, 'STDH', '', 'TALADRO - ROTAMARTILLO 1/2 800W', '2017-11-20', 2667.80, 1, 7, '2021-01-31', '2021-01-31'),
(322, 'TRUPER', '', 'ESMERIL DE BANCO', '2017-11-20', 1498.58, 1, 7, '2021-01-31', '2021-01-31'),
(323, 'Oaster', '', 'Microodas', '2018-02-20', 3090.00, 1, 7, '2021-01-31', '2021-01-31'),
(324, 'Truper Profecional Roti -18AZ', '', 'Rotamartillo Inalambrico/ Taladro', '2018-03-20', 2938.02, 1, 7, '2021-01-31', '2021-01-31'),
(325, 'Truper', '', 'Compresor lubricado y manguera', '2018-03-20', 5642.07, 1, 7, '2021-01-31', '2021-01-31'),
(326, 'Atlas', '', 'cocina', '2018-03-20', 9581.79, 1, 7, '2021-01-31', '2021-01-31'),
(327, 'Craftsman', '', 'Motosierra', '2018-11-20', 6273.53, 1, 7, '2021-01-31', '2021-01-31'),
(328, 'Mr7j2ll/A/', '', 'Ipad', '2019-02-20', 13635.87, 1, 7, '2021-01-31', '2021-01-31'),
(329, '', '', 'Corta Cesped', '2019-02-20', 7499.95, 1, 7, '2021-01-31', '2021-01-31'),
(330, '', '', 'OTOSCOPIO', '2015-08-07', 1778.88, 1, 7, '2021-01-31', '2021-01-31'),
(331, '', '', 'OTOSCOPIO', '2015-08-07', 1778.88, 1, 7, '2021-01-31', '2021-01-31');

-- --------------------------------------------------------

--
-- Table structure for table `catequipocomputo`
--

CREATE TABLE `catequipocomputo` (
  `catEquipoCompId` int(11) NOT NULL,
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
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catequipocomputo`
--

INSERT INTO `catequipocomputo` (`catEquipoCompId`, `catEquipoModelo`, `catEquipoNumeroSerie`, `catEquipoMarca`, `catEquipoTamanioAlmacenamiento`, `TipoMemoriaRAM`, `catEquipoCantidadRAM`, `catEquipoTipoSO`, `catEquipoFechaCompra`, `catEquipoCostoEquipo`, `CatEquipoEstado`, `idActivofijo`, `updated_at`, `created_at`) VALUES
(1, 'Swam/Equino', '', 'SWANN', '', '', '', 'SWANN', '2018-01-20', 9999.00, 1, 3, '2021-01-31', '2021-01-31'),
(2, '15r210dx', 'CND5197FR8Laptop', 'HP', '671 GB', 'DDR4', '6 GB', 'windows10', '2018-01-20', 13500.00, 1, 3, '2021-02-02', '2021-01-31'),
(3, '316SN6W', '', '', '', '', '', '', '2018-01-20', 13500.00, 1, 3, '2021-01-31', '2021-01-31'),
(4, 'RTL8723BRNF', '', '', '', '', '', '', '2018-02-20', 12648.80, 1, 3, '2021-01-31', '2021-01-31'),
(5, 'ZF802512Voo15A', '', '', '', '', '', '', '2018-09-20', 12823.20, 1, 3, '2021-01-31', '2021-01-31'),
(6, 'BENQ', '17088111', 'BENQ', NULL, NULL, NULL, NULL, '2019-06-20', 17399.99, 1, 3, '2021-02-02', '2021-01-31'),
(7, 'ASUS', 'J8NOCX05', 'ASUS', '', '', '', 'windows 10', '2019-06-20', 27860.80, 1, 3, '2021-01-31', '2021-01-31'),
(8, 'Kingston', NULL, 'KINGSTON', '16 GB', NULL, NULL, NULL, '2019-06-20', 1892.86, 1, 3, '2021-02-02', '2021-01-31'),
(9, 'MFFZDA', 'WX71E1924YLW', '', '', '', '', '', '2019-08-20', 2130.57, 1, 3, '2021-01-31', '2021-01-31'),
(10, 'E6440 NotebookPC', 'MSIP-CMM-E2K-P386001', '', '', '', '', '', '2019-09-20', 14698.00, 1, 3, '2021-01-31', '2021-01-31'),
(11, '', '', '', '', '', '', '', '2019-07-20', 12541.50, 1, 3, '2021-01-31', '2021-01-31'),
(12, 'INSPIRON', 'H6N9N63', 'DELL', '120 GB', 'DDR4', '4 GB', 'windows10', '2020-11-20', 1998.39, 1, 3, '2021-02-02', '2021-01-31'),
(13, 'INSPIRON', '4YY9N63', 'DELL', '120 GB', 'DDR4', '4 GB', 'windows10', '2020-11-20', 19980.40, 1, 3, '2021-02-02', '2021-01-31'),
(14, 'INSPIRON', 'DD8BN63', 'DELL', '120 GB', 'DDR4', '4 GB', 'windows10', '2020-11-20', 19980.40, 1, 3, '2021-02-02', '2021-01-31'),
(15, 'INSPIRON', '8TSGN63', 'DELL', '120 GB', 'DDR4', '4 GB', 'windows10', '2020-11-20', 19980.40, 1, 3, '2021-02-02', '2021-01-31'),
(16, 'INSPIRON', '6DNKN63', 'DELL', '120 GB', 'DDR4', '4 GB', 'windows10', '2020-11-20', 19980.40, 1, 3, '2021-02-02', '2021-01-31'),
(17, 'INSPIRON', '3WSGN63', 'DELL', '120 GB', 'DDR4', '4 GB', 'windows10', '2020-11-20', 19980.40, 1, 3, '2021-02-02', '2021-01-31'),
(18, 'INSPIRON', 'JYSGN63', 'DELL', '120 GB', 'DDR4', '4 GB', 'windows10', '2020-11-20', 19980.40, 1, 3, '2021-02-02', '2021-01-31'),
(19, 'INSPIRON', '6H7KN63', 'DELL', 'DELL', 'DDR4', '4 GB', 'windows10', '2020-11-20', 19980.40, 1, 3, '2021-02-02', '2021-01-31'),
(20, 'Ideapad3', 'JVHFC1', 'LENOVO', '1 TB', 'DDR4', '4 GB', 'windows10', '2020-11-20', 23393.90, 1, 3, '2021-02-02', '2021-01-31'),
(21, 'SAMSUNG', 'HYUE91HC901417E', 'SAMSUNG', '', '', '', '', '2013-01-01', 13881.10, 1, 3, '2021-01-31', '2021-01-31'),
(22, 'ACER', 'NUSH7AA004305227D01601', 'ACER', '', '', '', '', '2013-08-02', 4940.29, 1, 3, '2021-01-31', '2021-01-31'),
(23, 'FELLOW', 'CRC 57277', 'FELLOW', '', '', '', '', '2013-01-01', 2685.16, 1, 3, '2021-01-31', '2021-01-31'),
(24, 'SCOTCH', '102306', 'SCOTCH', '', '', '', '', '2012-06-01', 800.00, 1, 3, '2021-01-31', '2021-01-31'),
(25, 'CASIO', 'V032CBAF11-164582', 'CASIO', '', '', '', '', '2013-01-01', 20509.20, 1, 3, '2021-01-31', '2021-01-31'),
(26, 'SONY HANDYCAM', '', 'SONY', '', '', '', '', '2013-10-08', 5711.15, 1, 3, '2021-01-31', '2021-01-31'),
(27, 'apple', 'F5XK86R5DFHW', 'apple', '', '', '', 'IOS 9.5', '2013-08-02', 9905.41, 1, 3, '2021-01-31', '2021-01-31'),
(28, 'TELSTAR', '', 'TESTLAR', '', '', '', '', '2012-06-01', 2500.00, 1, 3, '2021-01-31', '2021-01-31'),
(29, 'apple', 'DYTJVM2TDFHW', 'apple', '', '', '', 'IOS 9.5', '2013-08-02', 9905.41, 1, 3, '2021-01-31', '2021-01-31'),
(30, '', '', '', '', '', '', '', '2012-06-01', 1000.00, 1, 3, '2021-01-31', '2021-01-31'),
(31, '', '', '', '', '', '', '', '2012-06-01', 500.00, 1, 3, '2021-01-31', '2021-01-31'),
(32, '', '', '', '', '', '', '', '2012-06-01', 1500.00, 1, 3, '2021-01-31', '2021-01-31'),
(33, 'DYNAVOX', '175661', 'DYNAVOX', '', '', '', '', '2012-06-01', 20000.00, 1, 3, '2021-01-31', '2021-01-31'),
(34, 'apple', 'DYTKWP0WDFHW', 'apple', '', '', '', 'IOS 9.5', '2014-01-13', 10116.80, 1, 3, '2021-01-31', '2021-01-31'),
(35, 'apple', 'F5RLMBL3DKPH', 'apple', '', '', '', 'IOS 9.5', '2014-01-13', 10116.80, 1, 3, '2021-01-31', '2021-01-31'),
(36, '', '', '', '', '', '', '', '2012-06-01', 8000.00, 1, 3, '2021-01-31', '2021-01-31'),
(37, 'HP', '3CR337024W', 'HP', '', '', '', '', '2014-03-01', 14250.30, 1, 3, '2021-01-31', '2021-01-31'),
(38, 'HP', '3CR337028K', 'HP', '', '', '', '', '2014-03-01', 14250.30, 1, 3, '2021-01-31', '2021-01-31'),
(39, 'DELL', '', 'DELL', '', '', '', '', '2014-04-01', 10265.00, 1, 3, '2021-01-31', '2021-01-31'),
(40, 'DELL', '', 'DELL', '', '', '', '', '2014-04-01', 8981.84, 1, 3, '2021-01-31', '2021-01-31'),
(41, 'ASUS', 'E2N0CX619075095', 'ASUS', '', '', '', '', '2014-06-01', 11267.50, 1, 3, '2021-01-31', '2021-01-31'),
(42, 'LOREX', '', 'LOREX', '', '', '', 'LOREX', '2014-07-01', 9198.85, 1, 3, '2021-01-31', '2021-01-31'),
(43, 'CANON', '', 'CANON', '', '', '', '', '2014-09-18', 17205.60, 1, 3, '2021-01-31', '2021-01-31'),
(44, 'CANON', '892063007477', 'CANON', '', '', '', '', '2015-02-17', 4993.75, 1, 3, '2021-01-31', '2021-01-31'),
(45, 'SWANN', '28054041140437', 'SWANN', '', '', '', 'SWANN', '2015-07-01', 11999.00, 1, 3, '2021-01-31', '2021-01-31');

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
  `catImpresorasMarca` text DEFAULT NULL,
  `catImpresoraModelo` text DEFAULT NULL,
  `catImpresoraTipoToner` text DEFAULT NULL,
  `catImpresoraDescripcion` text DEFAULT NULL,
  `catImpresoraFechaIngreso` date DEFAULT NULL,
  `catImpresoraCosto` float(11,2) DEFAULT NULL,
  `CatImpresoraEstado` int(11) NOT NULL,
  `idActivofijo` int(11) NOT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catimpresoras`
--

INSERT INTO `catimpresoras` (`catImpresorasId`, `catImpresorasMarca`, `catImpresoraModelo`, `catImpresoraTipoToner`, `catImpresoraDescripcion`, `catImpresoraFechaIngreso`, `catImpresoraCosto`, `CatImpresoraEstado`, `idActivofijo`, `updated_at`, `created_at`) VALUES
(1, 'Epson', 'L5190', '', 'X5NQ015151', '2019-11-20', 10175.70, 1, 3, '2021-01-31', '2021-01-31'),
(2, 'Laser canon image class', 'D1620', '', '2SN14907', '2020-12-20', 21150.00, 1, 3, '2021-01-31', '2021-01-31');

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
