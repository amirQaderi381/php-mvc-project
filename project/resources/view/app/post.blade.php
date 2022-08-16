@extends('app.layouts.app')

@section('head-tag')
<title>بلاگ</title>
@endsection

@section('content')
<div class="hero-wrap" style="background-image: url('<?= asset('admin-assets/images/home/bg_1.jpg') ?>');">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
                <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="<?= route('home.home') ?>">خانه</a></span> <span class="mr-2"><a href="<?= route('home.all.post') ?>">بلاگ ها</a></span> <span>
                        <p><?= $post->title ?></p>
                    </span>

                <h1 class="mb-3 bread">بلاگ</h1>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section ftco-degree-bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 ftco-animate">
                <h2 class="mb-3"><?= $post->title ?></h2>
                <img src="<?= asset($post->image) ?>" alt="" class="w-100 mt-3">
                <p class="py-4">
                    <?= html_entity_decode($post->body) ?>
                </p>

                <div class="tag-widget post-tag-container mb-5 mt-5">
                    <div class="tagcloud">
                        <a href="#" class="tag-cloud-link">مسکن</a>
                        <a href="#" class="tag-cloud-link">فروش</a>
                        <a href="#" class="tag-cloud-link">اخبار</a>
                    </div>
                </div>


                <div class="pt-5 mt-5">
                    <h3 class="mb-5">نظرات</h3>
                    <ul class="comment-list">
                        <?php foreach ($comments as $comment) { ?>
                            <li class="comment">
                                <div class="vcard bio">
                                    <img src="<?= $comment->user()->avatar ?>" alt="Image placeholder">
                                </div>
                                <div class="comment-body">
                                    <h3><?= $comment->user()->first_name . " " . $comment->user()->last_name ?></h3>
                                    <div class="meta"><?= \Morilog\Jalali\Jalalian::forge($post->created_at)->format('%B %d، %Y') ?></div>
                                    <p><?= $comment->comment ?></p>

                                </div>

                                <?php
                                $childComment = $comment->child()->get();
                                if (!empty($childComment)) {
                                ?>

                                    <ul class="children">
                                        <?php foreach ($childComment as $comment) { ?>
                                            <li class="comment">
                                                <div class="vcard bio">
                                                    <img src="<?= $comment->user()->avatar ?>" alt="Image placeholder">
                                                </div>
                                                <div class="comment-body">
                                                    <h3>پاسخ ادمین: <?= $comment->user()->first_name . " " . $comment->user()->last_name ?></h3>
                                                    <div class="meta"><?= \Morilog\Jalali\Jalalian::forge($post->created_at)->format('%B %d، %Y') ?></div>
                                                    <p><?= $comment->comment ?></p>

                                                </div>
                                            </li>
                                        <?php } ?>
                                    </ul>
                                <?php } ?>
                            </li>
                        <?php } ?>
                    </ul>
                    <!-- END comment-list -->

                    <?php if (\System\Auth\Auth::checkLogin()) { ?>

                        <div class="comment-form-wrap pt-5">
                            <h3 class="mb-5">درج نظر</h3>
                            <form action="<?= route('home.post.comment', [$post->id]) ?>" class="p-5 bg-light" method="post">
                                <div class="form-group">
                                    <label for="message">پیام</label>
                                    <textarea name="comment" id="message" cols="30" rows="10" class="form-control"></textarea>
                                </div>
                                <div class="form-group">
                                    <input type="submit" value="ارسال نطر" class="btn py-3 px-4 btn-primary">
                                </div>

                            </form>
                        </div>
                    <?php } else { ?>
                        <p>برای ثبت نظر باید ابتدا وارد حساب خود شوید </p>
                        <div class="w-50 d-flex ">
                            <a href="<?= route('auth.login.view')?>" class="btn btn-success d-flex align-items-center mx-2 w-25">
                                <span class="icon-user m-2"></span>
                                ورود
                            </a>
                            <a href="<?= route('auth.register.view')?>" class="btn btn-primary d-flex align-items-center">
                                <span class="icon-pencil m-2"></span>
                                ثبت نام
                            </a>
                        </div>
                    <?php } ?>
                </div>

            </div> <!-- .col-md-8 -->
            <div class="col-lg-4 sidebar ftco-animate">

                <div class="sidebar-box ftco-animate">
                    <div class="categories">
                        <h3>دسته بندی ها</h3>
                        <?php foreach ($categories as $category) { ?>
                            <li><a href="<?= route('home.category',[$category->id])?>"><?= $category->name ?> <span>(<?= count($category->ads()->get()) ?>)</span></a></li>
                        <?php } ?>
                    </div>
                </div>

                <div class="sidebar-box ftco-animate">
                    <h3>اخرین بلاگ ها</h3>
                    <?php foreach ($posts as $post) { ?>
                        <div class="block-21 mb-4 d-flex">
                            <a class="blog-img mr-4" style="background-image: url('<?= asset($post->image) ?>');"></a>
                            <div class="text">
                                <h3 class="heading"><a href="#"><?= $post->title ?></a></h3>
                                <div class="meta">
                                    <div><a href="#"><span class="icon-calendar"></span> <?= \Morilog\Jalali\Jalalian::forge($post->created_at)->format('%B %d، %Y') ?></a></div>
                                    <div><a href="#"><span class="icon-person"></span> <?= $post->user()->first_name . " " . $post->user()->last_name ?></a></div>
                                    <div><a href="#"><span class="icon-chat"></span> ۱۹</a></div>
                                </div>
                            </div>
                        </div>
                    <?php } ?>
                </div>




            </div>
        </div>
</section> <!-- .section -->

@endsection