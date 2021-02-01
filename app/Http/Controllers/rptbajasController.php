<?php

namespace App\Http\Controllers;

use App\rptbajasModel;
use Illuminate\Http\Request;
use FFI\Exception;
use Illuminate\Support\Facades\DB;

class rptbajasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try {
            //$listaGralReporte = rptbajasModel::all();
            $listaGralReporte = DB::select('call SPrptdetalleactivo_estadobajas');
            return view('RptBajas',compact('listaGralReporte'));
        } catch (exception $ex) {
            return 'Error - '.$ex->getMessage();
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
    public function store($id)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show()
    {
        try {   
            $mes = date('n');
            $anio = date('Y');
            // echo '<script>console.log('.$mes.' '.$anio.')</script>';
            $listaGralReporte = DB::select("CALL SPdetalleactivo_estadobajas_busqueda(?,?)",[$mes,$anio]);
            return $listaGralReporte;
        } catch (exception $ex) {
            return "Error -".$ex->getMessage(); 
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
