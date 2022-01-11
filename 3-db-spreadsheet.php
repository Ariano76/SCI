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

// (B) LOAD PHPSPREADSHEET
require "vendor/autoload.php";
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

// (C) CREATE A NEW SPREADSHEET + WORKSHEET
$spreadsheet = new Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();
$sheet->setTitle("Users");

// (D) FETCH USERS + WRITE TO SPREADSHEET
$stmt = $pdo->prepare("SELECT * FROM `users`");
$stmt->execute();
$i = 1;
while ($row = $stmt->fetch()) {
  $sheet->setCellValue("A".$i, $row["id"]);
  $sheet->setCellValue("B".$i, $row["name"]);
  $sheet->setCellValue("C".$i, $row["email"]);
  $i++;
}

// (E) SAVE FILE
$writer = new Xlsx($spreadsheet);
$writer->save("users.xlsx");
echo "OK";
