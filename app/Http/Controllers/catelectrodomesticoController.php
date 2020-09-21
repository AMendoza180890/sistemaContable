<?php

namespace App\Http\Controllers;

use App\catelectrodomesticoModel;
use Illuminate\Http\Request;
use FFI\Exception;

class catelectrodomesticoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $listaElectrodomesticos = catelectrodomesticoModel::all();
        return view('electrodomestico',compact('listaElectrodomesticos'));
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
                'electmarca'=>'required',
                'electmodelo' => 'required',
                'electFecha' => 'required',
                'electcosto' => 'required',
                'electdescripcion' => 'required'
            ]);

            $electrodomestico = new catelectrodomesticoModel();

            $electrodomestico->CatElectMarca = $request->electmarca;
            $electrodomestico->CatElectModelo = $request->electmodelo;
            $electrodomestico->CatElectFechaIngreso = $request->electFecha;
            $electrodomestico->CatElectCosto = $request->electcosto;
            $electrodomestico->CatElectDescripcion = $request->electdescripcion;

            $electrodomestico->save();

            return back()->with('ExitoElectrodomestico','Se a agregado el electrodomestico correctamente!!');
            
        } catch (Exception $ex) {
            return 'Error -'.$ex->getMessage();
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
            $findElectrodomestico = catelectrodomesticoModel::find($id);
            return $findElectrodomestico;
        } catch (exception $ex) {
            return "Error - ".$ex->getMessage();
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
