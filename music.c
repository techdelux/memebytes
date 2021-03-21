#include <stdio.h>


void midifreq()
// Converts MIDI Note number to its
// equal-tempered frequency in hertz.
//
// Background information below main
// function.
{
	
	printf("midifreq\n");


}


int main(){

	midifreq();
	return 0;

}


// MidiHertz function information.
//
// Midi note data values use an unsigned
// seven-bit integer range i.e. from 0
// to 127 inclusive.
//
// These numbers have to brace key
// numbers, various controllers
// (including Pitchbend and Modulation),
// Key Velocity and Pressure, and so on.
//
// Converting midi values into other
// things is going to be a very common
// operation.
