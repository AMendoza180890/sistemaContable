select
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`ActivoFijoCodigoDescripcion` AS `CODIGO`,
            `bdsistemacontabletest`.`catelectrodomesticos`.`catElectCodigo` AS `CODIGO`,
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
UNION ALL
        select
            "" AS `CODIGO`,
            "" AS `CODIGO`,
            "" AS `CATEGORIA`,
            "" AS `DETALLE_ACTIVO`,
            "" AS `FECHA_RECIBIDA`,
            sum(`bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`) AS `COSTO`,
            "" AS `VIDA_UTIL`,
           "" AS `MESES`,
            sum(`depreciacionMensual`(
                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`
            )) AS `depreciacionMensual`,
            sum(`depreciacionAcumulativa`(
                `calculoMes`(
                    curdate(),
                    `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectFechaIngreso`
                ),
                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                `depreciacionMensual`(
                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                    `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectCosto`
                )
            )) AS `depreciacionAcumulada`,
            sum(`saldoEnLibro`(
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
            )) AS `saldoEnLibro`
        from
            (
                `bdsistemacontabletest`.`catelectrodomesticos`
                join `bdsistemacontabletest`.`cattipocuentaactivofijo`
            )
        where
            `bdsistemacontabletest`.`catelectrodomesticos`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo`
            and `bdsistemacontabletest`.`catelectrodomesticos`.`CatElectEstado` <> 2