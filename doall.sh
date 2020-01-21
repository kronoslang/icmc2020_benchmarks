#!/bin/bash

PREFIX=${1:-result}

echo "Running benchmarks, prefix ID \"${PREFIX}_\""

for patch in *.pd
do
echo "[$patch]"
script -q "${PREFIX}_${patch%.pd}.csv" bash bench.sh $patch 
done
