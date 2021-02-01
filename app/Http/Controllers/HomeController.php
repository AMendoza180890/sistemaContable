<?php

namespace App\Http\Controllers;

use App;
use App\rptdetalleCategoriaActivoFijo;
use Illuminate\Http\Request;
use FFI\Exception;
use Illuminate\Support\Facades\DB;

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
            //$detalleCategoria = rptdetalleCategoriaActivoFijo::all();
            $detalleCategoria = DB::select('call SPrptdetallecategoriaactivofijoSinParametro()');
            $rptBajasClass = new rptbajasController();
            $rptAltaClass = new rptaltaController();
            $rptBajasMesActual = $rptBajasClass->show();
            $rptAltaMesActual = $rptAltaClass->index();
            return view('home', compact('detalleCategoria','rptBajasMesActual','rptAltaMesActual'));
        } catch (exception $ex) {
            return 'ERROR = '. $ex->getMessage();
        }
        //return view('home');
    }
    public function rptResumen(){
        try{
            $detalleCategoria = rptdetalleCategoriaActivoFijo::all();
            $rptBajasClass = new rptbajasController();
            $rptAltaClass = new rptaltaController();
            $rptBajasMesActual = $rptBajasClass->show();
            $rptAltaMesActual = $rptAltaClass->index();
            $pdf = App::make('dompdf.wrapper');
            //$pdf->set_paper('letter', 'landscape');
            $pdf->loadview('RptResumenActivoFijo',compact('detalleCategoria','rptBajasMesActual','rptAltaMesActual'));
            return $pdf->stream();
        }catch(exception $ex){
            return 'Error -'.$ex->getMessage();
        }
    }
}
