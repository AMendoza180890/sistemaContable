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
        $listaVehiculos = catvehiculoModel::all()->where('catVehiculoEstado','!=','2');
        $listaVehiculosDeshabilitados = catvehiculoModel::all()->where('catVehiculoEstado','=','2');
        return view('vehiculo',compact('listaVehiculos','listaVehiculosDeshabilitados'));
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
                'catVehiculoPlacaN'=>'required',
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
            $vehiculos->catVehiculoPlaca = $request->catVehiculoPlacaN;
            $vehiculos->catVehiculoEstado = 1;

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
            return $obtenerVehiculos;
            
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
        try {
            $actualizarVehiculo = catvehiculoModel::where('catVehiculoId', '=', $id)->first();
    
            $actualizarVehiculo->catVehiculoTipo  = $request->vehTipoE;
            $actualizarVehiculo->catVehiculoModelo = $request->vehModeloE;
            $actualizarVehiculo->catVehiculoColor = $request->vehColorE;
            $actualizarVehiculo->catVehiculoMotor = $request->vehMotorE;
            $actualizarVehiculo->catVehiculoChasis = $request->vehChasisE;
            $actualizarVehiculo->catVehiculoVIM = $request->vehVIME;
            $actualizarVehiculo->catVehiculoCantPasajeros = $request->vehPasajerosE;
            $actualizarVehiculo->catVehiculoCombustible = $request->vehcombustibleE;
            $actualizarVehiculo->catVehiculoUso = $request->vehUsoE;
            $actualizarVehiculo->catVehiculoAnio = $request->vehAnioE;
            $actualizarVehiculo->catVehiculoCilindro = $request->vehCilindroE;
            $actualizarVehiculo->catVehiculoServicio = $request->vehServicioE;
            $actualizarVehiculo->catVehiculoPropietario = $request->vehPropietarioE;
            $actualizarVehiculo->catVehiculoFechaCompra = $request->vehFechaE;
            $actualizarVehiculo->catVehiculoCosto = $request->vehCostoE;
            //Agregar Objeto donde se obtendra la planca en el front-end
            $actualizarVehiculo->catVehiculoPlaca = $request->catVehiculoPlacaE;
            $actualizarVehiculo->catVehiculoEstado = 1;
    
            $actualizarVehiculo->save();

            return redirect()->route('vehiculo.all')->with('mensaje exitoso','Se actualizo vehiculo correctamente');
            
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
            $eliminarVehiculo = catvehiculoModel::where('catVehiculoId','=',$id)->first();

            $eliminarVehiculo->catVehiculoEstado = 2;

            $eliminarVehiculo->save();
            //catvehiculoModel::find($id)->delete();
            return redirect()->route('vehiculo.all')->with('mensajeExitoso','Se desactivo correctamente el vehiculo seleccionado');
        } catch (exception $ex) {
            return "Error - ".$ex->getMessage();
        }
    }

    public function Recover($id)
    {
        try {
            $ActivarVehiculo = catvehiculoModel::where('catVehiculoId','=',$id)->first();

            $ActivarVehiculo->catVehiculoEstado = 1;

            $ActivarVehiculo->save();
            //catvehiculoModel::find($id)->delete();
            return redirect()->route('vehiculo.all')->with('mensajeExitoso','Se habilito correctamente el vehiculo seleccionado');
        } catch (exception $ex) {
            return "Error - ".$ex->getMessage();
        }
    }
}
