<?php

namespace App\Http\Controllers;

use App\rptConsolidadoCategoriaActivoFijoModel;
use Illuminate\Http\Request;
use FFI\Exception;
use DB;
class rptConsolidadoCategoriaActivoFijoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try {
            $consolidadoActivo = rptConsolidadoCategoriaActivoFijoModel::all();
            return view('RptConsolidadoActivoFijo',compact('consolidadoActivo'));
        } catch (exception $ex) {
            return 'error - '.$ex->getMessage();
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
            
            $consolidadoActivo = DB::select('CALL SPRptdetallecategoriaactivofijo(?)',array($request->dateConsolidadoReporteActivo));
            return view('RptConsolidadoActivoFijo',compact('consolidadoActivo'));
        } catch (exception $ex) {
            return 'Error -'.$ex->getMessage();
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
