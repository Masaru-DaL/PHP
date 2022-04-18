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
// print(100 / 3000 * 100);

// floor -> 切り捨て
// print(floor(100 / 3000 * 100));

// ceil -> 切り上げ
// print(ceil(100 / 3000 * 100));

// round -> 四捨五入
// print(round(100 / 3000 * 100));

// round -> 小数点第何位まで表示させるか(第2位までの場合)
print(round(100 / 3000 * 100, 2));
?>
</pre>
</main>
</body>
</html>
