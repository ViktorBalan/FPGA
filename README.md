# FPGA

This is a directory documenting a school project. The first objective is to familiarize oneself with verilog and the FPGA, and the ultimate goal is to build a simple CPU program on the [Icestick](https://www.latticesemi.com/icestick).
The tutorials and resources used for the learning stage are stored in the `learning` directory. `existing_implementations` directory contains materials related to the objective of studying existing CPU implementations.

# how to build

The source codes of designs in this project can be built and uploaded onto the Icestick by following these instructions (note: steps 1 to 4 are only necessary to initially set Apio up. Once you have done them once, you only need to perform step 5 or 6 when building/testing):
1. make sure you have Python installed
2. use pip to install Apio by running the command `pip install -U apio` in terminal
3. install packages by running `apio install --all`
4. depending on the FPGA you're using, you may have to install FTDI or serial drivers (the Icestick has FTDI drivers).
Do this by plugging in the board and then running `apio drivers --ftdi-enable` or `apio drivers --serial-enable` respectively.
You may need to run cmd as administrator for this step.
Follow the instructions in the terminal to replace the driver.
5. to synthesize a project, run `apio build` in the project's folder. Then, run `apio upload` to upload it to the connected FPGA.
6. alternatively, you may simulate a testbench by running `apio sim`. You can append the wires in the list on the left to view their values during the simulation.