<?php

namespace App\Http\Controllers\Admin;

use App\Comment;
use System\Auth\Auth;
use App\Http\Requests\Admin\CommentRequest;


class CommentController extends AdminController
{
  public function index()
  {
    $comments = Comment::all();
    return view('admin.comment.index', compact('comments'));
  }

  public function show($id)
  {
    $comment = Comment::find($id);
    return view('admin.comment.show', compact('comment'));
  }

  public function approved($id)
  {
    $comment = Comment::find($id);

    if ($comment->approved == 0) {

      Comment::update(['id' => $id, 'approved' => 1]);
      
    } else {

      Comment::update(['id' => $id, 'approved' => 0]);
    }

    return back();
  }

  public function answer($id)
  {
    $comment = Comment::find($id);
    $request = new CommentRequest();
    $inputs = $request->all();
    $inputs['user_id'] = Auth::user()->id;
    $inputs['post_id'] = $comment->post_id;
    $inputs['parent_id'] = $comment->id;
    $inputs['status'] = 0;
    $inputs['approved'] = 1;
    Comment::create($inputs);
    return redirect('admin/comment');
  }
}
