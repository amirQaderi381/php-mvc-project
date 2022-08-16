<?php

namespace App\Http\Controllers\Auth;

use App\User;
use App\Http\Services\ImageUpload;
use App\Http\Requests\Auth\RegisterRequest;
use App\Http\Services\MailService;

class RegisterController
{
    protected $redirectTo = '/login';

    public function view()
    {
        return view('auth.register');
    }

    public function register()
    {
        $request = new RegisterRequest();
        $inputs = $request->all();
        $path = "images/avatar/" . date("Y/M/d");
        $name = date("Y-m-d-H-i-s-") . rand(10, 99);
        $inputs['avatar'] = ImageUpload::UploadAndFitImage($request->file('avatar'), $path, $name, 100, 100);
        $inputs['password'] = password_hash($request->password, PASSWORD_DEFAULT);
        $inputs['status'] = 0;
        $inputs['is_active'] = 0;
        $inputs['verify_token'] = generateToken();
        $inputs['user_type'] = 'user';
        $inputs['remember_token'] = null;
        $inputs['remember_token_expire'] = null;

        User::create($inputs);

        $message = '
         <h2>ایمیل فعال سازی</h2>
         <p>کاربر گرامی ثبت شما با موفقیت صورت گرفت برای فعال سازی حساب کاربری خود روی لینک زیر کلیک کنید</p>
         <p style="text-align:center">
            <a href="' . route('auth.activation', [$inputs['verify_token']]) . '">فعالسازی حساب کاربری</a>
         </p>

        ';

        $mailService = new MailService();
        $mailService->send($inputs['email'], 'ایمیل فعال سازی', $message);


        return redirect($this->redirectTo);
    }

    public function activation($token)
    {

        $user = User::where('verify_token', $token)->get();
        if (empty($user)) {
            die('کد اعتبار ندارد');
        }
        $user=$user[0];
        $user->is_Active = 1;
        $user->save();
        die('حساب کاربری فعال شد');
    }
}
