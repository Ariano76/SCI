<?php
// (A) CONNECT TO DATABASE - CHANGE SETTINGS TO YOUR OWN!
$dbhost = "localhost";
$dbname = "test";
$dbchar = "utf8";
$dbuser = "root";
$dbpass = "";
$pdo = new PDO(
  "mysql:host=$dbhost;charset=$dbchar;dbname=$dbname",
  $dbuser, $dbpass, [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_NAMED
  ]
);

// (B) CSV HTTP HEADERS
header("Content-Type: text/csv");
header("Content-Disposition: attachment; filename=\"users.csv\"");

// (C) GET ENTRIES + OUTPUT
$stmt = $pdo->prepare("SELECT * FROM `users`");
$stmt->execute();
while ($row = $stmt->fetch()) {
  echo implode(",", $row) . PHP_EOL;
}
