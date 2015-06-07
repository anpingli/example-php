#!/bin/bash

# For SCL enablement
source ./.bashrc

# Default php.ini configuration values, all taken 
# from php defaults.
export ERROR_REPORTING=${ERROR_REPORTING:-E_ALL & ~E_NOTICE}
export DISPLAY_ERRORS=${DISPLAY_ERRORS:-ON}
export DISPLAY_STARTUP_ERRORS=${DISPLAY_STARTUP_ERRORS:-OFF}
export TRACK_ERRORS=${TRACK_ERRORS:-OFF}
export HTML_ERRORS=${HTML_ERRORS:-ON}
export INCLUDE_PATH=${INCLUDE_PATH:-.:/opt/openshift/src:/opt/rh/php55/root/usr/share/pear}
export SESSION_PATH=${SESSION_PATH:-/tmp/sessions}
# TODO should be dynamically calculated based on container memory limit/16
export OPCACHE_MEMORY_CONSUMPTION=${OPCACHE_MEMORY_CONSUMPTION:-16M}

export PHPRC=${PHPRC:-/opt/rh/php55/root/etc/php.ini}
export PHP_INI_SCAN_DIR=${PHP_INI_SCAN_DIR:-/opt/rh/php55/root/etc/php.d}

envsubst < /opt/openshift/etc/php.ini.template > /opt/rh/php55/root/etc/php.ini
envsubst < /opt/openshift/etc/php.d/opcache.ini.template > /opt/rh/php55/root/etc/php.d/opcache.ini

set -e
exec httpd -D FOREGROUND
