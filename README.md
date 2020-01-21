# How to Benchmark #

- Please copy the appropriate binary file to your <Documents>/Pd/externals folder.
- Make sure Pure data is on your path and that you can launch it on the command line with `pd`.
	- On macOS, you will need to append your path: `$ export PATH=$PATH:"/Applications/<Pd-Bundle-Name-Here>/Contents/MacOS"`
- Run 13 copies of each patch by `BENCH_INSTANCES=13 bash doall.sh`
- The script will launch Pd with multiple copies of each patch, wait for a while to stabilize, and collect process statistics with `ps` for 100 seconds. Afterwards, it will kill `Pd` and move to the next patch.
- The results are written in `.csv` files that correspond to each patch.
- Please make a directory for your device/environment and move the `.csv` files there.

