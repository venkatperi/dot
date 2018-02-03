if [ -f /var/run/nginx.pid ]
then
  alias ngstop="sudo kill -QUIT $( cat /var/run/nginx.pid )"
  alias ngreload="sudo kill -HUP $( cat /var/run/nginx.pid )"
  alias ngtest="sudo nginx -c /etc/nginx/nginx.conf -t"
fi
