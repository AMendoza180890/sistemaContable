<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class cattipocuentaactivofijo extends Model
{
    protected $table = 'cattipocuentaactivofijo';
    protected $primaryKey = 'idActivofijo';
    protected $fillable = ['idActivofijo','ActivoFijoCodigoDescripcion','descripcionActivoFjo','vidaUtilActivoFijo', 'CatTipoCuentaActivoEstado','updated_at','created_at'];
}
