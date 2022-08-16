<?php

namespace App\Http\Controllers\Auth;

use App\User;
use System\Session\Session;
use App\Http\Requests\Auth\ForgotRequest;
use App\Http\Services\MailService;


class ForgotController
{
    private $redirectTo="/home";

    public function view()
    {
        return view('auth.forgot');
    }

    public function forgot()
    {
       if(Session::get('forgot_password') != false && time() < Session::get('forgot_password'))
       {
          error('forgot','کاربر گرامی لطفا دو دقیقه صبر کنید و مجددا تلاش کنید ');
          
          return back();
       }
        else
        {
            Session::set('forgot_password',time()+120);
            $request=new ForgotRequest();
            $inputs=$request->all();
            $user=User::where('email',$inputs['email'])->get();

            if(empty($user))
            {
                error('forgot','کاربر وجود ندار');
                return back();
            }

            $user=$user[0];
            $user->remember_token=generateToken();
            $user->remember_token_expire=date("Y-m-d H:i:s" , strtotime(" + 10 min"));
            $user->save();

            $message = '

            <h2>ایمیل بازیابی رمز عبور</h2>
            <p>کاربر گرامی برای بازیابی رمز عبور از لینک زیر استفاده نمایید .</p>
            <p style="text-align:center">
               <a href="' . route('auth.reset.password.view', [$user->remember_token]) . '"> بازیابی رمز عبور </a>
            </p>
   
           ';

           $mailService=new MailService();
           $mailService->send($user->email,'ایمیل بازیابی رمز عبور',$message);
           flash('forgot', 'ایمیل بازیابی با موفقیت ارسال شد');
           
           return redirect($this->redirectTo);
        }
    }
}