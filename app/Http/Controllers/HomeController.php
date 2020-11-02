<?php

namespace App\Http\Controllers;

use App\rptdetalleCategoriaActivoFijo;
use Illuminate\Http\Request;
use FFI\Exception;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        try {
            $detalleCategoria = rptdetalleCategoriaActivoFijo::all();
            return view('home', compact('detalleCategoria'));
        } catch (exception $ex) {
            return 'ERROR = '. $ex->getMessage();
        }
        //return view('home');
    }
}
