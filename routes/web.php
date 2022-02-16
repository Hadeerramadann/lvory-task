<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/', 'ActionController@index')->name('home');
Route::get('addCours', 'ActionController@addCours')->name('addCours');
Route::get('addStudent', 'ActionController@addStudent')->name('addStudent');
Route::get('addTeacher', 'ActionController@addTeacher')->name('addTeacher');

Route::get('CoursesStudent', 'ActionController@CoursesStudent')->name('CoursesStudent');
Route::get('Coursesteacher', 'ActionController@Coursesteacher')->name('Coursesteacher');


Route::get('details/{student_id}', 'ActionController@show')->name('details');
Route::get('coursDetails/{student_id}', 'ActionController@showCoursDetails')->name('coursDetails');


