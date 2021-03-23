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
	// for frequency of MIDI Note 0.
	double c0;
	 // for frequency of Middle C.
	double c5;
	// . . . which we want to find.
	double frequency;
	// . . . given this note.
	int midinote;

	/* calculate required numbers */
	semitone_ratio = pow(2, 1/12.0);

	c5 = 220.0 * pow(semitone_ratio, 3);
	c0 = c5 * pow(0.5, 5);

	// Calculate freq for given MIDI Note.
	midinote = 73;
	frequency = c0 * pow(semitone_ratio, midinote);
	printf("MIDI Note %d" midinote);


	printf("midifreq/001**\n");



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
// So an octave below Concert A would
// have the frequency 220 Hz & a further
// octave fall halves the frequency to
// 110 Hz.
//
// A single semitone rise corresponds to
// the (approximate) value 1.0594631,
// which is (approximately) the twelfth
// root of 2 (a semi-tone "only" in E.T.
// 12 tuning). That is to say, multiply
// 1.0594631 by itself twelve times and
// you should get the value 2.0.
//
// This operation, known as raisong to a
// power, is notaded mathematically as
// 1.0594631^12.
