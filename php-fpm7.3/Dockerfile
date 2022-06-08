FROM phpdockerio/php73-fpm
WORKDIR "/srv/www"

RUN export DEBIAN_FRONTEND=noninteractive; apt-get update; \
    apt-get -y --no-install-recommends install \
        git \ 
        sudo \
        php7.3-bcmath \ 
        php7.3-bz2 \ 
        php7.3-decimal \ 
        php7.3-ds \ 
        php7.3-gd \ 
        php7.3-grpc \ 
        php7.3-http \ 
        php7.3-imagick \ 
        php7.3-intl \ 
        php7.3-mcrypt \ 
        php7.3-memcache \ 
        php7.3-memcached \ 
        php7.3-mysql \ 
        php7.3-propro \
        php7.3-pspell \ 
        php7.3-psr \ 
        php7.3-soap \ 
        php7.3-ssh2 \ 
        php7.3-tidy \ 
        php7.3-xmlrpc \ 
        php7.3-xsl \
        php7.3-raphf \
        libmagickcore-dev \
        imagemagick; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*; \
    chmod 0777 -R /tmp /var/tmp/;

RUN echo "www-data ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers