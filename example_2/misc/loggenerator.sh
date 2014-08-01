#!/bin/bash
#
# Name: loggenerator.sh
#
# This scripts aims to generate noise on apache access log file
# so they could be stored into elasticsearch and the user can have
# an actual dashboard with real data in it
#
protocol=http
webservers=('web999.puppeels.mylezeem.com');
webpages=('/page1' '/page2' '/page42' '/anotherpage' '/doesntevenexist' '/' '/' '/');

declare -a webservers=('web999.puppeels.mylezeem.com');
declare -a webpages=('/page1' '/page2' '/page42' '/anotherpage' '/doesntevenexist' '/' '/' '/');

echo ${webservers[0]}

for i in {1..1000};do
  random_webserver=$(($RANDOM%1+0))
  random_webpage=$(($RANDOM%9+0))

  request=${protocol}://${webservers[$random_webserver]}${webpages[$random_webpage]}
  curl $request
done
