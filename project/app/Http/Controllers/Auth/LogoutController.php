<?php

namespace App\Http\Controllers\Auth;

use System\Auth\Auth;

class LogoutController
{
    protected $redirectTo="/home";

    public function logout()
    {
        Auth::logout();
        return redirect($this->redirectTo);
    }
}