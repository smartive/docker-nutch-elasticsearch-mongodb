#!/bin/bash

# Start nutch webserver for controlling with REST API
$NUTCH_HOME/bin/nutch nutchserver > /dev/null &
# Start nutch web gui
$NUTCH_HOME/bin/nutch webapp
