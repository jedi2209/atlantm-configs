FROM phpdockerio/php:8.2-fpm
WORKDIR "/srv/www"

RUN apt-get update; \
    apt-get -y --no-install-recommends install \
        git \ 
        php8.2-bcmath \ 
        php8.2-bz2 \ 
        php8.2-decimal \ 
        php8.2-ds \ 
        php8.2-gd \ 
        php8.2-grpc \ 
        php8.2-http \ 
        php8.2-imagick \ 
        php8.2-intl \ 
        php8.2-mcrypt \ 
        php8.2-memcache \ 
        php8.2-memcached \ 
        php8.2-mysql \ 
        php8.2-pspell \ 
        php8.2-psr \ 
        php8.2-soap \ 
        php8.2-ssh2 \ 
        php8.2-tidy \ 
        php8.2-xmlrpc \ 
        php8.2-xsl \
        php8.2-raphf; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
