-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2020 at 10:52 PM
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
-- Database: `bdsistemacontable`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPgenerarReporteFecha` (`fecha` DATE)  BEGIN
SELECT  `bdsistemacontable`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `CATEGORIA`,
        `bdsistemacontable`.`catelectrodomesticos`.`CatElectDescripcion` AS `DETALLE_ACTIVO`,
        `bdsistemacontable`.`catelectrodomesticos`.`CatElectFechaIngreso` AS `FECHA_RECIBIDA`,
        `bdsistemacontable`.`catelectrodomesticos`.`CatElectCosto` AS `COSTO`,
        `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `VIDA_UTIL`,
        `calculoMes`(
            fecha,
            `bdsistemacontable`.`catelectrodomesticos`.`CatElectFechaIngreso`
        ) AS `MESES`,
        `depreciacionMensual`(
            `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
            `bdsistemacontable`.`catelectrodomesticos`.`CatElectCosto`
        ) AS `depreciacionMensual`,
        `depreciacionAcumulativa`(
            `calculoMes`(
                fecha,
                `bdsistemacontable`.`catelectrodomesticos`.`CatElectFechaIngreso`
            ),
            `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
            `depreciacionMensual`(
                `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                `bdsistemacontable`.`catelectrodomesticos`.`CatElectCosto`
            )
        ) AS `depreciacionAcumulada`,
        `saldoEnLibro`(
            `bdsistemacontable`.`catelectrodomesticos`.`CatElectCosto`,
            `depreciacionAcumulativa`(
                `calculoMes`(
                    fecha,
                    `bdsistemacontable`.`catelectrodomesticos`.`CatElectFechaIngreso`
                ),
                `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                `depreciacionMensual`(
                    `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                    `bdsistemacontable`.`catelectrodomesticos`.`CatElectCosto`
                )
            )
        ) AS `saldoEnLibro`
    FROM
        (
            `bdsistemacontable`.`catelectrodomesticos`
        JOIN `bdsistemacontable`.`cattipocuentaactivofijo`
        )
    WHERE
        (`bdsistemacontable`.`catelectrodomesticos`.`idActivofijo` = `bdsistemacontable`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontable`.`catelectrodomesticos`.`CatElectEstado` <> 2)
    UNION ALL
SELECT
    `bdsistemacontable`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,
    `bdsistemacontable`.`catequipocomputo`.`catEquipoMarca` AS `CatEquipoMarca`,
    `bdsistemacontable`.`catequipocomputo`.`catEquipoFechaCompra` AS `CatequipoFechaCompra`,
    `bdsistemacontable`.`catequipocomputo`.`catEquipoCostoEquipo` AS `catEquipoCostoEquipo`,
    `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,
    `calculoMes`(
        fecha,
        `bdsistemacontable`.`catequipocomputo`.`catEquipoFechaCompra`
    ) AS `MESES`,
    `depreciacionMensual`(
        `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
        `bdsistemacontable`.`catequipocomputo`.`catEquipoCostoEquipo`
    ) AS `depreciacionMensual`,
    `depreciacionAcumulativa`(
        `calculoMes`(
            fecha,
            `bdsistemacontable`.`catequipocomputo`.`catEquipoFechaCompra`
        ),
        `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
        `depreciacionMensual`(
            `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
            `bdsistemacontable`.`catequipocomputo`.`catEquipoCostoEquipo`
        )
    ) AS `depreciacionAcumulada`,
    `saldoEnLibro`(
        `bdsistemacontable`.`catequipocomputo`.`catEquipoCostoEquipo`,
        `depreciacionAcumulativa`(
            `calculoMes`(
                fecha,
                `bdsistemacontable`.`catequipocomputo`.`catEquipoFechaCompra`
            ),
            `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
            `depreciacionMensual`(
                `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                `bdsistemacontable`.`catequipocomputo`.`catEquipoCostoEquipo`
            )
        )
    ) AS `saldoEnLibro`
