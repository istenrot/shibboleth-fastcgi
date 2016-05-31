#!/bin/bash

set -e

#EPEL required for fcgi-devel library
sudo yum -y install epel-release

#Configure Shibboleth repository for dependencies
sudo curl -s -L -o /etc/yum.repos.d/shibboleth.repo http://download.opensuse.org/repositories/security://shibboleth/CentOS_7/security:shibboleth.repo

#Install all the things!
#Note: most of the following was manually determined. YMMV on newer versions.
sudo yum install -y \
	rpm-build \
	yum-utils \
	libxml-security-c-devel \
	libxmltooling-devel \
	xmltooling-schemas \
	libsaml-devel \
	opensaml-schemas \
	liblog4shib-devel \
	chrpath boost-devel \
	doxygen \
	unixODBC-devel \
	fcgi-devel \
	httpd-devel \
	redhat-rpm-config \
	pcre-devel \
	zlib-devel \
	libmemcached-devel \
	systemd-devel

sudo yum -y install \
	gcc \
	gcc-c++ \
	binutils \
	autoconf \
	automake \
	libtool \
	make \
	patch \
	mock \
	scl-utils \
	centos-release-scl-rh

sudo yum -y install \
	devtoolset-3-binutils \
	devtoolset-3-gcc \
	devtoolset-3-gcc-c++

#Download in the home directory of the VM. Don't use the shared directory.
cd ~

#Obtain the SPRM
yumdownloader --source shibboleth

#Rebuild with FastCGI support
source /opt/rh/devtoolset-3/enable && rpmbuild --rebuild shibboleth*.src.rpm --with fastcgi

#Remove original SRPM
rm shibboleth*.src.rpm -f

