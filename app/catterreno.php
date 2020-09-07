<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class catterreno extends Model
{
    protected $table = 'catterreno';
    protected $fillable = ['catTerrenoId','catTerrenoPropietario','catTerrenoArea','catTerrenoFechaCompra','caterrenoCosto','updated_at','created_at'];
}
