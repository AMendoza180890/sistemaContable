<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class catequipocomputoModel extends Model
{
    protected $table = 'catequipocomputo';
    protected $primaryKey = 'catEquipoCompId';
    protected $fillable = ['catEquipoCompId', '	catEquipoComputoCodigo', 'catEquipoModelo', 'catEquipoNumeroSerie', 'catEquipoMarca', 'catEquipoTamanioAlmacenamiento', 'TipoMemoriaRAM', 'catEquipoCantidadRAM', 'catEquipoTipoSO', 'catEquipoFechaCompra', 'catEquipoCostoEquipo','CatEquipoEstado','idActivofijo','catEquipoComputoTipoEquipo','	catEquipoComputoObservaciones','updated_at','created_at'];
}
