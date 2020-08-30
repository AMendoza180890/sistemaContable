@extends('adminlte::page')

@section('title', 'Cat Terrenos')

@section('content_header')
    <h1>Catalogo de Terrenos</h1>
@stop

@section('content')
    <div class="card">
        <div class="card-header">
            <h1 class="card-title">Lista de Terrenos</h1>
        </div>
        <div class="card-body">
           <div class="card">
        <div class="box-header with-border">
            <button class="btn btn-primary" data-toggle="modal" data-target="#CrearCuentaActivo">Crear</button>
        </div>
        <div class="card-body">
           <table class="table table-bordered table-hover table-striped TB">
                     <thead>
                         <tr>
                             <th>N</th>
                             <th>Propietario</th>
                             <th>Area</th>
                             <th>Fecha de Compra</th>
                             {{-- <th>Editar / Eliminar</th> --}}
                         </tr>
                     </thead>
                        @foreach ($listaTerrenos as $terreno)
                            <tbody>
                                <td>{{$terreno -> catTerrenoId }}</th>
                                <td>{{$terreno -> catTerrenoPropietario }}</th>
                                <td>{{$terreno -> catTerrenoArea }}</th>
                                <td>{{$terreno -> catTerrenoFechaCompra }}</th>
                            </tbody>
                        @endforeach
                </table>
                </div>
            </div> 
        </div>
    </div>
@stop

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
@stop

@section('js')
    <script> console.log('Hi!'); </script>
@stop