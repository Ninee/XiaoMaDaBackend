<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateHotRanksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('hot_ranks', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nickname');
            $table->string('avatar');
            $table->tinyInteger('gender');
            $table->tinyInteger('role')->default(1);
            $table->text('intro');
            $table->integer('fans');
            $table->string('red_book_link')->nullable();
            $table->integer('red_book_fans')->default(0);
            $table->string('douyin_link')->nullable();
            $table->integer('douyin_fans')->default(0);
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
        Schema::dropIfExists('hot_ranks');
    }
}
