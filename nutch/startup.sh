#!/bin/bash

# Create the nutch config
sed -e "s/%ELASTICSEARCH_PORT_9300_TCP_ADDR%/$ELASTICSEARCH_PORT_9300_TCP_ADDR/g" \
    -e "s/%ELASTICSEARCH_PORT_9300_TCP_PORT%/$ELASTICSEARCH_PORT_9300_TCP_PORT/g" \
    $NUTCH_HOME/conf/nutch-site.xml > $NUTCH_HOME/conf/nutch-site.xml

# Start nutch webserver for controlling with REST API
$NUTCH_HOME/bin/nutch nutchserver > /dev/null &
# Start nutch web gui
$NUTCH_HOME/bin/nutch webapp
