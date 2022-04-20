<!doctype html>
<html lang="ja">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/style.css">

<title>よくわかるPHPの教科書</title>
</head>
<body>
<header>
<h1 class="font-weight-normal">よくわかるPHPの教科書</h1>
</header>

<main>
<h2>Practice</h2>
<pre>
<?php
/* ここに、PHPのプログラムを記述します */
// $week_name = ['日', '月', '火', '水', '木', '金', '土'];
// $week = 1 + 3;
// print($week_name[$week]);
// print('今日は' . $week_name[date('w')] . '曜日です');

// 練習問題: リストを配列にし、自分年代を画面に表示させろ
$age_list = ['10代以下', '20代', '30代', '40代', '50代', '60代以上', ];

print ('自分の年代は、' . $age_list[2] . 'です。');
?>
</pre>
</main>
</body>
</html>
