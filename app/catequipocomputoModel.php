<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class catequipocomputoModel extends Model
{
    protected $table = 'catequipocomputo';
    protected $fillable = ['catEquipoCompId', 'catEquipoModelo', 'catEquipoNumeroSerie', 'catEquipoMarca', 'catEquipoTamañoAlmacenamiento', 'TipoMemoriaRAM', 'catEquipoCantidadRAM', 'catEquipoTipoSO', 'catEquipoFechaCompra', 'catEquipoCostoEquipo'];
}
