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
// $sum = 100 + 1050 + 200;
// $tax = 1.08;
// print($sum);
// print("\n");
// print($sum * 1.08);
// print('合計金額は:' . $sum . '円です');
// print("\n");
// print('税込金額は:' . $sum * $tax . '円です');

// 練習問題 -> 10と表示させろ
$sum = 8 + 2;
print($sum);
?>
<!-- 合計金額は: <?php print($sum); ?>円です<br> -->
<!-- 税込金額は: <?php print($sum * 1.08); ?>円です -->
<!-- 税込金額は: <?php print($sum * $tax); ?>円です -->


</pre>
</main>
</body>
</html>
