-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 18, 2022 at 05:57 PM
-- Server version: 5.7.36-cll-lve
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `new_mvc`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `address` text NOT NULL,
  `amount` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `floor` varchar(191) NOT NULL,
  `year` tinyint(5) NOT NULL,
  `storeroom` tinyint(1) NOT NULL,
  `balcony` tinyint(1) NOT NULL,
  `area` tinyint(5) NOT NULL,
  `room` tinyint(5) NOT NULL,
  `toilet` enum('ایرانی','فرنگی','ایرانی و فرنگی','') NOT NULL,
  `parking` tinyint(5) NOT NULL,
  `tag` varchar(191) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `cat_id` bigint(20) NOT NULL,
  `status` tinyint(5) NOT NULL,
  `sell_status` tinyint(4) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `view` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `title`, `description`, `address`, `amount`, `image`, `floor`, `year`, `storeroom`, `balcony`, `area`, `room`, `toilet`, `parking`, `tag`, `user_id`, `cat_id`, `status`, `sell_status`, `type`, `view`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2 واحد آپارتمان در مجموعه آسیا', '&lt;p&gt;بسیار عالی . حیاط بزرگ . سه پارکینگ مجزا . منظره بی نظیر . آسانسور . تک واحدی&lt;/p&gt;\r\n', 'تهران - خیابان شریعتی - مجموعه آسیا', '42000 تومان', '/images/ads/2022/Jan/04/2022-01-04-09-35-1249.jpg', 'سرامیک', 127, 0, 1, 114, 3, 'ایرانی و فرنگی', 1, 'مجموعه آسیا, آپارتمان', 1, 2, 0, 0, 0, 0, '0000-00-00 00:00:00', '2022-01-04 14:20:49', '0000-00-00 00:00:00'),
(2, 'خانه ویلای در نیاوران', '&lt;p&gt;مکانی زیبا و دلنشین برای زندگی کردن&amp;nbsp;&lt;/p&gt;\r\n', 'تهران - نیاوران - خیابان گلشن ', '650000 تومان', '/images/ads/2022/Jan/04/2022-01-04-09-35-3029.jpg', 'سرامیک', 127, 0, 1, 127, 5, 'ایرانی و فرنگی', 1, 'ویلایی, نیاوران', 1, 3, 0, 0, 0, 0, '0000-00-00 00:00:00', '2022-01-24 14:38:29', '0000-00-00 00:00:00'),
(3, 'آپارتمان 65 متری - صادقیه', 'جای قشنگی برای زندگی کردنه', 'تهران - صادقیه - فلکه دوم صادقیه - کوچه آفتاب شرقی', 'توافقی', '/images/ads/2022/Jan/04/2022-01-04-09-36-1683.jpg', 'سرامیک', 127, 0, 1, 75, 2, 'ایرانی و فرنگی', 1, 'آپارتمان, صادقیه, 75متری', 1, 3, 0, 0, 0, 0, '2020-07-12 13:09:12', '2022-01-04 13:06:16', '0000-00-00 00:00:00'),
(4, 'آپارتمان 80 متری در ایران زمین', '&lt;p&gt;ساختمان&lt;/p&gt;\r\n', 'ارین زمین - مجتمع رویال - بوک A - پلاک 12', 'توافقی', '/images/ads/2022/Jan/04/2022-01-04-09-36-3497.jpg', 'سرامیک', 127, 0, 1, 127, 2, 'ایرانی و فرنگی', 0, 'آپارتمان, ایران زمین', 1, 3, 0, 1, 0, 0, '2020-07-17 13:48:18', '2022-01-04 13:06:34', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(20) NOT NULL,
  `name` varchar(191) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'آپارتمان', NULL, '2020-07-09 23:01:44', '2022-01-08 13:28:01', NULL),
(2, 'تجاری', NULL, '2020-07-10 00:00:00', '2022-01-08 13:28:10', NULL),
(3, 'وییلایی', NULL, '2020-07-10 17:50:39', '2022-01-08 13:28:25', NULL),
(4, 'برج', NULL, '2020-07-10 17:52:42', '2022-01-08 13:28:38', NULL),
(5, 'فرهنگ و هنر', 1, '2020-07-10 17:53:14', '2020-07-14 02:14:27', '2020-07-14 02:14:38');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `comment` text NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `status` tinyint(5) NOT NULL DEFAULT '0',
  `approved` tinyint(5) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `post_id`, `comment`, `parent_id`, `status`, `approved`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 'test', NULL, 0, 1, '2020-07-11 00:00:00', '2020-07-18 00:09:20', NULL),
