# MariaDB for Polypus
# Copyright (C) 2017 Rodrigo Martínez <dev@brunneis.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

FROM mariadb:10.3
MAINTAINER Rodrigo Martínez <dev@brunneis.com> 

################################################
# MARIADB
################################################

ENV \
    TERM=xterm \ 
	MYSQL_DATABASE=dpsa \
	MYSQL_USER=dpsa \
	MYSQL_PASSWORD=dpsa \
	MYSQL_ROOT_PASSWORD=dpsa

COPY polypus_rm.sql /

RUN { \
echo '[mysqld]'; \
echo 'max_connections=10000'; \
echo 'character-set-server=utf8'; \
echo 'collation-server=utf8_general_ci'; \
echo '[client]'; \
echo 'default-character-set=utf8'; \
} > /etc/mysql/conf.d/polypus.cnf;

VOLUME ["/var/lib/mysql"]

EXPOSE 3306

COPY entrypoint.sh /
ENTRYPOINT ["bash", "/entrypoint.sh"]
