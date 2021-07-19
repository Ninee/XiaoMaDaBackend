<?php

namespace App;

use App\Models\Follow;
use App\Models\Order;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Tymon\JWTAuth\Contracts\JWTSubject;

class User extends Authenticatable implements JWTSubject
{
    use Notifiable;

    const ROLE_VIEWER = 0;
    const ROLE_MEMBER = 1;
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'mobile', 'password', 'openid', 'nickname', 'avatar', 'gender', 'wechat_id', 'intro',
        'red_book_link', 'red_book_fans', 'douyin_link', 'douyin_fans', 'is_business'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * Get the identifier that will be stored in the subject claim of the JWT.
     *
     * @return mixed
     */
    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array
     */
    public function getJWTCustomClaims()
    {
        return [];
    }

    public function orders()
    {
        return $this->hasMany(Order::class, 'user_id');
    }

    public function getIntroAttribute()
    {
        if ($this->attributes['intro']) {
            return $this->attributes['intro'];
        } else {
            return '';
        }
    }
    public function followers()
    {
        return $this->hasMany(Follow::class, 'idol_id', 'id');
    }
}
