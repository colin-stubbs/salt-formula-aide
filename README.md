# salt-formula-aide
Install and configure aide

Available states
================

``aide``
------------

Installs the aide package then configures aide.conf

A new database will be generated and moved to the the expected database location provided a file does not already exist there.

``aide.schedule``
------------

Creates a cron task schedule to run 'aide --check 1>/dev/null 2>&1'

Defaults are at midnight daily as user root.
