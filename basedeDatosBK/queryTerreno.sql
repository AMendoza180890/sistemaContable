      select
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`ActivoFijoCodigoDescripcion` AS `CODIGO`,
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`descripcionActivoFjo` AS `descripcionActivoFjo`,
            `bdsistemacontabletest`.`catterreno`.`catTerrenoPropietario` AS `catTerrenoPropietario`,
            `bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra` AS `catterrenoFechaCompra`,
            `bdsistemacontabletest`.`catterreno`.`catterrenoCosto` AS `catterrenoCosto`,
            `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo` AS `vidaUtilActivoFijo`,
            `calculoMes`(
                curdate(),
                `bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra`
            ) AS `MESES`,
            `depreciacionMensual`(
                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                `bdsistemacontabletest`.`catterreno`.`catterrenoCosto`
            ) AS `depreciacionMensual`,
            `depreciacionAcumulativa`(
                `calculoMes`(
                    curdate(),
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
                        curdate(),
                        `bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra`
                    ),
                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                    `depreciacionMensual`(
                        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                        `bdsistemacontabletest`.`catterreno`.`catterrenoCosto`
                    )
                )
            ) AS `saldoEnLibro`
        from
            (
                `bdsistemacontabletest`.`catterreno`
                join `bdsistemacontabletest`.`cattipocuentaactivofijo`
            )
        where
            `bdsistemacontabletest`.`catterreno`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo`
            and `bdsistemacontabletest`.`catterreno`.`CatTerrenoEstado` <> 2 AND `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` = 1
UNION ALL
        select
            "" AS `CODIGO`,
            "" AS `descripcionActivoFjo`,
            "" AS `catTerrenoPropietario`,
            "" AS `catterrenoFechaCompra`,
            SUM(`bdsistemacontabletest`.`catterreno`.`catterrenoCosto`) AS `catterrenoCosto`,
            "" AS `vidaUtilActivoFijo`,
            "" AS `MESES`,
            SUM(`depreciacionMensual`(
                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                `bdsistemacontabletest`.`catterreno`.`catterrenoCosto`
            )) AS `depreciacionMensual`,
            SUM(`depreciacionAcumulativa`(
                `calculoMes`(
                    curdate(),
                    `bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra`
                ),
                `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                `depreciacionMensual`(
                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                    `bdsistemacontabletest`.`catterreno`.`catterrenoCosto`
                )
            )) AS `depreciacionAcumulada`,
            SUM(`saldoEnLibro`(
                `bdsistemacontabletest`.`catterreno`.`catterrenoCosto`,
                `depreciacionAcumulativa`(
                    `calculoMes`(
                        curdate(),
                        `bdsistemacontabletest`.`catterreno`.`catTerrenoFechaCompra`
                    ),
                    `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                    `depreciacionMensual`(
                        `bdsistemacontabletest`.`cattipocuentaactivofijo`.`vidaUtilActivoFijo`,
                        `bdsistemacontabletest`.`catterreno`.`catterrenoCosto`
                    )
                )
            )) AS `saldoEnLibro`
        from
            (
                `bdsistemacontabletest`.`catterreno`
                join `bdsistemacontabletest`.`cattipocuentaactivofijo`
            )
        where
            `bdsistemacontabletest`.`catterreno`.`idActivofijo` = `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo`
            and `bdsistemacontabletest`.`catterreno`.`CatTerrenoEstado` <> 2 AND `bdsistemacontabletest`.`cattipocuentaactivofijo`.`idActivofijo` = 1