
FROM	debian:bullseye

RUN	apt update && apt upgrade && apt install -y php-fpm curl php-mysqli

COPY	conf/www.conf /etc/php/7.4/fpm/pool.d/.
COPY	tools/script.sh /script.sh
COPY	conf/wp-config.php /

RUN	mkdir -p /run/php && chown -R www-data:www-data /run/php

RUN	chmod +x /script.sh

CMD	["/script.sh"]
