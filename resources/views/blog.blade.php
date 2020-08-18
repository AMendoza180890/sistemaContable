@extends('adminlte::page')

@section('title', 'Blog')

@section('content_header')
    <h1>Blog</h1>
@stop

@section('content')
    <div class="card">
        <div class="card-header">
            <h1 class="card-title">Bienvenido</h1>
        </div>
        <div class="card-body">
            <p>Aqui estoy cargando Blog</p>
        </div>
    </div>
@stop

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
@stop

@section('js')
    <script> console.log('Hi!'); </script>
@stop