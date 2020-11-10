<?php

namespace App\Http\Controllers;

use App\cattipocuentaactivofijo;
use Illuminate\Http\Request;
use Symfony\Component\Console\Input\Input;
use FFI\Exception;
use PHPUnit\Framework\Constraint\Count;
use function GuzzleHttp\Promise\exception_for;

class CatActivoFijoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $ActivoFijoC = cattipocuentaactivofijo::all()->where('CatTipoCuentaActivoEstado','!=','2');
        $ActivoFijoCDeshabilitado = cattipocuentaactivofijo::all()->where('CatTipoCuentaActivoEstado','=','2');
        return view('tipoCuentas', compact('ActivoFijoC','ActivoFijoCDeshabilitado'));
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
                    'CodigoCuentaN'=> 'required',
                  'activoDescripcionN' => 'required',
                  'activoVidaUtilN'=>'required'
              ]);
    
            $tipoCuenta = new cattipocuentaactivofijo();
            $tipoCuenta ->ActivoFijoCodigoDescripcion = $request->CodigoCuentaN;
            $tipoCuenta->descripcionActivoFjo = $request ->activoDescripcionN;
            $tipoCuenta->vidaUtilActivoFijo = $request ->activoVidaUtilN;
            $tipoCuenta->CatTipoCuentaActivoEstado	= 1;
            $tipoCuenta->Save();

            return redirect()->route('tipocuenta.all')->with('mensajeExitoso', 'Se ha guardado correctamente la cuenta '. $request->activoDescripcionN);
                
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
    public function update(request $request, $id)
    {
        try {
            
            $tipoCuenta = cattipocuentaactivofijo::where('idActivofijo','=',$id)->first();
                $tipoCuenta->ActivoFijoCodigoDescripcion = $request->CodigoCuentaE;
                $tipoCuenta->descripcionActivoFjo   =   $request->activoDescripcionE;
                $tipoCuenta->vidaUtilActivoFijo     =   $request->activoVidaUtilE;

                $tipoCuenta->save();
                return redirect()->route('tipocuenta.all')->with('mensajeExitoso', 'Se actualizo correctamente la informacion de la cuenta');
            
            //back()->with('mensajeExitoso','Se actualizo la informacion de la cuenta correctamente');

        } catch (exception $ex) {
            return 'Error - '.$ex->getMessage();
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id)
    {
        try {
            $tipoCuenta = cattipocuentaactivofijo::where('idActivofijo', '=', $id)->first();

            $tipoCuenta->CatTipoCuentaActivoEstado     =   2;

            $tipoCuenta->save();

            // cattipocuentaactivofijo::find($id)->delete();
            return redirect()->route('tipocuenta.all')->with('mensajeExitoso','Se desabilito correctamente la cuenta');
        } catch (exception $ex) {
            return "Error - ".$ex->getMessage();
        }
    }

    public function Recover($id){
        try {
            $tipoCuenta = cattipocuentaactivofijo::where('idActivofijo', '=', $id)->first();

            $tipoCuenta->CatTipoCuentaActivoEstado     =   1;

            $tipoCuenta->save();

            return redirect()->route('tipocuenta.all')->with('mensajeExitoso','Se habilito correctamente la cuenta');
        } catch (exception $ex) {
            return 'Error -'.$ex->getMessage();
        }
    }

     public function listarTipoCuenta(){
         try {
             $ActivoFijolista = cattipocuentaactivofijo::all()->where('CatTipoCuentaActivoEstado', '!=', '2');

             return $ActivoFijolista;
    //         return  foreach ($ActivoFijolista as $key => $value) {
    //             echo '<option value="'.$value->idActivofijo.'">'.$value->descripcionActivoFjo.'</option>';
    //         };

         } catch (Exception $ex) {
             return 'Error -'.$ex->getMessage();
         }
    }
}
