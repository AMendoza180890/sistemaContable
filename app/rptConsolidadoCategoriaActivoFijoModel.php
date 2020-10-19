<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class rptConsolidadoCategoriaActivoFijoModel extends Model
{
    protected $table = 'rptconsolidadocategoriaactivofijo';
    protected $fillable = ['CATEGORIA', 'DETALLE_ACTIVO', 'COSTO', 'DEPRECIACIONTOTALMENSUAL', 'DEPRECIACIONTOTALACUMULADA', 'SALDOTOTALLIBRO'];
}
