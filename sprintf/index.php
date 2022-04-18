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
// $fix = sprintf('%d', 10);
// print($fix);

// dはデジタルのdのため、文字では表示しない
// $fix = sprintf('%d', 'abc');
// print($fix);

// $fix = sprintf('%s', 'abc');
// print($fix);

// 5桁になるまで0を入れて補う
// $fix = sprintf('%05d', 10);
// print($fix);

// 04 -> 4桁, 02 -> 2桁を引数として指定している
$date = sprintf('%04d年 %02d月 %02d日', 2018, 1, 23);
print($date);
?>
</pre>
</main>
</body>
</html>
