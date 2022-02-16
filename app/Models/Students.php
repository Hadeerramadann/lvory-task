<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Students extends Model
{
    use HasFactory;
    protected $table = 'Students';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected  $fillable = [
        'name'
       
    ];

    public function courses(){

        return  $this->belongsToMany(Coursses::class, 'coursses_students', 'student_id', 'cours_id');

    }
}
