<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class catterreno extends Model
{
    protected $table = 'catterreno';
    protected $primaryKey = 'catTerrenoId';
    protected $fillable = ['catTerrenoId','catTerrenoPropietario','catTerrenoArea','catTerrenoFechaCompra', 'catterrenoCosto','CatTerrenoEstado','idActivofijo','catTerrenoNumeroCatastral','updated_at','created_at'];
}
