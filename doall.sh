#!/bin/bash

PREFIX=${1:-result}

echo "Running benchmarks, prefix ID \"${PREFIX}_\""

for patch in *.pd
do
echo "[$patch]"
script -qc "bash ./bench.sh $patch" "${PREFIX}_${patch%.pd}.csv"
done
