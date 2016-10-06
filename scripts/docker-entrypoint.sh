#!/bin/bash

set -e

envtpl /etc/logstash/conf.d/logstash.conf.tpl

# Run logstash
/opt/logstash/bin/logstash -f /etc/logstash/conf.d/logstash.conf -e
