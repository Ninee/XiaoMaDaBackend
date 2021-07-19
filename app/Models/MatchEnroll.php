<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MatchEnroll extends Model
{
    public function zone()
    {
        return $this->belongsTo(MatchZone::class);
    }

    public function track()
    {
        return $this->belongsTo((Track::class));
    }
}
