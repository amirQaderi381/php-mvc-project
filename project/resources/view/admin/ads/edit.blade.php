@extends('admin.layouts.app')

@section('head-tag')
<title>ادمین | ویرایش اگهی </title>
@endsection

@section('content')
<div class="content-header row">

</div>
<div class="content-body">

    <!-- Zero configuration table -->
    <section id="basic-datatable">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">آگهی</h4>
                        <span><a href="<?= route('admin.ads.index') ?>" class="btn btn-success">بازگشت</a></span>
                    </div>
                    <div class="card-content">
                        <div class="card-body card-dashboard">

                            <form class="row" action="<?= route('admin.ads.update',['id'=>$ads->id]) ?>" method="post" enctype="multipart/form-data">
                                 <input type="hidden" name="_method" value="put">
                                <div class="col-md-6">
                                    <fieldset class="form-group">
                                        <label for="title">عنوان</label>
                                        <input name="title" type="text" id="title" value="<?= oldOrValue('title',$ads->title) ?>" class="form-control <?= errorClass('title') ?>" placeholder="عنوان ...">
                                        <?= errorText('title') ?>
                                    </fieldset>
                                </div>



                                <div class="col-md-6">
                                    <fieldset class="form-group">
                                        <label for="image">تصویر</label>
                                        <input name="image" type="file" id="image" class="form-control-file mb-2 <?= errorClass('image') ?>">
                                        <img src="<?= asset($ads->image)?>" alt="" width="450px" height="250px">
                                        <?= errorText('image') ?>
                                    </fieldset>
                                </div>

                                <div class="col-md-6">
                                    <fieldset class="form-group">
                                        <label for="address">آدرس</label>
                                        <input name="address" type="text" value="<?= oldOrValue('address',$ads->address) ?>" id="address" class="form-control <?= errorClass('address') ?>" placeholder="آدرس ...">
                                        <?= errorText('address') ?>
                                    </fieldset>
                                </div>


                                <div class="col-md-6">
                                    <fieldset class="form-group">
                                        <label for="floor">کف</label>
                                        <input name="floor" type="text" value="<?= oldOrValue('floor',$ads->floor) ?>" id="floor" class="form-control <?= errorClass('floor') ?>" placeholder="کف ...">
                                        <?= errorText('floor') ?>
                                    </fieldset>
                                </div>


                                <div class="col-md-6">
                                    <fieldset class="form-group">
                                        <label for="year">سال ساخت</label>
                                        <input name="year" type="text" value="<?= oldOrValue('year',$ads->year) ?>" id="year" class="form-control <?= errorClass('year') ?>" placeholder="سال ساخت ...">
                                        <?= errorText('year') ?>
                                    </fieldset>
                                </div>

                                <div class="col-md-6">
                                    <fieldset class="form-group">
                                        <label for="amount">قیمت</label>
                                        <input name="amount" type="text" value="<?= oldOrValue('amount',$ads->amount) ?>" id="amount" class="form-control <?= errorClass('amount') ?>" placeholder="قیمت ...">
                                        <?= errorText('amount') ?>
                                    </fieldset>
                                </div>

                                <div class="col-md-6">
                                    <fieldset class="form-group">
                                        <label for="area">متراژ</label>
                                        <input name="area" type="text" value="<?= oldOrValue('area',$ads->area) ?>" id="area" class="form-control <?= errorClass('area') ?>" placeholder="سال ساخت ...">
                                        <?= errorText('area') ?>
                                    </fieldset>
                                </div>

                                <div class="col-md-6">
                                    <fieldset class="form-group">
                                        <label for="room">اتاق</label>
                                        <input name="room" type="text" value="<?= oldOrValue('room',$ads->room) ?>" id="room" class="form-control <?= errorClass('room') ?>" placeholder="سال ساخت ...">
                                        <?= errorText('room') ?>
                                    </fieldset>
                                </div>


                                <div class="col-md-6">
                                    <fieldset class="form-group">
                                        <label for="tag">تگ</label>
                                        <input name="tag" type="text" value="<?= oldOrValue('tag',$ads->tag) ?>" id="tag" class="form-control <?= errorClass('tag') ?> " placeholder="تگ ...">
                                        <?= errorText('tag') ?>
                                    </fieldset>
                                </div>


                                <div class="col-md-12">
                                    <section class="form-group">
                                        <label for="description">متن</label>
                                        <textarea class="form-control " id="description" rows="5" name="description" placeholder="متن ...">
                                        <?= oldOrValue('description',$ads->description) ?>
                                        </textarea>
                                        <?= errorText('description') ?>
                                    </section>
                                </div>


                                <div class="col-md-6">
                                    <fieldset class="form-group">
                                        <div class="form-group">
                                            <label for="storeroom">انبار</label>
                                            <select name="storeroom" class="select2 form-control <?= errorClass('storeroom')?>">
                                                <option value="0" <?= oldOrValue('storeroom',$ads->storeroom) == 0 ? 'selected' : ''?> >ندارد</option>
                                                <option value="1" <?= oldOrValue('storeroom',$ads->stroeroom) == 1 ? 'selected' : ''?> >دارد</option>
                                            </select>
                                             <?= errorText('storeroom')?>
                                        </div>
                                    </fieldset>
                                </div>

                                <div class="col-md-6">
                                    <fieldset class="form-group">
                                        <div class="form-group">
                                            <label for="balcony">بالکن</label>
                                            <select name="balcony" class="select2 form-control <?= errorClass('balcony')?> ">
                                                <option value="0" <?= oldOrValue('balcony',$ads->balcony) == 0 ? 'selected' : ''?>>ندارد</option>
                                                <option value="1" <?= oldOrValue('balcony',$ads->balcony) == 1 ? 'selected' : ''?>>دارد</option>
                                            </select>
                                            <?= errorText('balcony')?>
                                        </div>
                                    </fieldset>
                                </div>

                                <div class="col-md-6">
                                    <fieldset class="form-group">
                                        <div class="form-group">
                                            <label for="toilet">توالت</label>
                                            <select name="toilet" class="select2 form-control <?= errorClass('toilet')?> ">
                                            <option value="ایرانی" <?= oldOrValue('toilet',$ads->toilet) == 'ایرانی' ? 'selected' : '' ?>>ایرانی</option>
                                                    <option value="فرنگی" <?= oldOrValue('toilet',$ads->toilet) == 'فرنگی' ? 'selected' : '' ?>>فرنگی</option>
                                                    <option value="ایرانی و فرنگی" <?= oldOrValue('toilet',$ads->toilet) == 'ایرانی و فرنگی' ? 'selected' : '' ?>>ایرانی و فرنگی</option>
                                            </select>
                                            <?= errorText('toilet')?>
                                        </div>
                                    </fieldset>
                                </div>


                                <div class="col-md-6">
                                    <fieldset class="form-group">
                                        <div class="form-group">
                                            <label for="sell_status">نوع آگهی</label>
                                            <select name="sell_status" class="select2 form-control" <? errorClass('sell_status')?>>
                                                <option value="0" <?= oldOrValue('sell_status',$ads->sell_status) == 0 ? 'selected' : ''?>>خرید</option>
                                                <option value="1" <?= oldOrValue('sell_satus',$ads->sell_status) == 1 ? 'selected' : ''?>>اجاره</option>
                                            </select>
                                            <?= errorText('sell_status')?>
                                        </div>
                                    </fieldset>
                                </div>

                                <div class="col-md-6">
                                    <fieldset class="form-group">
                                        <div class="form-group">
                                            <label for="type">نوع ملک</label>
                                            <select name="type" class="select2 form-control <?= errorClass('type')?>">
                                                <option value="0" <?= oldOrValue('type',$ads->type) == 0 ? 'selected' : ''?>>آپارتمان</option>
                                                <option value="1" <?= oldOrValue('type',$ads->type) == 1 ? 'selected' : ''?>>ویلایی</option>
                                                <option value="2" <?= oldOrValue('type',$ads->type) == 2 ? 'selected' : ''?>>زمین</option>
                                                <option value="3" <?= oldOrValue('type',$ads->type) == 3 ? 'selected' : ''?>>سوله</option>
                                            </select>
                                            <?= errorText('type')?>
                                        </div>
                                    </fieldset>
                                </div>


                                <div class="col-md-6">
                                    <fieldset class="form-group">
                                        <div class="form-group">
                                            <label for="parking">پارکینگ</label>
                                            <select name="parking" class="select2 form-control <?= errorClass('parking')?>">
                                                <option value="0" <?= oldOrValue('parking',$ads->parking) == 0 ? 'selected' : ''?>>ندارد</option>
                                                <option value="1" <?= oldOrValue('parking',$ads->parking) == 0 ? 'selected' : ''?>>دارد</option>
                                            </select>
                                        </div>
                                    </fieldset>
                                </div>


                                <div class="col-md-6">
                                    <fieldset class="form-group">
                                        <div class="form-group">
                                            <label for="cat_id">دسته</label>
                                            <select name="cat_id" class="select2 form-control <?= errorClass('cat_id')?>">
                                                <?php foreach ($categories as $categorySelect) { ?>
                                                    <option value="<?= $categorySelect->id ?>" <?= oldOrValue('cat_id',$ads->cat_id) == $categorySelect->id ? 'selected' : ''?>>
                                                        <?= $categorySelect->name ?>
                                                    </option>
                                                <?php } ?>
                                            </select>
                                            <?= errorText('cat_id')?>
                                        </div>
                                    </fieldset>
                                </div>

                                <div class="col-md-6">
                                    <section class="form-group">
                                        <button type="submit" class="btn btn-primary">ویرایش</button>
                                    </section>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
@endsection

@section('script')
<script src="<?= asset('ckeditor/ckeditor.js') ?>"></script>
<script>
    CKEDITOR.replace('description');
</script>
@endsection