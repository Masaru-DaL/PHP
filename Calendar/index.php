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
// 86400 = 24時間後, 1970年1月1日の24時間後を表示 = 1/2(金)
// $day = date('n/j(D)', 86400);
// print($day . "\n");

// 現在の日時を表示
// $day = date('n/j(D)');
// print($day . "\n");

// 1970年1月1日から数えた秒数が表示される
// $time = time();
// print($time);

// strtotimeファンクション = str to time -> 文字列を　タイムスタンプに変換するファンクション
// 家康の誕生日のタイムスタンプ
// $ieyasu = strtotime('1543/1/31');
// print($ieyasu);

// 明後日の日付を表示させる
$day_after_tomorrow = strtotime('+2day');
$day = date('n/j(D)', $day_after_tomorrow);
print($day . "\n");

?>
</pre>
</main>
</body>
</html>
