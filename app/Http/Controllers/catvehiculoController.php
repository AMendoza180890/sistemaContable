<?php

namespace App\Http\Controllers;

use App\catvehiculoModel;
use Illuminate\Http\Request;
use FFI\Exception;

class catvehiculoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $listaVehiculos = catvehiculoModel::all();
        return view('vehiculo',compact('listaVehiculos'));
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
                'vehTipo'=>'required',
                'vehModelo' => 'required',
                'vehColor' => 'required',
                'vehMotor' => 'required',
                'vehCilindro' => 'required',
                'vehcombustible' => 'required',
                'vehChasis' => 'required',
                'vehVIM' => 'required',
                'vehUso' => 'required',
                'vehAnio' => 'required',
                'vehPasajeros' => 'required',
                'vehServicio' => 'required',
                'vehPropietario'=>'required',
                'vehFecha' => 'required',
                'vehCosto' => 'required',

                
            ]);
            
            $vehiculos = new catvehiculoModel();

            $vehiculos->catVehiculoTipo = $request->vehTipo;
            $vehiculos->catVehiculoModelo = $request->vehModelo;
            $vehiculos->catVehiculoColor = $request->vehColor;
            $vehiculos->catVehiculoMotor = $request->vehMotor;
            $vehiculos->catVehiculoChasis = $request->vehChasis;
            $vehiculos->catVehiculoVIM = $request->vehVIM;
            $vehiculos->catVehiculoCantPasajeros = $request->vehPasajeros;
            $vehiculos->catVehiculoCombustible = $request->vehcombustible;
            $vehiculos->catVehiculoUso = $request->vehUso;
            $vehiculos->catVehiculoAnio = $request->vehAnio;
            $vehiculos->catVehiculoCilindro = $request->vehCilindro;
            $vehiculos->catVehiculoServicio = $request->vehServicio;
            $vehiculos->catVehiculoPropietario = $request->vehPropietario;
            $vehiculos->catVehiculoFechaCompra = $request->vehFecha;
            $vehiculos->catVehiculoCosto = $request->vehCosto;

            $vehiculos->save();

            return back()->with('ExitoVehiculos','Se ha agregado vehiculo correctamente!!');
            
            
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
        
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($catVehiculoId)
    {
        try {
            $obtenerVehiculos = catvehiculoModel::find($catVehiculoId);
            return view('editvehiculo',compact('obtenerVehiculos'));
            
        } catch (Exception $ex) {
            return 'Error - '.$ex->getMessage();
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
