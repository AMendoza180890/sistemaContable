<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class rptaltaModel extends Model
{
    private $table = "SPdetalleactivo_estadoAlta_busqueda";
    private $fillable = ["CATEGORIA","DETALLE_ACTIVO","FECHA_BAJA","FECHA_RECIBIDA","COSTO","VIDA_UTIL","MESES","depreciacionMensual","depreciacionAcumulada","saldoEnLibro"];
}
