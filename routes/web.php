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

Route::get('/tipoCuentas', 'CatActivoFijoController@index');
Route::POST('/registrartipoCuentas', 'CatActivoFijoController@create');

Route::get('/computadoras', 'catequipocomputoController@index');

Route::get('/terrenos', 'catterrenoC@index');

Route::get('/impresoras', 'catImpresorasController@index');

Route::get('/vehiculos', 'catvehiculoController@index');

Route::get('/electrodomesticos', 'catelectrodomesticoController@index');



/*Parte del sistema AdminLTE No tocar*/
 Auth::routes();

 Route::get('/home', 'HomeController@index')->name('home');

//  Auth::routes();

//  Route::get('/home', 'HomeController@index')->name('home');
