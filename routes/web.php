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
Route::get('/recuperarTipocuenta/{updateActivo}','CatActivoFijoController@Recover')->name('tipocuenta.recover')->where(['updateActivo'=>'[0-9]+']);
/*Hasta aqui finaliza Tipo cuentas Activo Fijo */

/*Rutas de Terreno*/
Route::get('/terrenos', 'catterrenoC@index')->name('terreno.all');
Route::post('/registrarTerreno','catterrenoC@store')->name('terreno.insertar');
Route::get('/editarTerreno/{catTerrenoid}/edit','catterrenoC@edit')->name('terreno.edit')->where(['catTerrenoid' => '[0-9]+']);
Route::get('/eliminarTerreno/{idTerreno}','catterrenoC@destroy')->name('terreno.destroy')->where(['idTerreno' => '[0-9]+']);
Route::put('/actualizarTerreno/{idTerreno}','catterrenoC@update')->name('terreno.update')->where(['idTerreno'=>'[0-9]+']);
Route::get('/recuperarTerreno/{idTerreno}', 'catterrenoC@Recover')->name('terreno.recover')->where(['idTerreno'=>'[0-9]+']);
/*Hasta aqui finaliza Terrenos */

/*Rutas de equipos de computo o computadoras*/
Route::get('/computadoras', 'catequipocomputoController@index')->name('computadora.all');
Route::post('/registrarComputadoras', 'catequipocomputoController@store')->name('computadora.insertar');
Route::get('/editarComputadora/{catComputadoraid}/edit','catequipocomputoController@edit')->name('computadora.edit')->where(['catComputadoraid' => '[0-9]+']);
Route::get('/eliminarComputadora/{idComputadora}','catequipocomputoController@destroy')->name('computadora.destroy')->where(['idComputadora' => '[0-9]+']);
Route::put('/actualizarComputadora/{idComputadora}','catequipocomputoController@update')->name('computadora.update')->where(['idComputadora'=>'[0-9]+']);
Route::get('/recuperaComputadora/{idComputadora}','catequipocomputoController@Recover')->name('computadora.recover')->where(['idComputadora'=>'[0-9]+']);
/*Hasta aqui finaliza Computadoras */

/*Rutas de Impresoras*/
Route::get('/impresoras', 'catImpresorasController@index')->name('impresora.all');
Route::post('/registrarImpresoras','catImpresorasController@store')->name('impresora.insertar');
Route::get('/editarImpresora/{catEquipoCompId}/edit','catImpresorasController@edit')->name('impresora.edit')->where(['catEquipoCompId' => '[0-9]+']);
Route::get('/eliminarImpresora/{idImpresora}','catImpresorasController@destroy')->name('impresora.destroy')->where(['idImpresora' => '[0-9]+']);
Route::put('/actualizarImpresora/{idImpresora}','catImpresorasController@update')->name('impresora.update')->where(['idImpresora'=>'[0-9]+']);
Route::get('/recuperarImpresora/{idImpresora}', 'catImpresorasController@Recover')->name('impresora.recover')->where(['idImpresora'=>'[0-9]+']);
/*Hasta aqui finaliza Impresora*/

/*Ruta de Vehiculos */
Route::get('/vehiculos', 'catvehiculoController@index')->name('vehiculo.all');
Route::post('/registrarVehiculo','catvehiculoController@store')->name('vehiculo.insertar');
Route::get('/editarvehiculo/{catVehiculoId}/edit','catvehiculoController@edit')->name('vehiculo.edit')->where(['catVehiculoId' => '[0-9]+']);
Route::get('/eliminarVehiculo/{idVehiculo}','catvehiculoController@destroy')->name('vehiculo.destroy')->where(['idVehiculo' => '[0-9]+']);
Route::put('/actualizarVehiculo/{catVehiculoId}/','catvehiculoController@update')->name('vehiculo.update')->where(['catVehiculoId'=>'[0-9]+']);
Route::get('/recuperarVehiculos/{catVehiculoId}', 'catvehiculoController@Recover')->name('vehiculo.recover')->where(['catVehiculoId'=>'[0-9]+']);
/*Hasta aqui finaliza Vehiculos */

/*Ruta de electrodomesticos */
Route::get('/electrodomesticos', 'catelectrodomesticoController@index')->name('electrodomestico.all');
Route::post('/registrarElectrodomesticos','catelectrodomesticoController@store')->name('electrodomestico.insertar');
Route::get('/editarElectrodomestico/{catElectId}/edit','catelectrodomesticoController@edit')->name('electrodomestico.edit')->where(['catElectId' => '[0-9]+']);
Route::get('/eliminiarElectrodomestico/{idElectrodomestico}','catelectrodomesticoController@destroy')->name('electrodomestico.destroy')->where(['idElectrodomestico' => '[0-9]+']);
Route::put('/actualizarElectrodomestico/{idElectrodomestico}','catelectrodomesticoController@update')->name('electrodomestico.update')->where(['idElectrodomestico'=>'[0-9]+']);
Route::get('/recuperarElectrodomesticos/{idElectrodomestico}','catelectrodomesticoController@Recover')->name('electrodomestico.recover')->where(['idElectrodomestico'=>'[0-9]+']);
/*Hasta aqui finaliza electrodomesticos*/


/*Rutas de Login */
Route::get('/usuarios','catUsuarioController@index')->name('usuario.all');
Route::post('/registrarUsuario','catUsuarioController@store')->name('usuario.insertar');
Route::get('/eliminarUsuario/{idusuario}','catUsuarioController@destroy')->name('usuario.destroy')->where(['idusuario'=>'[0-9]+']);
Route::get('/recuperarUsuario/{idusuario}', 'catUsuarioController@recover')->name('usuario.recover')->where(['idusuario' => '[0-9]+']);
Route::get('/usuarioEdit/{idusuario}/edit','catUsuarioController@edit')->name('usuario.edit')->where(['idusuario' => '[0-9]+']);
/*Hasta aqui finaliza Login */

/* Cargar catalogos en   formularios*/
Route::get('/catalogoTipocuenta', 'CatActivoFijoController@listarTipoCuenta')->name('catalogoTipoCuentas.all'); 
/* fin del cargar  formularios */

/*Rutas de reportes */
Route::get('/RptActivoFijo', 'catReporteActivofijoController@index')->name('RptCuenta.all');
/*Fin de Reportes */

/*Parte del sistema AdminLTE No tocar*/
 Auth::routes();
 Route::get('/home', 'HomeController@index')->name('home');
/*fin de Ruta AdminLTE */