#!/bin/bash

for patch in *.pd
do
echo "[$patch]"
script -q "result_${patch%.pd}.csv" bash bench.sh $patch 
done
