<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CatTerreno extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('catterreno', function (Blueprint $table) {
            $table->increments('catTerrenoId');
            $table->text('catTerrenoPropietario');
            $table->text('catTerrenoArea');
            $table->date('catTerrenoFechaCompra');
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
        Schema::dropIfExists('catterreno');
    }
}
