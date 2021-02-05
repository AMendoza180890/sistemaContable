<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class catelectrodomesticoModel extends Model
{
    protected $table = 'catelectrodomesticos';
    protected $primaryKey = 'CatElectId';
    protected $fillable = ['CatElectId', 'catElectCodigo', 'CatElectMarca', 'CatElectModelo', 'CatElectDescripcion', 'CatElectFechaIngreso','CatElectCosto','CatElectEstado','idActivofijo','catElectTipoEquipo','catElectObservaciones'];
}
