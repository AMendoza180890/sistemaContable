<?php

namespace App\Http\Controllers;

use App\cattipocuentaactivofijo;
use Illuminate\Http\Request;
use Symfony\Component\Console\Input\Input;
use FFI\Exception;

class CatActivoFijoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $ActivoFijoC = cattipocuentaactivofijo::all();
        return view('tipoCuentas', compact('ActivoFijoC'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        return view('tipoCuentas');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return Response
     */
    public function store(Request $request)
    {
        try {
            $this->validate(request(),[
                 'activoDescripcionN' => 'required',
                 'activoVidaUtilN'=>'required'
             ]);
    
            $tipoCuenta = new cattipocuentaactivofijo();
            $tipoCuenta->descripcionActivoFjo = $request->get('activoDescripcionN');
            $tipoCuenta->vidaUtilActivoFijo = $request->get('activoVidaUtilN');
            $tipoCuenta->Save();

            return redirect()->route('tipoCuentas')->with('Correcto','Se ha agregado el registro correctamente');
    
            // cattipocuentaactivofijo::insert([
            //     'descripcionActivoFjo' => input('activoDescripcionN'),
            //     'vidaUtilActivoFijo' => Input::('activoVidaUtilN')
            // ]);
    
        } catch (Exception $ex) {
            return 'faltal error - '. $ex->getMessage();
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function update($id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id)
    {
        //
    }
}
