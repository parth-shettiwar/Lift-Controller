5 floor lift:
170070021 - Parth Shettiwar
170070011- Parth Patil
17D070034 - Ayushraj Mehrotra

Input form:For every floor up and down buttons are there and inside the lift there are 5 buttons for going to a particular floor.

Number of input bits - 10(2 for every floor)+5(for inside lift) + 1(force input)=16
Convention for floor buttons:
00 - no button pressed
01 - down button pressed
10 - up button pressed

XXXXX - For inside Lift buttons,X can be either 0 or 1.
Example - 00101 means ground and 2nd floor buttons are pressed inside the lift.

Force open input is a single bit input.
If set to 1,it will open the lift at that floor if its closing.This simulates a real lift where we can open a closing door from inside.(When a person is rushing from outside but cant make to the lift)

Outputs - Direction of lift(2 bit) and current floor(5 bit).
Direction is 2 bit encoded.
00 - Lift is idle
01 - going down
10 - going up

Current floor is 5 bit encoded(One hot encoding)
Example - 00100 means Lift is at second floor.

The stae of Lift is also observed.
Lift can be in one of five states - IDLE,UP,DOWN,OPENING,CLOSING

Include Gates.vhdl,distance.vhdl and Lift.vhdl files in quartus project and make the Lift.vhdl file as top entity.Compile and Run the RTL simulation and give the inputs.The lift is initially considered to be at ground floor.