(2, 1, 2, 'پاسخ ادمین', 1, 0, 1, '2020-07-13 00:00:00', '2020-07-18 00:09:26', NULL),
(3, 5, 2, 'پست بسیار عالی بود', NULL, 0, 0, '2020-07-13 23:48:26', '2021-12-22 13:45:06', NULL),
(4, 1, 2, 'سپاس از شما!', 1, 0, 1, '2020-07-17 15:51:51', NULL, NULL),
(5, 1, 1, 'بازم ممنون', NULL, 0, 1, '2020-07-17 15:53:16', NULL, NULL),
(6, 1, 2, 'باز هم ممنون از شما', 1, 0, 0, '2020-07-17 15:54:46', '2022-01-24 16:08:19', NULL),
(7, 1, 2, 'این کامنت تستی است\r\n', 1, 0, 0, '2020-07-17 15:56:46', '2022-01-24 16:08:23', NULL),
(15, 1, 2, 'پاسخ تستی', 1, 0, 1, '2021-12-24 06:37:25', NULL, NULL),
(16, 14, 1, 'this is admin message', NULL, 0, 1, '2022-01-21 20:08:00', '2022-01-21 20:08:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` bigint(20) NOT NULL,
  `image` varchar(191) NOT NULL,
  `advertise_id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `image`, `advertise_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(15, '/images/galleries/2021/Dec/20/2021-12-20-12-40-1326.jpg', 1, '2021-12-20 12:40:13', NULL, NULL),
(16, '/images/galleries/2021/Dec/20/2021-12-20-12-41-0050.png', 1, '2021-12-20 12:41:00', NULL, '2021-12-20 12:48:45'),
(17, '/images/galleries/2022/Jan/07/2022-01-07-09-08-2172.jpg', 3, '2022-01-07 12:38:21', NULL, NULL),
(18, '/images/galleries/2022/Jan/07/2022-01-07-09-08-2766.jpg', 3, '2022-01-07 12:38:27', NULL, NULL),
(19, '/images/galleries/2022/Jan/07/2022-01-07-09-08-4850.jpg', 3, '2022-01-07 12:38:48', NULL, NULL),
(20, '/images/galleries/2022/Jan/07/2022-01-07-11-54-1689.jpg', 1, '2022-01-07 15:24:16', NULL, NULL),
(21, '/images/galleries/2022/Jan/24/2022-01-24-11-10-3937.jpg', 2, '2022-01-24 14:40:40', NULL, NULL),
(22, '/images/galleries/2022/Jan/24/2022-01-24-11-10-5093.jpg', 2, '2022-01-24 14:40:50', NULL, NULL),
(23, '/images/galleries/2022/Jan/24/2022-01-24-11-12-4730.jpg', 4, '2022-01-24 14:42:47', NULL, NULL),
(24, '/images/galleries/2022/Jan/24/2022-01-24-11-12-5244.jpg', 4, '2022-01-24 14:42:53', NULL, NULL),
(25, '/images/galleries/2022/Jan/27/2022-01-27-22-12-1071.jpg', 1, '2022-01-27 22:12:10', NULL, '2022-01-28 18:55:19'),
(26, '/images/galleries/2022/Jan/28/2022-01-28-18-55-1241.jpg', 1, '2022-01-28 18:55:12', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) NOT NULL,
  `title` varchar(191) NOT NULL,
  `body` text NOT NULL,
  `image` text NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `cat_id` int(10) NOT NULL,
  `published_at` datetime NOT NULL,
  `status` tinyint(5) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `image`, `user_id`, `cat_id`, `published_at`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ساخت یک میلیون مسکن از آرزو تا واقعیت', 'به نظر می رسد هدف&amp;zwnj;گذاری مجلس و دولت برای ساخت سالیانه یک میلیون واحد مسکونی، تنها به پشتوانه تزریق پول پرقدرت توسط بانک مرکزی ارائه شده که آن هم با توجه به اثرات مخرب اقتصادی و همچنین نبود منابع لازم قابل تحقق نیست؛ شاید به همین دلیل است که پس از جلسه امروز وزیر با اعضای کمیسیون عمران مجلس، خروجی خاصی درباره نحوه تامین بودجه این طرح به دست نیامد. به گزارش ایسنا، جلسه&amp;zwnj;ای که روز یکشنبه در خصوص نهایی شدن نحوه تامین مالی طرح احداث سالانه یک میلیون واحد مسکن ملی تا ۶ سال آینده منتظرش بودیم، امروز سه شنبه ۲۴ تیرماه برگزار شد. با این تفاوت که نه خبری از تزریق پول پرقدرت بانک مرکزی و نه جزئیاتی از چگونگی مشارکت بخش خصوصی در این طرح اعلام شد. امروز نمایندگان عضو کمیسیون عمران مجلس با محمد اسلامی وزیر راه و شهرسازی نشستی را برگزار کردند. پیش از این برخی نمایندگان گفته بودند که طرحی را با همکاری دولت تحت عنوان احداث یک میلیون واحد مسکونی در سال مد نظر دارند. محمودزاده معاون وزیر راه و شهرسازی هم ضمن تایید بر این تعامل، به ایسنا گفت که دولت قصد ورود به ساخت و ساز را ندارد و این موضوع توسط بخش خصوصی انجام می&amp;zwnj;شود. قرار بود یکشنبه ۲۲ تیرماه نحوه تامین مالی این طرح نهایی شود. به هر حال امروز سه&amp;zwnj;شنبه نشست کمیسیون عمران با وزیر راه و شهرسازی انجام شد. پس از این جلسه، محمد اسلامی وزیر راه و شهرسازی گفت: طرح ملی مسکن با مدل&amp;zwnj;های گوناگونی تامین مالی خواهد شد که هم&amp;zwnj;اکنون نیز در حال اجراست. در عین حال، این مدل&amp;zwnj;ها با طرحی که در مجلس پیشنهاد شده است می&amp;zwnj;تواند نیاز جامعه به مسکن را تامین کند و التهابات حباب گونه بخش مسکن را که در حال حاضر شاهد آن هستیم، از بین ببرد. شاید منظور اسلامی استفاده از ابزارهایی همچون صندوق سرمایه گذاری زمین و ساختمان، صندوقهای سرمایه گذاری املاک و مستغلات، حسابهای امانی، بازار رهن ثانویه، لیزینگ مسکن، توسعه ای شدن بانک مسکن، موسسات پس انداز و تسهیلات مسکن و صندوق پس انداز یکم باشد که برخی از آنها یا اصلاً اجرا نمی&amp;zwnj;شود و یا کارایی چندانی ندارد. این صحبت&amp;zwnj;های وزیر که البته واقع بینانه تر است دست اندازی به منابع بانک مرکزی است نشان می&amp;zwnj;دهد دولت در شرایط فعلی که رسیدن به تورم ۲۲ درصد را هدف&amp;zwnj;گذاری کرده قصد ندارد همانند آنچه در پروژه مسکن مهر دولت های قبلی انجام شد با تزریق پول پرقدرت، تورم مجددی را به جامعه تحمیل کند. سید البرز حسینی، سخنگوی کمیسیون عمران مجلس هم که درباره جزئیات جلسه امروز صحبت کرد، به موضوع بازآفرینی شهری و تامین قیر برای راهسازی پرداخت و اشاره خاصی به تامین مالی پروژه های بزرگ مقیاس در بخش مسکن نداشت. وی البته گفت: یکی از مسائل مهم اجرای طرح اقدام ملی مسکن است که در این رابطه نمایندگان مجلس نیز طرحی را تدوین کرده&amp;zwnj;اند، از این رو با اجرای این طرح و تولید مسکن امیدواریم که بخشی از التهابات و حباب بازار کاهش یابد. ساخت یک میلیون خانه در سال واقع&amp;zwnj;بینانه نیست مهدی سلطان محمدی - کارشناس اقتصاد مسکن - درباره طرح مجلس و دولت برای احداث سالیانه یک میلیون واحد مسکونی به ایسنا گفت: تولید یک میلیون خانه در سال نیاز به ۲۵۰ هزار میلیارد تومان نقدینگی دارد. کل بودجه عمرانی دولت کمتر از ۵۰ هزار میلیارد تومان است؛ لذا صحبت از طرح&amp;zwnj;های بزرگ مقیاس مسکن در حد شعار خواهد بود و قابلیت تحقق ندارد. وی افزود: دولت به دلیل کاهش درآمدهای نفتی، کاهش صادرات و رکود ناشی از کرونا دچار کمبود منابع شده و نوساناتی که در بازارهای مسکن، بورس، ارز و طلا می&amp;zwnj;بینیم در واقع انعکاسی از خشکی منابع دولتی است. به گفته سلطان محمدی، دولت مجبور است به اطراف شهرها برود که بحث آماده&amp;zwnj;سازی و زیرساخت&amp;zwnj;ها را خواهد داشت؛ لذا در خوشبینانه&amp;zwnj;ترین حالت معادل همین ۲۵۰ هزار میلیارد تومان را باید خرج زیرساخت&amp;zwnj;ها کند. چنین منابعی موجود نیست؛ پس نباید شعارهایی مثل احداث یک میلیون خانه در سال بدهیم که امکان تحقق آن وجود ندارد.', 's:52:\"/images/posts/2022/Jan/08/2022_01_08_10_14_11_93.jpg\";', 14, 1, '2020-07-09 00:00:00', 0, '2020-07-09 23:08:13', '2022-04-06 20:30:05', NULL),
(2, 'تعیین قیمت&zwnj;های دل&zwnj;خواه در بازار مسکن', 'راه های جایگزین برای تعیین قیمت در این بین روز ۲۱ اردیبهشت ماه بنا به دستور قضایی، ممنوعیت سایت های فروش ملک از درج قیمت مسکن اجرا شد. هرچند آمار خرداد نشان داد این اقدام در کنترل قیمت ها تاثیر چندانی نداشته است. از طرف دیگر به نظر می رسد سایت ها برای دور زدن قانون و تعیین قیمت، راه های جایگزین مثل استفاده از فضای مجازی و سایر اپلیکیشن ها را در پیش گرفته اند. بر این اساس گروهی از کارشناسان معتقدند با با توجه به گسترش وسایل ارتباط جمعی، حذف قیمت از بازار ها امکان پذیر نیست. مضافاً اینکه برداشتن قیمت، شفافیت را از بازار می گیرد و متعاملین را سردرگم می&amp;zwnj;کند. در سوی مقابل، عده&amp;zwnj;ای دیگر از جمله رئیس اتحادیه مشاوران املاک، هرج و مرج قیمتی در سایت&amp;zwnj;های​ فروش مسکن را از عوامل اصلی التهابات بازار ملک می دانند. مصطفی قلی خسروی می&amp;zwnj;گوید که ممنوعیت نرخ گذاری در سایت ها بازار را در میان مدت به آرامش می رساند. کاهش آگهی های مجازی بعد از حذف قیمت ها اما از زمان آغاز این محدودیت، مدیران سایتها که به نظر می رسد با کاهش عرضه کنندگان و متقاضیان مسکن روبرو شده&amp;zwnj;اند از این دستور قضایی دلخورند. گذشته از اینکه بعضاً تلاش می کنند با تکنیک های مختلف مثل امکان مشاهده قیمت در آگهی های نشان دار یا استفاده از تلگرام و دیگر اپلیکیشن ها برای تعیین قیمت استفاده کنند، محدودیت نرخ گذاری را برای متعاملین دردسرساز می دانند. تا جایی که یکی از اپلیکیشن ها ذیل تمامی آگهی&amp;zwnj;های خود نوشته: &amp;laquo;این موضوع باعث افزایش هزینه&amp;zwnj;های کاربران در جستجو، برقراری تماس های بیهوده و طولانی تر شدن زمان مذاکرات شده که بر خلاف اهداف ما در تسریع و ساده سازی معاملات شما و ایجاد شفافیت در بازار است&amp;raquo;. پایین آگهی&amp;zwnj;های یکی دیگر از سایتها نوشته شده است: &amp;laquo;با توجه به دستور مقام قضایی، امکان نمایش قیمت ها وجود ندارد. با پوزش نسبت به مشکلاتی که این اقدام برای شما به وجود آورده، تا پایان این محدودیت ناخواسته، برای اطلاع از قیمت با فروشنده تماس بگیرید.&amp;raquo; یک نماینده: سایت ها مجددا نرخ&amp;zwnj;گذاری را آغاز کرده&amp;zwnj;اند در این زمینه امروز یک عضو کمیسیون برنامه و بودجه مدعی شد که نرخ گذاری مسکن و خودرو در سایت ها مجدداً آغاز شده است. رحیم زارع اظهار کرد: سودجویان با سوء استفاده از وضعیت افزایش نرخ ارز و طلا در کشور بار دیگر قیمت گذاری را در سایت ها آغاز کرده&amp;zwnj;اند که این اقدام روی التهاب بازار مسکن و خودرو و افزایش قیمت ها تاثیر گذار است اما قوه قضاییه می&amp;zwnj;تواند با چارچوب تعیین شده خود جلوی افزایش قیمت&amp;zwnj;های یک&amp;zwnj;شبه را بگیرد. به دنبال این سخنان، برخی از سایت&amp;zwnj;های مشهور فروش مسکن را بررسی کردیم که نشان می دهد هم اکنون قیمت ها قابل مشاهده نیست. ممکن است برای مدت کوتاهی مشاهده نرخ ها را امکان&amp;zwnj;پذیر کرده باشند. هرچند با استفاده از دیگر فضا ها و ابزارها اقدام به تعیین نرخ می&amp;zwnj;کنند. از طرف دیگر گزارش های میدانی از دفاتر املاک نشان می دهد با وجود آنکه فایل&amp;zwnj;های متعارف از طرف فروشندگان واقعی به وفور دیده می&amp;zwnj;شود، برخی مالکان تحت تاثیر نوسانات بازارهای ارز و طلا نرخ های نجومی برای املاک خود تعیین می کنند. این در حالی است که کارشناسان معتقدند بخش مسکن علاوه بر اینکه باید نسبت به تحولات، دیر واکنش نشان دهد این بازار را فاقد ظرفیت لازم برای رشد قیمت می دانند؛ چراکه سالهاست توان متقاضیان واقعی پایین این بازار پایین آمده است.', 's:52:\"/images/posts/2022/Jan/08/2022_01_08_10_14_47_49.jpg\";', 14, 1, '2020-07-10 00:00:00', 0, '2020-07-10 18:32:48', '2022-01-08 13:44:47', NULL),
(3, 'بررسی راهکارهای ساماندهی بازار مسکن در کمیسیون عمران', 'یک عضو کمیسیون عمران مجلس شورای اسلامی از برگزاری چندمین جلسه این کمیسیون برای ساماندهی بازار مسکن و راهکارهای کنترل قیمت&amp;zwnj;ها خبر داد. رحمت الله فیروزی پوربادی در گفت&amp;zwnj;وگو با ایسنا، ضمن تشریح جلسه امروز کمیسیون عمران مجلس بیان کرد: کمیسیون عمران تاکنون چندین جلسه در خصوص ساماندهی بازار مسکن و راه&amp;zwnj;های مختلف برای شکستن قیمت&amp;zwnj;ها برگزار کرده است. در جلسه امروز نیز حول ساماندهی بازار مسکن بحث و بررسی صورت گرفت. این عضو کمیسیون عمران مجلس در ادامه اظهار کرد: تاکنون راهکارهای مختلفی نظیر ارائه تسهیلات یا موظف کردن دستگاه&amp;zwnj;ها برای ساخت مسکن یا بهره گیری از امکانات مختلف برای ساماندهی بازار مسکن در کمیسیون مطرح شده است. نماینده مردم نطنز در مجلس تصریح کرد: ان&amp;zwnj;شاءالله در روز سه&amp;zwnj;شنبه قرار است وزیر راه و شهرسازی نیز در جلسه کمیسیون حضور یابد تا تصمیم نهایی برای ساماندهی بازار مسکن اتخاذ شود. نمایندگان نیز طرحی را برای ساماندهی بازار مسکن آماده کردند که ان&amp;zwnj;شاءالله به زودی نهایی شده و اعلام می&amp;zwnj;شود.', 's:52:\"/images/posts/2022/Jan/08/2022_01_08_10_15_06_88.jpg\";', 14, 1, '2020-07-12 00:00:00', 0, '2020-07-12 15:18:59', '2022-01-08 13:45:06', NULL),
(4, 'اینفوگرافیک / تغییر قیمت مسکن در تهران، از پارسال تا امسال', 'بر اساس گزارش مرکز آمار ایران، درصد تغییر قیمت ماهانه مسکن در خرداد پارسال، ۳/۷ درصد بوده که این رقم در خرداد ۱۳۹۹ به ۱۱/۳ درصد رسیده است. همچنین تورم نقطه&amp;zwnj;ای در خردادماه ۱۳۹۹ به عدد ۴۴/۶ درصد رسیده است و این یعنی خریداران مسکن برای خرید یک واحد مسکونی در شهر تهران نسبت به خرداد ۱۳۹۸ باید ۴۴/۶ درصد پول بیشتری پرداخت کنند. اینفوگرافیک پیش رو میزان تغییرات قیمت مسکن در ماه&amp;zwnj;های مختلف تا خرداد ۱۳۹۹ را به روایت آمارهای مرکز آمار ایران نشان می&amp;zwnj;دهد. بر اساس گزارش مرکز آمار ایران، درصد تغییر قیمت ماهانه مسکن در خرداد پارسال، ۳/۷ درصد بوده که این رقم در خرداد ۱۳۹۹ به ۱۱/۳ درصد رسیده است. همچنین تورم نقطه&amp;zwnj;ای در خردادماه ۱۳۹۹ به عدد ۴۴/۶ درصد رسیده است و این یعنی خریداران مسکن برای خرید یک واحد مسکونی در شهر تهران نسبت به خرداد ۱۳۹۸ باید ۴۴/۶ درصد پول بیشتری پرداخت کنند. اینفوگرافیک پیش رو میزان تغییرات قیمت مسکن در ماه&amp;zwnj;های مختلف تا خرداد ۱۳۹۹ را به روایت آمارهای مرکز آمار ایران نشان می&amp;zwnj;دهد. بر اساس گزارش مرکز آمار ایران، درصد تغییر قیمت ماهانه مسکن در خرداد پارسال، ۳/۷ درصد بوده که این رقم در خرداد ۱۳۹۹ به ۱۱/۳ درصد رسیده است. همچنین تورم نقطه&amp;zwnj;ای در خردادماه ۱۳۹۹ به عدد ۴۴/۶ درصد رسیده است و این یعنی خریداران مسکن برای خرید یک واحد مسکونی در شهر تهران نسبت به خرداد ۱۳۹۸ باید ۴۴/۶ درصد پول بیشتری پرداخت کنند. اینفوگرافیک پیش رو میزان تغییرات قیمت مسکن در ماه&amp;zwnj;های مختلف تا خرداد ۱۳۹۹ را به روایت آمارهای مرکز آمار ایران نشان می&amp;zwnj;دهد.', 's:52:\"/images/posts/2022/Jan/04/2022_01_04_16_19_26_92.jpg\";', 14, 1, '2020-07-11 00:00:00', 0, '2020-07-12 15:20:04', '2022-01-04 19:49:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` bigint(20) NOT NULL,
  `title` varchar(191) NOT NULL,
  `url` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `amount` varchar(191) NOT NULL,
  `body` text NOT NULL,
  `image` varchar(191) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `title`, `url`, `address`, `amount`, `body`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'خانه ویلای در نیاوران', 'admin.slide', 'تهران - نیاوران - خیابان گلشن', '650000 تومان', '&lt;p&gt;تمام امکانات به روز یک خانه ویلایی مدرن توی این ساختمان پیاده شده و جای بسیار قشنگی برای زندگی کردنه.&lt;/p&gt;\r\n', '/images/slides/2022/Jan/03/2022-01-03-16-58-2794.jpg', '2020-07-12 13:53:46', '2022-01-03 20:28:27', NULL),
(2, 'آپارتمان 65 متری - صادقیه', 'http://localhost:8000/ads/3', 'تهران - صادقیه - فلکه دوم صادقیه - کوچه آفتاب شرقی', '650000 تومان', '&lt;p&gt;جای قشنگی برای زندگی کردنه. جای قشنگی برای زندگی کردنه. جای قشنگی برای زندگی کردنه&lt;/p&gt;\r\n', '/images/slides/2022/Jan/03/2022-01-03-16-58-5972.jpg', '2020-07-12 13:54:50', '2022-01-03 20:29:00', NULL),
(3, 'test', 'test.ir', 'gsfsd', '54545', '&lt;p&gt;tsdrfsa&lt;/p&gt;\r\n', '/images/slides/2021/Dec/20/2021-12-20-19-00-5033.png', '2021-12-20 19:00:50', NULL, '2021-12-21 13:01:13'),
(4, 'test', 'test.ir', 'gsfsd', '54545', '&lt;p&gt;test&lt;/p&gt;\r\n', '/images/slides/2021/Dec/22/2021-12-22-14-06-2368.jpg', '2021-12-22 14:06:23', NULL, '2021-12-22 14:06:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `email` varchar(191) CHARACTER SET utf8 NOT NULL,
  `first_name` varchar(191) CHARACTER SET utf8 NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8 NOT NULL,
  `avatar` varchar(191) CHARACTER SET utf8 NOT NULL,
  `password` varchar(191) CHARACTER SET utf8 NOT NULL,
  `status` tinyint(5) NOT NULL DEFAULT '0',
  `is_active` tinyint(5) NOT NULL DEFAULT '0',
  `verify_token` varchar(191) CHARACTER SET utf8 DEFAULT NULL,
  `user_type` varchar(191) CHARACTER SET utf8 NOT NULL,
  `remember_token` varchar(191) CHARACTER SET utf8 DEFAULT NULL,
  `remember_token_expire` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `first_name`, `last_name`, `avatar`, `password`, `status`, `is_active`, `verify_token`, `user_type`, `remember_token`, `remember_token_expire`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'amir@gmail.com', 'amir', 'qaderi', '/images/avatar/2021/Dec/24/2021-12-24-08-52-3913.jpg', '$2y$10$TMu34.395SD1GS2JSzT4v.1pDVP2PlA4ejRyvj2/F1wz9An1eqkQW', 0, 1, 'efefaosulchife6tg6fj8f467gft38hr4h89204r937nfyrh', 'admin', NULL, NULL, '2020-07-09 00:00:00', '2021-12-24 08:53:00', NULL),
(2, 'hassan.kh@gmail.com', 'mohammad', 'farokhi', '/images/avatar/2022/Jan/21/2022-01-21-12-17-4994.jpg', '$2y$10$nzNQlinmiJ5cVCjzd/8p1Oz3oDDUCY7gaYRWeDjRjTincYh9J1ukq', 0, 1, '1ea43c5ba95f56b295ec6adaf1bdfceeb01784bff9f66ca03cf65e3018b63ca5', 'user', NULL, NULL, '2020-07-13 01:37:24', '2022-01-21 15:48:56', NULL),
(5, 'raminfaramarzi93@gmail.com', 'رامین 2', 'فرامرزی', '/images/avatar/2020/Jul/12/2020_07_12_23_28_50_88.jpg', '$2y$10$aIBlWNYxeGDPRH0UbbslGeIWFtp5BuesiT9.vaw6BsbXs18gIIvei', 0, 0, '3302152ea5fae98fafe616f446dce82dc191a31b9ef31bff1d2cfa538d8ec311', 'user', '8f5955823fad4a89b8ba87632ea32f2e83f00846ef7cc0c1b37c197b4ca43c52', '2020-07-13 00:47:32', '2020-07-13 01:58:50', '2021-12-24 09:12:29', NULL),
(6, 'amirqaderi@example.com', 'amir', 'qaderi', '/images/avatar/2020/Jul/19/2020_07_19_23_21_53_51.jpg', '123456789', 0, 1, 'c648d798f99a09c48b5220eabf8f3c5fbf75c95e56c81d50b2b64b944dadb99f', 'admin', NULL, NULL, '2020-07-20 01:51:54', '2020-07-21 00:16:24', NULL),
(14, 'amirhosseinqaderii@gmail.com', 'امیر', 'قادری', '/images/avatar/2022/Jan/22/2022-01-22-13-02-5116.jpg', '$2y$10$HLzmQRGTfZCN82BD0oxX2O1/OD1bKciLRRqw0rYTXauKNiaelLHma', 0, 1, '3186e6036d4d5fc4dd019267a0a352fe6d093b36ca26b44ffc135254cf3fd129', 'admin', '8e945494c40bb58897d17ea6659778bcfea61fa01553d03ee12c4833509d7025', '2022-01-29 18:35:51', '2021-12-26 15:27:23', '2022-01-29 18:26:32', NULL),
(15, 'reza@gmail.com', 'reza', 'taheri', '/images/avatar/2022/Jan/28/2022-01-28-18-52-54-82.jpg', '$2y$10$/CLv7t9rhnfTZtIkIMUNweBkgsdWTteExDZtH5G05Z1eEmxFdpyRO', 0, 0, '789ab3e15f965a507546814eb3acafc412541c5b732311282b15e17fc2e6933f', 'user', NULL, NULL, '2022-01-28 18:52:55', NULL, NULL),
(16, 'admin@admin.com', 'علی', 'قادری ', '/images/avatar/2022/Jan/28/2022-01-28-19-09-32-33.jpg', '$2y$10$JCQL/vBQYT78JDj5xVzz3uM/F51gTRDXNGZH0diTGz7MQSSxFJyZ.', 0, 0, '58e8847f04b3b703eca080d61bb5c36ed9d0b6c9decca363b910fe8720dd6ad5', 'user', NULL, NULL, '2022-01-28 19:09:32', NULL, NULL),
(17, 'reza21@gmail.com', 'reza', 'farokhi', '/images/avatar/2022/Jan/28/2022-01-28-19-49-39-64.jpg', '$2y$10$rrXvM02fXhsb0cXSe5FSJ.pRfIqdmchQ0qwwayb7DlT.9Sm7UktW6', 0, 0, '504c37dc5dc5bc5847a94fabd1c29822ddab9236494aecc3e79023c4aff58a84', 'user', NULL, NULL, '2022-01-28 19:49:39', NULL, NULL),
(18, 'hassan325@gmail.com', 'hassan', 'taheri', '/images/avatar/2022/Jan/28/2022-01-28-20-12-47-64.jpg', '$2y$10$DU8Zl7vZdojPvGUi7BMrTefcrGYaDQUNyIuUrBLf8jZG8.HPw/Qsm', 0, 0, '9040202cf85f9a0ebb2ca9fb2ec66939eb52db398222181485ef7b5223fb6f2d', 'user', NULL, NULL, '2022-01-28 20:12:47', NULL, NULL),
(19, 'amirhossein@gmail.com', 'amirHossein', 'mohammadi', '/images/avatar/2022/Jan/28/2022-01-28-20-16-23-91.jpg', '$2y$10$4HNSv9tTST4k5JAinQrcCOr0CrjxTBlm2OHKhoCb8Fh7GXEB8C23W', 0, 0, '193cb083d94764ac8b5473ae412cdd30dc5972545b1d4e0368789fd09e9954fe', 'user', NULL, NULL, '2022-01-28 20:16:23', NULL, NULL),
(20, 'amir@gmail.comam', 'amir2', 'qaderi', '/images/avatar/2022/Jan/29/2022-01-29-18-31-35-77.jpg', '$2y$10$pv4xnMvvw56YSYnEuwVocOTFXzjVMcRYOdFevpky9ZhsE1utnENTm', 0, 0, '39d8558432de5e8dc3e190be4cb1bb69e0e8727d3edc393722413ead221846a0', 'user', NULL, NULL, '2022-01-29 18:31:35', NULL, NULL),
(21, 'amir425@gmail.com', 'amir2', 'qaderi', '/images/avatar/2022/Jan/29/2022-01-29-18-34-09-38.jpg', '$2y$10$10fGUzMe6NmSBEVWHZ5lN.CdtOIp5dwKZxqCaGfgW42n8JDGYGCEe', 0, 0, 'ad9dcc88ae384c9254fe0080557aa82563c6fc5e1133cdc2f59d702461430ebc', 'user', NULL, NULL, '2022-01-29 18:34:10', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
