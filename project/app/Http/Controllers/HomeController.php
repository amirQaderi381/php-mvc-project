<?php

namespace App\Http\Controllers;

use App\Ads;
use App\Post;
use App\Slide;
use App\Comment;
use App\Category;
use App\Http\Requests\UserCommentPost;
use System\Auth\Auth;


class HomeController extends Controller
{
    public function index()
    {
        $slides = Slide::all();
        $latestAds = Ads::orderBy("created_at", "desc")->limit(0, 6)->get();
        $bestAds = Ads::orderBy("view", "desc")->orderBy("created_at", "desc")->limit(0, 4)->get();
        $latestPosts = Post::where("published_at", "<=", date("Y-m-d H:i:s"))->orderBy(
            "created_at",
            "desc"
        )->limit(0, 4)->get();

        return view("app.index",compact("slides","latestAds","bestAds","latestPosts"));
    }

    public function about()
    {
        return view("app.about");
    }
    
    public function allAds()
    {
        $ads=Ads::all();
        return view("app.all-ads",compact("ads"));
    }
    
    public function ads($id)
    {
        
        $advertisement=Ads::find($id);
        $galleries = $advertisement->galleries()->get();
        $relatedAds=Ads::where("cat_id",$advertisement->cat_id)->where("id","!=",
        $id)->limit(0,2)->get();
        $categories=Category::all();
        $posts=Post::where("published_at","<=",date("Y-m-d H:i:s"))->orderBy("created_at",
        "desc")->limit(0,4)->get();

        return view("app.ads",compact("advertisement","galleries","relatedAds","categories",
        "posts"));
    }

    public function allPost()
    {
        $posts=Post::all();
        return view("app.all-post",compact('posts'));
    }
    
    public function post($id)
    {
        $post=Post::find($id);
        $categories=Category::all();
        $posts=Post::where("published_at","<=",date("Y-m-d H:i:s"))->orderBy("created_at",
        "desc")->limit(0,4)->get();
        $comments=Comment::whereNull('parent_id')->where('post_id',$id)->where('approved',1)->get();
        return view("app.post",compact('post','categories','posts','comments'));
    }

    public function category($id)
    {
        $category=Category::find($id);
        $ads=$category->ads()->get();
        $posts=$category->post()->get();
        return view('app.category',compact('category','ads','posts'));
    }

    public function comment($post_id)
    {
        $request=new UserCommentPost();
        $inputs=$request->all();
        $inputs['post_id']=$post_id;
        $inputs['approved']=0;
        $inputs['status']=0;
        $inputs['user_id']=Auth::user()->id;
        Comment::create($inputs);
        return back();

    }

    public function search()
    {
        if(isset($_GET['search']))
        {
            $search='%'.$_GET['search'].'%';
            $ads=Ads::where('title','LIKE',$search)->whereOr('tag','LIKE',$search);
            $posts=Post::where('title','LIKE',$search);
            return view('app.search',compact('search'));

        }
    }

    public function ajaxLastPosts()
    {
        $posts=Post::where('published_at','<=',date('Y-m-d H:i:s'))->orderBy('created_at',
        'desc')->limit(0,4)->get();
         
        foreach($posts as $post)
        {
            $post->user=$post->user()->first_name." ".$post->user()->last_name;
            unset($post->user_id);
            $post->created_at=\Morilog\Jalali\Jalalian::forge($post->created_at)->format('%B %d، %Y');
            $post->url=route('home.post',[$post->id]);
        }
        
        header("Content-type:application/json");
        $result=json_encode($posts,JSON_UNESCAPED_UNICODE);
        echo $result;
        exit;
        
    }
    
}
