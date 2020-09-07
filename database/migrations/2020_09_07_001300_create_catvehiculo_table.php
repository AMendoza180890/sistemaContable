<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCatvehiculoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('catvehiculo', function (Blueprint $table) {
            $table->increments('catVehiculoId');
            $table->text('catVehiculoTipo');
            $table->text('catVehiculoModelo');
            $table->text('catVehiculoColor');
            $table->text('catVehiculoMotor');
            $table->text('catVehiculoChasis');
            $table->text('catVehiculoVIM');
            $table->integer('catVehiculoCantPasajeros');
            $table->text('catVehiculoCombustible');
            $table->text('catVehiculoUso');
            $table->text('catVehiculoAnio');
            $table->text('catVehiculoCilindro');
            $table->text('catVehiculoServicio');
            $table->text('catVehiculoPropietario');
            $table->date('catVehiculoFechaCompra');
            $table->text('catVehiculoCosto');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('catvehiculo');
    }
}
