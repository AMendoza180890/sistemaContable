<?php

namespace App\Http\Controllers;

use App;
use App\catterreno;
use Illuminate\Http\Request;
use FFI\Exception;
use Illuminate\Auth\Events\Verified;
use SebastianBergmann\Environment\Console;

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
            $listaTerrenos = catterreno::all()->where('CatTerrenoEstado','!=','2');
            $listaTerrenosDeshabilitados = catterreno::all()->where('CatTerrenoEstado','=','2');
            return view('terreno',compact('listaTerrenos','listaTerrenosDeshabilitados'));
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
            $terrenos->catTerrenoNumeroCatastral = $request->TerrenoNumeroCatastralN;
            $terrenos->idActivofijo = $request->tipocuenta;
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
        try {
            $terrenos = catterreno::find($id);
            $pdf = App::make('dompdf.wrapper');
            $pdf->loadview('RptTerreno',compact('terrenos'));
            return $pdf->stream();
        } catch (Exception $ex) {
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
            $actualizarTerreno = catterreno::where('catTerrenoId', '=', $id)->first();

            $actualizarTerreno->catTerrenoPropietario = $request->TerrenoPropiedadE;
            $actualizarTerreno->catTerrenoArea = $request->TerrenoAreaE;
            $actualizarTerreno->catTerrenoFechaCompra = $request->TerrenofechaCompraE;
            $actualizarTerreno->catterrenoCosto = $request->TerrenoCostoE;
            $actualizarTerreno->catTerrenoNumeroCatastral = $request->TerrenoNumeroCatastralE;
            $actualizarTerreno->idActivofijo = $request->tipocuentaE;
            $actualizarTerreno->CatTerrenoEstado = 1;

            $actualizarTerreno->save();

            return redirect()->route('terreno.all')->with('mensaje exitoso','Se actualizo terreno correctamente');
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
            $eliminarTerreno = catterreno::where('catTerrenoId','=',$id)->first();

            $eliminarTerreno->CatTerrenoEstado = 2;
            //catterreno::find($id)->delete();
            $eliminarTerreno->save();
            return redirect()->route('terreno.all')->with('mensaje exitoso','Se desactivo correctamente el terreno seleccionado');
        } catch (exception $ex) {
            return "Error - ".$ex->getMessage();
        }
    }

    public function recover($id)
    {
        try {
            $habilitarTerreno = catterreno::where('catTerrenoId', '=', $id)->first();

            $habilitarTerreno->CatTerrenoEstado = 1;
            //catterreno::find($id)->delete();
            $habilitarTerreno->save();
            return redirect()->route('terreno.all')->with('mensaje exitoso', 'Se habilito correctamente el terreno seleccionado');
        } catch (exception $ex) {
            return "Error - " . $ex->getMessage();
        }
    }
}
