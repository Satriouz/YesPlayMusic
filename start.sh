#/bin/bash
nginx -g "daemon off;"&
yarn netease_api:run
