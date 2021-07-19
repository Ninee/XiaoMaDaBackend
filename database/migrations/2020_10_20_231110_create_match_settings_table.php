<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMatchSettingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('match_settings', function (Blueprint $table) {
            $table->increments('id');
            $table->string('pre_start');
            $table->string('pre_end');
            $table->integer('pre_fans');
            $table->string('final_start');
            $table->string('final_end');
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
        Schema::dropIfExists('match_settings');
    }
}
