notes:
if it crashes or says PAKALA A! you did something wrong. there are NO bugs (because they're all features)
.ike extension for arabic numbers in <p> and <o> and the seme command (0-9)
.pona extension for pu numbers (wan, tu, luka, mute, ale/ali)
printing numbers is arabic and this is intentional (challenge: print pu numbers)
this is the final version no more revisions
if you want latin alphabet:
use a full sitelen pona font
use lookalikes: kapa = a, alu = c, jo = g, etc.

syntax: <c> <p> e <o>
<p> and <o> are numbers
<c> is a nimi

moku:
there is a (simulated) jan that runs your code. it must be fed.
the jan starts with 20 moku points
at the end of every instruction executed the jan will lose 1 moku point
use kala to feed it. this will take a few moments, and it refills the jan's moku points to 20
if it is lower than 1 before an instruction, the jan will stop because of hunger
you should feed your jan
the jan is not fast (this is normal)
 

commands:
lon      -> exist a box p
kon      -> unexist a box p
ijo      -> put 1 thing into box p
lanpan   -> take out 1 thing from box p
a        -> print nimi of box p (1 = a, 2 = akesi, etc.)
nanpa    -> print number of things in box p as an arabic number
weka     -> for every thing in box o take out one from box p
esun     -> take 1 thing from box p and put in box o
anu      -> put either p or o things into box o
ken      -> skip the next instruction 50% of the time
mute     -> skip the next instruction if box p has at least one thing
jo       -> grab box p, this moves it into the hand, leaving a gap to be lonned
pana     -> place the grabbed box to p, box p must not exist yet
kala     -> the (simulated) jan that runs your code must be fed. this feeds it a kala pona which makes it full.
loje     -> makes the text from now on red
jelo     -> makes the text from now on yellow
laso     -> makes the text from now on grue/aqua/turquoise/laso
walo     -> makes the text from now on white
pimeja   -> makes the text from now on gray (because black blends in with the background)
la       -> makes the function with the nimi number of p move the code to the next instruction, will crash if the nimi number is already taken.
seme     -> ask for input. if applicable, creates/replaces a box p with the written number of ijo in it. 
            box o and boxes to the positive side of o get created/replaced with the nimi numbers of the written words, like this:
            input (toki a) becomes box o = 109 (toki) box o+1 = 1 (a)
lape     -> the program ends, giving the (simulated) jan some rest. passing beyond the code will result in a crash, so make sure to use this
n        -> when the command is n, the rest of the command is not parsed, and is not run. this allows you to have comments in your code
