<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class catelectrodomesticoModel extends Model
{
    protected $table = 'catelectrodomesticos';
    protected $fillable = ['CatElectId', 'CatElectMarca', 'CatElectModelo', 'CatElectDescripcion', 'CatElectFechaIngreso','CatElectCosto'];
}
