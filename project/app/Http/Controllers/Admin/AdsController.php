<?php

namespace App\Http\Controllers\Admin;

use App\Ads;
use App\Gallery;
use App\Category;
use App\Http\Requests\Admin\GalleryRequest;
use System\Auth\Auth;
use App\Http\Requests\Admin\AdsRequest;
use App\Http\Services\ImageUpload;

class AdsController extends AdminController
{
    public function index()
    {
        $ads = Ads::all();
        return view('admin.ads.index', compact('ads'));
    }

    public function create()
    {
        $categories = Category::all();
        return view('admin.ads.create', compact('categories'));
    }

    public function store()
    {
        $request = new AdsRequest();
        $inputs = $request->all();
        $inputs['user_id'] = Auth::user()->id;
        $inputs['view'] = 0;
        $inputs['status'] = 0;
        $path = "images/ads/" . date("Y/M/d");
        $name = date("Y-m-d-H-i-s-") . rand(10, 99);
        $inputs['image'] = ImageUpload::UploadAndFitImage($request->file('image'), $path, $name, 800, 530);
        Ads::create($inputs);
        return redirect('admin/ads');
    }

    public function edit($id)
    {
        $ads = Ads::find($id);
        $categories = Category::all();
        return view('admin.ads.edit', compact('ads', 'categories'));
    }

    public function update($id)
    {
        $request = new AdsRequest();
        $inputs = $request->all();
        $inputs['id'] = $id;
        $file = $request->file('image');

        if (!empty($file['tmp_name'])) {

            $path = "images/ads/" . date("Y/M/d");
            $name = date("Y-m-d-H-i-s") . rand(10, 99);
            $inputs['image'] = ImageUpload::UploadAndFitImage($request->file('image'), $path, $name, 800, 530);
        }

        Ads::update($inputs);
        return redirect('admin/ads');
    }

    public function destroy($id)
    {
        Ads::delete($id);
        return back();
    }

    public function gallery($id)
    { 
        $advertise = Ads::find($id);
        $galleries=Gallery::where('advertise_id',$id)->get();
        return view('admin.ads.gallery',compact('advertise','galleries'));
        
    }

    public function storeGalleryImage($id)
    {
      $request= new GalleryRequest();
      $inputs=$request->all();
      $inputs['advertise_id']=$id;
      $path = "images/galleries/" . date("Y/M/d");
      $name = date("Y-m-d-H-i-s") . rand(10, 99);
      $inputs['image'] = ImageUpload::UploadAndFitImage($request->file('image'), $path, $name, 800, 530);
      Gallery::create($inputs);
      return back();
    }

    public function deleteGalleryImage($Gallery_id)
    {
        Gallery::delete($Gallery_id);
        return back();
    }
}
