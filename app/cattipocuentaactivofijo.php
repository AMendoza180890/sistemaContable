<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class cattipocuentaactivofijo extends Model
{
    protected $table = 'cattipocuentaactivofijo';
    protected $primaryKey = 'idActivofijo';
    protected $fillable = ['idActivofijo','descripcionActivoFjo','vidaUtilActivoFijo','updated_at','created_at'];
}