FROM
    (
        `bdsistemacontable`.`catequipocomputo`
    JOIN `bdsistemacontable`.`cattipocuentaactivofijo`
    )
WHERE
    (`bdsistemacontable`.`catequipocomputo`.`idActivofijo` = `bdsistemacontable`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontable`.`catequipocomputo`.`CatEquipoEstado` <> 2)
UNION ALL
SELECT
    `bdsistemacontable`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,
    `bdsistemacontable`.`catimpresoras`.`catImpresorasMarca` AS `catImpresorasMarca`,
    `bdsistemacontable`.`catimpresoras`.`catImpresoraFechaIngreso` AS `catImpresoraFechaIngreso`,
    `bdsistemacontable`.`catimpresoras`.`catImpresoraCosto` AS `catimpresoraCosto`,
    `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,
    `calculoMes`(
        fecha,
        `bdsistemacontable`.`catimpresoras`.`catImpresoraFechaIngreso`
    ) AS `MESES`,
    `depreciacionMensual`(
        `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
        `bdsistemacontable`.`catimpresoras`.`catImpresoraCosto`
    ) AS `depreciacionMensual`,
    `depreciacionAcumulativa`(
        `calculoMes`(
            fecha,
            `bdsistemacontable`.`catimpresoras`.`catImpresoraFechaIngreso`
        ),
        `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
        `depreciacionMensual`(
            `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
            `bdsistemacontable`.`catimpresoras`.`catImpresoraCosto`
        )
    ) AS `depreciacionAcumulada`,
    `saldoEnLibro`(
        `bdsistemacontable`.`catimpresoras`.`catImpresoraCosto`,
        `depreciacionAcumulativa`(
            `calculoMes`(
                fecha,
                `bdsistemacontable`.`catimpresoras`.`catImpresoraFechaIngreso`
            ),
            `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
            `depreciacionMensual`(
                `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                `bdsistemacontable`.`catimpresoras`.`catImpresoraCosto`
            )
        )
    ) AS `saldoEnLibro`
FROM
    (
        `bdsistemacontable`.`catimpresoras`
    JOIN `bdsistemacontable`.`cattipocuentaactivofijo`
    )
WHERE
    (`bdsistemacontable`.`catimpresoras`.`idActivofijo` = `bdsistemacontable`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontable`.`catimpresoras`.`CatImpresoraEstado` <> 2)
UNION ALL
SELECT
    `bdsistemacontable`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,
    `bdsistemacontable`.`catvehiculo`.`catVehiculoModelo` AS `catvehiculoModelo`,
    `bdsistemacontable`.`catvehiculo`.`catVehiculoFechaCompra` AS `catvehiculoFechaCompra`,
    `bdsistemacontable`.`catvehiculo`.`catVehiculoCosto` AS `catVehiculoCosto`,
    `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,
    `calculoMes`(
        fecha,
        `bdsistemacontable`.`catvehiculo`.`catVehiculoFechaCompra`
    ) AS `MESES`,
    `depreciacionMensual`(
        `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
        `bdsistemacontable`.`catvehiculo`.`catVehiculoCosto`
    ) AS `depreciacionMensual`,
    `depreciacionAcumulativa`(
        `calculoMes`(
            fecha,
            `bdsistemacontable`.`catvehiculo`.`catVehiculoFechaCompra`
        ),
        `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
        `depreciacionMensual`(
            `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
            `bdsistemacontable`.`catvehiculo`.`catVehiculoCosto`
        )
    ) AS `depreciacionAcumulada`,
    `saldoEnLibro`(
        `bdsistemacontable`.`catvehiculo`.`catVehiculoCosto`,
        `depreciacionAcumulativa`(
            `calculoMes`(
                fecha,
                `bdsistemacontable`.`catvehiculo`.`catVehiculoFechaCompra`
            ),
            `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
            `depreciacionMensual`(
                `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                `bdsistemacontable`.`catvehiculo`.`catVehiculoCosto`
            )
        )
    ) AS `saldoEnLibro`
