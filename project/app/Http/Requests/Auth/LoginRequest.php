<?php

namespace App\Http\Requests\Auth;

use System\Request\Request;

class LoginRequest extends Request
{
    public function rules()
    {
        return [
            'email' => "required|max:64|email",
            'password' => "required",
        ];
    }
}