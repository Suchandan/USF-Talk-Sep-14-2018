#!/usr/bin/env bash

########################################################
# Constants
########################################################

MAX_CONCURRENT_PROCESSES=100

########################################################
# Define a slow function
########################################################

function slow_function() {
    echo "Executing slow function $1"
    sleep 1
}

########################################################
# Multiprocessing Hack
########################################################

NUM_RUNNING_PROCESSES=0

for i in `seq 1 200`
do
    if (( MAX_CONCURRENT_PROCESSES >= NUM_RUNNING_PROCESSES )); then
        (( NUM_RUNNING_PROCESSES +=1 ))
    else
        wait
        (( NUM_RUNNING_PROCESSES=0 ))
    fi

    slow_function $i &
done

wait

echo "Done!"
