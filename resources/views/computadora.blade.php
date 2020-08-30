@extends('adminlte::page')

@section('title', 'Cat Computadoras')

@section('content_header')
    <h1>Catalogo de Computadoras</h1>
@stop

@section('content')
    <div class="card">
        <div class="card-header">
            <h1 class="card-title">Listado de Equipos</h1>
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
                             <th>Modelo</th>
                             <th>Serie</th>
                             <th>Marca</th>
                             <th>Almacenamiento</th>
                             <th>TipoRAM</th>
                             <th>CantidadRAM</th>
                             <th>TipoSO</th>
                             <th>FechaCompra</th>
                             <th>costoEquipo</th>
                             {{-- <th>Editar / Eliminar</th> --}}
                         </tr>
                     </thead>
                        @foreach ($listaComputadoras as $computadoras)
                            <tbody>
                                <td>{{$computadoras -> catEquipoCompId }}</td>
                                <td>{{$computadoras -> catEquipoModelo }}</td>
                                <td>{{$computadoras -> catEquipoNumeroSerie }}</td>
                                <td>{{$computadoras -> catEquipoMarca }}</td>
                                <td>{{$computadoras -> catEquipoTamañoAlmacenamiento }}</td>
                                <td>{{$computadoras -> TipoMemoriaRAM }}</td>
                                <td>{{$computadoras -> catEquipoCantidadRAM }}</td>
                                <td>{{$computadoras -> catEquipoTipoSO }}</td>
                                <td>{{$computadoras -> catEquipoFechaCompra }}</td>
                                <td>{{$computadoras -> catEquipoCostoEquipo }}</td>
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