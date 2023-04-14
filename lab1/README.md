# lab1

## install env

```
sudo apt-get update
sudo apt-get install iverilog 
sudo apt-get install gtkwave
```

## basic operation (Hello World)

compile && simulate "Hello"
```
iverilog -o compiled_file.vpp Hello.v && vvp compiled_file.vpp
```

View waveform (A dump file will be generated if $dumpfile("dump_file.vcd") is called in simulate)
```
gtkwave dump_file.vcd
```

## lab1 operation

```
# compile
make
# simulate
vvp lab1.vpp
# check wave
gtkwave lab1.vcd
```


