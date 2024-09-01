# Description
Cascaded integrator-comb (CIC) filter in Bluespec SystemVerilog (BSV)

## Quickstart

### Create an environment for BSC
```shell
source env.sh
```

### Simulate
```shell
bsc -sim -u ./test/Tb.bsv
bsc -sim -e mkTb1
./bsim
```
or
```shell
./brun.sh mkTb1 -m 100
./brun.sh mkTb2 -m 100
./brun.sh mkTb3 -m 100
./brun.sh mkTb4 -m 100
```

# Create RTL
```shell
bsc -verilog -u ./test/Tb.bsv
```

## References
* [Eugene Hogenauer, "An economical class of digital filters for decimation and interpolation", IEEE Transactions on Acoustics Speech and Signal Processing, May 1981](doc/Hogenauer1981-AnEconomicalClassofDigitalFiltersforDecimationandInterpolation.pdf)
