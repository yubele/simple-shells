#!/bin/sh

ruby_version='2.2.0'

if [ ! -e ~/.rbenv ]; then
	git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
	git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

	echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
	echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

	uname -a | grep -i ubuntu
	if [ $? -eq 0 ]; then
		sudo apt-get update
		sudo apt-get install -yq build-essential bison libreadline6-dev curl git-core zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev autoconf libncurses5-dev libffi-dev
	else
		sudo yum install -y install gcc-c++ glibc-headers openssl-devel readline libyaml-devel readline-devel zlib zlib-devel libffi-devel libxml2 libxslt libxml2-devel libxslt-devel sqlite-devel
	fi
	
	. ~/.bash_profile
	rbenv install $ruby_version
	rbenv global $ruby_version
	rbenv rehash
fi;
