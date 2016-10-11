% Darude Matlabstorm project
% Jonathan Mace
% Creates a rendition of the song Sandstorm, by Darude (https://www.youtube.com/watch?v=y6120QOlsfU)
%Uses sheet music from https://musescore.com/user/1391776/scores/1055511
%https://www.scribd.com/doc/261710471/Darude-Sandstorm-Piano-Sheet-Music
% The code from this https://www.youtube.com/watch?v=voDSnB6fmnM person was very useful to me creating this
%Note: It is hard to accurately portray a song accurately, creating it from scratch, especially playing it in a programming language.
%I haven't added any harmonics or anything, so it doesn't sound like any real instrument
%I like the way it sounds, though. It gives it a bit of uniqueness to it. It's how the instrument of Matlab sounds.


clear,clc;
t = [0:.000125:.2]; %You can adjust the length of each note here
u = [0:.000125:.1];
r = zeros(1,800); %about half a note, useful to make a note play only half as long and combine it with 
%a longer-playing note

%Creates all the notes
%Each note is just a sinusoidal wave, given by sin(2*pi*frequency*t)
All = sin(2*pi*110*t);
Al = sin(2*pi*220*t); % The 'l' attached to A is to show it's a note below middle C.
A = sin(2*pi*440*t);
C = sin(2*pi*523.25*t);
D = sin(2*pi*587.33*t);
Dshort = sin(2*pi*587.33*u);
E = sin(2*pi*659.26*t);
Eshort = sin(2*pi*659.26*u); %Shorter version of E
midc = sin(2*pi*261.6*t);
G = sin(2*pi*392.00*t);
Gl = sin(2*pi*196*t); % The 'l' attached to 'G' is to show it is below middle C
Gll = sin(2*pi*98*t); %below GL 
B = sin(2*pi*493.88*t);
Bshort = sin(2*pi*493.88*u); %Shorter version of B, to play two in quick succession
F = sin(2*pi*349.23*t);
Fl = sin(2*pi*174.61*t); % The 'l' attached to 'F' is to show it is below middle C
Dl = sin(2*pi*293.66*t); % The 'l' attached to the 'D' is to show it is below middle c
Dll = sin(2*pi*73.42*t); %lower than Dl
Bl = sin(2*pi*246.94*t); % The 'l' attached to the 'B' is to show it is below middle c
El = sin(2*pi*164.81*t); % Same condition as above.
Ell = sin(2*pi*82.41*t);
Fs = sin(2*pi*369.994*t);

%These are different chords, and other combinations of notes that I want to play at the same time
dChord = (Dl + Fs + Al);
eChord = (El+Gl+Bl);
gChord1 = (Gl + C + El);
gChord2 = (Gl + Bl + Dl);
aChord = (Al + midc + E);
Bshortdouble = [Bshort Bshort(1:length(Bshort)-1)];
Dshortdouble = [Dshort Dshort(1:length(Dshort)-1)];
Eshortdouble = [Eshort Eshort(1:length(Eshort)-1)];%makes the two short notes in quick succession the length of one note
ebChord = (eChord + Bshortdouble);
ebChordshort = (eChord + [Bshort, r]);
edChord = (eChord + D);
eeChord = (eChord + Eshortdouble);
eb = (El + Bshortdouble);
ellb = (Ell + Bshortdouble);
ae = (All + Eshortdouble); %Is an even lower A
eaChord = (aChord + Eshortdouble);
daChord = (aChord + Dshortdouble);
dgChord = (gChord2 + Dshortdouble);
dgchordshort = (gChord2 + [Dshort, r]);
gd = (Gll + Dshortdouble); %Gll + Drepeated note
dd = (Dll + D); %Dll + D
adChord = (dChord + A);
geBEG = (B + E + G);

%Here I organise all of the lines together
%Each line is just a big long sinusoidal wave
%Combining them line by line is easier in a number of ways
%To both read, and to test to make sure it sounds right.
line1 = [eChord eChord eChord eChord eChord aChord eChord eChord eChord eChord eChord aChord eChord eChord eChord eChord eChord aChord aChord aChord gChord2 gChord2 gChord2 dChord];
line2 = [ebChord ebChord ebChordshort eChord eChord aChord eChord eChord eChord eChord edChord dChord ebChord ebChordshort eChord eChord eChord aChord aChord aChord gChord2 gChord2 dgchordshort dChord];
line3 = line2; %Just repeated
line4 = [ebChord ebChord eChord eChord eChord eChord ebChord ebChord eChord eChord eChord eChord ebChord ebChord eChord eChord eChord eChord ebChord ebChord eChord eChord eChord eChord]; %ebChord ebChord eChord eChord eChord eChord repeated four times
line4b = [eChord eChord eChord eChord eChord eChord eChord eChord eChord eChord eChord eChord eChord eChord eChord eChord eChord eChord eChord eChord eChord eChord eChord eChord]; %ebChord ebChord eChord eChord eChord eChord repeated four times
line5 = [ebChord ebChord eChord ebChord ebChord eChord ebChord ebChord eChord ebChord ebChord eChord ebChord ebChord ebChord ebChord ebChord ebChord ebChord ebChord];

transition = [eb ebChord eb ebChord eb ebChord eb eaChord ae eaChord ae dgChord gd dgChord dd adChord];

line6 = [ebChord ebChord ebChord ebChord ebChord ebChord ebChord ebChord eb ebChord eb ebChord eb ebChord eb eaChord ae eaChord ae dgChord gd dgChord dd adChord];
line6end = [eb eaChord ae eaChord ae dgChord gd dgChord dd adChord];
line7 = [eb ebChord eb ebChord eb ebChord eb eaChord eb ebChord eb ebChord eb ebChord eb eaChord eb ebChord eb ebChord eb ebChord eb eaChord];
line8 = [ae eaChord ae daChord gd daChord dd adChord ellb ebChord ellb ebChord ellb ebChord eb eaChord];

%Adds all the lines together
song = [line1 line2 line3 line4 line5 line6 line7 line8 transition line7 line8];

%Plays the song!!!
soundsc(song)