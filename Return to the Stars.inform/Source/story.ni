"Return to the Stars" by Adrian Welcker

The story genre is "Science Fiction". The story headline is "An Interactive Escape".
The story description is "After having been taken captive in battle, you soon settled into a routine: sleep, eat, shower, reconsider your life choices, repeat. Until, one day, there is no more food. Or guards, for that matter. It seems to be up to you to find a way out of your prison and back home...".

Release along with cover art ("A starship leaving a planet"), a "StarryVoid" website, a "Quixe" interpreter, and the source text.

Book 1 - Preamble

Use american dialect and the serial comma.

Include Basic Screen Effects by Emily Short.
Include Menus by Emily Short.
Include Version 16 of Smarter Parser by Aaron Reed.
Include Version 5/170902 of Undo Output Control by Nathanael Nerode.
Include Version 1/170902 of Title Case for Headings by Nathanael Nerode.
Include Version 3/210518 of Multi-examine by Jon Ingold.

[This is an instruction to the I6 compiler to leave out routines not used by the game (such as those relating to external files and real numbers), reducing the size of the resulting Glulx story file by some 10%.]
Use OMIT_UNUSED_ROUTINES of 1.

[Upon startup, the library checks whether the current interpreter claims to support unicode, and stores the result in this global variable.]
To decide whether unicode is available:
	(- unicode_gestalt_ok -).

To say dash:
	if unicode is available, say unicode 8211;
	otherwise say "--".

To say CO2:
	if unicode is available, say "CO[unicode 8322]";
	otherwise say "CO2".

When play begins (this is the show intro rule):
	say "With his back against the proverbial wall, your commander ordered a somewhat daring raid on a Shwabolian outpost to break out of the strategic stalemate. Naturally, things didn't quite go as planned. Several members of your platoon were killed, and you were separated, captured, sedated, and taken to this prison... somewhere.[paragraph break]Initially, you settled into a sort of routine: sleep, shower, eat, reconsider your life choices, the occasional questioning impeded by language barriers, and back to sleep again. But it has been three days since your captors last fed you [dash] or given you any attention, really. If you are to leave this planet alive, you better find a way before you starve..."

After printing the banner text:
	say "[italic type][if gore is allowed]Content Warning: descriptions of gore and violence[otherwise]Toned down mode[end if] [dash] type ABOUT for more info.[roman type][paragraph break]".

Gore-allowed is a truth state that varies. Gore-allowed is usually true.
To decide whether gore is allowed/enabled:
	decide on whether or not gore-allowed is true.
To decide whether gore is not allowed:
	decide on whether or not gore-allowed is false.

Chapter I - Menus

Requesting the game menu is an action out of world applying to nothing.
Understand "credits" or "about" or "help" or "hint" or "hints" or "menu" as requesting the game menu.
Carry out requesting the game menu:
	now the current menu is the Table of Main Menu;
	now the current menu title is "RETURN TO THE STARS";
	carry out the displaying activity;
	clear the screen;
	try looking.

Table of Main Menu
title	subtable	description	toggle
"Content Warning"	--	--	query gore mode rule
"Unusual Verbs"	--	"[help-text]"	--
"Hints"	Table of Hints	--	--
"Contacting the Author"	--	"[contact-info-text]"	--
"Credits"	--	"[credits-text]"	--

To say help-text:
	say "You may find the following 'non-standard' verbs to be useful on occasion:[paragraph break]CLIMB UP/DOWN [italic type]something[roman type][line break]CRAWL THROUGH [italic type]something[roman type][line break]LOOK UNDER [italic type]something[roman type][line break]CUT [italic type]something[roman type] OPEN WITH [italic type]some kind of knife[roman type][line break]SHOOT [italic type]something[roman type] WITH [italic type]some kind of gun[roman type][line break]LAUNCH[line break]PREPARE [italic type]something[roman type] FOR LAUNCH"

To say credits-text:
	say "[RttS] by Adrian Welcker[line break]Built using Inform 7 and the following extensions:[line break][complete list of extension credits]Time-keeping based on code by Eric Eve.[paragraph break][bold type]Playtesters[roman type]: [the playtesters]".

To say contact-info-text:
	say "Enjoyed playing [RttS]? Found a bug? Got stuck and need a hint?[paragraph break]The most straightforward way to reach out is by e-mail to ardi@diepixelecke.de. For more general feedback, you can leave a review on IFDB, or just start talking about the game on intfiction.org [dash] I'll see it sooner or later.".

To say the playtesters:
	say "Lucas Beringer, Erik Schwejda, Edo, and Peter M.J. Gross".

To say rtts/RTTS/RttS:
	say "[italic type]Return to the Stars[roman type]".

This is the query gore mode rule:
	say "[RttS] contains a few descriptions of gore and violence that some people may find objectionable. If you wish for these descriptions to be toned down (for example, when playing with smaller children), you can do that here.[if gore is allowed](Currently using original text.)[otherwise](Currently using toned-down text.)[end if][paragraph break]Show descriptions in their full gory descriptiveness? (YES or NO) >>";
	now gore-allowed is whether or not the player consents.

Chapter II - Final Question and Authors Notes

Table of Final Question Options (continued)
final question wording	only if victorious	topic	final response rule	final response activity
"read some author's NOTES about this story"	true	"author/author's/-- note/notes"	author's notes rule	--

This is the author's notes rule:
	say "Thank you for playing 'Return to the Stars'![paragraph break]The general premise of needing to escape from captivity on an alien world occurred to me in early 2018, but as things often go in life, I was busy with other projects, so the idea was set aside and mostly forgotten about. The announcement of ParserComp 2021 brought the concept back to my mind, I reduced the scope somewhat, and in April [']21 I finally sat down and started working on the implementation in earnest [dash] partially out of sheer boredom, some five months into Germany's second COVID lockdown. Its release marks the first time I actually finish and publish a piece of IF.[paragraph break]With the minor history lesson out of the way, it is time for some acknowledgements. While it is often said in writing circles that 'everything has been done before', and that it's all about the individual author's take on a certain concept, I think it is only fair for me to acknowledge the major source of inspiration for 'Return': Marko Kloos['] [italic type]Frontlines[roman type] novel series. (And probably half a dozen others, subconsciously, but that's usually the one that comes to my mind when I think 'military SF'. I highly recommend it.) As such, the appearance of certain names or phrases, such as [italic type]space-borne infantry[roman type], is no coincidence. (Rest assured, however, that this is not just a barely-concealed fanficion.)[line break]And, last but not least, a huge THANK YOU to my playtesters, who helped catch a number of larger and smaller issues in the game: [the playtesters].".

Chapter III - Hints

Table of Hints
title	subtable	description	toggle
"How do I leave the cell?"	Table of Cell-Leaving Hints	a text	hint toggle rule
"How do I leave the prison building?"	Table of Prison-Leaving Hints	--	hint toggle rule
"How do I avoid dying outside?"	Table of Air-Supply Hints	--	hint toggle rule
"How do I cross the water?"	Table of Diving Hints	--	hint toggle rule
"How do I unlock the door to the command center?"	Table of CCDoor Hints	--	hint toggle rule
"How do I return to the prison island?"	Table of Island-Return Hints	--	hint toggle rule
"How do I pass the force field to the hangar?"	Table of Forcefield Hints	--	hint toggle rule
"How do I start up the ship?"	Table of Ship-Starting Hints	--	hint toggle rule
"How do I avoid getting shot?"	Table of Combat Training	--	hint toggle rule
"How do I retrieve the swallowed object?"	Table of Autopsy Hints	--	hint toggle rule
"How do I launch the ship?"	Table of Launching Hints	--	hint toggle rule
"How do I return home?"	Table of Homecoming Hints	--	hint toggle rule

Table of Cell-Leaving Hints
hint	used
"Look around again."	a number
"There is another option besides the door."
"That air duct sure looks interesting."
"The grate covering it looks old and fragile."
"It's too far up to kick it in, but you can try something else."
"PULL GRATE. CRAWL THROUGH DUCT."

Table of Prison-Leaving Hints
hint	used
"For security reasons, the airlock leading out of the building doesn't open from the inside."	a number
"Perhaps you can disable the locks altogether."
"Investigate the switches in the installations room."
"If only you could read them."
"Your armor has a translator. Find it, then return to the installations room."
"The foors in the facility have a magnet-based locking mechanism."
"SWITCH MAGLOCK OFF."	

Table of Air-Supply Hints
hint	used
"You will need some kind of respiratory protection."	a number
"Your trusty battle armor has that functionality. If only you had it..."
"You can find the helmet in the control room and the rest of it in the storage room."
"The storage room is east of the front office."

Table of Diving Hints
hint	used
"Swimming in armor isn't really an option, obviously."	a number
"But the armor has a built-in air supply."
"And it can function as a space suit."
"It might make for passable diving equipment as well."
"JUMP IN WATER. Then walk north."

Table of CCDoor Hints
hint	used
"The door has an attached card reader."	a number
"So you'll need some kind of access card to unlock the door."
"Perhaps someone has lost theirs somewhere."
"Back on the prison island."
"It's in the control room."
"Under the desk."
"LOOK UNDER DESK."
"Return, then UNLOCK DOOR WITH CARD."

Table of Island-Return Hints
hint	used
"Go back through the water, all the way to the south."	a number
"You can CLIMB THE CLIFFS."

Table of Forcefield Hints
hint	used
"Read the room description for the plaza."	a number
"Stay and LOOK a couple of times."
"Some things can pass through the force field."
"What do those things have in common."
"They're all native to the planet."
"You will need to disguise yourself as being native to the planet."
"The shoreline is rather muddy."
"Go there, then COVER ARMOR IN MUD."

Table of Ship-starting Hints
hint	used
"You'll need the keys, so to speak."	a number
"Try finding the owner of the ship."
"He's in the command center."
"In the ops center, all the way to the north."
"Bring a gun."
"Once you've done that, ENTER THE SHIP and PUT CRYPT IN RECESS."
"Now, BOOT UP SHIP."	

Table of Combat Training
hint	used
"Sometimes, violence is the only answer."	a number
"Best to bring more than your fists to a gunfight."
"There's a small armory in the command center."
"Take the rifle and ammo."
"Combat is randomized, so you'd better SAVE."
"Go back to the ops center, then SHOOT one of the aliens WITH THE RIFLE."

Table of Autopsy Hints
hint	used
"The owner isn't going to return it willingly."	a number
"He seems hell-bent on killing you, so perhaps deal with that first."
"He is dead. It doesn't need to be pretty."
"You will need some kind of cutting tool."
"The shelf in the armory didn't seem to be very well made."
"BREAK SHELF. Now you have a makeshift knife."
"[if gore is allowed]CUT LARGER CORPSE WITH KNIFE[otherwise]RETRIEVE SWALLOWED OBJECT FROM LARGER[end if]."
"[if gore is allowed]And once that is done, you may feel the need to THROW UP[otherwise]You now have the object[end if]."

Table of Launching Hints
hint	used
"You'll need to get it out of the hangar first."	a number
"The control room (UP from the hangar) has control over that."
"OPEN LAUNCH DOORS first."
"Then, PUSH RED BUTTON."
"The ship is now outside."
"Go out, then ENTER SHIP."
"Boot up the ship, if you haven't already."
"Finally, TAKE OFF."
"(Or something to that effect. You might prefer to ASCEND INTO THE SKIES.)"

Table of Homecoming Hints
hint	used
"Once you're in orbit, it's simple."	a number
"Try some commands related to going home."
"You can quite literally say GO HOME."
"(Or TRANSITION TO EARTH, or even PUT THE PEDAL TO THE METAL.)"

Book 2 - Mechanics

Chapter 1 - Player Description

The description of the player is "[if the player is wearing the armor and the armor is clean]In [our] armored suit [we] almost look soldierly again[otherwise if the player is wearing the armor and the armor is muddy]Covered in a generous amount of ocean mud [dash] [we] [haven't] looked this bad since bootcamp, probably. [We]['re] not sure whether [we] look particularly fierce or particularly ridiculous[otherwise if the player is wearing the armor and the armor is covered][We]['ve] completely covered [ourselves] in the ocean mud, so [we] now look more like a vaguely human-shaped brown blob[otherwise if the player is wearing the armor and the armor is not clean][We] look like [we] just dug around in another person's body, because that's exactly what [we] did. [We] should find a place to clean up[otherwise][We]['ve] seen better days[end if]."

The player is wearing a set of fatigues. The description of the fatigues is "A set of standard-issue combat fatigues, consisting of a gray shirt, pants and blouse in a grey-and-black digital urban camouflage pattern, and a pair of black leather boots[if the number of things held by the player is 1]. It is the only possession you have left at the moment[end if].". Understand "uniform" or "fatigue" or "fatigues" or "blouse" or "pants" or "trousers" or "shirt" or "clothes" or "digital" or "urban" or "camo" or "camouflage" or "battle/combat dress" as the fatigues.
Instead of taking off the fatigues, say "You'd rather not strip naked.[if the location is your cell] It's not exactly warm in here, anyways.[end if]".
Report smelling the fatigues:
	say "You've been wearing the same clothes for the past few weeks, so they don't exactly smell fresh anymore."
The pair of black leather combat boots is part of the fatigues. The description is "A pair of black leather combat boots. They have carried you across many worlds already."
Instead of taking off the boots, say "Walking around barefoot doesn't seem particularly beneficial right now."
Instead of taking off something that is not the armor when the armor is worn:
	if the noun is the helmet lamp, make no decision;[* which then goes on to print "that seems to be part of your armor".]
	say "You'd rather not strip naked. Also, you would need to remove the armor first.".
Instead of attacking the fatigues, say "Strips of fabric can come in handy in all sorts of situations, but the current is not among them."
Instead of doing something other than examining to the fatigues when the player is wearing the armor, say "You can't do that while wearing [the armor] over top of the fatigues."

Instead of listening to the player:
	if we have not eaten:
		say "Your stomach is growling.";
		take 10 seconds;
		rule succeeds;
	otherwise:
		continue the action.

Chapter 2 - Time

Section 1 - Applying Time

[Time is a somewhat important concept in this story, so we give it a little extra attention.
Implemented as a variation on Eric Eve's "Variable Time Control", that doesn't immediately gobble up the time taken once calculated.]

The work duration is a number that varies.
The work duration variable translates into I6 as "action_seconds".
The current-action-time-custom is a truth state that varies.
The current-action-time-custom variable translates into I6 as "action_time_is_custom".

[This could easily be written in I7, but since the regular "advance time rule" is implemented in I6, it feels more adequate for our replacement to do the same.]
Include (-
! The number of seconds the current action will take
Global action_seconds;
! The number of seconds in the current minute of the time of day
Global time_seconds;
! Whether or not the current action has customised the time
Global action_time_is_custom;
! Default duration of an action that doesn't set its own time (one minute, just as usual)
Constant DEFAULT_ACTION_SECONDS = 60;

[ ADVANCE_TIME_R;
	! Apply default time if the action succeeded and didn't set its own time.
	if ((~~action_time_is_custom) && (reason_the_action_failed == 0)) action_seconds = DEFAULT_ACTION_SECONDS;
	if (action_seconds > 0) turns++;
	! Calculate the new time of day, leaving the action's time intact (which the Variable Time extension doesn't do, unfortunately)
	time_seconds = time_seconds + action_seconds;
	if (time_seconds >= 60) {
		the_time = the_time + (time_seconds / 60);
		time_seconds = time_seconds % 60;
	}
	the_time = the_time % TWENTY_FOUR_HOURS;
	rfalse;
];
-) instead of "Advance Time Rule" in "OrderOfPlay.i6t".

