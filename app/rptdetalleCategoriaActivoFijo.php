<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class rptdetalleCategoriaActivoFijo extends Model
{
    protected $table = 'rptdetallecategoriaactiofijo';
    protected $fillable = ['CATEGORIA','COSTO','DEPRECIACIONTOTALMENSUAL', 'DEPRECIACIONTOTALACUMULADA', 'SALDOTOTALLIBRO'];
}
