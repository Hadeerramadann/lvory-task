<?php

namespace App\Http\Controllers;
use DB;
use Illuminate\Http\Request;
use App\Models\Students;
use App\Models\Teatchers;
use App\Models\Coursses;


class ActionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       $Students =  Students::all();
       $Teatchers =  Teatchers::all();
       $Coursses =  Coursses::all();

       $data = array(
        'Students' => $Students, 
        'Teatchers' => $Teatchers, 
        'Coursses' => $Coursses, 

        

        ); 
        return view('welcome',compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function addCours(Request $request)
    {
        $data = $request->all();
        $CoursName=$data['name'];

        $Coursses= new Coursses();
        $Coursses ->name=$CoursName;
        $Coursses ->save();

        return redirect('/');
    }
    public function addStudent(Request $request)
    {
        $data = $request->all();
        $StudentName=$data['name'];

        $Students= new Students();
        $Students ->name=$StudentName;
        $Students ->save();

        return redirect('/');
    }
    public function addTeacher(Request $request)
    {
        $data = $request->all();
        $TeatcherName=$data['name'];

        $Teatchers= new Teatchers();
        $Teatchers ->name=$TeatcherName;
        $Teatchers ->save();

        return redirect('/');
    }

    public function CoursesStudent(Request $request)
    {
       $student= Students::find($request ->student_id);
       $student->courses()->attach($request ->coursesid);


        return redirect('/');
    }
    public function Coursesteacher(Request $request)
    {
       $Teatcher= Teatchers::find($request ->teacher_id);
       $Teatcher->courses()->attach($request ->coursesid);


        return redirect('/');
    }

    /**
     * Display the students details with all data of courses and teatchers.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($student_id)
    {
        
        $student= Students::find($student_id);
        $courses=$student ->courses;
        $student_name=$student ->name;
        return view('student_details',compact('courses','student_name'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function showCoursDetails($cours_id)
    {
        $cours=Coursses::find($cours_id);
        $teatchers=$cours->teatchers;
        $course_name=$cours ->name;

        return view('course_details',compact('teatchers','course_name'));

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