FROM
    (
        `bdsistemacontable`.`catvehiculo`
    JOIN `bdsistemacontable`.`cattipocuentaactivofijo`
    )
WHERE
    (`bdsistemacontable`.`catvehiculo`.`idActivofijo` = `bdsistemacontable`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontable`.`catvehiculo`.`catVehiculoEstado` <> 2)
UNION ALL
SELECT
    `bdsistemacontable`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,
    `bdsistemacontable`.`catterreno`.`catTerrenoPropietario` AS `catTerrenoPropietario`,
    `bdsistemacontable`.`catterreno`.`catTerrenoFechaCompra` AS `catterrenoFechaCompra`,
    `bdsistemacontable`.`catterreno`.`catterrenoCosto` AS `catterrenoCosto`,
    `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,
    `calculoMes`(
        fecha,
        `bdsistemacontable`.`catterreno`.`catTerrenoFechaCompra`
    ) AS `MESES`,
    `depreciacionMensual`(
        `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
        `bdsistemacontable`.`catterreno`.`catterrenoCosto`
    ) AS `depreciacionMensual`,
    `depreciacionAcumulativa`(
        `calculoMes`(
            fecha,
            `bdsistemacontable`.`catterreno`.`catTerrenoFechaCompra`
        ),
        `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
        `depreciacionMensual`(
            `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
            `bdsistemacontable`.`catterreno`.`catterrenoCosto`
        )
    ) AS `depreciacionAcumulada`,
    `saldoEnLibro`(
        `bdsistemacontable`.`catterreno`.`catterrenoCosto`,
        `depreciacionAcumulativa`(
            `calculoMes`(
                fecha,
                `bdsistemacontable`.`catterreno`.`catTerrenoFechaCompra`
            ),
            `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
            `depreciacionMensual`(
                `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                `bdsistemacontable`.`catterreno`.`catterrenoCosto`
            )
        )
    ) AS `saldoEnLibro`
FROM
    (
        `bdsistemacontable`.`catterreno`
    JOIN `bdsistemacontable`.`cattipocuentaactivofijo`
    )
WHERE
    (`bdsistemacontable`.`catterreno`.`idActivofijo` = `bdsistemacontable`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontable`.`catterreno`.`CatTerrenoEstado` <> 2) ;
END$$

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
        `bdsistemacontable`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `CATEGORIA`,
        `bdsistemacontable`.`catelectrodomesticos`.`CatElectDescripcion` AS `DETALLE_ACTIVO`,
        `bdsistemacontable`.`catelectrodomesticos`.`CatElectFechaIngreso` AS `FECHA_RECIBIDA`,
        `bdsistemacontable`.`catelectrodomesticos`.`CatElectCosto` AS `COSTO`,
        `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `VIDA_UTIL`,
        `calculoMes`(
            fecha, `bdsistemacontable`.`catelectrodomesticos`.`CatElectFechaIngreso`) AS `MESES`,
            `depreciacionMensual`(
                `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                `bdsistemacontable`.`catelectrodomesticos`.`CatElectCosto`
            ) AS `depreciacionMensual`,
            `depreciacionAcumulativa`(
                `calculoMes`(
                    fecha, `bdsistemacontable`.`catelectrodomesticos`.`CatElectFechaIngreso`),
                    `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                    `depreciacionMensual`(
                        `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                        `bdsistemacontable`.`catelectrodomesticos`.`CatElectCosto`
                    )
                ) AS `depreciacionAcumulada`,
                `saldoEnLibro`(
                    `bdsistemacontable`.`catelectrodomesticos`.`CatElectCosto`,
                    `depreciacionAcumulativa`(
                        `calculoMes`(
                            fecha, `bdsistemacontable`.`catelectrodomesticos`.`CatElectFechaIngreso`),
                            `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                            `depreciacionMensual`(
                                `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                `bdsistemacontable`.`catelectrodomesticos`.`CatElectCosto`
                            )
                        )
                    ) AS `saldoEnLibro`
                FROM
                    (
                        `bdsistemacontable`.`catelectrodomesticos`
                    JOIN `bdsistemacontable`.`cattipocuentaactivofijo`
                    )
                WHERE
                    `bdsistemacontable`.`catelectrodomesticos`.`idActivofijo` = `bdsistemacontable`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontable`.`catelectrodomesticos`.`CatElectEstado` <> 2
                UNION ALL
            SELECT
                `bdsistemacontable`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,
                `bdsistemacontable`.`catequipocomputo`.`catEquipoMarca` AS `CatEquipoMarca`,
                `bdsistemacontable`.`catequipocomputo`.`catEquipoFechaCompra` AS `CatequipoFechaCompra`,
                `bdsistemacontable`.`catequipocomputo`.`catEquipoCostoEquipo` AS `catEquipoCostoEquipo`,
                `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,
                `calculoMes`(
                    fecha, `bdsistemacontable`.`catequipocomputo`.`catEquipoFechaCompra`) AS `MESES`,
                    `depreciacionMensual`(
                        `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                        `bdsistemacontable`.`catequipocomputo`.`catEquipoCostoEquipo`
                    ) AS `depreciacionMensual`,
                    `depreciacionAcumulativa`(
                        `calculoMes`(
                            fecha, `bdsistemacontable`.`catequipocomputo`.`catEquipoFechaCompra`),
                            `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                            `depreciacionMensual`(
                                `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                `bdsistemacontable`.`catequipocomputo`.`catEquipoCostoEquipo`
                            )
                        ) AS `depreciacionAcumulada`,
                        `saldoEnLibro`(
                            `bdsistemacontable`.`catequipocomputo`.`catEquipoCostoEquipo`,
                            `depreciacionAcumulativa`(
                                `calculoMes`(
                                    fecha, `bdsistemacontable`.`catequipocomputo`.`catEquipoFechaCompra`),
                                    `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                    `depreciacionMensual`(
                                        `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                        `bdsistemacontable`.`catequipocomputo`.`catEquipoCostoEquipo`
                                    )
                                )
                            ) AS `saldoEnLibro`
                        FROM
                            (
                                `bdsistemacontable`.`catequipocomputo`
                            JOIN `bdsistemacontable`.`cattipocuentaactivofijo`
                            )
                        WHERE
                            `bdsistemacontable`.`catequipocomputo`.`idActivofijo` = `bdsistemacontable`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontable`.`catequipocomputo`.`CatEquipoEstado` <> 2
                        UNION ALL
                    SELECT
                        `bdsistemacontable`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,
                        `bdsistemacontable`.`catimpresoras`.`catImpresorasMarca` AS `catImpresorasMarca`,
                        `bdsistemacontable`.`catimpresoras`.`catImpresoraFechaIngreso` AS `catImpresoraFechaIngreso`,
                        `bdsistemacontable`.`catimpresoras`.`catImpresoraCosto` AS `catimpresoraCosto`,
                        `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,
                        `calculoMes`(
                            fecha, `bdsistemacontable`.`catimpresoras`.`catImpresoraFechaIngreso`) AS `MESES`,
                            `depreciacionMensual`(
                                `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                `bdsistemacontable`.`catimpresoras`.`catImpresoraCosto`
                            ) AS `depreciacionMensual`,
                            `depreciacionAcumulativa`(
                                `calculoMes`(
                                    fecha, `bdsistemacontable`.`catimpresoras`.`catImpresoraFechaIngreso`),
                                    `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                    `depreciacionMensual`(
                                        `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                        `bdsistemacontable`.`catimpresoras`.`catImpresoraCosto`
                                    )
                                ) AS `depreciacionAcumulada`,
                                `saldoEnLibro`(
                                    `bdsistemacontable`.`catimpresoras`.`catImpresoraCosto`,
                                    `depreciacionAcumulativa`(
                                        `calculoMes`(
                                            fecha, `bdsistemacontable`.`catimpresoras`.`catImpresoraFechaIngreso`),
                                            `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                            `depreciacionMensual`(
                                                `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                `bdsistemacontable`.`catimpresoras`.`catImpresoraCosto`
                                            )
                                        )
                                    ) AS `saldoEnLibro`
                                FROM
                                    (
                                        `bdsistemacontable`.`catimpresoras`
                                    JOIN `bdsistemacontable`.`cattipocuentaactivofijo`
                                    )
                                WHERE
                                    `bdsistemacontable`.`catimpresoras`.`idActivofijo` = `bdsistemacontable`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontable`.`catimpresoras`.`CatImpresoraEstado` <> 2
                                UNION ALL
                            SELECT
                                `bdsistemacontable`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,
                                `bdsistemacontable`.`catvehiculo`.`catVehiculoModelo` AS `catvehiculoModelo`,
                                `bdsistemacontable`.`catvehiculo`.`catVehiculoFechaCompra` AS `catvehiculoFechaCompra`,
                                `bdsistemacontable`.`catvehiculo`.`catVehiculoCosto` AS `catVehiculoCosto`,
                                `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,
                                `calculoMes`(
                                    fecha, `bdsistemacontable`.`catvehiculo`.`catVehiculoFechaCompra`) AS `MESES`,
                                    `depreciacionMensual`(
                                        `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                        `bdsistemacontable`.`catvehiculo`.`catVehiculoCosto`
                                    ) AS `depreciacionMensual`,
                                    `depreciacionAcumulativa`(
                                        `calculoMes`(
                                            fecha, `bdsistemacontable`.`catvehiculo`.`catVehiculoFechaCompra`),
                                            `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                            `depreciacionMensual`(
                                                `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                `bdsistemacontable`.`catvehiculo`.`catVehiculoCosto`
                                            )
                                        ) AS `depreciacionAcumulada`,
                                        `saldoEnLibro`(
                                            `bdsistemacontable`.`catvehiculo`.`catVehiculoCosto`,
                                            `depreciacionAcumulativa`(
                                                `calculoMes`(
                                                    fecha, `bdsistemacontable`.`catvehiculo`.`catVehiculoFechaCompra`),
                                                    `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                    `depreciacionMensual`(
                                                        `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                        `bdsistemacontable`.`catvehiculo`.`catVehiculoCosto`
                                                    )
                                                )
                                            ) AS `saldoEnLibro`
                                        FROM
                                            (
                                                `bdsistemacontable`.`catvehiculo`
                                            JOIN `bdsistemacontable`.`cattipocuentaactivofijo`
                                            )
                                        WHERE
                                            `bdsistemacontable`.`catvehiculo`.`idActivofijo` = `bdsistemacontable`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontable`.`catvehiculo`.`catVehiculoEstado` <> 2
                                        UNION ALL
                                    SELECT
                                        `bdsistemacontable`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,
                                        `bdsistemacontable`.`catterreno`.`catTerrenoPropietario` AS `catTerrenoPropietario`,
                                        `bdsistemacontable`.`catterreno`.`catTerrenoFechaCompra` AS `catterrenoFechaCompra`,
                                        `bdsistemacontable`.`catterreno`.`catterrenoCosto` AS `catterrenoCosto`,
                                        `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,
                                        `calculoMes`(
                                            fecha, `bdsistemacontable`.`catterreno`.`catTerrenoFechaCompra`) AS `MESES`,
                                            `depreciacionMensual`(
                                                `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                `bdsistemacontable`.`catterreno`.`catterrenoCosto`
                                            ) AS `depreciacionMensual`,
                                            `depreciacionAcumulativa`(
                                                `calculoMes`(
                                                    fecha, `bdsistemacontable`.`catterreno`.`catTerrenoFechaCompra`),
                                                    `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                    `depreciacionMensual`(
                                                        `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                        `bdsistemacontable`.`catterreno`.`catterrenoCosto`
                                                    )
                                                ) AS `depreciacionAcumulada`,
                                                `saldoEnLibro`(
                                                    `bdsistemacontable`.`catterreno`.`catterrenoCosto`,
                                                    `depreciacionAcumulativa`(
                                                        `calculoMes`(
                                                            fecha, `bdsistemacontable`.`catterreno`.`catTerrenoFechaCompra`),
                                                            `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                            `depreciacionMensual`(
                                                                `bdsistemacontable`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                                                                `bdsistemacontable`.`catterreno`.`catterrenoCosto`
                                                            )
                                                        )
                                                    ) AS `saldoEnLibro`
                                                FROM
                                                    (
                                                        `bdsistemacontable`.`catterreno`
                                                    JOIN `bdsistemacontable`.`cattipocuentaactivofijo`
                                                    )
                                                WHERE
                                                    `bdsistemacontable`.`catterreno`.`idActivofijo` = `bdsistemacontable`.`cattipocuentaactivofijo`.`idActivofijo` AND `bdsistemacontable`.`catterreno`.`CatTerrenoEstado` <> 2
                                                ) `activo`
                                            GROUP BY
                                                `activo`.`CATEGORIA`,
                                                `activo`.`DETALLE_ACTIVO` WITH ROLLUP;
END$$

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

CREATE DEFINER=`root`@`localhost` FUNCTION `depreciacionAcumulativa` (`mes` INT, `vidaUtil` INT, `depreciacionMensual` DECIMAL(30,2)) RETURNS DECIMAL(30,2) BEGIN
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
  `CatElectCosto` int(11) DEFAULT NULL,
  `CatElectEstado` int(11) NOT NULL,
  `idActivofijo` int(11) NOT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catelectrodomesticos`
--

INSERT INTO `catelectrodomesticos` (`CatElectId`, `CatElectMarca`, `CatElectModelo`, `CatElectDescripcion`, `CatElectFechaIngreso`, `CatElectCosto`, `CatElectEstado`, `idActivofijo`, `updated_at`, `created_at`) VALUES
(1, 'Sony', 'Lavadora', 'Lavadora de ropa, color blanca.', '2020-05-13', 300, 1, 1, '2020-10-03', '2020-09-06');

-- --------------------------------------------------------

--
-- Table structure for table `catequipocomputo`
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
-- Dumping data for table `catequipocomputo`
--

INSERT INTO `catequipocomputo` (`catEquipoCompId`, `catEquipoModelo`, `catEquipoNumeroSerie`, `catEquipoMarca`, `catEquipoTamanioAlmacenamiento`, `TipoMemoriaRAM`, `catEquipoCantidadRAM`, `catEquipoTipoSO`, `catEquipoFechaCompra`, `catEquipoCostoEquipo`, `CatEquipoEstado`, `idActivofijo`, `updated_at`, `created_at`) VALUES
(1, '20EV002JUS', '001002003004005', 'LENOVO', '250Gb, SSD', 'DDR4', '16Gb', 'windows10', '2020-10-06', 4500, 2, 3, '2020-10-22', NULL),
(2, '20EV002JUS', '001002003004005', 'LENOVO', '250Gb, SSD', 'DDR4', '16Gb', 'windows10', '2020-10-08', 250.5, 1, 3, '2020-10-08', NULL),
(4, 'inspiron', 'MY1235678', 'HP', '250Gb', 'DDR4', '8Gb', 'windows10', '2020-06-10', 230, 1, 3, '2020-10-03', '2020-09-06');

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
-- Dumping data for table `catimpresoras`
--

INSERT INTO `catimpresoras` (`catImpresorasId`, `catImpresorasMarca`, `catImpresoraModelo`, `catImpresoraTipoToner`, `catImpresoraDescripcion`, `catImpresoraFechaIngreso`, `catImpresoraCosto`, `CatImpresoraEstado`, `idActivofijo`, `updated_at`, `created_at`) VALUES
(1, 'Canon', 'MF4770N', '3500BN001', 'NEGRO, MULTIFUNCIONAL, CON ACCESO A RED LAN CABLE E INALAMBRICO', '2019-10-16', 350, 1, 1, '2020-10-08', NULL),
(2, 'Epson', 'MYL12345678', '128', 'Color negro, conectado por red inalambrica', '2020-06-09', 250, 1, 5, '2020-10-09', '2020-09-06');

-- --------------------------------------------------------

--
-- Table structure for table `catterreno`
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
-- Dumping data for table `catterreno`
--

INSERT INTO `catterreno` (`catTerrenoId`, `catTerrenoPropietario`, `catTerrenoArea`, `catTerrenoFechaCompra`, `catterrenoCosto`, `CatTerrenoEstado`, `catTerrenoNumeroCatastral`, `idActivofijo`, `updated_at`, `created_at`) VALUES
(2, 'Tesoros de Dios', '200mts Cuadrados', '2020-01-22', 2000, 1, '', 1, '2020-10-11', '2020-09-05'),
(3, 'Casa Bradley', '100mts Cuadrados', '2019-09-18', 1500, 1, '', 1, '2020-10-06', '2020-09-05'),
(4, 'Tesoros de Dios', '100 mts Cuadrados', '2020-05-14', 500, 1, '', 1, '2020-10-11', '2020-09-22'),
(5, 'Tesoros de Dios', '300 mts Cuadrados', '2020-10-03', 500, 1, '', 1, '2020-10-04', '2020-10-04');

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
(7, '121700', 'Mobiliario y Equipo Docentes', 60, 1, '2020-10-06', '2020-10-06');

-- --------------------------------------------------------

--
-- Table structure for table `catvehiculo`
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
-- Dumping data for table `catvehiculo`
--

INSERT INTO `catvehiculo` (`catVehiculoId`, `catVehiculoTipo`, `catVehiculoModelo`, `catVehiculoColor`, `catVehiculoMotor`, `catVehiculoChasis`, `catVehiculoVIM`, `catVehiculoCantPasajeros`, `catVehiculoCombustible`, `catVehiculoUso`, `catVehiculoAnio`, `catVehiculoCilindro`, `catVehiculoServicio`, `catVehiculoPropietario`, `catVehiculoFechaCompra`, `catVehiculoCosto`, `catVehiculoEstado`, `catVehiculoPlaca`, `idActivofijo`, `updated_at`, `created_at`) VALUES
(1, 'Bus', 'Coaster', 'Blanco', 'CUMIN', 'BLANCO', '456789', 12, 'Diésel', 'PRIVADO', '2010', '8', 'PARA ESTUDIANTES Y FAMILIAS', 'TESOROS DE DIOS', '2019-12-10', '2500', 1, '', 5, '2020-10-06', '2020-09-06');

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
,`DETALLE_ACTIVO` longtext
,`COSTO` double
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
,`COSTO` mediumtext
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
,`COSTO` mediumtext
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
,`COSTO` double
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
(1, 'Allan', 'tecnologia@tesorosdedios.org', NULL, '$2y$10$t/P8vLpce1DTK48NQ/8yxe8flJIE1fpUFRwODoJwW8Kh80Kms/49G', 'XZr73ZHnPczzPuXrbvU4sgjNstij0R5S1lM4GJ4qFXiMagdF6pt2Mgq7T9SO', 1, '2020-08-17 04:52:20', '2020-08-17 04:52:20'),
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
  MODIFY `CatElectId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `catequipocomputo`
--
ALTER TABLE `catequipocomputo`
  MODIFY `catEquipoCompId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `catTerrenoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cattipocuentaactivofijo`
--
ALTER TABLE `cattipocuentaactivofijo`
  MODIFY `idActivofijo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `catvehiculo`
--
ALTER TABLE `catvehiculo`
  MODIFY `catVehiculoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
