<?php

namespace App\Http\Requests;

use System\Request\Request;

class UserCommentPost extends Request
{
    public function rules()
    {
        return [
            'comment'=>'required|max:500'
        ];
    }
}