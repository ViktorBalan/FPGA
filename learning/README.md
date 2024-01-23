# Learning resources

I mostly used tutorials made by DigiKey available [here](https://www.youtube.com/watch?v=lLg1AgA2Xoo&list=PLEBQazB0HUyT1WmMONxRZn9NmQ_9CIKhb) on Youtube.
I have used [Apio](https://github.com/FPGAwars/apio) to build and test the programs, and run them on the [Icestick](https://www.latticesemi.com/icestick) itself.
The folders here document programs I have created, mostly following the exercise statements in the tutorial:

1. gate
	- a simple exercise solution using wire assignment - a full-adder circuit that adds three bit inputs together and displays the result on two output bits
	
2. counter
	- an always loop test - a circuit with two inputs and four LEDs that counts through numbers 0-15 in a loop with every "clock" tick
	
3. slow_counter
	- a counter same as before, except incrementing automatically every second
	
4. msm
	- a Moore State Machine - waits for the go signal, then counts up using four LEDs, blinks a green LED and returns to waiting state when done
	
5. debouncer
	- exercise solution - a simple state machine that prevents buttons outputting too frequently by waiting for the button to be unpressed until its signal is registered again
	
6. clock_dividers
	- a demonstration of module nesting, where a module is instantiated inside of another. The inner clock_divider module is used again in further exercises and simply transforms the fast clock into a slower one. Two are instantiated, controlling two LEDs in the whole design
	
7. boomerang
	- an exercise solution - the circuit waits for a signal, counts from 0-15 on the LEDs and then back. Implemented by two counter modules combined with an AND

8. div_testbench
	- a testbench around the clock_divider module

9. memory
	- simple memory module - reads and writes data. Also includes a testbench module with tests

10. playback
	- a module that cycles through numbers 0-15 on the four LEDs. During the first repetition, it samples button's state at even intervals, and then reconstructs the pattern with the green LED each following repetition
	this is based on an exercise from the tutorials, but adapted to require less buttons
	
11. pll
	- usage of a phase-locked loop

The source codes of exercises in the folders can be built and uploaded onto the Icestick by following these instructions (note: steps 1 to 4 are only necessary to initially set Apio up. Once you have done them once, you only need to perform step 5 or 6 when building/testing):
1. make sure you have Python installed
2. use pip to install Apio by running the command `pip install -U apio` in terminal
3. install packages by running `apio install --all`
4. depending on the FPGA you're using, you may have to install FTDI or serial drivers (the Icestick has FTDI drivers).
Do this by plugging in the board and then running `apio drivers --ftdi-enable` or `apio drivers --serial-enable` respectively.
You may need to run cmd as administrator for this step.
Follow the instructions in the terminal to replace the driver.
5. to synthesize a project, run `apio build` in the project's folder. Then, run `apio upload` to upload it to the connected FPGA.
6. alternatively, you may simulate a testbench by running `apio sim`. You can append the wires in the list on the left to view their values during the simulation.