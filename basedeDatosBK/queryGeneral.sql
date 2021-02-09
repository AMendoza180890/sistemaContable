select
    `activo`.`CATEGORIA` AS `CATEGORIA`,
    `activo`.`DETALLE_ACTIVO` AS `DETALLE_ACTIVO`,
    sum(`activo`.`COSTO`) AS `COSTO`,
    sum(`activo`.`depreciacionMensual`) AS `DEPRECIACIONTOTALMENSUAL`,
    sum(`activo`.`depreciacionAcumulada`) AS `DEPRECIACIONTOTALACUMULADA`,
    sum(`activo`.`saldoEnLibro`) AS `SALDOTOTALLIBRO`
from
    (
        select
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `CATEGORIA`,
            `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectDescripcion` AS `DETALLE_ACTIVO`,
            `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso` AS `FECHA_RECIBIDA`,
            `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto` AS `COSTO`,
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `VIDA_UTIL`,
            `calculoMes`(
                curdate(),
                `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso`
            ) AS `MESES`,
            `depreciacionMensual`(
                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`
            ) AS `depreciacionMensual`,
            `depreciacionAcumulativa`(
                `calculoMes`(
                    curdate(),
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
                        curdate(),
                        `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso`
                    ),
                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                    `depreciacionMensual`(
                        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                        `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`
                    )
                )
            ) AS `saldoEnLibro`
        from
            (
                `bdsistemacontabletest`.`catelectrodomesticos`
                join `bdsistemacontabletest`.`cattipocuentaactivofijo`
            )
        where
            `bdsistemacontabletest`.`catelectrodomesticos`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo`
            and `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectEstado` <> 2
        union
        all
        select
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
        all
        select
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
        union
        all
        select
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,
            `bdsistemacontabletest`.`catvehiculo`.`catVehiculoModelo` AS `catvehiculoModelo`,
            `bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra` AS `catvehiculoFechaCompra`,
            `bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto` AS `catVehiculoCosto`,
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,
            `calculoMes`(
                curdate(),
                `bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra`
            ) AS `MESES`,
            `depreciacionMensual`(
                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                `bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`
            ) AS `depreciacionMensual`,
            `depreciacionAcumulativa`(
                `calculoMes`(
                    curdate(),
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
                        curdate(),
                        `bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra`
                    ),
                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                    `depreciacionMensual`(
                        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                        `bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`
                    )
                )
            ) AS `saldoEnLibro`
        from
            (
                `bdsistemacontabletest`.`catvehiculo`
                join `bdsistemacontabletest`.`cattipocuentaactivofijo`
            )
        where
            `bdsistemacontabletest`.`catvehiculo`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo`
            and `bdsistemacontabletest`.`catvehiculo`.`catVehiculoEstado` <> 2
    ) `activo`
group by
    `activo`.`CATEGORIA`,
    `activo`.`DETALLE_ACTIVO` with rollup