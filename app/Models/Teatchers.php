<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Teatchers extends Model
{
    use HasFactory;
    protected $table = 'Teatchers';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected  $fillable = [
        'name'
       
    ];


    public function courses(){

        return  $this->belongsToMany(Coursses::class, 'coursses_teatchers', 'teatcher_id', 'cours_id');

    }
}
