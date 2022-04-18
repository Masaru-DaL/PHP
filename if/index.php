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
// if (date('G') > 9) {
//     print ('※ 現在受付時間外です');
// } else {
//     print ('営業中です');
// }

// $x = 'あいうえお';
// if ($x) {
//     print('xには文字が入っています');
// }

// $y = 0;
// if ($y) {
//     print('yは0です');
// }

// $x = 0;
// if (!$x) {
//     print('xは0です');
// }

// 練習問題: 変数が0のときは「1文字以上の数字を指定してください」というメッセージを出すプログラムを記述せよ
$i = 0;
if ($i === 0) {
    print('1文字以上の数字を指定してください');
}
?>
</pre>
</main>
</body>
</html>
