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

Route::get('/tipoCuentas',function (){
   return view('tipoCuentas'); 
});

Route::get('/blog',function(){
    return view('blog');
});


/*Parte del sistema AdminLTE No tocar*/
 Auth::routes();

 Route::get('/home', 'HomeController@index')->name('home');

 Auth::routes();

 Route::get('/home', 'HomeController@index')->name('home');
