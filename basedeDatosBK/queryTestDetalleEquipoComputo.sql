select
    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`ActivoFijoCodigoDescripcion` AS `CODIGO_CUENTA`,
    `bdsistemacontabletest`.`catequipocomputo`.`catEquipoComputoCodigo` AS `CODIGO`,
    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,
    `bdsistemacontabletest`.`catequipocomputo`.`catEquipoMarca` AS `CatEquipoMarca`,
    `bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra` AS `CatequipoFechaCompra`,
    `bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo` AS `catEquipoCostoEquipo`,
    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,
    `calculoMes`(
        curdate(),
        `bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra`
    ) AS `MESES`,
    `depreciacionMensual`(
        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
        `bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`
    ) AS `depreciacionMensual`,
    `depreciacionAcumulativa`(
        `calculoMes`(
            curdate(),
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
                curdate(),
                `bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra`
            ),
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
            `depreciacionMensual`(
                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                `bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`
            )
        )
    ) AS `saldoEnLibro`
from
    (
        `bdsistemacontabletest`.`catequipocomputo`
        join `bdsistemacontabletest`.`cattipocuentaactivofijo`
    )
where
    `bdsistemacontabletest`.`catequipocomputo`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo`
    and `bdsistemacontabletest`.`catequipocomputo`.`CatEquipoEstado` <> 2
UNION all
select
    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`ActivoFijoCodigoDescripcion` AS `CODIGO_CUENTA`,
    `bdsistemacontabletest`.`catimpresoras`.`catImpresoraCodigo` AS `CODIGO`,
    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,
    `bdsistemacontabletest`.`catimpresoras`.`catImpresorasMarca` AS `catImpresorasMarca`,
    `bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso` AS `catImpresoraFechaIngreso`,
    `bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto` AS `catimpresoraCosto`,
    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,
    `calculoMes`(
        curdate(),
        `bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso`
    ) AS `MESES`,
    `depreciacionMensual`(
        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
        `bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`
    ) AS `depreciacionMensual`,
    `depreciacionAcumulativa`(
        `calculoMes`(
            curdate(),
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
                curdate(),
                `bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso`
            ),
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
            `depreciacionMensual`(
                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                `bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`
            )
        )
    ) AS `saldoEnLibro`
from
    (
        `bdsistemacontabletest`.`catimpresoras`
        join `bdsistemacontabletest`.`cattipocuentaactivofijo`
    )
where
    `bdsistemacontabletest`.`catimpresoras`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo`
    and `bdsistemacontabletest`.`catimpresoras`.`CatImpresoraEstado` <> 2
UNION all
-- Se creara el total a partir de una subquery
select
    -- `activo`.`CATEGORIA` AS `CATEGORIA`,
    -- `activo`.`DETALLE_ACTIVO` AS `DETALLE_ACTIVO`,
    -- sum(`activo`.`COSTO`) AS `COSTO`,
    -- sum(`activo`.`depreciacionMensual`) AS `DEPRECIACIONTOTALMENSUAL`,
    -- sum(`activo`.`depreciacionAcumulada`) AS `DEPRECIACIONTOTALACUMULADA`,
    -- sum(`activo`.`saldoEnLibro`) AS `SALDOTOTALLIBRO`
    "" AS `CODIGO`,
    "" AS `CODIGO`,
    "" AS `CATEGORIA`,
    "" AS `DETALLE_ACTIVO`,
    "" AS 'FECHA',
    sum(`activo`.`COSTO`) AS `COSTO`,
    "" AS 'VIDAUTIL',
    "" AS 'MESES',
    sum(`activo`.`depreciacionMensual`) AS `DEPRECIACIONTOTALMENSUAL`,
    sum(`activo`.`depreciacionAcumulada`) AS `DEPRECIACIONTOTALACUMULADA`,
    sum(`activo`.`saldoEnLibro`) AS `SALDOTOTALLIBRO`
from
    (
        select
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`ActivoFijoCodigoDescripcion` AS `CODIGO_CUENTA`,
        `bdsistemacontabletest`.`catequipocomputo`.`catEquipoComputoCodigo` AS `CODIGO`,
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,
            `bdsistemacontabletest`.`catequipocomputo`.`catEquipoMarca` AS `CatEquipoMarca`,
            `bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra` AS `CatequipoFechaCompra`,
            `bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo` AS `catEquipoCostoEquipo`,
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,
            `calculoMes`(
                curdate(),
                `bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra`
            ) AS `MESES`,
            `depreciacionMensual`(
                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                `bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`
            ) AS `depreciacionMensual`,
            `depreciacionAcumulativa`(
                `calculoMes`(
                    curdate(),
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
                        curdate(),
                        `bdsistemacontabletest`.`catequipocomputo`.`catEquipoFechaCompra`
                    ),
                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                    `depreciacionMensual`(
                        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                        `bdsistemacontabletest`.`catequipocomputo`.`catEquipoCostoEquipo`
                    )
                )
            ) AS `saldoEnLibro`
        from
            (
                `bdsistemacontabletest`.`catequipocomputo`
                join `bdsistemacontabletest`.`cattipocuentaactivofijo`
            )
        where
            `bdsistemacontabletest`.`catequipocomputo`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo`
            and `bdsistemacontabletest`.`catequipocomputo`.`CatEquipoEstado` <> 2
        union
        select
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`ActivoFijoCodigoDescripcion` AS `CODIGO_CUENTA`,
            `bdsistemacontabletest`.`catimpresoras`.`catImpresoraCodigo` AS `CODIGO`,
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,
            `bdsistemacontabletest`.`catimpresoras`.`catImpresorasMarca` AS `catImpresorasMarca`,
            `bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso` AS `catImpresoraFechaIngreso`,
            `bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto` AS `catimpresoraCosto`,
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,
            `calculoMes`(
                curdate(),
                `bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso`
            ) AS `MESES`,
            `depreciacionMensual`(
                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                `bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`
            ) AS `depreciacionMensual`,
            `depreciacionAcumulativa`(
                `calculoMes`(
                    curdate(),
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
                        curdate(),
                        `bdsistemacontabletest`.`catimpresoras`.`catImpresoraFechaIngreso`
                    ),
                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                    `depreciacionMensual`(
                        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                        `bdsistemacontabletest`.`catimpresoras`.`catImpresoraCosto`
                    )
                )
            ) AS `saldoEnLibro`
        from
            (
                `bdsistemacontabletest`.`catimpresoras`
                join `bdsistemacontabletest`.`cattipocuentaactivofijo`
            )
        where
            `bdsistemacontabletest`.`catimpresoras`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo`
            and `bdsistemacontabletest`.`catimpresoras`.`CatImpresoraEstado` <> 2
    ) `activo`