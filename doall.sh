#!/bin/bash

PREFIX=${1:-result}

echo "Running benchmarks, prefix ID \"${PREFIX}_\""

for patch in *.pd
do
echo "[$patch]"
if [[ $OSTYPE == "darwin"* ]];
then
	script -q "${PREFIX}_${patch%.pd}.csv" bash ./bench.sh $patch
else
	script -qc "bash ./bench.sh $patch" "${PREFIX}_${patch%.pd}.csv"
fi
done