[This can't be a simple "every turn" rule, because those run before the "advance time" rule. Figuring that out gave me a bit of a headache...]
This is the update air and reset time rule:
	[modify remaining air according to the number of seconds the action took
	(which is why it is so important for that number to remain available)]
	follow the air supply rules for the location;
	[and go back to default time for the next action]
	now current-action-time-custom is false;
	now the work duration is 0.
The update air and reset time rule is listed after the advance time rule in the turn sequence rules.

To take (s - a number) seconds:
	now current-action-time-custom is true;
	increase the work duration by s.
To take (s - a number) seconds in total:
	now current-action-time-custom is true;
	now the work duration is s.
To take no time: take zero seconds in total.
To take (m - a number) minutes: take (m times 60) seconds.
To take (m - a number) minutes in/-- total: take (m times 60) seconds in total.

Section 2 - Default Timings for Standard Actions

[Standard actions concerning the actor's possessions]
Carry out taking inventory (this is the default taking inventory timings rule): take 20 seconds.
Carry out taking (this is the default taking timings rule): take 10 seconds.
Carry out removing it from (this is the default removing it from timings rule): take 15 seconds.
Carry out dropping (this is the default dropping timings rule): take 10 seconds.
Carry out putting it on (this is the default putting it on timings rule): take 10 seconds.
Carry out inserting it into (this is the default inserting it into timings rule): take 15 seconds.
Carry out eating (this is the default eating timings rule): take 2 minutes.

First for implicitly taking something (this is the implicitly taking timing rule):
	take 10 seconds;
	make no decision.

["Standard actions which move the actor" are all left at the default one minute]

[Standard actions concerning the actor's vision]
Carry out looking (this is the default looking timings rule): take five seconds.
Carry out looking under (this is the default looking under timings rule): take 30 seconds.

[Standard actions which change the state of things]
Carry out locking it with (this is the default locking timings rule): take 30 seconds.
Carry out unlocking it with (this is the default unlocking timings rule): take 30 seconds.
Carry out switching on (this is the default switching on timings rule): take 30 seconds.
Carry out switching off (this is the default switching off timings rule): take 30 seconds.

Carry out attacking (this is the default attacking timings rule): take 90 seconds.

Chapter 3 - Unthings

[This is another concept lifted from TADS's adv3 library: a thing denoting the absence of a thing.]
An unthing is a kind of thing. It is always scenery. The description is usually "[The printed name] isn't here."
Instead of doing something other than examining to an unthing, try examining the noun.

Does the player mean doing something to an unthing: it is unlikely.

Chapter 4 - Armor, Air, and Toxicity

Section 1 - Armor

The player has a number called the air. The air of the player is 360. [6 minutes]
The armor has a number called the air. The air of the armor is 6000. [100 minutes]
The armor is wearable and proper-named. It is a player's holdall. It is open and unopenable. The printed name is "[our] armor".
Understand "your/my/-- battle/combat/-- armor/armour/rattle" or "your/my/-- suit/set of/-- battle/combat/-- armor/armour" or "suit" as the armor.
Dirtiness is a kind of value. The dirtinesses are clean, muddy, bloody, muddy-and-bloody, and covered.
The armor has a dirtiness. The armor is clean.
The description of the armor is "It is sometimes said that a soldier's best friend is his weapon [dash] but that hasn't really been true in a while now, with weapons being issued and turned in as needed. Your armor, however, has traveled to many a world with you, and saved your hide more than once. You're glad to have it back.[line break]It is fitted with a helmet lamp, and it can double as a space suit, providing air in hostile environments.[if the armor is not clean][paragraph break][end if][if the armor is muddy]It will need a good cleaning after being dragged across the bottom of the ocean, but it still seems to be working fine.[otherwise if the armor is covered]Any and all details are hidden under a thick, uniformly brown layer of ocean mud.[otherwise if the armor is not clean and gore is allowed]It's covered with a lot of blood and other... things. You should really find a place to clean up.[otherwise if the armor is not clean]The gloves are covered in a significant amount of slimy lizard spit.[end if]".

[There is little point to the character lugging around the pieces of the armor, so we disallow explicit takes and skip the implicit one when wearing it.]
The carrying requirements rule does nothing when the current action is Wearing and the noun is the armor. The can't wear what's not held rule does nothing when the noun is the armor.
Instead of taking the armor when the implicitly taking activity is not going on:
	say "You should probably put on the armor, rather than lugging it around in pieces."

Report wearing the armor for the first time:
	say "You slip into the undersuit and latch the armored plates into place. As you slide on your helmet, the internal systems start up, informing you that everything is still in working order."; [TODO]
	rule succeeds.

[Likewise, immediately deposit the armor on the ground when taking it off.]
After taking off the armor (this is the deposit armor immediately rule):
	silently try dropping the armor;
	say "You take off the armor, setting the pieces down on the ground in front of you."

After wearing the armor (this is the take a deep breath rule):
	decrease the air of the armor by (360 minus the air of the player);
	now the air of the player is 360;
	continue the action.

Carry out wearing the armor: take two minutes.

There is a device called the helmet lamp.[* This somewhat stilted syntax is the only way we can force Inform to create "the helmet lamp" and (later on) "a helmet" as separate things. By default, Inform would assume that "helmet" is merely a shorthand form of "helmet lamp" and treat them as one object -- causing errors, because they aren't, of course.] It is part of the armor.
Understand "helmet/-- lamp/light" as the helmet lamp.
Carry out switching on the helmet lamp: now the helmet lamp is lit.
Carry out switching off the helmet lamp: now the helmet lamp is not lit.

The translator is part of the armor.
The description of the translator is "The suit's control system has a translation feature."
Instead of switching on or switching off the translator, say "The translator is always active."

The dump pouch is an unthing. It is part of the armor.
The description of the dump pouch is "All the pouches, webbing, and holsters seem to have gone missing from your armor."
Understand "holster" or "holsters" or "webbing" or "pouches" or "pockets" as the dump pouch.

[With the armor's air supply and filtration system active, we don't smell much.]
Check smelling when the player is wearing the armor and the location is not breathable:
	say "With the armor's air supply system now active, you smell absolutely nothing at all." instead.

[Conversely...]
Check smelling when the player is wearing the armor and the location is breathable and the armor is muddy:
	take 10 seconds;
	say "You have a hard time smelling anything but the rancid fish smell emanating from the mud on your armor." instead.

Instead of smelling the armor when the player is not wearing the armor and the armor is muddy, say "It smells like old fish.".

[The following is gleaned from Michael J. Robert's "Return to Ditch Day":]
Instead of rubbing the armor:
	[Having separate rules reads more nicely, but this saves us four instead rules.]
	if the dirtiness of the armor is:
		-- muddy:
			 say "You try to wipe the mud off, but all you really accomplish is smearing it around.";
		-- covered:
			say "But you just went through the effort of making sure you're entirely covered." instead;
		-- muddy-and-bloody:
			say "Really all you manage is to smear the mud-[if gore is allowed]blood[otherwise]slime[end if] mixture around more.";
		-- bloody:
			if gore is allowed, say "You try to wipe away some of the disgusting blood-and-guts mixture, but the blood is beginning to coagulate and all you manage is to leave bloody handprints on formerly clean areas of your suit.";
			otherwise say "You try to wipe off slime, but it is too sticky.";
		-- clean:
			say "You flick a bit of dust off your armor.";
	take 30 seconds.
Understand "wipe off [something]" or "wipe [something] off" or "wipe [something]" as rubbing.
Understand "wipe the/-- mud off [something]" as rubbing when the armor is mud-caked.
Understand "wipe the/-- blood off [something]" as rubbing when the armor is blood-stained and gore is allowed.
Understand "wipe the/-- slime/spit/saliva off [something]" as rubbing when the armor is blood-stained and gore is not allowed.

Definition: the armor is mud-caked:
	if it is muddy, yes;
	if it is muddy-and-bloody, yes;
	if it is covered, yes;
	no.
Definition: the armor is blood-stained:
	if it is bloody, yes;
	if it is muddy-and-bloody, yes;
	no.

Instead of rubbing the player when the player is wearing the armor, try rubbing the armor.

Report touching something that is not a person while the player is wearing the armor:
	say "Through [our] armored gloves, [we] don't really feel much of anything."

Understand "fly" or "fly up/away" or "take flight/off" as a mistake ("While your suit has many functions, flying isn't one of them.") when the player is wearing the armor and the player is not in the messenger ship.

["remove helmet" is understood as the helmet lamp, which leads to odd responses. I'm too lazy to add the helmet as a separate part of the armor, so this hackery will have to do.]
Instead of taking off the helmet lamp when the last word in "[the player's command]" is "helmet":
	if the location is not breathable, say "That wouldn't be a great idea in the current environment";
	otherwise say "Your helmet is best carried on your head, not under your arm.";
	take no time.

To decide which text is the last word in (T - a text):
	let N be the number of words in T;
	decide on word number N in T.

Section 2 - Toxicity, Vacuum, Submersion

[Here we lay out what happens when the player ventures into a hostile environment without adequate protection.]
A room can be toxic, vacuum, submerged, or breathable. A room is usually breathable.
An outdoor room is a kind of room. An outdoor room is usually toxic.

The air supply rules are a room based rulebook.

An air supply rule for a room that is not breathable when the player is wearing the armor:
	if the air of the armor is five, say "Your suit sounds an alarm as its air supply is getting close to being depleted.";
	decrease the air of the armor by the work duration;
	if the air of the armor is less than zero:
		let d be the air of the armor multiplied by -1;
		if the air of the player is 360, say "The alarm grows more urgent as your suit's air reserve is now empty. As you take a final deep breath, you know that you have mere minutes left before you suffocate.";
		decrease the air of the player by d.

An air supply rule for a room that is not breathable when the player is not wearing the armor:
	decrease the air of the player by the work duration.

An air supply rule for a breathable room (this is the air replenishment rule):
	now the air of the player is 360;
	if the player is wearing the armor:
		if the air of the armor is less than 6000, increase the air of the armor by five times the work duration;
		if the air of the armor is greater than 6000, now the air of the armor is 6000.

An air supply rule for a toxic room when the air of the player is at most zero:
	say "Without [unless the player is wearing the armor]the protection of your suit[otherwise]your suit's air supply[end if], you succumb to the toxic atmosphere of this wholly hostile world.";
	end the story saying "You have died".

An air supply rule for a submerged room when the air of the player is at most zero:
	say "With your suit's air supply depleted, you rapidly run out of oxygen.";
	end the story saying "You have drowned".

The first air supply rule for a vacuum room when the player is not wearing the armor (this is the die immediately in vaccum without a space suit rule):
	say "Without a space suit of some description, you quickly perish in the vacuum.";
	end the story saying "You have asphyxiated".

An air supply rule for a vacuum room when the air of the player is at most zero:
	end the story saying "You have asphyxiated".

[Being in the ship overrides all air handling.]
The first air supply rule: if the holder of the player is the messenger ship, stop.

[Give the player an explicit nudge when they venture outside without protection]
After going to a toxic room for at least the second time:
	if the player is not wearing the armor, say "Your headache quickly returns as you venture outside again";
	continue the action.

Check eating when the location is not breathable and the player is wearing the armor:
	say "That would require raising [our] faceplate, which would not be advisable right now." instead.

Section 3 - Status Bar

Table of HUD status
left	central (a text)	right
"[location]"	--	"[time of day as military time]"
"[hud-environ-status]"	--	"[hud-air]"

Table of plain status
left	central (a text)	right
"[location]"	--	"[plain-air]"

Rule for constructing the status line when the player is wearing the armor and the displaying activity is not going on:
	fill status bar with the Table of HUD status;
	rule succeeds.
Rule for constructing the status line when the player is not wearing the armor and the displaying activity is not going on:
	fill status bar with the Table of plain status;
	rule succeeds.

To say hud-air:
	if the location is breathable, stop;
	if the air of the armor is greater than 300:
		say "Air: [air of the armor / 60] min";
	otherwise if the air of the armor is greater than zero:
		say "AIR: [air of the armor / 60] MIN";
	otherwise:
		say "OUT OF AIR".

To say plain-air:
	if the location is not breathable, say "NO AIR".

To say hud-environ-status:
	if the holder of the player is the messenger ship:
		say "Breathable";
	otherwise if the location is toxic:
		say "High levels of CO2";
	otherwise if the location is vacuum:
		say "No atmosphere";
	otherwise if the location is submerged:
		say "Submerged";
	otherwise:
		say "Breathable".

[Twelve-hour AM/PM time is hardly applicable in a military context]
To say (relevant time - a time) as military time:
    let H be the hours part of relevant time;
    let M be the minutes part of relevant time;
    say "[if H is less than 10]0[end if][H][if M is less than 10]0[end if][M]hrs".

Chapter 5 - Parser Improvements

Section 1 - Synonyms and Extra Grammar

[Adding some extra grammar, mostly based on dictionary synonyms.]

[Taking, Removing it from]
Understand the command "pack" as "pick".
Understand "grab [things]" as taking.
Understand "grab [things inside] from/off [something]" as removing it from.
Understand "collect [things]" as taking.
Understand "collect [things inside] from/off [something]" as removing it from.

[Dropping]
Understand "let go of/-- [things preferably held]" or "let [things preferably held] go" as dropping.
Understand "set [things preferably held] down" or "set down [things preferably held]" as dropping.
Understand the command "release" or "relinquish" or "deposit" or "offload" as "drop".
Understand "cast aside [something]" or "cast [something] aside" as dropping.
Understand the command "toss" as "cast".

[Inserting it into]
Understand "plug [something preferably held] into [something]" as inserting it into.

[Eating]
Understand the command "consume" or "devour" or "ingest" or "munch" as "eat".
Understand "wolf down [something preferably held]" or "wolf [something preferably held] down" as eating.
Understand "chow" or "food" or "ration" as something edible.

[Going]
Understand the command "travel" as "go".

[Exiting]
Understand "stand up" as exiting.
Instead of exiting when the holder of the player is a room, try going outside.

[Looking]
Understand "look around" as looking.

[Examining]
Understand the command "survery" or "study" or "inspect" as "examine".

[Searching]
Understand "search through [something]" as searching.
Understand the command "sift" or "comb" or "weed" or "rummage" or "scour" or "dredge" as "search".
Understand "dig into/through/-- [something]" as searching.

[Locking it with]
Understand "lock [something] using [something preferably held]" as locking it with.

[Unlocking it with]
Understand "unlock [something] using [something preferably held]" as unlocking it with.
Understand "open [something] using [something preferably held]" as unlocking it with.

[Switching on]
Understand "enable [something]" as switching on.
Understand the command "activate" or "engage" as "enable".

[Switching off]
Understand "disable [something]" as switching off.
Understand the command "deactivate" or "disengage" as "disable".

[Pulling]
Understand the command "tug" as "pull".

[Opening]
Understand the command "unclose" as "open".

[Wearing]
Understand "get into [the armor]" as wearing.
Understand "get dressed in [something]" as wearing.
Understand "clothe me/you/myself/yourself/-- in/with [something]" as wearing.
Understand "dress up/down/-- in [something]" as wearing.
Understand "slip into/on [something]" as wearing.
Understand "slip [something] on" as wearing.
Understand "suit up in/with [something]" as wearing.
Understand "suit up" as wearing.
Understand "rig me/you/myself/yourself out in/with [something]" as wearing.
Understand "change into [something]" as wearing.
Understand "wrap me/you/myself/yourself/-- up/-- in [something]" as wearing.
Understand the command "bundle" as "wrap".
Understand "array me/you/myself/yourself/-- in [something]" as wearing.
Understand "equip [something]" as wearing.

Rule for supplying a missing noun while wearing:
	if the armor is in the location:
		now the noun is the armor;
	otherwise if the player is carrying the helmet and the plates are in the location:
		now the noun is the plates.

[Taking off]
Understand "pull off [something]" or "pull [something] off" as taking off.
Understand "peel off [something]" or "peel [something] off" as taking off.
Understand "cast off [something]" or "cast [something] off" as taking off.
Understand "slip out of [something]" as taking off.
Understand "slip off [something]" or "slip [something] off" as taking off.
Understand "strip off/-- [something]" or "strip [something] off" as taking off.

[Waking up]
Understand "arise" or "rise and shine" as waking up.

[Attacking]
[to allow "break orbit" without also allowing "attack orbit"]
Understand the command "break" as something new.
Understand "break [something]" as attacking.
[to allow "hit the hyperlane", but not "torture the hyperlane"]
Understand the command "hit" as something new.
Understand "hit [something]" as attacking.
[to allow "punch it" (for going home), but not "torture it"]
Understand the command "punch" as something new.
Understand "punch [something]" as attacking.

[Further separate attacking into verbs that make sense for shooting, and those that don't.]
Understand the command "attack" as something new.
Understand the command "fight" as something new.
Understand the command "murder" as something new.
Understand the command "kill" as something new.
Understand "attack [something]" as attacking.
Understand the command "combat", "fight", "murder" and "kill" as "attack".

Understand "rip up/apart/-- [something]" or "rip [something] up/apart" or "rip [something] to bits/pieces" as attacking.
Understand the command "tear" as "rip".

[Pushing it to]
Understand "pull [something] [a direction]" as pushing it to.
Understand "pull [something] to [a direction]" as pushing it to.

[Climbing]
[A concept from TADS: "go up ladder", etc.]
Understand "go up/down [something]" as climbing.
Understand "climb up/down [something]" as climbing.
Understand "slide down [something]" as climbing.

[And finally]
Understand "xyzzy" or "say xyzzy" or "cast xyzzy" as a mistake ("You're not superstitious like that.").
[https://intfiction.org/t/parsercomp-submissions-start-1st-of-may-not-the-deadline/50702]
Understand "throw snotball at evil librarian" or "throw snotball at [someone]" as a mistake ("You remember the last thing your squadmate Rovarssen told you before you got separated: [italic type]...and if nothing else, throw a snotball at them![roman type]").

Understand "use" or "use [text]" as a mistake ("You'll need to be more specific than that.").

Section 2 - Smarter Parser Stuff

Use normal blank lines.

A smarter parser rule (this is the stripping formal address rule):
	if stripping "(sir|ma'am|maam),?" is fruitful, only from the beginning:
		identify error as stripping formal address rule;
		reparse the command.

Table of Smarter Parser Messages (continued)
rule name	message
stripping formal address rule	"[as the parser]There's no need to be overly polite.[as normal]"

[Adjust some default Smarter Parser messages to be more relevant to the game.]
Table of Smarter Parser Messages (amended)
rule name	message
stripping niceties rule	"[as the parser]As a soldier, [we]['re] used to taking orders, so there is no need for politeness.[as normal]"
asking who are you rule	"[as the parser]I'm the parser [dash] I translate what you type into actions your character takes in the story world. Use imperative commands like LOOK, GET [get noun example], or GO [get direction example] to advance the story.[as normal]"
stripping unnecessary addendum rule	"[as the parser]I only understood the first part of that[if corrections enabled is true] [dash] trying anyway[end if].[as normal]"
failed communication attempts rule	"[as the parser]Conversation isn't necessary in this story.[as normal]"

Chapter 6 - Grates and Air Ducts

An air duct is a kind of fixed in place closed enterable transparent scenery container. An air duct is always improper-named.
The description of an air duct is usually "It exudes a stream of cool, fresh air. [if the item described incorporates a grate]It is covered up by a grate[otherwise]It is open[end if]."
Understand "vent" as an air duct. [Seems kinda sus]

Carry out looking when the player is in an air duct (this is the air duct looking rule):
	say "You are lying in [the holder of the player], peeking out into the room:[paragraph break]".
The air duct looking rule is listed after the room description heading with activity rule in the carry out looking rules.

A grate is a kind of thing. A grate is part of every air duct. A grate is always improper-named. The indefinite article of a grate is usually "the".
Understand "flimsy/rusty/old/-- grate/grid/grating/bars" as a grate.

Understand the command "kick" or "bash" as "destroy".
To kick is a verb.

The block attacking rule does nothing when the noun is a grate.
Does the player mean attacking a grate when the player is in an air duct: it is likely.

Check an actor attacking a grate when the noun is not part of something:
	say "That would be fairly pointless." instead.

Carry out an actor attacking a grate (called the target) (this is the grate destruction rule):
	now the component parts core of the target is open;
	now the target is nowhere.

Report an actor attacking a grate (this is the standard report grate destruction rule):
	say "[The actor] [kick] the old grate, making a hole large enough for a person to squeeze through."

Check an actor attacking an air duct (called the conduit):
	let the target be a random grate which is part of the conduit;
	try the actor attacking the target instead.

Instead of pulling a grate which is part of an air duct (called the conduit):
	if the actor is in the conduit, instead say "The grate is mounted to the outside of the duct, and won't move when pulled from the inside.";
	now the conduit is open;
	now the noun is in the holder of the conduit;
	say "With a groan of exertion, [we] [pull] the grate with enough force for the old welds to give way. [We] set the grate down on the ground.";
	rule succeeds.

Instead of taking a grate which is not part of something:
	say "You see no reason to carry [the noun] around."

Connection relates one air duct to another (called the other end). The verb to connect to means the connection relation.

Crawling into is an action applying to one touchable thing.
Understand "crawl through/into/up/down/-- [something]" as crawling into.
Understand "crawl" as crawling into.
To crawl is a verb.
Does the player mean crawling into an air duct: it is likely.

Rule for supplying a missing noun while crawling into:
	if the holder of the player is an air duct:
		now the noun is the holder of the player;
		say "(through the air duct)[command clarification break]".

Check an actor crawling into a closed air duct (called the conduit) when the actor is not in the conduit (this is the can't crawl through grates rule):
	instead say "The grate is in the way."

Check an actor crawling into something that is not an air duct (this is the default block crawling rule):
	instead say "[The actor] [can't] crawl through [regarding the noun][those]."

Carry out an actor crawling into an air duct (this is the travel through air ducts rule):
	let the target be the other end of the noun;
	if the actor is the player, say "[We] [crawl] through the ducts, air rushing past [our] face." (A);
	take 2 minutes;
	if the target is open, now the actor is in the holder of the target;
	otherwise now the actor is in the target.

Report an actor crawling into an air duct (this is the report air duct travel rule):
	if the actor is not the player, say "[The actor] [crawl] out of sight." (A)

Check going when the holder of the player is an air duct (this is the crawling hint rule):
	say "[We] [would have] to get out of [the holder of the player] first.[line break](To crawl through the duct, try typing CRAWL.)" instead.

Before exiting when the holder of the actor is an air duct and a grate is part of the holder of the actor:
	say "(first kicking a hole into the grate)[command clarification break]";
	silently try attacking a random grate that is part of the holder of the actor.

Understand "climb in/into [something]" as entering.
Instead of climbing an air duct, try entering the noun.

Instead of crawling into an air duct when the player is wearing the armor, say "The duct is just large enough for a human to crawl through [dash] bulky suit of armor not included."

Chapter 7 - Looking Through

[There are a few locations within the game where the player may look through something to get a peek into another room.]
A thing has some text called the other-side-description.

Looking through is an action applying to one visible thing.
Understand the commands "look" and "l" as something new. [Argh]
Understand "look" as looking.
Understand "look inside/in/into [something]" as searching.
Understand "look under/underneath/below [something]" as looking under.
Understand "look through [something]" as looking through.
Understand the command "l" as "look".

First check looking through a transparent container (this is the convert looking through transparent containers to searching rule):
	try searching the noun instead.

Check looking through something when the other-side-description of the noun is empty (this is the opaque looking through rule):
	say "[We] [can't] [see] through [the noun]." instead.

Carry out looking through (this is the standard looking through rule):
	say "[the other-side-description of the noun][paragraph break]".

Chapter 8 - Ranged Weapons

Section 1 - Guns and Ammunition

[And, really just because we can't have a MilSF-themed game without guns in it...]

A gun is a kind of thing. Understand "gun" as a gun.
Definition: a thing is ungunlike if it is not a gun.

An ammo clip is a kind of thing.
The description of an ammo clip is usually "A magazine for a rifle. It contains [bullet count in words] rounds.".
An ammo clip has a number called the bullet count. The bullet count of an ammo clip is usually 30.
After printing the name of an ammo clip while taking inventory, say " (in which are [bullet count] rounds)".
Definition: an ammo clip is empty rather than non-empty if its bullet count is less than one.

A standoff-outcome is a kind of value. The standoff-outcomes are full-miss, near-miss, shot-dodged, glancing-hit, and deadly-hit.

Shooting it with is an action applying to one touchable thing and one visible thing.
Understand "shoot [something ungunlike] with/using [a gun]" as shooting it with.
Understand "shoot [something] with/using [something]" as shooting it with.
Understand "shoot [something]" as shooting it with.
Understand "shoot [something] at [something]" as shooting it with (with nouns reversed).
Understand "fire [something] at [something]" as shooting it with (with nouns reversed).
Understand "fire at [something] with/using [something]" as shooting it with.
Understand "fire at [something]" as shooting it with.
Understand "fire at [something ungunlike] with/using [a gun]" as shooting it with.
Understand "attack [something] with/using [something]" as shooting it with.
Understand "attack [something ungunlike] with/using [a gun]" as shooting it with.
The shooting it with action has an object called the clip shot from.
The shooting it with action has a standoff-outcome called the shot-result.
Rule for supplying a missing second noun while shooting something with:
	let the weapon be a random gun held by the player;
	if the weapon is not nothing:
		now the second noun is the weapon;
		say "(with [the weapon])[command clarification break]".

To shoot is a verb. To fire is a verb. To discard is a verb. To glance is a verb. To bring is a verb. To whirr is a verb. To dodge is a verb. To stand is a verb. To zero is a verb. To unleash is a verb. To discharge is a verb. To cock is a verb. To train is a verb. To pop is a verb. To miss is a verb.

A wreckage is a kind of closed unopenable transparent container.
After printing the name of a wreckage, omit contents in listing.
Wrecking relates one wreckage (called the remains) to one thing.
The verb to be the original of means the reversed wrecking relation.
The verb to be the remains of means the wrecking relation.

Setting action variables for an actor shooting something with something:
	let cnt be 31;
	let clp be nothing;
	[find the carried ammo clip with the lowest bullet count]
	repeat with c running through ammo clips carried by the actor:
		if the bullet count of c is less than cnt:
			now cnt is the bullet count of c;
			now clp is c;
	now the clip shot from is clp.

Check the player shooting something with something (this is the shooting requirements rule):
	if the player is not carrying a gun, say "[regarding the actor][They] are pathetically unarmed!" instead;
	if the second noun is not a gun, say "[The second noun] does not fire." instead;
	if the clip shot from is nothing, say "You are all out of ammunition" instead;
	if the noun is the second noun, say "Nice trick if you can do it!" instead;
	if the noun is the player, say "Even though you could punch yourself for allowing yourself to be taken captive, suicide isn't an option." instead;
	if the remains of the noun is nothing, say "Needless violence won't get you off this rock any faster. Also, you might still need [the noun] later on." instead.

Check an actor shooting something with something when the actor is not the player (this is the silent shooting requirements rule):
	if the actor is not carrying a gun, stop the action;
	if the second noun is not a gun, stop the action;
	if the clip shot from is nothing, stop the action;
	if the remains of the noun is nothing, stop the action.

Carry out an actor shooting something (called the target) with a gun (called the weapon) (this is the default shooting rule):
	decrease the bullet count of the clip shot from by 3;
	if the target is the player:
		let c be a random number between 1 and 10;
		if c is 1:
			now the shot-result is deadly-hit;
		otherwise if c is 2:
			now the shot-result is shot-dodged;
		otherwise if c is less than six:
			if the player is wearing the armor, now the shot-result is glancing-hit;
			otherwise now the shot-result is deadly-hit;
		otherwise if c is less than nine:
			now the shot-result is near-miss;
		otherwise:
			now the shot-result is full-miss;
	otherwise if the target is a person:
		if a random chance of four in five succeeds:
			now the shot-result is deadly-hit;
		otherwise:
			now the shot-result is near-miss;
	otherwise:
		now the shot-result is deadly-hit;
	if the target is not the player and the shot-result is deadly-hit:
		now the remains of the target is in the holder of the target;
		now the target is nowhere;
	if the clip shot from is empty:
		now the bullet count of the clip shot from is 30;
		now the clip shot from is in ammo-temp-storage.

Report an actor shooting something (called the target) with a gun (called the weapon) (this is the default report shooting rule):
	if the actor is the player:
		say "[We] [fire] a three-shot burst from [the weapon] at [the target], [run paragraph on]";
		if the shot-result is:
			-- deadly-hit:
				if the target is not a person, say "utterly destroying [regarding the target][them].";
				otherwise say "dropping [them] where [they] [stand].";
			-- near-miss:
				say "but in the heat of the moment, [we] [miss] [our] target.";
		if the clip shot from is empty, say "[We] [discard] the expended ammo clip.";
	otherwise if the target is the player:
		say "[The actor] [one of][take] aim[or][bring] [their] [weapon] to bear[or][cock] [their] [weapon][or][train] [their] [weapon] at [us][or][zero] in on [us][at random] and [regarding the actor][one of][unleash][or][shoot][or][fire][or][discharge][or][pop][at random] a volley in [our] direction! [run paragraph on]";
		if the shot-result is:
			-- deadly-hit:
				say "At point-blank range, [if the player is wearing the armor][the armor][otherwise][we][end if] [stand] little chance: leaving a trail of searing hot pain, the bullet carves a path through [our] [one of]head[or]chest[at random] before coming out on the other side, leaving [our] innards distributed on [the room-floor-prop of the location][unless the location is an outdoor room] and the wall behind [us][end unless].";
				end the story saying "You have been shot";
			-- glancing-hit:
				say "[regarding the actor][They] [past participle of the verb hold] [their] [weapon] at an odd angle, and the shot [regarding one][glance] off [our] [one of]helmet[or]chest plate[or]shoulder plate[or]leg armor[at random], leaving [one of]a[or]a deep[or]another[or]yet another[then at random] gouge in the material.";
			-- shot-dodged:
				say "Fifteen years of military experience lead to some rather tuned reflexes, so [we] [dodge] in time to avoid the shot.";
			-- near-miss:
				say "[regarding the actor][Their] aim [are] slightly off. The bullet [regarding one][whirr] past [our] [one of]head[or]shoulder[or]chest[at random] and [if the location is an outdoor room]flies off into the distance[otherwise]embeds itself into the wall behind [us][end if].";
			-- full-miss:
				say "Their aim is way off and the shot [if the location is an outdoor room]flies off into the distance[otherwise]embeds itself into the wall behind [us][end if].";
	otherwise:
		say "[The actor] [fire] at [the target]."

[Really the only ways to die in this game are by running out of air, or getting shot to death. I don't want to use undo prevention, but we don't need to rub in the possibility of retrying the random combat, so...]
When play begins (this is the don't advertise undo rule):
	choose row with a final response rule of immediately undo rule in the Table of Final Question Options;
	blank out the final question wording entry.

[Allow the player to determine the total number of bullets they are carrying.]
Ammo-counting is an action applying to nothing.
Understand "ammo" or "ammunition" or "count ammo/ammunition/rounds" as ammo-counting.
Report ammo-counting:
	if the number of ammo clips carried by the player is zero:
		say "You don't have any ammo.";
	otherwise:
		let cnt be zero;
		repeat with c running through ammo clips carried by the player:
			increase cnt by the bullet count of c;
		say "All in all, you have [cnt] rounds left.".

Section 2 - Enemies

A shwabolian is a kind of person. The description of a shwabolian is usually "An unsightly green not-quite-humaniod creature, like a lizard walking on two legs."
A corpse is a kind of wreckage. A corpse is usually pushable between rooms.
The cannotTakeMsg of a corpse is "You'd rather not carry a dead body around with you."
Understand "alien" as a corpse.
A corpse is part of every person.
Every shwabolian carries a gun and two ammo clips.
When play begins (this is the prepare corpses rule):
	repeat with s running through people:
		let c be a random wreckage that is part of s;
		now c is the remains of s;
		now c is nowhere.

Giving something to a shwabolian is invalid-conversation. Showing something to a shwabolian is invalid-conversation. Answering a shwabolian that something is invalid-conversation. Telling a shwabolian about something is invalid-conversation. Asking a shwabolian about something is invalid-conversation. Asking a shwabolian for something is invalid-conversation.

Instead of invalid-conversation, say "Now is not the time for idle talk!".

[Our sorry imitation of a combat AI]
Turns-in-location is a number that varies.
Carry out going (this is the reset combat rule):
	now turns-in-location is zero;
	continue the action.

Every turn (this is the aliens shooting rule):
	increase turns-in-location by one;
	if turns-in-location is at least two:
		let the hostile be a random shwabolian in the location;
		if the hostile is not nothing:
			let g be a random gun carried by the hostile;
			try the hostile shooting the player with g.

Check shooting a corpse with a gun:
	let o be a random person that is the original of the noun;
	say "[The o] is already as dead as it gets." instead.

Check wearing a corpse:
	say "While you enjoy the occasional costume theme party, [the noun] isn't the kind of costume you'd be willing to wear." instead.

Instead of attacking a shwabolian: [That is, "hit alien", etc.]
	say "They have guns, so your fists are probably not the most appropriate tool.".

Taunting is an action applying to one thing.
Understand "taunt [something]" or "make a/-- rude gesture at/-- [something]" as taunting.
Understand the command "mock" as "taunt".
Check taunting:
	say "You curse out [the noun], but [they] [seem] to be unfazed." instead.
Check taunting a shwabolian:
	say "You curse out [the noun], but in doing so you only enhance [their] rage." instead.

Section 3 - Blood

A room can be blood-marked. A room is usually not blood-marked.

Some blood is a backdrop.
The description is "Blood stains [the room-floor-prop of the location]."

Check examining a room-floor when the blood is in the location:
	if the noun is the default-floor or the noun is the default-ground, try examining the blood instead.

When play begins:
	move the blood backdrop to all blood-marked rooms.

Last carry out shooting a person with a gun (this is the spilling blood rule):
	if the shot-result is deadly-hit, now the location is blood-marked;
	update backdrop positions.

Carry out going with a corpse:
	if the room gone to is not in the sea-region:
		now the room gone to is blood-marked;
		update backdrop positions;
	continue the action.

Chapter 9 - Altered responses

[Replacing some of the standard responses with something more thematic.]
block sleeping rule response (A) is "You've spent so much of these past few weeks sleeping that you feel like you won't be tired again in a [italic type]long[roman type] time".

Chapter 10 - Room Parts

[Creating a floor/ground, ceiling/sky, and walls that are usually the same but can be customized on a per-room basis, and all without having to create each instance of the default as a thing (that would be anywhere from two to six things per room!). Modeled after how room parts work in the TADS3 library.]
A room-part is a kind of privately-named backdrop.
A room-floor is a kind of room-part. Understand "floor" or "ground" as a floor. The default-floor is a room-floor. The printed name is "floor". The default-ground is a room-floor. The printed name is "ground".
A room-ceiling is a kind of room-part. Understand "ceiling" as a room-ceiling. The default-ceiling is a room-ceiling. The printed name is "ceiling".
A room-sky is a kind of room-part. Understand "sky" as a room-sky. The default-sky is a room-sky. The printed name is "sky".
A room-wall is a kind of room-part. Understand "wall" as a room-wall.
A north-wall is a kind of room-wall. Understand "north/northern wall/--" as a north-wall. The default-north-wall is a north-wall. The printed name is "northern wall".
A south-wall is a kind of room-wall. Understand "south/southern wall/--" as a south-wall. The default-south-wall is a south-wall. The printed name is "southern wall".
A west-wall is a kind of room-wall. Understand "west/western wall/--" as a west-wall. The default-west-wall is a west-wall. The printed name is "western wall".
An east-wall is a kind of room-wall. Understand "east/eastern wall/--" as an east-wall. The default-east-wall is an east-wall. The printed name is "eastern wall".

[If we just wrote "A room has a room-top.", the property name would be equal to the kind name, confusing the compiler if we tried to create more instances of the kind later on.]
A room has an object called the room-top-prop. The room-top-prop of a room is usually the default-ceiling.
A room has an object called the room-floor-prop. The room-floor-prop of a room is usually the default-floor.
A room has a list of room-walls called the walls. The walls of a room is usually {default-north-wall, default-south-wall, default-west-wall, default-east-wall}.

The room-top-prop of an outdoor room is usually the default-sky.
The room-floor-prop of an outdoor room is usually the default-ground.
The walls of an outdoor room are usually {}.

After deciding the scope of the player when not in darkness (this is the place the current room's parts in scope rule):
	if the room-top-prop of the location is not nothing, place the room-top-prop of the location in scope;
	if the room-floor-prop of the location is not nothing, place the room-floor-prop of the location in scope;
	repeat with r running through walls of the location:
		place r in scope.

Check examining a direction (this is the redirect direction-examining to room parts or doors rule):
	[when there is a door in that direction, examine the door]
	let the portal be the door noun from the location;
	if the portal is not nothing, try examining the portal instead;
	[otherwise examine the room part in that direction, if any]
	if the noun is down and the room-floor-prop of the location is not nothing, try examining the room-floor-prop of the location instead;
	if the noun is up and the room-top-prop of the location is not nothing, try examining the room-top-prop of the location instead;
	repeat with w running through the walls of the location:
		if the noun is north and w is a north-wall, try examining w instead;
		if the noun is south and w is a south-wall, try examining w instead;
		if the noun is west and w is a west-wall, try examining w instead;
		if the noun is east and w is an east-wall, try examining w instead.

Understand "look [a direction]" as examining.

Instead of putting something on a room-floor, try dropping the noun.
Instead of removing something from a room-floor, try taking the noun.

Instead of entering a room-floor when the holder of the player is not the location, try exiting.
Instead of entering a room-floor when the holder of the player is the location, say "But [we] [are] already firmly standing on [the room-floor-prop of the location]."

Understand the command "stand" as something new.
Standing on is an action applying to one touchable thing.
Understand "stand on/in [something]" as standing on.
Check standing on something (this is the convert standing on to entering rule): try entering the noun instead.

Lying on is an action applying to one touchable thing.
Understand "lie down/-- on/in [something]" or "lay down/-- on/in [something]" as lying on.
Understand "lie down" or "lay down" as lying on.
Rule for supplying a missing noun while lying on:
	let the ground be the room-floor-prop of the location;
	if the ground is not nothing:
		say "(on [the ground])[command clarification break]";
		now the noun is the ground.
Check lying on a supporter: try entering the noun instead.
Check lying on a container: try entering the noun instead.
Check lying on:
	say "Now is not the time for rest. Besides, [we]['ve] done nothing but sleep for the past few weeks, so [we]['re] not particularly tired."

Chapter 11 - Rule-less refusals

[To cut down on the slew of "instead" rules, allow things to have a 'cannotTakeMsg' that is displayed when trying to take scenery or something that is fixed in place -- again, this is lifted from the TADS library.][* Some might argue that I should have written the game in TADS instead, since I'm "borrowing" so many concepts from over there, and I am inclined to agree -- but by the time I realizeed that, in early May, I was already mired up to my neck in Inform code, and didn't dare attempt a port.]

A thing has some text called the cannotTakeMsg.
The cannotTakeMsg of a thing is usually "[regarding the noun][They're] [if scenery]hardly portable[otherwise]fixed in place[end if]."

Check an actor taking (this is the can't take with message rule):
	if the noun is scenery or the noun is fixed in place, say the cannotTakeMsg of the noun instead.
The can't take with message rule is listed instead of the can't take what's fixed in place rule in the check taking rulebook.
The can't take scenery rule is not listed in the check taking rulebook.

Chapter 12 - Clearing Pronouns

[This is intended for use with multi-examining, which will not set 'they'/'them' to the group of objects that was just examined (which is impossible), instead leaving it to be some plural-named thing that happens to be in the location.]

Include
(-
[ UnsetAllPronouns i;
    for (i = 1: i <= (LanguagePronouns-->0) / 3: i++)
	    LanguagePronouns-->(3*i) = NULL;
];
-)

To clear all pronouns:
    (- UnsetAllPronouns(); -).

Book 3 - Locations

Chapter 1 - Cell Complex and Prison Island

Test prison with "x me / listen to me / i / x fatigues / smell / x floor / x down / x north / look through door / x cot / get on cot / get up / x sheets / x camera / x sanitary station / enter station / x air duct / pull grate / enter duct / crawl / kick grate / out / switch maglock off / up / x helmet / take helmet and card / s / e / e / x plates / take plates / x armor / x me / i / take all ration bars / i / eat ration / listen to me / w / open airlock / n / smell / e / jump / turn on lamp / u / x down / x up / take silt / w / n / n / n / n / x me / x armor".

Cell-complex is a region. Your cell, the corridor, the control room, the front office, the storage space, and the prison installations room are in cell-complex.

The silence is a backdrop in cell-complex.
Instead of doing something other than listening to the silence, say "The absence of sound is, of course, intangible."
Instead of listening to the location when the silence is in the location, try listening to the silence.
Instead of listening to the silence:
	say "It has been eerily quiet for a few days now. Gone are the footsteps, the occasional shouting, the idle chit-chat of the guards. Now you hear nothing but the faint noise of the ventilation system."

Section 1 - The Cell

[We've spent A LOT of time in this room, so describe it in plenty of detail.]
Your cell is a room. "This is the room you have spent most of your time in, ever since being taken captive. To be honest, you've kind of lost track of how long that has been. [if the cot is in your cell][A cot] stands in one corner of the room. [end if]An air duct[if a grate is part of cell air duct] covered by an old grate[end if] is mounted in the wall near [if the cot is in the location]the cot[otherwise]where the cot once stood[end if][if the ventilation switch is switched on], exuding a constant stream of cool, fresh air (and the occasional drop of condensation, which falls to the ground with an annoyingly loud [italic type]plink[roman type])[end if]. [A sanitary station] [dash] a sort of hybrid toilet-shower-sink [dash] is built into a corner of the room. [if the metal door is closed][A metal door] lies to the north, keeping you securely in the cell.[otherwise][The metal door] northward is open, leading to a corridor.[end if]".

An air duct called cell air duct is in your cell.
Check attacking the cell air duct's grate when the noun is part of something:
	instead say "It's too far up to throw a good punch at the grate[one of][or]. You may need to go in a different direction, so to speak[or]. Perhaps if you tugged on it instead[stopping]."
The description of the cell air duct's grate is "[if the cell air duct's grate is part of something]A rather flimsy, rusty grate covering the air duct. It looks like you could break it if you wanted to (although the presence of the camera has so far kept you from attempting anything)[otherwise]The grate lies discarded on the ground[end if]."

The metal door is north of your cell and south of the corridor. It is an openable closed lockable locked door.
The description is "[cell-door-desc].".
The other-side-description is "[We] peek through the small, scuffed up duraplast window into the corridor outside. It is empty."
Understand "small" or "duraplast" or "window" as the metal door.
To say cell-door-desc:
	if the location is your cell, say "The door is smooth on the inside, with only a small window allowing you to catch a glimpse of the corridor behind it. It lines up perfectly with the surrounding wall [dash] if you didn't know better, you might think it is part of the wall itself";
	if the location is the corridor, say "This is the door leading to your cell. It has a handle that allows it to be opened from this side".
Instead of unlocking the metal door with something when the location is your cell, say "The door doesn't have any lock or control mechanism on the inside."
Instead of unlocking the metal door with something when the location is the corridor, say "The door appears to be locked and unlocked remotely."
Instead of opening the unlocked metal door when the location is your cell:
	say "The door only opens inwards, into the room you're in, it has no handle or knob, and there are no seams where it meets the surrounding wall. No matter how hard you try, you can't get a grip on the door, so you can't open it.";
	take five minutes.
Instead of attacking the metal door:
	say "That was among the first things you tried when you got here. You've given up trying by now.".

The cot is a fixed in place enterable supporter in your cell. "A cot stands in one corner of the room."
The description is "Flimsy frame, uncomfortable plastic surface [dash] it's a cot alright."
The cannotTakeMsg is "It is bolted to the floor."
Understand "bed" or "cot" or "bunk" or "rack" or "sack" as the cot.

Some bedsheets are on the cot. "On the cot are some neatly folded bedsheets."
The description is "Plain white bedsheets. Thin, scratchy, and not quite warm enough to keep you comfortable. It seems like all expenses were spared here.[unless the bedsheets are handled] Your military discipline dictates that you neatly fold the bedsheets when you get up in the morning.[end if]".
Understand "plain" or "white" or "sheets" or "bed" or "sheet" or "bedsheet" as the bedsheets.

The sanitary station is a fixed in place enterable container in the cell. "A sanitary station [dash] a sort of hybrid toilet-shower-sink [dash] is built into a corner of the room." The description is "A brushed aluminum clamshell contraption for personal hygiene, not unlike showers you've used on some UNDC ships."
Understand "shower" or "toilet" or "head" as the sanitary station.
Instead of entering the sanitary station, say "You've already showered today."
After printing the name of the sanitary station, omit contents in listing.
Instead of attacking the sanitary station when the rage is ongoing:
	say "You kick [the station], but it is too sturdy for you to even make a dent in it.".

The camera is a fixed in place thing in the cell. "A small camera hangs above the cot, keeping a watchful eye on you." The description is "A small camera hangs in one corner of the room, a small red light presumably indicating that it is active."

[So I suppose the player can be a bit of a psychopath...]
Instead of attacking the camera:
	if the cot is not in your cell:
		say "Unfortunately, the camera is mounted too high on the wall to do that, and you've already destroyed the cot.";
	otherwise:
		say "Confident that nobody is watching anymore, you climb onto the cot, tear the camera off the wall, and grind it to pieces under the heel of your boot.[if the player is wearing the armor]It makes a satisfying crunching noise as it breaks.[otherwise][line break]If you're right, and nobody is around to witness it, then this was a pointless little act of defiance. If you are wrong, then you just made your life a whole lot more difficult...[paragraph break]Either way, this felt [italic type]good[roman type].[end if]";
		now the camera is nowhere;
		now the camera remains are in your cell;
		attempt rage conclusion;
		rule succeeds.
The camera remains are a plural-named thing. The description is "The remnants of the camera that you smashed lie on the floor." Understand "small" or "video" or "cctv" or "pieces" or "remnants" as the camera remains.
Instead of doing something other than examining to the camera remains, say "The pieces of camera are hardly useful anymore."

Instead of attacking the cot:
	if the player is not wearing the armor:
		say "As much as you'd like to [if the rage is ongoing]continue your rampage[otherwise]lay waste to this place[end if], the cot isn't quite flimsy enough to destroy with your bare hands.";
	otherwise:
		say "With your armor's power assist cranked up, you tear off the bolts holding the cot to the ground and rip its frame to pieces.";
		now everything that is on the cot is in the location;
		now the cot is nowhere;
		now the mangled frame is in your cell;
		attempt rage conclusion;
		rule succeeds.
The mangled cot frame is a thing. The description is "The mangled remains of the cot."
Understand "bent" or "destroyed" or "bed" or "bunk" or "rack" or "remains" or "remnants" or "pieces" as the mangled cot frame.
The cannotTakeMsg of the mangled cot frame is "No point lugging that around."

Instead of attacking the bedsheets:
	say "[if the rage is ongoing]You[otherwise]In a sudden fit of rage, you[end if] take the thin bedsheets and rip them to shreds.";
	now the bedsheets are nowhere;
	now the ripped bedsheets are in your cell;
	attempt rage conclusion;
	rule succeeds.
Some ripped bedsheets are a thing. The description is "You tore the bedsheets to pieces, and this is the result."
Understand "torn" or "white" or "pieces" or "shreds" or "of" or "sheets" as the ripped bedsheets.
Instead of doing anything other than examining to the ripped bedsheets, say "[We] [have] no further interest in [regarding the noun][them]."

[Scenes didn't want to work for some reason, so...]
To decide whether the rage is ongoing:
	if the mangled cot frame is in your cell and the ripped bedsheets are in your cell, no;
	if the mangled cot frame is in your cell, yes;
	if the ripped bedsheets are in your cell, yes;
	if the camera remains are in your cell, yes;
	no.
To decide whether the rage is/has concluded:
	if the mangled cot frame is in your cell and the ripped bedsheets are in your cell, yes;
	no.
To attempt rage conclusion:
	if the rage is concluded, say "[line break]You eye up your work: [if the camera is in your cell]only the camera remains on the wall, but it is too far up to reach now[otherwise]pieces of camera, cot, and bedsheets are strewn all across the floor[end if]. You managed to release a lot of the pent-up frustration that has accumulated over the past few weeks of being locked up in here, but you're not sure whether you approve of this new side of you."

Test rampage with "break camera / purloin armor / wear armor / rip up sheets / tear up cot / look / x camera / take camera / x mangled frame / take it / x sheets / take sheets"

[And here is our first custom room part.]
The cell floor is a room-floor. The description is "The floor has a grey, rubbery non-slip surface." Understand "grey/gray/-- rubber/rubbery/rubberized/rubberised/plastic/-- cell/-- floor" as the cell floor.
The room-floor-prop of your cell is the cell floor.

[Hint the player that there's no point just sitting around.]
At 09:30 AM:
	if we have not gone and the location is your cell:
		say "Usually, by this time, you should long since have received your breakfast, but no-one has been around to check on you for a few days now."

Section 2 - Corridor and Stuff

The corridor is a room. "The featureless white corridor runs east-to-west, bending around a corner and out of sight to each end.[paragraph break][The metal door] leading to your cell is south. The control room lies around the corner to the west[if the front office is visited], and the entry area lies around the corner to the east[end if]."

West of the corridor is south of the control room. Index map with control room mapped northwest of corridor.
The control room is a room. "The walls are plastered with screens[if the controls switch is switched on] showing video feeds from throughout the facility[otherwise], but they are all blank[end if]. This must be the place from which the prisoners are monitored.[paragraph break][A ladder-top] leads down into the installations room, and a corridor leads south."

A table is a scenery supporter in the control room.
On the table is a thing called a helmet. The initial appearance of the helmet is "Your[if we have examined the plates] missing[end if] helmet is sitting on a table in the middle of the room, with a number of wires attached to it.". The printed name of the helmet is "[our] helmet".
The description of the helmet is "Taking a closer look at the helmet confirms that it is, in fact, yours. Perhaps the rest of the suit is around here somewhere as well.".
Instead of wearing the helmet, say "Since the power and air supply are located in the torso pieces of the suit, wearing the helmet alone isn't terribly useful."
Before taking the helmet for the first time, say "You carefully disconnect the wires that connect the helmet to the computer systems in the room. Hopefully, your captors haven't messed anything up."

Some wires are scenery in the control room.
The description is "A slew of thin wires [if the helmet is on the table]runs from the control desk to your helmet[otherwise]lies discarded on the ground[end if].".

The control panel is in the control room. "A control desk and some screens are installed on the wall.". The description is "[control-panel-desc].". Understand "desk" or "screen" or "system" or "panel" or "panels" or "screens" or "surface" or "console" as the control panel.
Understand "video" or "feed" or "feeds" as the control panel when the ventilation switch is switched on.
To say control-panel-desc:
	if the controls switch is switched on:
		say "The screens show video feeds from various locations in the building[run paragraph on]";
		if the camera is in your cell, say "[if the mangled cot frame is in your cell or the ripped bedsheets are in your cell]. The havok you wrought in your cell is plainly visible[end if]";
		otherwise say ". One feed is missing [dash] presumably yours, considering that you broke the camera in your cell";
	otherwise:
		say "The screen is blank".

The prison warden's ID card is a thing. The description is "A purple-colored card with Shwabolian writing on it.[if the player is wearing the armor] Your suit translates it as 'Shevok Kemalik, Warden'.[end if]". Understand "warden" or "guard" or "access" or "purple" as the ID card.
Instead of looking under the control panel, try searching the noun.
Instead of searching the control panel:
	now the player is carrying the ID card;
	say "Looking under [the control panel], you find a purple card, which you pocket.";
	rule succeeds.

A ladder-top is privately-named scenery in the control room. The printed name is "ladder". Understand "ladder" or "rungs" as the ladder-top.
Instead of climbing ladder-top, try going down.

East of the corridor is south of the front office.
Index map with front office mapped northeast of corridor.
The description of the front office is "This room is the entrance to the facility. You have no doubt that there would normally be at least one guard posted here, but at the moment it is empty.[paragraph break]You could go east, into a small storage area, or south, back into the corridor.".

The airlock is a locked door. "[airlock-desc].". The airlock is north of the front office and south of the prison antecourt.
Understand "air" or "lock" as the airlock.

To say airlock-desc:
	if the player is in the front office, say "The way out of the building, to the north, leads through [if the player has not been in the military complex plaza]what appears to be [end if]an airlock";
	otherwise say "The airlock leading into the cell complex lies to the south"
	
Report going through the airlock for the first time:
	say "You open the inner door and step into the intermediate space. [if the player is wearing the armor]Nothing obvious happens, but your suit alerts you that the air coming in from the outside is, shall we say, less than ideal[otherwise]As the clean air inside the airlock is replaced with the outside atmosphere, you quickly develop a searing headache -- you won't last long under these conditions[end if].[line break]The other door opens and you take a tentative step outside.".

The airlock's inner card reader is an unthing in the front office. The description is "The door doesn't seem to have a card reader. There must be another way to unlock it.".
Instead of locking the airlock with something when the location is the front office, say "The door doesn't seem to have a card reader. There must be another way to unlock it.".
Instead of unlocking the airlock with something when the location is the front office, say "The door doesn't seem to have a card reader. There must be another way to control it.".
	
Section 3 - The Storage Area

The storage space is east of the front office. "This small storage closet seems to be the place where inmates['] possessions are stored. Bare-metal [shelves] line the walls.[paragraph break]The only way out is west."

Some shelves are a scenery supporter in the storage space.
Understand "bare" or "metal" or "bare-metal" or "shelf" or "rack" as the shelves. Understand "shelves" or "racks" as the plural of shelves.
Some plates are on the shelves. "Pieces of armor plating lie on the shelves." The description is "[We] are fairly sure that these are the pieces of [our] battle armor. They seem to be intact, but an integral part [dash] the helmet [dash] is [if the player has the helmet]not among them[otherwise]nowhere to be seen[end if]." The printed name is "armor plates". Understand "armor/armour/armored/armoured/-- plates/plating" or "armor" or "armour" as the plates. They are fixed in place.
The cannotTakeMsg of the plates is "They're too bulky, and the plates alone won't do you much good."
Instead of wearing the plates, say "The plates alone won't do you much good."

Instead of putting the helmet on the shelves:
	now the helmet is nowhere;
	now the plates are nowhere;
	now the armor is on the shelves;
	say "You put the helmet with the armor plates, completing the set again."

Before wearing or taking the plates when the player is carrying the helmet:
	now the helmet is nowhere;
	now the plates are nowhere;
	now the armor is in the location;
	say "(donning the now-complete suit)[command clarification break]";
	try wearing the armor instead.

A ration bar is a kind of edible thing.
The description of a ration bar is "You recognize the design of the wrapper: bars like these have been part of your meals from time to time.".
Instead of tasting a ration bar:
	say "As most ration bars tend to do, it tastes mostly like sugar, with some indeterminable artificial fruit mixed in.";
	rule succeeds.
After multiexamining a ration bar:
	clear all pronouns;
	continue the action.

On the shelves are five ration bars.

Section 4 - Basement

The prison installations room is down from the control room. "This is where most of the installations and appliances keeping the cell complex running reside. [if the ventilation switch is switched on]A stiff breeze blows through this room, from the large machine on one wall, to the air ducts on the opposite wall. [end if]A ladder leads up[if bottom of the air duct is open], the air duct to your cell is on the northern wall[end if]."

An air duct called bottom of the air duct is in the prison installations room. It connects to the cell air duct.
The description is "The air duct leads back to your cell."

Some some-air-ducts is a north-wall. The printed name is "air ducts". 
The description is "A number of air ducts are mounted into the northern wall, presumably leading to different rooms within the facility."
Understand "air/-- ducts" as some-air-ducts.
The ventilation-machine is a south-wall. The printed name is "ventilation machine".
The description is "A large machine takes up almost the entire south wall[if the ventilation switch is switched on]. It is forcing air through the room[end if].".
Understand "ventilation" or "machine" or "machinery" as the ventilation-machine.
The walls of the installations room are {some-air-ducts, ventilation-machine, default-west-wall, default-east-wall}.

Some appliances are scenery in the installations room.
The description is "Pipes and boxes line the wall."
Understand "installation" or "installations" or "appliance" as the appliances.

The ladder-bottom is privately-named scenery in the installations room. The printed name is "ladder".
The description is "A simple ladder is mounted on the wall, leading up."
Understand "ladder" or "rungs" as the ladder-bottom.
Instead of climbing the ladder-bottom, try going up.

["Obfuscated Switches" have a label in "Shwabolian" writing, which is really just ROT13-encoded english. The armor can translate those, so we show the plain english labels when the player is wearing the armor.]
An obfuscated switch is a kind of device. An obfuscated switch is usually switched on.
An obfuscated switch has some text called the obf-label. An obfuscated switch has some text called the real-label.
The printed name of an obfuscated switch is usually "[if the player is wearing the armor][real-label][otherwise][obf-label][end if] switch".
The description of an obfuscated switch is usually "A large rotary switch[if the player is wearing the armor]. Your suit's translator shows the label as '[real-label]'[otherwise] labeled '[obf-label]'[end if].".
Understand "rotary" or "switch" as an obfuscated switch.
To say switch-label of (o - an obfuscated switch):
	say "[if the player is wearing the armor][real-label of o][otherwise][obf-label of o][end if]".
Check turning an obfuscated switch:
	if the noun is switched on, try switching off the noun instead;
	otherwise try switching on the noun instead.

The switch panel is in the installations room. "On one of the walls is a panel with a number of large switches on it." It is fixed in place.
Understand "switches" as the panel.
The description is "A number of large rotary switches are attached to this panel. One is labeled '[switch-label of the lights switch]', the next '[switch-label of the ventilation switch]', a third '[switch-label of the doors switch]', and one is labeled '[switch-label of the controls switch]'.".
Does the player mean turning the switch panel: it is unlikely.
Does the player mean switching off the switch panel: it is unlikely.
Does the player mean switching on the switch panel: it is unlikely.

The lights switch is part of the switch panel. It is an obfuscated switch. The real-label is "LIGHTS". The obf-label is "YVTUGF". Understand "light" or "yvtugf" or "first" as the lights switch.
The ventilation switch is part of the panel. It is an obfuscated switch. The real-label is "VENTILATION". The obf-label is "IRAGVYNGVBA". Understand "iragvyngvba" or "second" as the ventilation switch.
The doors switch is part of the panel. It is an obfuscated switch. The real-label is "MAGLOCK". The obf-label is "ZNTYBPX". Understand "maglock" or "zntybpx" or "third" as the doors switch.
The controls switch is part of the panel. It is an obfuscated switch. The real-label is "CONTROLS". The obf-label is "PBAGEBYF". Understand "pbagebyf" or "fourth" as the controls switch.

Carry out switching off the lights switch:
	now all rooms in cell-complex are dark.
Carry out switching on the lights switch:
	now all rooms in cell-complex are lit.
Carry out switching off the doors switch:
	now all doors in cell-complex are unlocked.
Carry out switching on the doors switch:
	now all doors in cell-complex are locked.

Report switching off the ventilation switch:
	say "As you turn the switch, the ventilation machinery falls silent, and the wind in the room subsides.";
	rule succeeds.
Rule for printing the description of a dark room when the location is the installations room:
	say "It is pitch dark, save for a small light next to the lights switch beckoning you to turn the lights back on."

After deciding the scope of the player while in darkness and the location is the installations room:
	place the lights switch in scope.

Section 5 - Outside Area

Prison antecourt is an outdoor room. "A small courtyard lies outside the prison, which appears to be built on a small island.[paragraph break]The way back into the prison is south, through the airlock. You are otherwise surrounded by water, but there are some docks allowing easy access to the east."

The prison docks are an outdoor room. They are east of the prison antecourt. "The prison is built on a tiny island in the ocean [dash] presumably to make escaping more difficult. A small dock extends into the water, away from the rocky shoreline.[line break]The shore, populated with buildings, lies a few hundred meters to the north. The prison antecourt is to your west."

The dock is a backdrop. It is in the prison docks and the shore docks. The description is "A floating plastic contraption with a metal frame. It wobbles as you try to stand on it."
Understand "plastic" or "contraption" as the dock.
Understand "jump off [the dock]" as getting off.
Instead of getting off the dock, try entering the water.

The water is a backdrop. It is in the prison docks and the shore docks. The description is "The water is murky, but the sea is smooth.".
Understand "ocean" or "sea" as the water.

Understand "jump in/into [something]" or "dive in/into [something]" as entering.
Understand "swim in [something]" as entering when the water is in the location.
Does the player mean entering the water: it is likely.

Instead of jumping when the location is the prison docks or the location is the shore docks:
	say "(into the water)[command clarification break]";
	try entering the water.

Instead of entering the water:
	if the player is not wearing the armor, say "And swim all the way [if the location is the prison docks]to shore[otherwise]across[end if]? You'd never make it in time before the atmosphere here got the better of you.";
	otherwise try going down.

The rocky shoreline is scenery in the prison docks.
The description is "The coastal cliff falls off into the water".
Understand "coastal" or "coast" as the shoreline.

Chapter 2 - Underwater

A sea-room is a kind of room. The description of a sea-room is "You are standing knee-deep in the silt at the bottom of the ocean. The military complex is due north." A sea-room is usually dark. The printed name is usually "at the bottom of the ocean". A sea-room is always submerged. The room-top-prop of a sea-room is usually the sea. The room-floor-prop of a sea-room is usually the ocean floor. The walls of a sea-room are usually {}.

The sea-region is a region. Seabottom-1, seabottom-2, seabottom-3, and seabottom-4 are in the sea-region. Index map with room-colour of sea-region set to "Navy" and room-name-colour of sea-region set to "White".

Instead of going nowhere when the location is in the sea-region, say "Best not to wander around, lest you'll never find your way again."

The sea is a backdrop in the sea-region. The description is "There are about ten meter's worth of sea water above you. As you exhale, you can see the bubbles of your breath rising to the surface." Understand "ocean" or "sea" or "water" or "air/-- bubble/bubbles" as the sea.
Instead of examining up when the location is in the sea-region, try examining the sea.

The ocean floor is a backdrop in the sea-region. The description is "Silt has accumulated in the calmer waters between the shore and the prison island, enough to seriously hamper your movement down here." Understand "sea/ocean/-- bottom/ground/floor/silt" as the ocean floor.
The cannotTakeMsg of the ocean floor is "You scoop up a handful of silt, but it quickly runs through your fingers."

Instead of standing on the ocean floor, say "But [we] [are] already standing firmly on (or rather, [italic type]in[roman type]) the ocean floor."
Instead of entering the ocean floor, say "You'd feel a bit silly lying in the silt."
Report jumping when the location is in the sea-region:
	say "You jump on the spot, kicking clouds of sediment up into the water around you."

[An alternate ending.]
Surrendering is an action applying to one topic. Understand "give up hope/--" or "capitulate" or "fall" or "succumb" or "succumb to/-- [text]" or "give in to [text]" or "surrender" or "surrender to/-- [text]" or "abandon your/my/-- me/myself/you/yourself/hope/faith/life/existence" or "resign" or "stop fighting/breathing" or "despair" as surrendering.
Check surrendering: say "Not in a thousand years!" instead.
Lying on the ocean floor is giving up. Entering the ocean floor is giving up. Sleeping is giving up. Waiting is giving up. Surrendering is giving up.
Instead of giving up when the air of the armor is less than 300 and the location is in the sea-region:
	now the air of the armor is zero;
	say "Looking at the remaining air timer on your HUD, a strange sense of calmness overcomes you: you won't make it out of this alive, and that's okay. After some fifteen years of waging war, you have done your share. You can rest now.[line break]The ocean floor looks soft and inviting. You lay down, the silt conforming to the shape of your armored body, cushioning the bulky plates and sharp angles that typically make sleeping in armor a rather futile effort. Your armor's [CO2] scrubbers are still working, and the heating elements will keep you comfortable. [italic type]There are worse ways to go...[roman type], you think to yourself as you slowly slip into unconsciousness, with a hint of a smile on your face.";
	end the story finally saying "You have made peace."
Test alternate with "pull grate / crawl into duct / kick grate / out / turn off doors / up / take helmet / s / e / e / take plates / w / n / e / turn on helmet light / jump / air-drain / n / z / lie down".

Instead of going up in the sea-region (this is the can't swim in armor rule), say "While your armor's power assist usually keeps you from noticing its 50-or-so kilograms of heft, getting to the surface of the ocean would require a propeller of sorts, which is not provided."

seabottom-1 is a sea-room. It is down from the prison docks. "You are standing knee-deep in the silt at the bottom of the ocean. The rocky cliffs of the prison island lie to the south, the military complex is due north."

Before going down to seabottom-1 for the first time:
	say "While your armor is designed primarily for planetary and shipboard operations, it can also double as a space suit and diving equipment in a pinch (or so the manufacturer promises). While you had more chances than you'd care for to verify that it does make for a passable spacesuit, it may finally be time to put the 'diving' part of that claim to the test.[line break]You jump into the water, spreading your arms and legs to slow your descent..."; [blatantly ignoring the potential issue of barotrauma, but whatever]
	[pause the game; [for dramatic effect only]]
	say "About ten seconds later, you come to an abrupt halt as you land faceplate-first in the silt at the bottom of the sea.[line break]You scramble to your feet, wiping the muck off your faceplate. You can still breathe, and none of the electronics in your suit seem to have been fried [dash] so far, so good.";
	take 45 seconds.

The rocky cliffs are scenery in seabottom-1. "These cliffs are what the prison is built on top of."
Understand "rocks" or "cliff" as the cliffs.
Instead of climbing the rocky cliffs:
	say "You climb up the cliffs.";
	take 8 minutes;
	now the player is in the prison docks.
Instead of going up from seabottom-1 for more than the first time (this is the hint at climbing rule):
	say "While your armor's power assist usually keeps you from noticing its 50-or-so kilograms of heft, getting to the surface of the ocean would require a propeller of sorts, which is not provided.[line break](However, if you really must return, the cliffs look like you might stand a chance at climbing them.)".
Instead of going south from seabottom-1, try climbing the rocky cliffs.

seabottom-2 is a sea-room. It is north of seabottom-1.

seabottom-3 is a sea-room. It is north of seabottom-2.

seabottom-4 is a sea-room. It is north of seabottom-3. "You are standing knee-deep in the silt at the bottom of the ocean. The ground is sloping upwards to the north."

Before going north from seabottom-4 for the first time:
	say "You slowly make your way up the muddy incline [dash] half walking, half crawling [dash] until you finally reach dry land again.".
Carry out going north from seabottom-4 (this is the armor dirtying rule):
	now the armor is muddy;
	take 5 minutes;
	continue the action.
Instead of going up in seabottom-4, try going north.

[And being in the water gets us clean again -- no real benefit, except continuity.]
Every turn when the location is submerged (this is the armor cleaning rule):
	now the armor is clean.

Instead of squeezing when the player has been in the sea-region and the location is not in the sea-region:
	if the noun is the armor or the noun is the player:
		say "You make a fist, squeezing some sea water out of your gloves, but it's more of a symbolic effort.";
		rule succeeds;
	otherwise:
		continue the action.

Report going to a room in the sea-region from a room in the sea-region (this is the report trudging rule):
	say "You slowly trudge [noun]ward.";
	take 5 minutes;
	continue the action.

Chapter 3 - Military Complex Outdoors

Section 1 - The Docks

[Not a test as much as a convenience to quickly skip ahead during debugging.]
Test act2setup with "purloin my armor / wear armor / gonear incline / purloin ID card / down / up".

The shore docks are an outdoor room. They are up from seabottom-4 and north from seabottom-4. "The shoreline here seems more like an extension of the ocean floor you just walked: a gradual incline, rather than a sharp drop. A dock extends into the water to allow loading and unloading boats without needing to drive them up against the shore. (Although no boats are to be seen.)[line break]You vaguely recall coming through here, weeks ago, sedated, a breathing apparatus in your face...[paragraph break]The prison buildings lie to the south, down the muddy incline and across the water, and the military complex continues to the north."
Index map with shore docks mapped north of prison docks.

The muddy incline is scenery in the shore docks. "The muddy shore slopes down into the water. You can see the rut you left as you crawled up."
Understand "slope" or "rut" or "muck" or "mud" or "silt" or "shore" or "shoreline" as the incline.
Instead of climbing the muddy incline, try going south.
Before going south from the shore docks, say "You take a few tentative steps down the incline before falling on your ass and sliding the rest of the way down into the water."
Before going down from the shore docks for the first time, say "With more confidence than before, you jump off the end of the dock and sink to the bottom of the ocean again."

Rubbing it on is an action applying to two touchable things and requiring light.
Understand "rub [something] on/onto [something]" as rubbing it on.
Understand "rub [something] with/using/in [something]" as rubbing it on (with nouns reversed). [Not really proper english IMO, but was attempted in beta testing.]
Understand "slather [something] on/onto [something]" as rubbing it on.
Understand "slather [something] with/in/using [something]" as rubbing it on (with nouns reversed).
Understand the commands "cake", "coat", "encrust", "paint", "plaster", "slap", "smother", and "smear" as "slather".
Understand "cover [something] with/in/using [something]" as rubbing it on (with nouns reversed).
Understand the commands "disguise", "mask", and "obscure" as "cover".
Report rubbing something on something:
	say "[We] [rub] [the noun] on [the second noun], but not much happens." instead.
Check rubbing the muddy incline on something:
	if the player is not wearing the armor:
		if the second noun is the player or the noun is the fatigues or the noun is the boots, say "That would take forever to clean up!" instead;
	otherwise:
		if the second noun is the player, try rubbing the muddy incline on the armor instead;
		if the second noun is the fatigues or the second noun is the boots, say "But [we]['re] already wearing a perfectly adequate canvas over top of the fatigues." instead.
Check rubbing the muddy incline on the armor when the player is not wearing the armor:
	say "That would make a mess when trying to put the suit back on." instead.
Instead of rubbing the muddy incline on the armor when the player is wearing the armor:
	say "You kneel down in the mud and go to town, scooping up the gooey mud and slathering it onto yourself with both hands, until you are satisfied that you have covered every square inch (save for your visor) in a uniformly thick layer of the greyish-brown substance.";
	now the armor is covered;
	take three minutes;
	rule succeeds.
Instead of rubbing the muddy incline on the armor when the player is wearing the armor and the armor is covered:
	say "[We] are already covered in enough mud to no longer pass as a human being [dash] [we] see no reason to add more.".
Instead of taking the muddy incline, try rubbing the muddy incline on the player.
Instead of rubbing the muddy incline:
	say "(rubbing the mud onto yourself)[command clarification break]";
	try rubbing the muddy incline on yourself.
Instead of putting the muddy incline on something, try rubbing the noun on the second noun instead.
Before wearing the muddy incline, try rubbing the noun on yourself instead.

Rolling in is an action applying to one touchable thing and requiring light.
Understand "roll in [something]" or "roll around in [something]" as rolling in.
Understand the command "wallow" as "roll".
Check rolling in something:
	say "That wouldn't accomplish much." instead.
Check rolling in the muddy incline when the player is not wearing the armor:
	say "That would take forever to clean up!" instead.
Instead of rolling in the muddy incline when the player is wearing the armor:
	say "You lie down in the mud, rolling back and forth until you are confident that you are covered helmet-to-boots in a thick layer of the greyish-brown goo.";
	now the armor is covered;
	take three minutes;
	rule succeeds.
Instead of lying on the default-ground when the location is the shore docks, try rolling in the muddy incline.
Instead of lying on the muddy incline, try rolling in the noun.
Instead of crawling into the muddy incline, try rolling in the noun.

Section 2 - The Plaza

The military complex plaza is an outdoor room. It is north of the shore docks. "This base must be the heart of the operations [dash] in this area, at least.[paragraph break]There are several places you could go from here. The shoreline and the docks lie to the south. [if the hangar is unvisited]What looks like a[otherwise]The[end if] hangar lies to the east[if the force field is enabled], blocked off by a force field[end if]. A smaller building[if the player is wearing the armor], labeled 'Barracks',[end if] lies to the west, and a larger building [if the player is wearing the armor] with a sign reading 'Command Center'[end if], blocked off by a door, lies to the north."

The command center door is north of the plaza and south of the entry hallway. It is an openable closed lockable locked door. The prison warden's ID card unlocks the command center door.
The description of the command center door is "A simple metal door. It is equipped with a card reader rather than a keyhole. It is [if open]open[otherwise]closed[end if].".
The command center door's card reader is a backdrop. It is in the plaza and the entry hallway.
The description is "A small grey box waiting to be presented with an access card.".
Instead of unlocking the card reader with something, try unlocking the command center door with the noun.
Instead of locking the card reader with something, try locking the command center door with the noun.

The force field is a door. It is east of the plaza and west of the hangar. "[one of]The wind picks up some leaves and blows them through the force field to the [forcefield-desc-direction][or]The force field to the [forcefield-desc-direction] gives off a faint blue glow[or]A small bird flies through the force field and off to the [forcefield-desc-direction][then at random].".
The description is "The force field [if enabled]gives off a faint blue glow[otherwise]is disabled[end if]."
The force field can be enabled or disabled. The force field is enabled, open, and not openable.
Understand "forcefield" or "force-field" as the force field.
To say forcefield-desc-direction:
	if the location is the plaza, say "east";
	otherwise say "west".

[Ensure that the disabled force field, the command center door, and its card reader dont't get mentioned in room descriptions.]
After choosing notable locale objects (this is the military plaza locale objects rule):
	if the force field is disabled:
		if there is a notable-object of force field in the Table of Locale Priorities:
			set the locale priority of the force field to 0;
	if there is a notable-object of command center door in the Table of Locale Priorities:
		set the locale priority of the command center door to 0;
	[if there is a notable-object of command center door's card reader in the Table of Locale Priorities:
		set the locale priority of the command center door's card reader to 0;]
	continue the activity.

Check going through the enabled force field:
	if the player is not wearing the armor, say "The force field does not let you pass." instead;
	if the armor is clean:
		say "The force field does not let you pass." instead;
	if the armor is muddy or the armor is blood-stained:
		say "[one of]Your dirty hand[regarding one][or]Your lower arm[regarding one][or]A mud-stained leg[regarding one][or]Your mud-caked hands[regarding two][then at random] [pass] through the force field, but not more." instead;
	if the armor is covered:
		say "Your mud-covered body passes through the force field with little resistance.";
		continue the action.

Chapter 4 - The Command Center

Section 1 - Hallways

The entry hallway is a room. "This is the entry area into the base's command center, where those in charge would no doubt hold briefings, discuss command decisions, and do other important officer things. (In all your years of military service, you've never felt a desire to move up into the officer ranks yourself, even though there were plenty of open spots in the newly-unified military.)[paragraph break]A small armory is to the west, and the hallway continues to the north. The way out is south, through the door."
Instead of going outside when the location is the entry hallway, try going south.

The command center lobby is north of the entry hallway. "You are standing in a sparsely furnished lobby. Some chairs are lined up on a wall, but that's about it.[paragraph break]A briefing room is to the east, [if the ops center is unvisited]what appears to be an[otherwise]the[end if] ops center lies to the north, and the hallway leading back to the entrance is south.[if at least one shwabolian is in the ops center][paragraph break]You can hear subdued talking coming from the room to the north.[end if]"

A chair is an enterable scenery supporter in the lobby.
The description is "They look to be the same plastic monstrosities you had to sit on throughout your years in school."
Understand "chairs" or "stool" or "stools" as the chair.
The cannotTakeMsg of the chairs is "The chairs are bolted to the wall."

Instead of listening to the command center lobby when at least two shwabolians are in the ops center:
	say "You can hear subdued talking coming from the room to the north.";
	take 30 seconds;
	rule succeeds.

Section 2 - Armory

The armory is west of the entry hallway. "This 'armory' is really more of a glorified storage closet: [if the storage rack is in the armory]it is just large enough to hold a rather flimsy [storage rack] and [an ammo crate][otherwise][an ammo crate] stands on the ground, and the room would have just enough room for a small shelf (if you hadn't pulled that apart)[end if].[paragraph break]The only way out is east, back to the hallway."

The ammo crate is a fixed in place container in the armory.
The cannotTakeMsg of the ammo crate is "It's too heavy and awkward to carry around."
Does the player mean taking the ammo crate: it is unlikely.

Some some-ammo-clips is in the crate. It is privately-named. The indefinite article is "some". The printed name is "ammo clips". Understand "clip" or "clips" or "ammo" or "ammunition" or "rounds" or "magazines" as some-ammo-clips.
ammo-temp-storage is a container. In it are ten ammo clips. 
Instead of taking some-ammo-clips:
	if the player is carrying at least three ammo clips:
		say "You have enough ammunition already." instead;
	otherwise:
		let the clips taken be three minus the number of ammo clips carried by the player;
		say "[Clips taken in words] clip[unless clips taken is one]s[end unless]: Taken.";
		repeat with i running from 1 to clips taken:
			let c be a random ammo clip in the ammo-temp-storage;
			now c is in the ammo crate;
			silently try taking c.

A storage rack are a fixed in place supporter in the armory.
The description is "It is a very simple design, made of plain metal struts with rather sharp edges. It looks like you could easily break it if you were so inclined."
The cannotTakeMsg is "It is too large and heavy to carry around in one piece."
Understand "bare" or "metal" or "shelf" or "rack" or "metal" or "struts" as the rack.
A rifle is a gun on the rack. The description is "A rifle of Shwabolian design as you've seen on the battlefield often enough."
Instead of attacking the rack:
	say "You pull apart the frame of the shelf, giving you a piece of metal with a rather sharp edge.";
	now all things that are on the rack are in the location;
	now the rack is nowhere;
	now rack-gone is in the armory;
	now the makeshift knife is in the armory;
	silently try taking the makeshift knife;
	take 90 seconds in total;
	rule succeeds.
Understand "make [knifedesc] [makefrom] [the storage rack]" as attacking.
Understand "build [knifedesc] [makefrom] [the storage rack]" as attacking.
Understand "turn [the storage rack] into [knifedesc]" as attacking.
Understand "from" or "out of" as "[makefrom]".
Understand "a/an/-- makeshift/improvised/-- knife" as "[knifedesc]".
Understand "disassemble [the storage rack]" or "take apart [the storage rack]" or "take [the storage rack] apart" as attacking.

rack-gone is a privately-named unthing. The description is "You broke the rack to make a knife, remember?".

The makeshift knife is a thing. The description is "A piece of metal you pulled out of the shelves in the armory. It happens to have a rather sharp edge."
Understand "make-shift" or "dagger" or "metal" or "frame" or "strut" or "shelf" or "piece" or "of" as the makeshift knife.

Section 3 - Briefing Room

The briefing room is east of the lobby. "This looks to be a briefing or meeting room of some kind, presumably for the higher-ranking officers stationed here. [A large round table] stands in the middle of the room. [A large screen] hangs on one of the walls, with [a lectern] in front of it [dash] for when the communal discussion format doesn't cut it.[line break]Like most of the Shwabolian facilities you've seen so far, this room too is entirely devoid of decoration.[paragraph break]The only way out is west, back into the lobby."

A large round table is a fixed in place supporter in the briefing room.
The description is "It is a simple table with a white plastic surface. It has enough room for ten, perhaps fifteen people, although all the chairs seem to have been removed [dash] if there ever were any.[paragraph break]You can't help but wonder what warranted all this nonessential material being shipped out here.".

A large screen is a fixed in place thing in the briefing room.
The description is "A large screen has been fitted into the wall. It is blank."

The lectern is a fixed in place supporter in the briefing room.
The description is "A lectern stands in front of the screen, waiting for someone to step up and address those present in the room (which is none, at the moment). In keeping with everything you've seen so far, it lacks any seals, emblems, or insignia you might typically find on a lectern in a UNDC facility."

Section 4 - Nerve Center

The ops center is north of the lobby. "This appears to be the nerve center of the operation [dash] whatever that may be. The walls are lined with screens and control surfaces, but most of them seem to be inactive.[paragraph break]The only way out is south, back into the lobby."

The larger alien and the smaller alien are shwabolians in the ops center.
Understand "large" as the larger alien. Understand "small" as the smaller alien.
The description of the larger alien's corpse is "A well and truly dead shwabolian. Its lizard appendages lie splayed out in all directions. [if closed]Blood is pooling around him from where your bullets hit their mark[otherwise]He is looking a bit worse for wear after you extracted the data crypt from inside him[end if]."
The examine containers rule does nothing when the noun is a corpse.

Understand "stab [someone] with/using [something]" as a mistake ("Bringing a knife to a gunfight is rarely a good idea.").

[I expect this will probably be the most controversial part of the game.
This wasn't really planned from the start, but I needed some puzzles and my brain basically went: "Why don't we do this, here's the text for it!" -- and that was the only idea I was going to get.]
Cutting it with is an action applying to two touchable things and requiring light.
Understand the command "cut" as something new.
Understand "cut up/-- [something] open/-- with/using [something preferably held]" as cutting it with.
Understand "dissect [something] with/using [something preferably held]" as cutting it with.
Understand "autopsy [something] with/using [something preferably held]" as cutting it with.
Understand "slice [something] open/-- with/using [something preferably held]" as cutting it with.
To cut is a verb.
Understand "stomach" or "belly" or "abdomen" as the larger alien's corpse.
Understand "large" as the larger alien's corpse. Understand "small" as the smaller alien's corpse.
Check cutting the open larger alien's corpse with something:
	if gore is allowed, say "You'd rather not desecrate the body further." instead;
	otherwise say "You already have what you needed." instead.
Instead of cutting the closed larger alien's corpse with the makeshift knife:
	if the player is not wearing the armor:
		say "You'd rather not do this with your bare hands.";
		stop the action;
	now the larger alien's corpse is open;
	if the armor is clean, now the armor is bloody;
	if the armor is not bloody, now the armor is muddy-and-bloody;
	if gore is allowed:
		[heavens, what is wrong with me...]
		say "You double-check inside the creature's mouth, but no dice. With a sigh, you kneel down in the puddle of blood now surrounding the body. You carefully position [the second noun], plunging it deep into the dead creature's abdominal area; guts, blood, and other bodily fluids spilling out and onto your armored legs as you cut.[line break]With the incision complete, you take a second to steel yourself before reaching into the abdominal cavity. After a minute or so of fishing around in the bloody soup, you find the object of your desire: a small data crypt, which the creature swallowed when you came into the room. It appears to be undamaged.[paragraph break]You feel like throwing up.";
	otherwise:
		say "In a process that defies any description, you retrieve the object of your desire: a small data crypt which the creature swallowed when you came into the room. It appears to be undamaged.";
	now the player has the data crypt;
	take 10 minutes;
	rule succeeds.

Check eating when the larger alien's corpse is open:
	say "After what you did, you don't think you could stomach anything." instead.

Check cutting something with something that is not the makeshift knife:
	say "[The second noun] [cannot cut] anything." instead.
Check cutting the larger alien's corpse with the shard:
	say "[The second noun] is far too delicate for the task [dash] it's like trying to cut down an old tree with a jigsaw." instead.
Check cutting the makeshift knife with something:
	say "Don't you have those the wrong way around?" instead.

Check cutting a corpse with something:
	if the rage has concluded, say "Despite how satisfying it was to destroy the furniture in your cell, military tradition forbids desecrating a fallen soldier's body, and you see no reason to break with that rule in this instance." instead;
	otherwise say "You see no need to disturb the rest of the fallen." instead.
Check cutting something that is not the larger alien's corpse with something:
	say "Cutting up [the noun] would achieve little." instead.
Check cutting the player with something:
	say "You'd rather keep your fluids inside your body" instead.
Check cutting the armor with something:
	say "You feel no need to test out the suit's ability to resist [the second noun]." instead.
Check cutting the fatigues with something:
	say "While strips of fabric can serve a number of purposes, there doesn't seem to be a need to sacrifice your clothes right now." instead.

[The somewhat more family friendly version.]
Retrieving it from is an action applying to one thing and one touchable thing, and requiring light.
[Understand "retrieve [something] from [something]" or "extract [something] from [something]" as retrieving it from.]
Understand "retrieve [something] from [something]" as removing it from.
Understand the command "extract" as "retrieve".
Instead of removing the data crypt from the larger alien's corpse:
	if the data crypt is not in the larger alien's corpse:
		say "You already have [the data crypt].";
		stop the action;
	if gore is allowed:
		if the player does not have the makeshift knife, say "You'll need some kind of tool to do that." instead;
		say "(using [the makeshift knife])[command clarification break]";
		try cutting the larger alien's corpse with the makeshift knife instead;
	otherwise:
		if the player is not wearing the armor:
			say "You'd rather not do this with your bare hands.";
			stop the action;
		now the larger alien's corpse is open;
		if the armor is clean, now the armor is bloody;
		if the armor is not bloody, now the armor is muddy-and-bloody;
		say "You open the creature's oversized mouth and peek inside. Shifting around its large tongue, you notice something at the back of its throat. You reach in and retrieve the small object that the creature hastily swallowed as you entered the room: a data crypt. It, as well as your glove, are covered in slimy lizard saliva.";
		now the player has the data crypt;
		take 5 minutes;
		rule succeeds.
Instead of taking the data crypt when the data crypt is in the larger alien's corpse:
	say "You'll need to be more specific about how you plan to get that back out of him." instead.
Rule for reaching inside the closed larger alien's corpse:
	if the current action is taking the data crypt, allow access;
	if the current action is removing the data crypt from the larger alien's corpse, allow access;
	make no decision.

Report going to the ops center for the first time (this is the alien swallows key rule):
	say "As you enter the room, [the larger alien] hastily pulls a small device out of the control panel and swallows it. Then, the two reach for their weapons!".
The alien swallows key rule is listed last in the report going rules.

A data crypt is in the larger alien's corpse.
The description is "[data-crypt-desc]."
Understand "small/-- swallowed/eaten object/thing/device" or "small/-- object/thing/device swallowed/eaten by the/-- large/larger/-- alien/shwabolian/lizard" or "small" or "device" or "object" as the data crypt.

To say data-crypt-desc:
	if the data crypt is in the larger alien's corpse, say "The object which the large alien swallowed is still inside of him";
	otherwise say "A small storage device you salvaged from [if gore is allowed]the innards of [end if]one of your captors"

[What I want to do after writing the above.]
Vomiting is an action applying to nothing.
Understand "vomit" or "throw up" or "puke" or "hurl" or "retch" or "ralph" or "barf" as vomiting when gore is allowed.
Check vomiting when the larger alien's corpse is closed:
	say "You feel fine." instead.
Check vomiting when we have vomited:
	say "You feel a lot better already." instead.
Check vomiting when the location is not breathable and the larger alien's corpse is open:
	say "You'd like nothing better, but this isn't the right place." instead.
Carry out vomiting:
	take 3 minutes;
	now the vomit is in the location.
Report vomiting:
	say "[if the player is wearing the armor]Raising your faceplate, you[otherwise]You[end if] give in to the urge to empty your stomach and hurl into a corner of the room.".

The vomit is a fixed in place thing. The initial appearance is "The former contents of your stomach form a puddle in a corner of the room.".
The description is "After digging around in that dead shwabolian, you felt the irresistible urge to relieve yourself of the contents of your own stomach. You'd rather not dwell on it.".
Understand "vomitus" or "eject" or "former/-- contents of/-- your/my/-- stomach/belly" as the vomit.
The cannotTakeMsg of the vomit is "How, by scooping it up in your hands? You'd rather not."

The mouth is part of the larger alien's corpse.
Understand "large/larger/-- alien/alien's/-- mouth" as the mouth.
Sticking an arm in is an action applying to one touchable thing.
Understand "stick a/an/my/your/-- arm/hand [stick-in] [something]" as sticking an arm in.
Understand "in/down/into" or "down into" as "[stick-in]".
Check sticking an arm in a closed corpse:
	[According to Wikipedia, even in whales the esophagus is at most 10-25cm in diameter, so for a slightly-larger-than-human-sized creature, I guess it wouldn't make sense for a hand/wrist/arm to fit.]
	if gore is allowed:
		say "Despite the size of the creature's mouth, its throat is not large enough for your hand and arm to fit down." instead;
	otherwise:
		if the player does not have the data crypt and the noun is the larger alien's corpse, try removing the data crypt from the noun instead;
		otherwise say "You feel around inside the creature's mouth, but find nothing." instead.
Check sticking an arm in the mouth: try sticking an arm in the component parts core of the noun instead.
Check sticking an arm in an open corpse:
	say "You already have what you needed." instead.
Check sticking an arm in something:
	say "[The noun] [are] not something you can stick an arm into." instead.
Instead of sticking an arm in the muddy incline:
	say "You kneel down and stick an arm into the mud.";
	if the armor is not mud-caked, now the armor is muddy;
	take 30 seconds;
	rule succeeds.
Instead of sticking an arm in the water:
	say "You hold your arm into the water. Nothing particular happens." instead.

Test alien with "pull grate / crawl through duct / out / turn off maglock / up / take helmet / look under desk / s / e / e / take plates / w / open airlock / n / e / turn on helmet light / enter water / n / n / n / n / n / unlock door with card / n / w / take rifle and ammo / break rack / e / n / n / shoot larger with rifle / shoot smaller with rifle / cut larger corpse with knife / x me / x armor / x data crypt / throw up".

Chapter 5 - The Barracks

[This area doesn't really do anything useful, but it would be a bit weird if it were absent.]

The mess hall is west of the military complex plaza. "This is the entry area to what must be the barracks of this place. The area near the entrance is set up like a mess hall, with tables and counters, while the back of the room is set up more casually, with [some pillows] on the floor and even a [italic type]couch[roman type]. You've never seen [a couch] in a military facility in your life.[paragraph break]You could go east, back outside, or west, further into the building."

Some plain white tables are scenery in the mess hall.
The description is "You see nothing interesting about the tables. They are boring, even by the low standards of tables.".
Understand "boring" or "table" as the tables.
Some counters are scenery in the mess hall.
The description is "This must be where the food was handed out. Like most of the sparse furniture in here, there really isn't anything noteworthy about them: just white plastic surfaces with recessions for food bowls.".
Understand "counter" or "recession" or "recessions" as the counters.

Some pillows are scenery in the mess hall. The description is "They are plain white pillows that could very well be the same that people used for sleeping.".
Understand "white" or "pillow" or "cushion" or "cushions" as the pillows.
The cannotTakeMsg of the pillows is "You don't see a point to carrying those around with you.".
A couch is an enterable scenery container in the mess hall. The description is "It's not a particularly [italic type]nice[roman type] couch [dash] it looks rather old and worn [dash] but still: [italic type]it's a freakin['] couch[roman type]! How the hell did they get a couch out here?![if the couch is not clean][line break]It looks significantly worse for wear, now that you've plonked your dirty self down on it.[end if]".
Understand "sofa" as the couch.
The couch has a dirtiness. The couch is clean.
After entering the couch:
	if the player is wearing the armor and the armor is mud-caked and the couch is clean:
		now the couch is muddy;
		say "The couch looks comfy and inviting, and despite the entire situation you can't resist the urge to sit down for a bit. You transfer a considerable amount of mud to the couch in the proces, but if the Shwabolians ever notice, a dirty couch will be the least of your issues.";
	otherwise:
		continue the action.

The barracks are west of the mess hall. "You are standing in the sleeping area of the barracks. Like the entire facility so far, the room is designed in a very utilitarian manner, with no decoration or personal touches.[paragraph break]You can go east, back to the mess hall, or south, [if the communal washroom is not visited]further into the building[otherwise]into the washroom[end if]."

Some bunks are in the barracks. "Four stacked bunk beds are lined up on the walls." They are fixed in place.
The description is "The non-folding, stacked version of the cot you spent the past weeks on, perhaps. From the looks of them, these bunks are only marginally more comfortable than what you had to sleep on."
Understand "stacked" or "bunk" or "bed" or "beds" as the bunks.

The communal washroom is south of the barracks. "This would be the place where the garrison force (if one can call it that, given the size of the facility) takes care of personal hygiene. It is a sterile-looking room, white tiles covering the floor and the walls all the way up to the ceiling. Four sinks and mirrors are installed on one wall, four toilets on another, the remaining two have two showers each. It doesn't seem like the Shwabolians care a whole lot about privacy, seeing as there are no dividers of any kind in the room.[line break]The only way out is north, back to the barracks."

Some toilets are scenery in the washroom. The description is "They look like the kind you'd find in the worst of public restrooms back on earth: steel body, no lid, no real seat. Comfort clearly wasn't high on the priority list here."
Understand "toilet" or "loo" or "loos" or "head" as the toilets.

Some sinks are scenery in the washroom. The description is "[if we have examined the toilets]Just like the toilets, the[otherwise]The[end if] sinks are made of plain steel."
Understand "sink" or "washbasin" or "washbasins" or "washbowl" or "washbowls" or "wash" or "basin" or "basins" as the sinks.

Some mirrors are scenery in the washroom.
Understand "mirror" as the mirrors.
Instead of examining the mirrors:
	if the mirrors are handled, say "You smashed one mirror, but three remain.[paragraph break]";
	say "You regard yourself in one of the mirrors: [run paragraph on]";
	try examining yourself;
	rule succeeds.
Instead of attacking the mirrors:
	if the mirrors are not handled:
		if the player is not wearing the armor, say "You'd rather not, with your bare hands." instead;
		now the mirrors are handled;
		say "You drive an armored fist into one of the mirrors, smashing it. You pocket one of the larger pieces.";
		now the shard is in the location;
		silently try taking the shard;
	otherwise:
		say "Destroying one of the mirrors should be sufficient." instead.

The shard is a thing.
The description is "A piece of mirror. You catch a glimpse of your [if the player is not wearing the armor]face[otherwise if the armor is covered]mud-covered helmet[otherwise]helmet[end if] as you tilt it around."
Understand "piece" or "of" or "glass" or "mirror" as the shard.

Some showers are scenery in the washroom.
The description is "[if we have examined the toilets or we have examined the sinks]Much like the rest of the room, the[otherwise]The[end if] showers aren't much to look at: non-adjustable shower heads emerging from the ceiling, simple mechanical controls mounted on the walls, and all the water ultimately goes down the grated drains built into the tiled floor."
Understand "shower" or "showerhead" or "showerheads" or "showers" or "control" or "controls" or "water" as the showers.

To slide is a verb. To collect is a verb.
Instead of switching on the showers:
	if the player is wearing the armor and the armor is not clean:
		say "You turn on one of the showers and let the water run over you. [if the armor is muddy-and-bloody]The mud and [wash-grime][regarding two][otherwise if the armor is muddy or the armor is covered]The mud[regarding one][otherwise if the armor is bloody]The [wash-grime][regarding one][end if] [slide] off your gear and [collect] on the floor before finding [their] way down the drain.";
		now the armor is clean;
		take 8 minutes;
		if the vomit is in the location, now the vomit is nowhere;
		rule succeeds;
	otherwise:
		say "You're already about as clean as you're going to get."
Instead of switching off the showers, say "All the showers are off already.".
Instead of entering the showers, try switching on the showers.
Instead of taking the showers, try switching on the showers.

Showering is an action applying to nothing.
Understand "shower" or "wash me/you/myself/yourself/--" as showering.
Check showering:
	say "There's nothing here with which to shower." instead.
Instead of showering when the showers are in the location, try switching on the showers.
Instead of showering when the sanitary station is in the location, try entering the sanitary station.

To say wash-grime:
	if gore is allowed, say "blood";
	otherwise say "slime".

Chapter 6 - Hangar and Launch

Section 1 - The Hangar

The hangar is a room. "This large, cavernous space where dropships and other small craft can be stored when not in use. It is currently empty[if the messenger ship is in the hangar], except for [a messenger ship][end if].[paragraph break][if the launch doors are open]You could go north, through [the launch doors] and onto the landing pad,[otherwise][The launch doors] leading north are closed. You can go[end if] west, [if the force field is enabled]through the force field and [end if]back to the plaza, or up to the control room."

The launch doors are a plural-named door. They are north of the hangar and south of the landing strip. They are closed.
The description is "Large sliding doors [dash] more than large enough for a dropship to fit through [dash] make up pretty much the entire northern wall of the hangar. They are currently [if the launch doors are open and the location is the hangar]open, revealing a view of the launch pad[otherwise if the launch doors are open]open, reavealing a view of the inside of the hangar[otherwise]closed.".
Instead of opening or closing the launch doors, say "These doors appear to be operated remotely."
[The force field is nominally a door, but we don't want it to be included in "x doors".]
Before multiexamining when the location is the hangar and considering only doors:
	alter the multiple object list to {the launch doors};
	now the noun is the launch doors;
	continue the action.
Instead of looking through the open launch doors:
	if the location is the hangar, say "The landing pad outside is [if the messenger ship is in the hangar]empty[otherwise]occupied by the messenger ship[end if].";
	otherwise say "[if the messenger ship is in the hangar]The cavernous hangar is largely empty[otherwise]You see the messenger ship standing in the hangar[end if].";
	rule succeeds.

Section 2 - The Launch Pad

The landing strip is an outdoor room. "You are standing on the tarmac of a small landing pad. It's not long enough for a fixed-wing atmospheric craft to take off, but perfectly adequate for the vertical take-off and landing operation of a space-capable vessel.[paragraph break]You could go south, through [the launch doors] and back into the hangar."

The tarmac-ground is a room-floor. The printed name is "tarmac".
The description is "[if the location is the landing strip]A smooth surface of black tarmac, ideal for ships to land on[otherwise if the messenger ship is in the landing strip]The messenger ship stands on the tarmac outside[otherwise]The tarmac outside is empty[end if].".
Understand "ground" or "tarmac" or "landing" or "pad" as the tarmac-ground.

The room-floor-prop of the landing strip is the tarmac-ground.

Section 3 - The Launch Control Room

The control tower is up from the hangar. "You are standing in a room built into the wall near the ceiling of the cavernous hangar. Normally, no craft would enter or leave the airspace around the facility without the approval of the air-traffic controllers on duty here, but now it is deserted.[paragraph break]The only way out is down, back into the hangar."

The large window is in the tower. It is fixed in place. "A large window overlooks the landing pad outside."
The other-side-description is "You can see the [if the messenger ship is in the landing strip]the messenger ship standing on the landing pad[otherwise]the empty landing pad outside[end if].".

After deciding the scope of the player when the location is the control tower:
	place the tarmac-ground in scope.

The air traffic control desk is in the control tower. "A desk festooned with screens and buttons is mounted below the window." It is fixed in place.
The description is "This desk must be the place from which most of the air traffic going into and out of this place is controlled. It is festooned with screens, buttons, and switches, but three elements stick out: a switch labeled [switch-label of the force field switch], one labeled [switch-label of the launch doors switch], and a large red button."
Understand "screen" or "screens" or "buttons" or "switches" or "air-traffic" or "air-traffic-control" as the control desk.

The force field switch is an obfuscated switch. It is part of the control desk.
The real-label is "FORCE FIELD". The obf-label is "SBEPR SVRYQ".
Understand "forcefield" or "sbepr" or "svryq" or "sbeprsvryq" as the force field switch.
Carry out switching off the force field switch:
	now the force field is disabled.
Carry out switching on the force field switch:
	now the force field is enabled.
Does the player mean switching off the air traffic control desk: it is unlikely.
Does the player mean switching on the air traffic control desk: it is unlikely.
Does the player mean examining the air traffic control desk: it is likely.

The launch doors switch is an obfuscated switch. It is part of the control desk.
The real-label is "LAUNCH DOORS". The obf-label is "YNHAPU QBBEF".
Understand "launchdoors" or "ynhapu" or "qbbef" or "ynhapuqbbef" as the launch doors switch.
Carry out switching off the launch doors switch:
	now the launch doors are open;
	take 30 seconds.
After switching off the launch doors switch:
	say "You flip the switch, and the large doors separating the hangar from the launch pad slide open."
Instead of opening the launch doors switch, try switching off the noun.
Carry out switching on the launch doors switch:
	now the launch doors are closed;
	take 30 seconds.
After switching on the launch doors switch:
	say "You flip the switch, and the large doors separating the hangar from the launch pad slide shut."
Instead of closing the launch doors switch, try switching on the noun.

The big red button is part of the control desk. The description is "A large red button is mounted in the center of the console. It is not labeled."
Understand "large" as the button.
Instead of pushing the big red button:
	if the launch doors are closed or the messenger ship is not in the hangar:
		take 10 seconds;
		say "The system beeps, but nothing more happens.";
	otherwise:
		say "An alarm sounds, and the floor below the messenger ship begins to move: it is standing on a sort of conveyor belt, and is now moving outside and into position on the launch pad.";
		now the messenger ship is in the landing strip;
		take 90 seconds.

Section 4 - Ship

The messenger ship is an enterable container in the hangar.
The description is "The messenger ship has a sleek silver shape. It looks like a somewhat larger, elongated variant of a typical Shwabolian dropship design. What sets it apart is the fact that, instead of a large cargo hold, it has a fully-featured alcubierre drive, allowing for faster-than-light travel. Useful for when urgent messages (or passengers) need to be delivered somewhere, and waiting for the next cargo hauler or patrol boat is not an option."
After printing the name of the messenger ship, omit contents in listing.
The ship can be started. The ship is not started.

The notch is a scenery container in the messenger ship. The description is "The panels surrounding you are festooned with buttons and switches. You hope that most of them aren't too important.[line break][if the data crypt is not in the notch]A notch is in one of the control panels, ready to accept something[otherwise]The data crypt rests in its place in the control panel[end if]."
Understand "recess" or "control" or "panel" or "panels" or "button" or "buttons" or "screen" or "screens" or "aussparung" [;-)] as the notch.
Check inserting something which is not the data crypt into the notch:
	say "[The noun] doesn't seem to fit." instead.
Instead of inserting a corpse into the notch:
	say "You haphazardly slap the dead alien onto the control panel and across the notch. The ship does not seem to be impressed. The corpse slides back onto the ground."

After entering the messenger ship, try looking.

Carry out looking when the player is in the messenger ship (this is the messenger ship innards rule):
	say "You are sitting in the cockpit of the messenger ship. [if the ship is started]The control panels in front of you inform you that all systems of the ship are in working order[otherwise]The control panels are dark and blank[end if].";
	rule succeeds.
The messenger ship innards rule is listed after the room description heading with activity rule in the carry out looking rules.

The canopy is part of the messenger ship.
The description is "A sort of glass dome covering the cockpit, allowing the pilot to look in all directions."
Understand "glass" or "dome" as the canopy.
Instead of looking through the canopy when the player is in the messenger ship:
	try looking;
	take 15 seconds in total;
	rule succeeds.
The alcubierre drive is part of the messenger ship.
The description is "The faster-than-light drive system is what sets this ship apart from others in its size class."

Starting is an action applying to one touchable thing.
Understand "start up/-- [something]" or "boot up/-- [something]" or "power up/-- [something]" as starting.
Understand "prepare [something]" or "prepare [something] for launch/take-off" or "prepare for launch/take-off [something]" as starting.
Understand the command "prep" as "prepare".
To start is a verb.
Does the player mean starting the messenger ship: it is likely.
Check starting something that is not the messenger ship:
	say "[We] [can't] [start] [regarding the noun][those]." instead.
Check starting the started messenger ship:
	say "The ship is already prepared for take-off." instead.
Check starting the messenger ship when the messenger ship is not started and the data crypt is not in the notch:
	say "The ship doesn't seem to want to power up. Perhaps you need some sort of key for the ship to accept your commands." instead.
Check starting the messenger ship when the messenger ship is not started and the player is not in the messenger ship:
	say "You can only do that from inside the ship." instead.
Carry out starting the messenger ship:
	now the messenger ship is started;
	take three minutes.
Report starting the messenger ship:
	say "Luckily, earth scientists were able to get their hands on a similar model of Shwabolian ship, so your suit is able to guide you through most of the pre-flight checks.[paragraph break]You press the button that your suit indicates as being the main switch for the ship. One by one, the messenger ship's systems come alive around you. The ship is now ready for launch.".
Instead of switching on the messenger ship, try starting the messenger ship.

Launching is an action applying to one visible thing.
Understand "launch [something]" as launching.
Does the player mean launching the messenger ship: it is likely.
To launch is a verb.
Check launching something that is not the messenger ship:
	say "[We] [can't] [launch] [regarding the noun][those]." instead.
Check launching the messenger ship when the player is not in the messenger ship:
	say "[We] [can't] remote-control [the messenger ship]. Also, it would probably be good if [we] were [italic type]on[roman type] the ship when it launches, wouldn't it?" instead.
Check launching the messenger ship when the messenger ship is not started:
	say "The systems of [the messenger ship] are powered down." instead.
Check launching the messenger ship when the location is the planetary orbit:
	say "[We] [are] already in space." instead.
Check launching the messenger ship when the location is the hangar:
	say "[We] will need to get the ship out in the open first." instead.
Carry out launching the messenger ship:
	now the messenger ship is in the planetary orbit;
	take 30 minutes.
Report launching the messenger ship:
	say "You get into the pilot's seat and take a few seconds to collect your thoughts. While you didn't perform [italic type]absolutely[roman type] terribly on the simulator tryouts in bootcamp, there is certainly a reason why you were placed with the space-borne infantry rather than in a dropship wing.[line break]... no time for second thoughts. It's either this, or staying on this planet until you either starve or your captors return and discover what you did. After all, you (hopefully) won't need to fly any combat maneuvers, just take off and make orbit. You push your doubts aside and follow the pointers provided by you armor's computer system.[paragraph break]Half an hour later, you have safely left the atmosphere and have settled into a stable low orbit.";
	try looking.

Nounless-launching is an action applying to nothing.
Understand "make orbit" or "take off" or "blast off" or "lift off" or "ascend" or "ascend into/to the/-- skies/sky/space/orbit" or "depart" as nounless-launching.
Understand "climb" or "climb into space/orbit" or "climb into the sky" or "rise" or "take flight" as nounless-launching when the player is in the ship.
Check nounless-launching when the messenger ship is in the location:
	try launching the messenger ship instead.
Check nounless-launching (this is the default block nounless launching rule):
	say "[We] [are] incapable." instead.
Instead of going up when the player is in the ship, try nounless-launching.

Deorbiting is an action applying to one visible thing.
Understand "land [something]" or "land [something] on/at [surface-desc]" as deorbiting.
Does the player mean deorbiting the messenger ship: it is likely.
Check deorbiting something that is not the messenger ship:
	say "[We] [can't] land [regarding the noun][those]." instead.
To leave is a verb.
Check deorbiting the messenger ship when the player is not in the messenger ship:
	say "[We] [can't] remote-control [the messenger ship]. Also, doing that [would leave] [us] stranded out here." instead.
Check deorbiting the messenger ship when the location is not the planetary orbit:
	say "[We] [are] already on the planet." instead.
Carry out deorbiting the messenger ship:
	take 30 minutes.

Nounless-deorbiting is an action applying to nothing.
Understand "deorbit" or "break orbit" or "touchdown" or "touch down" or "make planetfall" or "enter the/-- atmosphere" or "re-enter the/-- atmosphere" or "reenter the/-- atmosphere" or "return to the/-- [surface-desc]" as nounless-deorbiting.
Understand "surface/planet/island" or "landing/-- runway/pad/strip" or "military/-- complex/facility/prison" as "[surface-desc]".
Check nounless-deorbiting when the location is not planetary orbit:
	say "[We] [are] not in orbit." instead.
Check nounless-deorbiting when the messenger ship is in the location:
	try launching the messenger ship instead.
Instead of going down when the location is the planetary orbit, try nounless-deorbiting.

Understand "warp" or "warp [number]" as a mistake ("The warp drive was a neat theory, but the real world doesn't work like that.") when the player is in the ship.

Chapter 7 - Space

Planetary orbit is a vacuum room. "You float in space, several hundred kilometers above the planet's sickly yellowish surface.[paragraph break]The time has come to finally return home. Or, if you really must, you could attempt to break orbit and land back at the facility."
The room-floor-prop is nothing. The room-top-prop is nothing. The walls are {}.

The planet is scenery in the orbit. "In the external camera view, [we] [see] the barren, yellow surface of your former prison receding behind [us]. [We] [are] glat to be on [our] way."
Understand "wretched" or "damned" or "godforsaken" or "horrible" or "awful" or "third-rate" or "shithole" or "hellish" or "hell-hole" or "hellhole" or "planet" or "rock" or "wasteland" or "excuse" or "of a" as the planet.
Understand "leave this/-- [the planet]" as getting off when the location is the planetary orbit.
Instead of getting off the planet, try home-going.
Understand "go to [the planet]" as entering when the location is the planetary orbit.
Instead of entering the planet, try nounless-deorbiting.

The transit node is scenery in the orbit. "A yellow dot on the ship's map marks the spot at which you can transition transition to earth [dash] it is not actually visible out there." Understand "space/-- road/highway/motorway" or "hyperlane" or "alcubierre" or "chute" as the transit node.
Understand "hit [the transit node]" as entering when the location is the planetary orbit.
Instead of entering the transit node, try home-going.
Instead of doing something other than entering or examining to the transit node, say "The node isn't a tangible thing [dash] just an area where local space-time is weak."

Home-going is an action applying to nothing.
Understand "go [home-desc]" or "return [home-desc]" or "travel [home-desc]" or "fly [home-desc]" as home-going.
Understand "home" or "to/-- earth" as "[home-desc]".
Understand "pedal to the/-- metal" or "put the/-- pedal to the/-- metal" or "stick to the/-- panel" or "put the/-- control/-- stick to the/-- panel" or "punch it" or "transition [home-desc]" or "transition away" or "transition out of here" or "leave this/-- system" as home-going when the location is the orbit.

Check home-going when the location is not the planetary orbit:
	say "Yes, that's [one of]the plan[or]the mission[or]the objective[or]what [we]['re] trying to do[at random]." instead.
Check home-going when the location is the planetary orbit and the player is not in the messenger ship:
	say "Without a ship? Good luck." instead;
Check home-going when the location is not the planetary orbit and the player is in the messenger ship:
	say "Yes! Take off." instead.

Carry out home-going:
	take 300 minutes;
	say "While your sudden appearance in the solar system caused some confusion and concern, the transmission of your identification codes [dash] and showing your face on video comms [dash] dissuaded the combined military forces in the area from blowing you to pieces. Against your own expectations, you manage to land the ship in the hangar of one of the fleet's large carriers. Despite the prospect of hours upon hours of debriefings from all levels of command, and probably military intelligence as well, you are glad to be back.";
	end the story finally saying "You have returned home".

Instead of going when the location is the planetary orbit, say "[We] don't really have anywhere to go in normal space."

Book 4 - Debug Commands - Not for Release

[The macOS IDE hangs whenever you click "Go", unless we unlist all rules that attempt to print something before the banner text. Go figure.]
The show intro rule is not listed in any rulebook.
