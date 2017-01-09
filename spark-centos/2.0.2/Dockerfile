# Spark (Vanilla) for Orchestration on CentOS 7.
# Copyright (C) 2016 Rodrigo Martínez <dev@brunneis.com>
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

FROM brunneis/centos-jdk
MAINTAINER "Rodrigo Martínez" <dev@brunneis.com>

################################################
# SPARK
################################################

ENV SPARK_VERSION 2.0.2
ENV SPARK_SUBVERSION bin-without-hadoop
ENV SPARK_ARCHIVE spark-$SPARK_VERSION-$SPARK_SUBVERSION.tgz
ENV SPARK_ARCHIVE_URL https://archive.apache.org/dist/spark/spark-$SPARK_VERSION/$SPARK_ARCHIVE
ENV SPARK_ASC_URL $SPARK_ARCHIVE_URL.asc
ENV SPARK_KEYS https://archive.apache.org/dist/spark/KEYS

# Install Spark
RUN \
	yum -y update && yum clean all \
	&& wget $SPARK_ARCHIVE_URL \
	&& wget $SPARK_ASC_URL \
	&& wget $SPARK_KEYS \
	&& gpg --import KEYS \
	&& gpg --verify $SPARK_ARCHIVE.asc \
	&& mkdir /opt/spark \
	&& tar xvf $SPARK_ARCHIVE -C /opt/spark \
	&& rm -f $SPARK_ARCHIVE \
	&& rm -f $SPARK_ARCHIVE.asc \
	&& rm -f KEYS \
	&& ln -s /opt/spark/*spark* /opt/spark/default	
	
# Spark configuration volume
VOLUME ["/opt/spark/default/conf"]

# Data volume
VOLUME ["/data"]

# Environment variables
ENV PATH=/opt/spark/default/bin\
:/opt/spark/default/sbin:$PATH \
JAVA_HOME=/usr

# The container stays idle
CMD bash --login -i
