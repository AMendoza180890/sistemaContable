<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateComputadoras extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('catequipocomputo', function (Blueprint $table) {
            $table->increments('catEquipoCompId');
            $table->text('catEquipoModelo');
            $table->text('catEquipoNumeroSerie');
            $table->text('catEquipoMarca');
            $table->text('catEquipoTamañoAlmacenamiento');
            $table->text('TipoMemoriaRAM');
            $table->text('catEquipoCantidadRAM');
            $table->text('catEquipoTipoSO');
            $table->text('catEquipoFechaCompra');
            $table->date('catEquipoCostoEquipo');
            $table->float('catEquipoCostoEquipo');
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
        Schema::dropIfExists('catequipocomputo');
    }
}
