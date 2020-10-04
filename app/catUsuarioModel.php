<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class catUsuarioModel extends Model
{
    protected $table = 'users';
    protected $fillable = ['id','name','email', 'email_verified_at', 'password', 'remember_token','estado', 'created_at', 'updated_at'];
    protected $primarykey = 'id';
}
