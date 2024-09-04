
FROM	debian:bullseye

RUN	apt update && apt upgrade && apt install -y mariadb-server

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY	tools/init.sql /etc/mysql/init.sql
COPY	tools/script.sh /script.sh

RUN	mkdir /run/mysqld && chmod +x /script.sh

CMD	["/script.sh"]
