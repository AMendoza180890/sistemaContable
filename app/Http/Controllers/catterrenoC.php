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
            $listaTerrenos = catterreno::all()->where('CatTerrenoEstado','!=','0');
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
            $terrenos->CatTerrenoEstado = 1;
    
            $terrenos->save();
    
            return redirect()->route('terreno.all')->with('mensajeExitoso','Se ha insertado la informacion del terreno');
            
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
        try {
            $actualizarTerreno = catterreno::where('catTerrenoId', '=',$id);

            $actualizarTerreno->catTerrenoPropietario = $request->TerrenoPropiedadE;
            $actualizarTerreno->catTerrenoArea = $request->TerrenoAreaE;
            $actualizarTerreno->catTerrenoFechaCompra = $request->TerrenofechaCompraE;
            $actualizarTerreno->caterrenoCosto = $request->TerrenoCostoE;
            $actualizarTerreno->CatTerrenoEstado = 1;
        } catch (exception $ex) {
            return 'Error -'.$ex->getMessage();
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            $eliminarTerreno = catterreno::where('catTerrenoId','=',$id);

            $eliminarTerreno->CatTerrenoEstado = 0;
            //catterreno::find($id)->delete();
            return redirect()->route('terreno.all')->with('mensaje exitoso','Se elimino correctamente el terreno seleccionado');
        } catch (exception $ex) {
            return "Error - ".$ex->getMessage();
        }
    }
}
