<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class catImpresorasModel extends Model
{
    protected $table = 'catImpresoras';
    protected $fillable = ['catImpresorasId', 'catImpresorasMarca', 'catImpresoraModelo', 'catImpresoraTipoToner', 'catImpresoraDescripcion', 'catImpresoraFechaIngreso'];
}
