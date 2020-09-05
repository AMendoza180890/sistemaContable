<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
/*Se pueden agregar rutas a necesidad*/
Route::get('/', function () {
     return view('login');
});
/*Rutas de Tipo Cuentas Activo Fijo*/
Route::get('/tipoCuentas', 'CatActivoFijoController@index');
Route::post('/registrartipoCuentas', 'CatActivoFijoController@store')->name('tipocuenta.insertar');
/*Hasta aqui finaliza Tipo cuentas Activo Fijo */


/*Rutas de Terreno*/
Route::get('/terrenos', 'catterrenoC@index');
Route::post('/registrarTerreno','catterrenoC@store')->name('terreno.insertar');
/*Hasta aqui finaliza Terrenos */


Route::get('/computadoras', 'catequipocomputoController@index');

Route::get('/impresoras', 'catImpresorasController@index');

Route::get('/vehiculos', 'catvehiculoController@index');

Route::get('/electrodomesticos', 'catelectrodomesticoController@index');



/*Parte del sistema AdminLTE No tocar*/
 Auth::routes();

 Route::get('/home', 'HomeController@index')->name('home');
