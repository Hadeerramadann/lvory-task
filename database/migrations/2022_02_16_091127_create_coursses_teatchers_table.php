<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCourssesTeatchersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('coursses_teatchers', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('teatcher_id');
            $table->foreign('teatcher_id')->references('id')->on('teatchers');
            $table->unsignedBigInteger('cours_id');
            $table->foreign('cours_id')->references('id')->on('coursses');
         
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('coursses_teatchers', function (Blueprint $table) {
            //
        });
    }
}
