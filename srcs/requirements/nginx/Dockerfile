
FROM	debian:bullseye

RUN	apt update && apt upgrade && apt install -y nginx openssl

COPY	conf/default /etc/nginx/sites-available/default
COPY	tools/script.sh /script.sh

RUN	chmod +x /script.sh

EXPOSE	443

CMD	["/script.sh"]
