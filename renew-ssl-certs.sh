#!/bin/bash

# turn off nginx
sudo systemctl stop nginx

EXIT_CODE="$?"

if [ 0 -ne "$EXIT_CODE" ]
then
  echo "error stopping nginx"
  exit "$EXIT_CODE"
fi

# update certificates
sudo letsencrypt renew

EXIT_CODE="$?"

if [ 0 -ne "$EXIT_CODE" ]
then
  echo "error renewing certificates"
  exit "$EXIT_CODE"
fi

# turn on nginx
sudo systemctl start nginx

EXIT_CODE="$?"

if [ 0 -ne "$EXIT_CODE" ]
then
  echo "error starting nginx"
  exit "$EXIT_CODE"
fi

# all done!
echo "all done!"
exit "0"
