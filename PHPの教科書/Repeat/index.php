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
// print($i);
// $i = $i + 1;
// print($i);
// $i = $i + 1;
// print($i);

// $i = 1;
// while ($i <= 365) {
//     print($i);
//     $i++;
// }

// for ($i=1; $i <= 365; $i++) {
//     print($i);# code...
// }

// 練習問題 100から1までの数字を偶数だけ表示させろ
// $i = 2;
// while ($i <= 100) {
//     print($i);
//     $i = $i + 2;
// }
$i = 100;
while ($i >= 1) { //0以上と書くと0も表記されてしまう(0は偶数じゃない)
    print($i);
    $i = $i - 2;
    print("\n");
}
?>
</pre>
</main>
</body>
</html>
