<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class catequipocomputoModel extends Model
{
    protected $table = 'catequipocomputo';
    protected $primaryKey = 'catEquipoCompId';
    protected $fillable = ['catEquipoCompId', 'catEquipoModelo', 'catEquipoNumeroSerie', 'catEquipoMarca', 'catEquipoTamanioAlmacenamiento', 'TipoMemoriaRAM', 'catEquipoCantidadRAM', 'catEquipoTipoSO', 'catEquipoFechaCompra', 'catEquipoCostoEquipo','CatEquipoEstado','idActivofijo','updated_at','created_at'];
}
