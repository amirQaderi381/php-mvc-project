<?php

namespace App\Http\Requests\Auth;

use System\Request\Request;

class ForgotRequest extends Request
{
    public function rules()
    {
        return [

            'email'=>'required|max:64|email|exist:users,email'
        ];
    }
}