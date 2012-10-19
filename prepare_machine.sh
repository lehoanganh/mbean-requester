#!/usr/bin/env bash

welcome(){
	echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
	echo "::: THIS SCRIPT WILL INSTALL EVERYTHING TO MAKE THIS MACHINE READY TO USE MBEAN REQUESTER"
	echo "::: PLEASE WAIT IF YOU THINK THE PROGRAM IS SLOW, IT IS WORKING IN THE BACKGROUND :)"
	echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
}

apt_update(){
	echo "::::::::::::::::::::::"
	echo "::: Update Apt Repo..." 
	echo "::::::::::::::::::::::"
	sudo apt-get update -qq
}

install_needed_packages(){
	echo "::::::::::::::::::::::::::::::::"
	echo "::: Installing needed packages.."
	echo "::::::::::::::::::::::::::::::::"
	sudo apt-get install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g \
					zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev \
					autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config \
					curl g++ openjdk-6-jre-headless -qq
}

install_ruby(){
	echo "::::::::::::::::::::::::::::::"
	echo "::: Installing Ruby via RVM..."
	echo "::::::::::::::::::::::::::::::"
	curl -L https://get.rvm.io -s | bash -s stable # load the install bash script
		
	# update rvm variables
	echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.' >> $HOME/.bashrc
	. "$HOME/.rvm/scripts/rvm"
	
	command rvm install 1.9.3 # rvm is NOT loaded into shell as a function
	
	echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
	echo "::: [INFO] Do NOT forget to set ruby 1.9.3 as default use"
	echo "::: [INFO] $ . $HOME/.bashrc"
	echo "::: [INFO] $ rvm --default use 1.9.3"
	echo "::: [INFO] $ rvm install jruby"
	echo "::: [INFO] $ jruby-1.6.8 -S gem install jmx4r"
	echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
}

# ================================================================

# Time measurement
start=$(date +%s)


welcome
apt_update
install_needed_packages
install_ruby

# Time measurement
end=$(date +%s)

diff=$(( $end - $start ))

echo ":::::::::::::::::::::::::::::::::"
echo "::: Elapsed Time: $diff seconds!!"
echo ":::::::::::::::::::::::::::::::::"