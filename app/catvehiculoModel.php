<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class catvehiculoModel extends Model
{
    protected $table = 'catvehiculo';
    protected $fillable = ['catVehiculoId', 'catVehiculoTipo', 'catVehiculoModelo', 'catVehiculoColor', 'catVehiculoMotor', 'catVehiculoChasis', 'catVehiculoVIM','catVehiculoCantPasajeros', 'catVehiculoCombustible', 'catVehiculoUso', 'catVehiculoAnio', 'catVehiculoCilindro', 'catVehiculoServicio', 'catVehiculoPropietario', 'catVehiculoFechaCompra', 'catVehiculoCosto'];
}
