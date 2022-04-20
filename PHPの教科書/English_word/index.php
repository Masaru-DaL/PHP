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
// $fruits = ['りんご', 'ぶどう', 'レモン', 'トマト', 'もも'];
// print($fruits[2]);

$fruits = [
    'apple' => 'りんご',
    'grape' => 'ぶどう',
    'lemon' => 'レモン',
    'tomato' => 'トマト',
    'peach' => 'もも'
];
// print($fruits['lemon']);
foreach ($fruits as $english => $japanese) {
// foreach ($fruits as $japanese) {
    print ($english . ' : ' . $japanese . "\n");
}

// 練習問題: 連想配列を表示させよ
$PC = [
    'win' => 'Windows',
    'mac' => 'Macintosh',
    'iphone' => 'iPhone',
    'ipad' => 'iPad',
    'android' => 'Android'
    ];
print($PC['win']);
?>
</pre>
</main>
</body>
</html>
