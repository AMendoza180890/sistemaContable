<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCattipocuentaactivofijosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cattipocuentaactivofijo', function (Blueprint $table) {
            $table->increments('idActivofijo');
            $table->text('descripcionActivoFjo');
            $table->integer('vidaUtilActivoFijo');
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
        Schema::dropIfExists('cattipocuentaactivofijo');
    }
}
