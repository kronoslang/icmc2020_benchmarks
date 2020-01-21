#!/bin/bash

REPEAT=${BENCH_INSTANCES:-'5'}
PATCHES=""

for ((i=0;i<REPEAT;i++))
do
CPY="$(mktemp).pd"
cp $1 $CPY
PATCHES="$PATCHES $CPY"
done

pd $PATCHES & 
PID=$!

echo "Launched Pure data with master PID $PID (${REPEAT} instances)" 1>&2
echo "Waiting $REPEAT seconds to stabilize..." 1>&2

sleep $REPEAT

echo "cmd,pid,wall,cputime,usertime,rmem,load"

for run in {1..100}
do
	if [[ "$OSTYPE" == "darwin"* ]]; then
		ps -g $$ -o comm=,pid=,etime=,time=,utime=,rss=,%cpu= | grep -v $PID | grep -i pd | sed -e 's/  */,/g'
	else 
		ps -p $PID -o comm=,pid=,etime=,time=,utime=,rss=,%cpy=
	fi
	sleep 1
done
kill -9 $PID
