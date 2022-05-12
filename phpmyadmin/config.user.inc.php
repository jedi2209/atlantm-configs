<?php

$cfg['Export']['method'] = 'custom';
$cfg['Export']['compression'] = 'zip';
$cfg['Export']['lock_tables'] = true;
$cfg['Export']['charset'] = 'utf-8';
$cfg['Export']['sql_drop_table'] = true;
$cfg['Export']['sql_type'] = 'REPLACE';
$cfg['Console']['StartHistory'] = true;
$cfg['Console']['Mode'] = 'collapse';
$cfg['Server']['hide_db'] = '';
$cfg['Server']['only_db'] = '';
$cfg['lang'] = 'ru';

// IP address of your instance
$cfg['Servers'][$i]['host'] = 'rc1b-6hjqm8by6fiennpe.mdb.yandexcloud.net';
// Use SSL for connection
$cfg['Servers'][$i]['ssl'] = true;
$cfg['Servers'][$i]['auth_type'] = 'cookie';
$cfg['Servers'][$i]['extension'] = 'mysqli';
// // Client secret key
// $cfg['Servers'][$i]['ssl_key'] = '../client-key.pem';
// // Client certificate
// $cfg['Servers'][$i]['ssl_cert'] = '../client-cert.pem';
// Server certification authority
$cfg['Servers'][$i]['ssl_ca'] = '/var/www/html/mysql/root.crt';
// Disable SSL verification (see above note)
$cfg['Servers'][$i]['ssl_verify'] = false;