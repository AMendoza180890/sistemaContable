<?php

namespace App\Http\Controllers;

use App\catterreno;
use Illuminate\Http\Request;
use FFI\Exception;

class catterrenoC extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try {
            $listaTerrenos = catterreno::all();
            return view('terreno',['listaTerrenos'=>$listaTerrenos]);
        } catch (Exception $ex) {
            return 'Error:'.$ex->getMessage();
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
        try {
            $this->validate(request(), [
                'TerrenoPropiedadN' => 'required',
                'TerrenoAreaN' => 'required',
                'TerrenofechaCompraN'=>'required',
                'TerrenoCostoN'=>'required'
            ]);
    
            $terrenos = new catterreno();
            $terrenos->catTerrenoPropietario = $request->TerrenoPropiedadN;
            $terrenos->catTerrenoArea = $request->TerrenoAreaN;
            $terrenos->catTerrenoFechaCompra = $request->TerrenofechaCompraN;
            $terrenos->catterrenoCosto = $request->TerrenoCostoN;
    
            $terrenos->save();
    
            return back()->with('mensajeExitoso','Se ha insertado la informacion del terreno');
            
        } catch (Exception $ex) {
            return 'Error'.$ex->getMessage();
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        try {
            $terrenos = catterreno::find($id);
            return $terrenos;
        } catch (exception $ex) {
            return "error - ".$ex->getMessage();
        }
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
