 select
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`ActivoFijoCodigoDescripcion` AS `CODIGO`,
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
UNION ALL 

 select
            "" AS `CODIGO`,
            "" AS `descripcionActivoFjo`,
            "" AS `catvehiculoModelo`,
            "" AS `catvehiculoFechaCompra`,
            sum(`bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`) AS `catVehiculoCosto`,
            "" AS `vidaUtilActivoFijo`,
            "" AS `MESES`,
            sum(`depreciacionMensual`(
                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                `bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`
            )) AS `depreciacionMensual`,
            sum(`depreciacionAcumulativa`(
                `calculoMes`(
                    curdate(),
                    `bdsistemacontabletest`.`catvehiculo`.`catVehiculoFechaCompra`
                ),
                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                `depreciacionMensual`(
                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                    `bdsistemacontabletest`.`catvehiculo`.`catVehiculoCosto`
                )
            )) AS `depreciacionAcumulada`,
            sum(`saldoEnLibro`(
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
            )) AS `saldoEnLibro`
        from
            (
                `bdsistemacontabletest`.`catvehiculo`
                join `bdsistemacontabletest`.`cattipocuentaactivofijo`
            )
        where
            `bdsistemacontabletest`.`catvehiculo`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo`
            and `bdsistemacontabletest`.`catvehiculo`.`catVehiculoEstado` <> 2
