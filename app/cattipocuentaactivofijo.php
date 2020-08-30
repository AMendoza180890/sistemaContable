<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class cattipocuentaactivofijo extends Model
{
    protected $table = 'cattipocuentaactivofijo';
    protected $fillable = ['idActivofijo','descripcionActivoFjo','vidaUtilActivoFijo'];
}
