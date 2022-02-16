<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Coursses extends Model
{
    use HasFactory;
    protected $table = 'Coursses';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected  $fillable = [
        'name'
       
    ];

    public function teatchers(){

        return  $this->belongsToMany(Teatchers::class, 'coursses_teatchers',  'cours_id','teatcher_id');

    }
    public function students(){

        return  $this->belongsToMany(Students::class, 'coursses_students',  'cours_id','student_id');

    }
}
