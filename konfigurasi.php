<?php

// SET Koneksi ke MySQL Server
$user='root';
$pass='';
$host='localhost';
$db='bank';
$koneksi=mysqli_connect($host,$user,$pass,$db);

// SET Global Variabel
GLOBAL $koneksi;

// Set Proteksi Halaman Web
define('_PROTEKSI',true);
?>
