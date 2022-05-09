#!/bin/bash

user=$1
dir=$2

useradd $user;
passwd $user;
usermod -d $dir $user;
usermod -s /sbin/nologin $user;
usermod -aG www-data $user;
usermod -aG nginx $user;