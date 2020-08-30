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
            <p>Aqui estoy cargando tipo Cuentas</p>
        </div>
    </div>
@stop

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
@stop

@section('js')
    <script> console.log('Hi!'); </script>
@stop