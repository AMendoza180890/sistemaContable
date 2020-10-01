<?php

use App\Http\Controllers\catequipocomputoController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
*/
/*Se pueden agregar rutas a necesidad*/
Route::get('/', function () {
     return view('login');
});
/*Rutas de Tipo Cuentas Activo Fijo*/
Route::get('/tipoCuentas', 'CatActivoFijoController@index') ->name('tipocuenta.all');
Route::post('/registrartipoCuentas', 'CatActivoFijoController@store')->name('tipocuenta.insertar');
Route::get('/editarTipocuenta/{idActivofijo}/edit','CatActivoFijoController@edit')->name('tipocuenta.edit')->where(['idActivofijo' => '[0-9]+']);
Route::get('/eliminarTipocuenta/{idActivofijo}','CatActivoFijoController@destroy')->name('tipocuenta.destroy')->where(['idActivofijo'=>'[0-9]+']);
Route::put('/actualizarTipocuenta/{UpdateActivo}','CatActivoFijoController@update')->name('tipocuenta.update')->where(['UpdateActivo'=>'[0-9]+']);
/*Hasta aqui finaliza Tipo cuentas Activo Fijo */


/*Rutas de Terreno*/
Route::get('/terrenos', 'catterrenoC@index')->name('terreno.all');
Route::post('/registrarTerreno','catterrenoC@store')->name('terreno.insertar');
Route::get('/editarTerreno/{catTerrenoid}/edit','catterrenoC@edit')->name('terreno.edit');
Route::get('/eliminarTerreno/{idTerreno}','catterrenoC@destroy')->name('terreno.destroy');
/*Hasta aqui finaliza Terrenos */

/*Rutas de equipos de computo o computadoras*/
Route::get('/computadoras', 'catequipocomputoController@index')->name('computadora.all');
Route::post('/registrarComputadoras', 'catequipocomputoController@store')->name('computadora.insertar');
Route::get('/editarComputadora/{catComputadoraid}/edit','catequipocomputoController@edit')->name('computadora.edit');
Route::get('/eliminarComputadora/{idComputadora}','catequipocomputoController@destroy')->name('computadora.destroy');
/*Hasta aqui finaliza Computadoras */

/*Rutas de Impresoras*/
Route::get('/impresoras', 'catImpresorasController@index')->name('impresora.all');
Route::post('/registrarImpresoras','catImpresorasController@store')->name('impresora.insertar');
Route::get('/editarImpresora/{catEquipoCompId}/edit','catImpresorasController@edit')->name('impresora.edit');
Route::get('/eliminarImpresora/{idImpresora}','catImpresorasController@destroy')->name('impresora.destroy');
/*Hasta aqui finaliza Impresora*/

/*Ruta de Vehiculos */
Route::get('/vehiculos', 'catvehiculoController@index')->name('vehiculo.all');
Route::post('/registrarVehiculo','catvehiculoController@store')->name('vehiculo.insertar');
Route::get('/editarvehiculo/{catVehiculoId}/edit','catvehiculoController@edit')->name('vehiculo.edit');
Route::get('/eliminarVehiculo/{idVehiculo}','catvehiculoController@destroy')->name('vehiculo.destroy');
//Route::put('/actualizarVehiculo/{catVehiculoId}/','catvehiculoController@update')->name('vehiculo.update');
/*Hasta aqui finaliza Vehiculos */

/*Ruta de electrodomesticos */
Route::get('/electrodomesticos', 'catelectrodomesticoController@index')->name('electrodomestico.all');
Route::post('/registrarElectrodomesticos','catelectrodomesticoController@store')->name('electrodomestico.insertar');
Route::get('/editarElectrodomestico/{catElectId}/edit','catelectrodomesticoController@edit')->name('electrodomestico.edit');
Route::get('/eliminiarElectrodomestico/{idElectrodomestico}','catelectrodomesticoController@destroy')->name('electrodomestico.destroy');
/*Hasta aqui finaliza electrodomesticos*/


/*Parte del sistema AdminLTE No tocar*/
 Auth::routes();
 Route::get('/home', 'HomeController@index')->name('home');
