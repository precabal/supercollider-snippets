// adapted from http://danielnouri.org/docs/SuperColliderHelp/Streams-Patterns-Events/Pbrown.html

(
SynthDef("help-sinegrain",
	{ arg out=0, freq=440, sustain=0.05, attack=0.01;
		var env;
		env = EnvGen.kr(Env.perc(attack, sustain, 0.1), doneAction:2);
		Out.ar(out, [SinOsc.ar(freq, 0, env)])
	}).send(s);
)

(
var a;
a = Pbrown(0.0, 1.0, 0.01, inf).asStream;
b = Prand([544.29, 685.76, 915.38, 726.53, 363.27, 457.69, 181.63, 181.63], 900).asStream;
{

	loop {
		Synth("help-sinegrain", [\attack, a.next * 0.01 + 0.005, \freq, b.next]);
		0.15.wait;
	}
}.fork;
)