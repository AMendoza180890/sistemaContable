<?php

namespace App\Http\Controllers;

use App;
use App\catelectrodomesticoModel;
use Illuminate\Http\Request;
use FFI\Exception;
use Illuminate\Auth\Events\Verified;
use SebastianBergmann\Environment\Console;

class catelectrodomesticoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $listaElectrodomesticos = catelectrodomesticoModel::all()->where('CatElectEstado','!=','2');
        $listaElectrodomesticosDeshabilitado = catelectrodomesticoModel::all()->where('CatElectEstado','=','2');
        return view('electrodomestico',compact('listaElectrodomesticos','listaElectrodomesticosDeshabilitado'));
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
            $electrodomestico->idActivofijo = $request->tipocuentaE;
            $electrodomestico->CatElectEstado = 1;

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
        try {
            $findElectrodomestico = catelectrodomesticoModel::find($id);
            $pdf = App::make('dompdf.wrapper');
            $pdf->loadview('RptElectrodomestico',compact('findElectrodomestico'));
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
        try {
            $actualizarElectrodomestico = catelectrodomesticoModel::where('CatElectId','=',$id)->first();

            $actualizarElectrodomestico->CatElectMarca = $request->electmarcaE;
            $actualizarElectrodomestico->CatElectModelo = $request->electmodeloE;
            $actualizarElectrodomestico->CatElectDescripcion = $request->electdescripcionE;
            $actualizarElectrodomestico->CatElectFechaIngreso = $request->electFechaE;
            $actualizarElectrodomestico->CatElectCosto = $request->electcostoE;
            $actualizarElectrodomestico->idActivofijo = $request->tipocuentaE;
            $actualizarElectrodomestico->CatElectEstado = 1;

            $actualizarElectrodomestico->save();

            return redirect()->route('electrodomestico.all')->with('mensaje exitoso','Se actualizo correctamente el electrodomestico seleccinado');

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
            $eliminarElectrodomestico = catelectrodomesticoModel::where('CatElectId','=',$id)->first();
            $eliminarElectrodomestico->CatElectEstado = 2;
            $eliminarElectrodomestico->save();
            //catelectrodomesticoModel::find($id)->delete();
            return redirect()->route('electrodomestico.all')->with('mensaje exitoso','Se desactivo correctamente el electrodomestico seleccionado');
        } catch (exception $ex) {
            return "Error - ".$ex->getMessage();
        }
    }

    public function recover($id)
    {
        try {
            $activarElectrodomestico = catelectrodomesticoModel::where('CatElectId', '=', $id)->first();
            $activarElectrodomestico->CatElectEstado = 1;
            $activarElectrodomestico->save();
            //catelectrodomesticoModel::find($id)->delete();
            return redirect()->route('electrodomestico.all')->with('mensaje exitoso', 'Se habilito correctamente el electrodomestico seleccionado');
        } catch (exception $ex) {
            return "Error - " . $ex->getMessage();
        }
    }

    public function showBajas($id)
    {
        try {
            $findElectrodomestico = catelectrodomesticoModel::find($id);
            $pdf = App::make('dompdf.wrapper');
            $pdf->loadview('RptElectrodomesticoBaja', compact('findElectrodomestico'));
            return $pdf->stream();
        } catch (Exception $ex) {
            return 'Error -' . $ex->getMessage();
        }
    }
}
