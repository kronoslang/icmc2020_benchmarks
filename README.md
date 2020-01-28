# ICMC2020 Benchmarks #

This repo is used for the benchmarks in the ICMC2020 shaker paper comparing Kronos and Pd. The repo contains six patches, each of which activates Pd dsp on load. One of them is an empty baseline patch with just a silent dac. 

The supplied scripts are for repeatable benchmarking. They launch Pd, load multiple copies of each patch and observe process cpu time over two minutes.

`bench.sh` performs a single run with a pd patch given as an argument.

`doall.sh` runs benchmarks for all patches in the current directory, gathering the results in .csv files.

## How to Benchmark ##

- Please copy the appropriate binary file to your <Documents>/Pd/externals folder. The binaries are `icmc2020.pd_<platform>`.
- Make sure Pure data is on your path and that you can launch it on the command line with `pd`.
	- On macOS, you will need to append your path: `$ export PATH=$PATH:"/Applications/<Pd-Bundle-Name-Here>/Contents/MacOS"`
- Run 20 copies of each patch by `BENCH_INSTANCES=20 bash doall.sh <prefix>`. Prefix is an optional identifier that will be prepended to the resulting data files.
- The script will launch Pd with multiple copies of each patch, wait for a while to stabilize, and collect process statistics with `ps` for 100 seconds. Afterwards, it will kill `Pd` and move to the next patch.
- The results are written in `.csv` files that correspond to each patch. Each one is prefixed with `prefix`, which should be an abbreviation of the current device/platform (such as 'mba')
- Please make a directory for your device/environment and move the `.csv` files there.

20 instances seems good on the Mac. Raspberry Pi can probably handle only a handful of instances. RPi3 works fine with 4 instances.
