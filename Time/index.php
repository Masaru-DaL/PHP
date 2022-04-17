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
// print('現在は ' . date('G時 i分 s秒') . ' です');
// print('現在は ' . date('G i s') . ' です');
// print('現在は ' . date('s') . ' です');
// print('現在は ' . date('i s') . ' です');
// print('現在は ' . date('G i s') . ' です');
print(date('G'));
print('時');
print(date('i'));
print('分');
print(date('s'));
print('秒');
?>
</pre>
</main>
</body>
</html>
