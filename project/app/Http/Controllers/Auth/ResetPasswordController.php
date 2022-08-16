<?php

namespace App\Http\Controllers\Auth;

use App\User;
use App\Http\Requests\Auth\ResetPasswordRequest;


class ResetPasswordController
{
    protected $redirectTo = "/login";

    public function view($token)
    {
        $user = User::where('remember_token', $token)->where(
            'remember_token_expire',
            '>=',
            date("Y/M/d H:i:s")
        )->get();

        if (empty($user)) {
            error("reset", "لینک بازیابی رمز عبور اعتبار ندارد");
            return back();
        }

        $user = $user[0];

        return view("auth.reset", compact('token'));
    }

    public function resetPassword($token)
    {
        $request = new ResetPasswordRequest();
        $inputs = $request->all();
        

        $user = User::where('remember_token', $token)->where(
            'remember_token_expire',
            '>=',
            date("Y/M/d H:i:s")
        )->get();

        if (empty($user)) {
            error("reset", "کاربر وجود ندارد");
            return back();
        }

       
        if ($inputs['password'] !== $inputs['new_password']) {
            error("reset", "اطلاعات با هم مطابقت ندارد");
            return back();
        }

        $user = $user[0];
        $user->password = password_hash($inputs['password'], PASSWORD_DEFAULT);
        $user->save();
        return redirect($this->redirectTo);

    }
}
