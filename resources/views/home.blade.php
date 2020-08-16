@extends('adminlte::page')

@section('title', 'Sistema Contable')

@section('content_header')
    <h1>Escritorio</h1>
@stop

@section('content')
    <div class="card">
        <div class="card-header">
            <h1 class="card-title">Bienvenido</h1>
        </div>
        <div class="card-body">
            <p>Este es el panel administrativo para las operaciones contables</p>
        </div>
    </div>
@stop

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
@stop

@section('js')
    <script> console.log('Hi!'); </script>
@stop