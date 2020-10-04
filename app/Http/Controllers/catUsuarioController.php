<?php

namespace App\Http\Controllers;

use App\catUsuarioModel;
use FFI\Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class catUsuarioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try {
            $listaUsuarios = catUsuarioModel::all()->where('estado','!=','0');
            $listaUsuariosDesactivado = catUsuarioModel::all()->where('estado','=','0');
            return view('usuarios',compact('listaUsuarios', 'listaUsuariosDesactivado'));
        } catch (exception $ex) {
            return 'Error -'.$ex->getMessage();
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
            $this->validate(request(),[
                'UserNombreN'=>'required',
                'UserEmailN'=>'required',
                'UserPasswordN'=>'required',
                'UserPasswordConfirmN' => 'required',
                'UserCreadoN' =>'required'
            ]);
            
            if ($request->UserPasswordN != $request->UserPasswordConfirmN) {
                return redirect()->route('usuario.all')->with('UsuarioMsgError','hay un error al registrar al usuario, realizar el proceso nuevamente');
            }else{
                $crearUsuario = new catUsuarioModel();

                $crearUsuario->name = $request->UserNombreN;
                $crearUsuario->email = $request->UserEmailN;
                $crearUsuario->password = Hash::make($request->UserPasswordN);
                $crearUsuario->created_at = $request->UserCreadoN;
                $crearUsuario->estado = 1;

                $crearUsuario->save();

                return redirect()->route('usuario.all')->with('UsuarioMsgExito','Se registro el usuario correctamente');
            }

        } catch (exception $ex) {
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
            $recuperarUsuario = catUsuarioModel::find($id);
            return $recuperarUsuario;
        } catch (exception $ex) {
            return 'Error -'.$ex->getMessage();
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
        try {
            $desactivarUsuario = catUsuarioModel::where('id','=', $id)->first();

            $desactivarUsuario->estado = 0;

            $desactivarUsuario->save();

            return redirect()->route('usuario.all')->with('MsgExito','Se desactivo la cuenta del usuario correctamente');
        } catch (exception $ex) {
            return 'Error -'.$ex->getMessage();
        }
    }

    public function recover($id)
    {
        try {
            $ActivarUsuario = catUsuarioModel::where('id', '=', $id)->first();

            $ActivarUsuario->estado = 1;

            $ActivarUsuario->save();

            return redirect()->route('usuario.all')->with('MsgExito', 'Se activo la cuenta del usuario correctamente');
        } catch (exception $ex) {
            return 'Error -' . $ex->getMessage();
        }
    }
}
