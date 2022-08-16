<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar" style="direction: rtl;">
    <div class="container">
        <a class="navbar-brand" href="<?= route('home.home') ?>">Royal<span>estate</span></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> منو
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item <?= (currentUrl() == route('home.home')) ? 'active' : '' ?>"><a href="<?= route('home.home') ?>" class="nav-link">خانه</a></li>
                <li class="nav-item <?= (currentUrl() == route('home.all.ads')) ? 'active' : '' ?>"><a href="<?= route('home.all.ads') ?>" class="nav-link">آگهی ها</a></li>
                <li class="nav-item <?= (currentUrl() == route('home.about')) ? 'active' : '' ?>"><a href="<?= route('home.about') ?>" class="nav-link">درباره ما</a></li>
                <li class="nav-item <?= (currentUrl() == route('home.all.post')) ? 'active' : '' ?>"><a href="<?= route('home.all.post') ?>" class="nav-link">بلاگ</a></li>

                <?php if (\System\Auth\Auth::checkLogin()) { ?>
                    <?php if (\System\Auth\Auth::user()->user_type == 'admin') { ?>
                    
                       

                        <li class="nav-item bg-warning"><a href="<?= route('admin.index') ?>" class="nav-link text-white px-4"> پنل ادمین</a></li>
                       
                            <p class="text-cta px-4 m-auto"><?= \System\Auth\Auth::user()->first_name . " " . \System\Auth\Auth::user()->last_name ?></p>
                       
                        <li class="nav-item bg-danger"><a href="<?= route('auth.logout') ?>" class="nav-link text-white px-4"> خروج</a></li>



                    <?php } else { ?>
                        <li class="nav-item cta"><?= \System\Auth\Auth::user()->first_name . " " . \System\Auth\Auth::user()->last_name ?></li>

                        <li class="nav-item bg-danger"><a href="<?= route('auth.logout') ?>" class="nav-link ml-lg-1 mr-lg-5"> خروج</a></li>
                    <?php } ?>
                <?php } else { ?>
                    <li class="nav-item cta"><a href="<?= route('auth.login.view') ?>" class="nav-link ml-lg-1 mr-lg-5"><span class="icon-user m-2"></span>ورود</a></li>
                    <li class="nav-item cta cta-colored"><a href="<?= route('auth.register.view') ?>" class="nav-link"><span class="icon-pencil m-2"></span>ثبت نام</a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
</nav>