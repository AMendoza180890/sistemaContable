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
            $tipoCuenta->descripcionActivoFjo = $request ->activoDescripcionN;
            $tipoCuenta->vidaUtilActivoFijo = $request ->activoVidaUtilN;
            $tipoCuenta->Save();

            // cattipocuentaactivofijo::insert([
            //     'descripcionActivoFjo' => ('activoDescripcionN'),
            //     'vidaUtilActivoFijo' => ('activoVidaUtilN')
            // ]);
            return back();
            //     echo '<script>console.log("finalizo en el redirect")<script>';
                
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
        try {
            $findActivoFijo = cattipocuentaactivofijo::find($id);
            return $findActivoFijo;
        } catch (exception $ex) {
            return "Error - ".$ex->getMessage();
        }
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
