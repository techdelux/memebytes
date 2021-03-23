#include <stdio.h>
#include <math.h>

void midifreq()
// Converts MIDI Note number to its
// equal-tempered frequency in hertz.
//
// Background information below main
// function.
{
	double semitone_ratio;
	double c0; /* for frequency of MIDI Note 0 */
	double c5; /* for frquency of Middle C */
	double frequency; /* . . . which we want to find. */
	int midinote; /* . . . given this note. */

	/* calculate required numbers */
	printf("midifreq/001\n");


}


int main(){

	midifreq();
	return 0;

}


// MidiFreq function information.
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
//
// Middle C on the piano keyboard is
// defined to be MIDI Note 60. Given the
// international tuning standard, in
// which Concert A = 440, and assuming
// equal temperament (E.T.), middle C
// has a frequency of approximately
// 262.626 Hz.
//
// An octave contains 12 semitones, so
// that C an octave below middle C
// would correspond to MIDI Note 48.
//
// An octave jump corresponds to a
// frequency change by a factor (or 
// ratio) of 2: doubled for an octave
// rise, and halved for an octave fall.
//
