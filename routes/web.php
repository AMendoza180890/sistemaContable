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
Route::get('/tipoCuentas', 'CatActivoFijoController@index') ->name('tipocuenta.all');
Route::post('/registrartipoCuentas', 'CatActivoFijoController@store')->name('tipocuenta.insertar');
Route::get('/editarTipocuenta/{idActivofijo}/edit','CatActivoFijoController@edit')->name('tipocuenta.edit');
<<<<<<< HEAD
Route::delete('/eliminarTipocuenta/{idActivofijo}','CatActivoFijoController@destroy')->name('tipocuenta.eliminar');
=======
Route::get('/eliminarTipocuenta/{idActivofijo}','CatActivoFijoController@destroy')->name('tipocuenta.destroy');
>>>>>>> 56132ae8d390a24682aa1530f80c1f3d6107b07d
/*Hasta aqui finaliza Tipo cuentas Activo Fijo */


/*Rutas de Terreno*/
Route::get('/terrenos', 'catterrenoC@index')->name('terreno.all');
Route::post('/registrarTerreno','catterrenoC@store')->name('terreno.insertar');
Route::get('/editarTerreno/{catTerrenoid}/edit','catterrenoC@edit')->name('terreno.edit');
/*Hasta aqui finaliza Terrenos */

/*Rutas de equipos de computo o computadoras*/
Route::get('/computadoras', 'catequipocomputoController@index');
Route::post('/registrarComputadoras', 'catequipocomputoController@store')->name('computadora.insertar');
Route::get('/editarComputadora/{catComputadoraid}/edit','catequipocomputoController@edit')->name('computadora.edit');
/*Hasta aqui finaliza Computadoras */

/*Rutas de Impresoras*/
Route::get('/impresoras', 'catImpresorasController@index');
Route::post('/registrarImpresoras','catImpresorasController@store')->name('impresora.insertar');
Route::get('/editarImpresora/{catEquipoCompId}/edit','catImpresorasController@edit')->name('impresora.edit');
/*Hasta aqui finaliza Impresora*/

/*Ruta de Vehiculos */
Route::get('/vehiculos', 'catvehiculoController@index');
Route::post('/registrarVehiculo','catvehiculoController@store')->name('vehiculo.insertar');
Route::get('/editarvehiculo/{catVehiculoId}/edit','catvehiculoController@edit')->name('vehiculo.edit');
Route::put('/actualizarVehiculo/{catVehiculoId}/','catvehiculoController@update')->name('vehiculo.update');
/*Hasta aqui finaliza Vehiculos */

/*Ruta de electrodomesticos */
Route::get('/electrodomesticos', 'catelectrodomesticoController@index');
Route::post('/registrarElectrodomesticos','catelectrodomesticoController@store')->name('electrodomestico.insertar');
Route::get('/editarElectrodomestico/{catElectId}/edit','catelectrodomesticoController@edit')->name('electrodomestico.edit');
/*Hasta aqui finaliza electrodomesticos*/


/*Parte del sistema AdminLTE No tocar*/
 Auth::routes();
 Route::get('/home', 'HomeController@index')->name('home');
