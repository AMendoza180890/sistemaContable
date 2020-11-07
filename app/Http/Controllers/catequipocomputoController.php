<?php

namespace App\Http\Controllers;

use App;
use FFI\Exception;
use Illuminate\Http\Request;
use App\catequipocomputoModel;
use Illuminate\Auth\Events\Verified;
use SebastianBergmann\Environment\Console;

class catequipocomputoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $listaComputadoras = catequipocomputoModel::all()->where('CatEquipoEstado','!=','2');
        $listaComputadorasDeshablitados = catequipocomputoModel::all()->where('CatEquipoEstado','=','2');
        return view('computadora',compact('listaComputadoras','listaComputadorasDeshablitados'));
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
                'compModelo'       => 'required',
                'compSerie'  => 'required',
                'compMarca'        => 'required',
                'compAlmacenamiento' => 'required',
                'compTipoMemoriaRAM'        => 'required',
                'compCantidadRAM'  => 'required',
                'compTipoSO'       => 'required',
                'compFechaCompra'  => 'required',
                'compCosto'  => 'required'
            ]);
    
               $Computadoras = new catequipocomputoModel();
               $Computadoras->catEquipoModelo      = $request->compModelo;
               $Computadoras->catEquipoNumeroSerie = $request->compSerie;
               $Computadoras->catEquipoMarca       = $request->compMarca;
               $Computadoras->catEquipoTamanioAlmacenamiento = $request->compAlmacenamiento;
               $Computadoras->TipoMemoriaRAM       = $request->compTipoMemoriaRAM;
               $Computadoras->catEquipoCantidadRAM = $request->compCantidadRAM;
               $Computadoras->catEquipoTipoSO      = $request->compTipoSO;
               $Computadoras->catEquipoFechaCompra = $request->compFechaCompra;
               $Computadoras->catEquipoCostoEquipo = $request->compCosto;
               $Computadoras->idActivofijo = $request->tipocuenta;
               $Computadoras->CatEquipoEstado = 1;

              $Computadoras->save();
                
              return back()->with('mensajeExito','Se agregó correctamente la computadora!!');

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
            $findComputadora = catequipocomputoModel::find($id);
            $pdf = App::make('dompdf.wrapper');
            $pdf ->loadview('RptComputadora',compact('findComputadora'));
            return $pdf->stream();
        } catch (exception $ex) {
            return 'Error = '.$ex->getMessage();
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
            $findComputadora = catequipocomputoModel::find($id);
            return $findComputadora;
        } catch (exception $ex) {
            return "Error -".$ex->getMessage();
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
            $actualizarComputadora = catequipocomputoModel::where('catEquipoCompId', '=', $id)->first();
            
            $actualizarComputadora->catEquipoModelo = $request->inputModeloE;
            $actualizarComputadora->catEquipoNumeroSerie = $request->inputSerieE;
            $actualizarComputadora->catEquipoMarca = $request->inputMarcaE;
            $actualizarComputadora->catEquipoTamanioAlmacenamiento = $request->inputAlmacenamientoE;
            $actualizarComputadora->TipoMemoriaRAM = $request->InputTipoMemoriaE;
            $actualizarComputadora->catEquipoCantidadRAM = $request->cantTotalRamE;
            $actualizarComputadora->catEquipoTipoSO = $request->compTipoSOE;
            $actualizarComputadora->catEquipoFechaCompra = $request->compFechaCompraE;
            $actualizarComputadora->catEquipoCostoEquipo = $request->compCostoE;
            $actualizarComputadora->idActivofijo = $request->tipocuentaE;
            $actualizarComputadora->CatEquipoEstado = 1;

            $actualizarComputadora->save();
            return redirect()->route('computadora.all')->with('mensaje exito', 'Se actualizo correctamente el equipo de computo');
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
            $DesactivarComputadora = catequipocomputoModel::where('catEquipoCompId','=',$id)->first();

            $DesactivarComputadora->CatEquipoEstado = 2;

            $DesactivarComputadora->save();
            //catequipocomputoModel::find($id)->delete();
            return redirect()->route('computadora.all')->with('mensaje exito','Se desactivo correctamente el equipo de computo');
        } catch (exception $ex) {
            return "Error - ".$ex->getMessage();
        }
    }

    public function recover($id){
        try {
            $habilitarComputadora = catequipocomputoModel::where('catEquipoCompId', '=',$id)->first();

            $habilitarComputadora->CatEquipoEstado = 1;

            $habilitarComputadora->save();

            return redirect()->route('computadora.all')->with('mensaje exito','Se activo correctamente el equipo de computo');
        } catch (exception $ex) {
            return 'Error -'.$ex->getMessage();
        }
    }

    public function showBajas($id)
    {
        try {
            $findComputadora = catequipocomputoModel::find($id);
            $pdf = App::make('dompdf.wrapper');
            $pdf ->loadview('RptComputadoraBaja',compact('findComputadora'));
            return $pdf->stream();
        } catch (exception $ex) {
            return 'Error = '.$ex->getMessage();
        }
    }
}
