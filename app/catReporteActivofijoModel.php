<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class catReporteActivofijoModel extends Model
{
    protected $table = 'rptdetalleactivo_estadoactivo';
    protected $fillable = ['CATEGORIA', 'DETALLE_ACTIVO', 'FECHA_RECIBIDA', 'COSTO', 'VIDA_UTIL', 'MESES', 'depreciacionMensual', 'depreciacionAcumulada', 'saldoEnLibro'];
}
