@extends('admin.layouts.app')

@section('head-tag')
<title>ادمین | نظرات</title>
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
                        <h4 class="card-title">نظرات</h4>
                        <span><a href="#" class="btn btn-success disabled">ایجاد</a></span>
                    </div>
                    <div class="card-content">
                        <div class="card-body card-dashboard">

                            <div class="">
                                <table class="table zero-configuration">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>کاربر</th>
                                            <th>نظر</th>
                                            <th>وضعیت</th>
                                            <th>تنظیمات</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <?php $id=1 ?>
                                        <?php foreach ($comments as $comment) { ?>

                                            <tr role="row" class="odd">
                                                <td class="sorting_1"><?= $id++?></td>
                                                <td><?= $comment->user()->first_name?></td>
                                                <td><?= $comment->comment ?></td>
                                                <td><span class="<?= $comment->approved == 1 ? 'text-success' : 'text-danger' ?>">
                                                        <?= $comment->approved == 1 ? 'تایید شده' : 'در انتظار تایید' ?>
                                                    </span></td>
                                                <td>
                                                    <a href="<?= route('admin.comment.show',['id'=>$comment->id])?>" class="btn btn-success waves-effect waves-light">نمایش</a>

                                                    <?php if ($comment->approved == 1) { ?>
                                                        <a href="<?= route('admin.comment.approved',['id'=>$comment->id])?>" class="btn btn-danger waves-effect waves-light">لغو تایید</a>
                                                    <?php } ?>

                                                    <?php if ($comment->approved == 0) { ?>
                                                        <a href="<?= route('admin.comment.approved',['id'=>$comment->id])?>" class="btn btn-warning waves-effect waves-light">تائید</a>
                                                    <?php } ?>
                                                </td>
                                            </tr>
                                        <?php } ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/ Zero configuration table -->
</div>
@endsection