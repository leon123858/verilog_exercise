# lab1

## install env

```
sudo apt-get update
sudo apt-get install iverilog 
sudo apt-get install gtkwave
```

optional: install formatter

download from `https://github.com/ericsonj/verilog-format` for install in linux
by the way, you need to `sudo apt update && sudo apt install default-jre` for JAVA

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


