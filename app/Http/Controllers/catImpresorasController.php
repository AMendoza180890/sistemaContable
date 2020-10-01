<?php

namespace App\Http\Controllers;

use App\catImpresorasModel;
use FFI\Exception;
use Illuminate\Http\Request;

class catImpresorasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $listaImpresoras = catImpresorasModel::all();
        return view('impresora',compact('listaImpresoras'));
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
            $this->validate(request(),[
                'impMarca' => 'required',
                'impModelo' => 'required',
                'TipoTonner' => 'required',
                'impFecha' => 'required',
                'impCosto' => 'required',
                'impDescripcion' => 'required'
            ]);

            $impresoras = new catImpresorasModel();

            $impresoras->catImpresorasMarca = $request->impMarca;
            $impresoras->catImpresoraModelo = $request->impModelo;
            $impresoras->catImpresoraTipoToner = $request->TipoTonner;
            $impresoras->catImpresoraFechaIngreso = $request->impFecha;
            $impresoras->catImpresoraCosto = $request->impCosto;
            $impresoras->catImpresoraDescripcion = $request->impDescripcion;
            $impresoras->CatImpresoraEstado = 1;

            $impresoras->save();

            return back()->with("Exito","Se ha agregado la impresora exitosamente!!");
            
        } catch (Exception $ex) {
            return 'Error - '.$ex->getMessage();
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
            $findImpresora = catImpresorasModel::find($id);
            return $findImpresora;
        } catch (exception $ex) {
            return "Error - ". $ex->getMessage();
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
            $actualizarImpresora = catImpresorasModel::where('catImpresorasId', '=', $id);
            $actualizarImpresora->catImpresorasMarca = $request->inputMarcaE;
            $actualizarImpresora->catImpresoraModelo = $request->inputModeloE;
            $actualizarImpresora->catImpresoraTipoToner = $request->inputTonnerE;
            $actualizarImpresora->catImpresoraDescripcion = $request->impDescripcionE;
            $actualizarImpresora->catImpresoraFechaIngreso = $request->impfechaCompraE;
            $actualizarImpresora->catImpresoraCosto = $request->impcostoE;
            $actualizarImpresora->CatImpresoraEstado = 1;
            
            $actualizarImpresora->save();
        } catch (exception $ex) {
            return 'Error - '.$ex->getMessage();
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

            $eliminarImpresora = catImpresorasModel::where('catImpresorasId','=',$id);

            $eliminarImpresora->CatImpresoraEstado = 0;

            //catimpresorasModel::find($id)->delete();
            return redirect()->route('impresora.all')->with('mensaje exitoso','Se elimino correctamente la impresora seleccionada');
        } catch (exception $ex) {
            return "Error - ".$ex->getMessage();
        }
    }
}
