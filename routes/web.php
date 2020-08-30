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

Route::resource('/tipoCuentas', 'CatActivoFijoController');

Route::get('/computadoras',function(){
    return view('computadora');
});

Route::get('/electrodomesticos', function () {
    return view('electrodomestico');
});

Route::get('/impresoras', function () {
    return view('impresora');
});

Route::get('/terrenos', function () {
    return view('terreno');
});

Route::get('/vehiculos', function () {
    return view('vehiculo');
});


/*Parte del sistema AdminLTE No tocar*/
 Auth::routes();

 Route::get('/home', 'HomeController@index')->name('home');

//  Auth::routes();

//  Route::get('/home', 'HomeController@index')->name('home');
