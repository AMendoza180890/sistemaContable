<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class rptbajasModel extends Model
{
    protected $table = 'rptdetalleactivo_estadobajas';
    protected $fillable = ['CATEGORIA','DETALLE_ACTIVO','FECHA_RECIBIDA','COSTO','FECHA_BAJA','VIDA_UTIL','MESES','depreciacionMensual','depreciacionAcumulada','saldoEnLibro'];
}
