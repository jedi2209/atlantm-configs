FROM phpdockerio/php:7.4-fpm
WORKDIR "/srv/www"

RUN apt-get update; \
    apt-get -y --no-install-recommends install \
        git \ 
        sudo \
        php7.4-bcmath \ 
        php7.4-bz2 \ 
        php7.4-decimal \ 
        php7.4-ds \ 
        php7.4-gd \ 
        php7.4-grpc \ 
        php7.4-http \ 
        php7.4-imagick \ 
        php7.4-intl \ 
        php7.4-mcrypt \ 
        php7.4-memcache \ 
        php7.4-memcached \ 
        php7.4-mysql \ 
        php7.4-propro \
        php7.4-pspell \ 
        php7.4-psr \ 
        php7.4-soap \ 
        php7.4-ssh2 \ 
        php7.4-tidy \ 
        php7.4-xmlrpc \ 
        php7.4-xsl \
        php7.4-raphf \
        libmagickcore-dev \
        imagemagick; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*; \
    chmod 0777 -R /tmp /var/tmp/;

RUN echo "www-data ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers