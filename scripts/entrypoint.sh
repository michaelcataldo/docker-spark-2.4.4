#!/bin/bash

case "$1" in
    master)
        $SPARK_HOME/sbin/start-master.sh
        ;;
    slave)
        shift
        $SPARK_HOME/sbin/start-slave.sh "$@"
        ;;
    *)
        exec "$@"
        ;;
esac

tail -f /dev/null