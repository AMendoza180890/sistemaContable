<?php

use App\Http\Controllers\catequipocomputoController;
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

/*Rutas de equipos de computo o computadoras*/
Route::get('/computadoras', 'catequipocomputoController@index');
Route::post('/registrarComputadoras', 'catequipocomputoController@store')->name('computadora.insertar');
/*Hasta aqui finaliza Computadoras */

/*Rutas de Impresoras*/
Route::get('/impresoras', 'catImpresorasController@index');
Route::post('/registrarImpresoras','catImpresorasController@store')->name('impresora.insertar');
/*Hasta aqui finaliza Impresora*/

/*Ruta de Vehiculos */
Route::get('/vehiculos', 'catvehiculoController@index');
Route::post('/registrarVehiculo','catvehiculoController@store')->name('vehiculo.insertar');
Route::get('/editarvehiculo/{catVehiculoId}/edit','catvehiculoController@edit')->name('vehiculo.edit');
Route::put('/actualizarVehiculo/{catVehiculoId/','catvehiculoController@update')->name('vehiculo.update');
/*Hasta aqui finaliza Vehiculos */

/*Ruta de electrodomesticos */
Route::get('/electrodomesticos', 'catelectrodomesticoController@index');
Route::post('/registrarElectrodomesticos','catelectrodomesticoController@store')->name('electrodomestico.insertar');
/*Hasta aqui finaliza electrodomesticos*/


/*Parte del sistema AdminLTE No tocar*/
 Auth::routes();
 Route::get('/home', 'HomeController@index')->name('home');
