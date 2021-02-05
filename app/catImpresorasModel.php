<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class catImpresorasModel extends Model
{
    protected $table = 'catImpresoras';
    protected $primaryKey = 'catImpresorasId';
    protected $fillable = ['catImpresorasId','catImpresoraCodigo', 'catImpresorasMarca', 'catImpresoraModelo', 'catImpresoraTipoToner', 'catImpresoraDescripcion', 'catImpresoraFechaIngreso', 'catImpresoraCosto','CatImpresoraEstado','idActivofijo','catImpresoraTipoEquipo','catImpresoraObservaciones'];
}
