<?php

namespace App\Http\Controllers;

use App\catReporteActivofijoModel;
use App\catterreno;
use FFI\Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class catReporteActivofijoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try {
            $listaGralReporte = DB::select('CALL SPrptdetalleactivo_estadoactivo()');
            //$listaGralReporte = catReporteActivofijoModel::all();
            // var_dump($listaGralReporte);
            // die;
            return view('RptActivoFijo',compact('listaGralReporte'));
        } catch (exception $ex) {
            return 'ERROR -'.$ex->getMessage();
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        try {
            $listaGralReporte = DB::select('CALL SPgenerarReporteFecha(?)',array($request->dateReporteActivo));
            return view('RptActivoFijo', compact('listaGralReporte'))->with('mensajeExito',"Se genero reporte a la fecha ".$request->dateReporteActivo);
        } catch (exception $ex) {
            return 'ERROR - '.$ex->getMessage();
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
