"Return to the Stars" by Adrian Welcker

The story genre is "Science Fiction". The story headline is "An Interactive Escape".

Release along with cover art ("A starship leaving a planet"), a website, an interpreter, and the source text.

Book 1 - Preamble

Use american dialect and the serial comma.

Include Basic Screen Effects by Emily Short.
Include Menus by Emily Short.
Include Version 16 of Smarter Parser by Aaron Reed.

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

[Making this a "when play begins" rule causes the macOS IDE to hang during play. Go figure.]
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
title	subtable (table name)	description	toggle (a rule)
"Content Warning"	--	--	query gore mode rule
"Unusual Verbs"	--	"[help-text]"	--
"Credits"	--	"[credits-text]"	--

To say help-text:
	say "You may find the following 'non-standard' verbs to be useful on occasion:[paragraph break]CLIMB UP/DOWN [italic type]something[roman type][line break]CRAWL THROUGH [italic type]something[roman type][line break]LOOK UNDER [italic type]something[roman type][line break]CUT [italic type]something[roman type] OPEN WITH [italic type]some kind of knife[roman type][line break]SHOOT [italic type]something[roman type] WITH [italic type]some kind of gun[roman type][line break]LAUNCH[line break]PREPARE [italic type]something[roman type] FOR LAUNCH"

To say credits-text:
	say "[RttS] by Adrian Welcker[line break]Built using the following extensions:[line break][complete list of extension credits]Time-keeping based on code by Eric Eve.[paragraph break][the playtesters]".

To say the playtesters:
	say "[bold type]Playtesters[roman type]: none yet...".

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
	say "Thank you for playing 'Return to the Stars'![paragraph break]The general premise of needing to escape from captivity on an alien world occurred to me in early 2018, but as things often go in life, I was busy with other projects, so the idea was set aside and mostly forgotten about. The announcement of ParserComp 2021 brought the concept back to my mind, I reduced the scope somewhat, and in April [']21 I finally sat down and started working on the implementation in earnest [dash] partially out of sheer boredom, some five months into Germany's second COVID lockdown. Its release marks the first time I actually finish and publish a piece of IF.[paragraph break]With the minor history lesson out of the way, it is time for some acknowledgements. While it is often said in writing circles that 'everything has been done before', and that it's all about the individual author's take on a certain concept, I think it is only fair for me to acknowledge the major source of inspiration for 'Return': Marko Kloos['] [italic type]Frontlines[roman type] novel series. (And probably half a dozen others, subconsciously, but that's usually the one that comes to my mind when I think 'military SF'. I highly recommend it.) As such, the appearance of certain names or phrases, such as [italic type]space-borne infantry[roman type], is no coincidence. (Rest assured, however, that this is not just a barely-concealed fanficion.)".

Book 2 - Mechanics

Chapter 1 - Player Description

The carrying capacity of the player is three.

The description of the player is "[if the player is wearing the armor and the armor is clean]In [our] armored suit [we] almost look soldierly again[otherwise if the player is wearing the armor and the armor is muddy]Covered in a generous amount of ocean mud [dash] [we] [haven't] looked this bad since bootcamp, probably. [We]['re] not sure whether [we] look particularly fierce or particularly ridiculous[otherwise if the player is wearing the armor and the armor is covered][We]['ve] completely covered [ourselves] in the ocean mud, so [we] now look more like a vaguely human-shaped brown blob[otherwise if the player is wearing the armor and the armor is not clean][We] look like [we] just dug around in another person's body, because that's exactly what [we] did. [We] should find a place to clean up[otherwise][We]['ve] seen better days[end if]."

The player is wearing a set of fatigues. The description of the fatigues is "A set of standard-issue combat fatigues, consisting of a gray shirt, pants and blouse in a grey-and-black digital urban camouflage pattern, and a pair of black leather boots[if the number of things held by the player is 1]. It is the only possession you have left at the moment[end if].". Understand "uniform" or "fatigue" or "fatigues" or "blouse" or "pants" or "trousers" or "shirt" or "clothes" or "digital" or "urban" or "camo" or "camouflage" or "battle/combat dress" as the fatigues.
Instead of taking off the fatigues, say "You'd rather not strip naked.[if the location is your cell] It's not exactly warm in here, anyways.[end if]".
Report smelling the fatigues:
	say "You've been wearing the same clothes for the past few weeks, so they don't exactly smell fresh anymore."
The pair of black leather combat boots is part of the fatigues. The description is "A pair of black leather combat boots. They have carried you across many worlds already."
Instead of taking off the boots, say "Walking around barefoot doesn't seem particularly beneficial right now."
Instead of taking off something that is not the armor when the armor is worn, say "You'd rather not strip naked. Also, you would need to remove the armor first."
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

First for implicitly taking something (this is the implicitly taking timiming rule): take 10 seconds.

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

Chapter 3 - Armor, Air, and Toxicity

Section 1 - Armor

The player has a number called the air. The air of the player is 300. [5 minutes]
The armor has a number called the air. The air of the armor is 6000. [100 minutes]
The armor is wearable and proper-named. It is a player's holdall. It is open and unopenable. The printed name is "[our] armor". Understand "your/my/-- battle/combat/-- armor/armour/rattle" or "your/my/-- suit/set of/-- battle/combat/-- armor/armour" or "dump" or "pouch" or "sack" or "holdall" as the armor.
Dirtiness is a kind of value. The dirtinesses are clean, muddy, bloody, muddy-and-bloody, and covered.
The armor has a dirtiness. The armor is clean.
The description of the armor is "It is sometimes said that a soldier's best friend is his weapon [dash] but that hasn't really been true in a while now, with weapons being issued and turned in as needed. Your armor, however, has traveled to many a world with you, and saved your hide more than once. You're glad to have it back.[line break]It is fitted with a helmet lamp and a dump pouch, and it can double as a space suit, providing air in hostile environments.[if the armor is not clean][paragraph break][end if][if the armor is muddy]It will need a good cleaning after being dragged across the bottom of the ocean, but it still seems to be working fine.[otherwise if the armor is covered]Any and all details are hidden under a thick, uniformly brown layer of ocean mud.[otherwise if the armor is not clean and gore is allowed]It's covered with a lot of blood and other... things. You should really find a place to clean up.[otherwise if the armor is not clean]The gloves are covered in a significant amount of slimy lizard spit.[end if]".

[Avoid trying to jam a rifle into the pouch]
Check an actor taking (this is the revised use player's holdall to avoid exceeding carrying capacity rule):
	if the number of things carried by the actor is at least the
		carrying capacity of the actor:
		if the actor is holding a player's holdall (called the current working sack):
			let the transferred item be nothing;
			repeat with the possible item running through things carried by the actor:
				if the possible item is not lit and the possible item is not a gun and the possible item is not the current working sack, let the transferred item be the possible item;
			if the transferred item is not nothing:
				if the actor is the player, say "(putting [the transferred item] into [the current working sack][if the current working sack is the armor]'s dump pouch[end if] to make room)[command clarification break]" (A);
				silently try the actor trying inserting the transferred item
					into the current working sack;
				take 10 seconds;
				if the transferred item is not in the current working sack:
					stop the action.
The revised use player's holdall to avoid exceeding carrying capacity rule is listed instead of the use player's holdall to avoid exceeding carrying capacity rule in the check taking rules.

examine containers rule response (A) is "In [the noun][if the noun is the armor]'s dump pouch[end if] ".
examine containers rule response (B) is "[The noun][if the noun is the armor]'s dump pouch[end if] [are] empty.".

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
	decrease the air of the armor by (300 minus the air of the player);
	now the air of the player is 300;
	continue the action.

Carry out wearing the armor: take two minutes.

There is a device called the helmet lamp.[* This somewhat stilted syntax is the only way we can force Inform to create "the helmet lamp" and (later on) "a helmet" as separate things. By default, Inform would assume that "helmet" is merely a shorthand form of "helmet lamp" and treat them as one object -- causing errors, because they aren't, of course.] It is part of the armor.
Understand "helmet/-- lamp/light" as the helmet lamp.
Carry out switching on the helmet lamp: now the helmet lamp is lit.
Carry out switching off the helmet lamp: now the helmet lamp is not lit.

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
		if the air of the player is 300, say "The alarm grows more urgent as your suit's air reserve is now empty. As you take a final deep breath, you know that you have mere minutes left before you suffocate.";
		decrease the air of the player by d.

An air supply rule for a room that is not breathable when the player is not wearing the armor:
	decrease the air of the player by the work duration.

An air supply rule for a breathable room (this is the air replenishment rule):
	now the air of the player is five;
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
	[if the air of the armor is than 100 and the location is toxic:]
	if the air of the armor is 100 or (the location is not toxic and the location is not submerged), stop;
	if the air of the armor is greater than five:
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

Chapter 4 - Parser Improvements

Section 1 - Synonyms and Extra Grammar

[Adding some extra grammar, mostly based on dictionary synonyms.]

[Taking, Removing it from]
[Understand the command "grab" as "take".]
Understand the command "pack" as "pick".
Understand "grab [things]" as taking.
Understand "grab [things inside] from/off [something]" as removing it from.
Understand "collect [things]" as taking.
Understand "collect [things inside] from/off [something]" as removing it from.

[Dropping, Putting it on, Inserting it into]
Understand "let go of/-- [things preferably held]" or "let [things preferably held] go" as dropping.
Understand "set [things preferably held] down" or "set down [things preferably held]" as dropping.
Understand the command "release" or "relinquish" or "deposit" or "offload" as "drop".
Understand "cast aside [something]" or "cast [something] aside" as dropping.
Understand the command "toss" as "cast".

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

[Climbing]
[A concept from TADS: "go up ladder", etc.]
Understand "go up/down [something]" as climbing.
Understand "climb up/down [something]" as climbing.
Understand "slide down [something]" as climbing.

[And finally]
Understand "xyzzy" or "say xyzzy" or "cast xyzzy" as a mistake ("You're not superstitious like that.").
[https://intfiction.org/t/parsercomp-submissions-start-1st-of-may-not-the-deadline/50702]
Understand "throw snotball at evil librarian" or "throw snotball at [someone]" as a mistake ("You remember the last thing your squadmate Rovarssen told you before you got separated: [italic type]...and if nothing else, throw a snotball at them![roman type]").

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

Chapter 5 - Grates and Air Ducts

An air duct is a kind of fixed in place closed enterable transparent scenery container. An air duct is always improper-named.
The description of an air duct is usually "It exudes a stream of cool, fresh air."

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

Connection relates one air duct to another (called the other end). The verb to connect to means the connection relation.

Crawling into is an action applying to one touchable thing.
Understand "crawl through/into/up/down/-- [something]" as crawling into.
Understand "crawl" as crawling into.
To crawl is a verb.
Does the player mean crawling into an air duct: it is likely.

Rule for supplying a missing noun while crawling into:
	if the holder of the player is an air duct, now the noun is the holder of the player;
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

Before exiting when the holder of the actor is an air duct and a grate is part of the holder of the actor:
	say "(first kicking a hole into the grate)[command clarification break]";
	silently try attacking a random grate that is part of the holder of the actor.

Understand "climb in/into [something]" as entering.

Instead of crawling into an air duct when the player is wearing the armor, say "The duct is just large enough for a human to crawl through [dash] bulky suit of armor not included."

Chapter 6 - Looking at Buildings

[This is to allow commands such as "x armory" or "enter armory" when the armory is an adjacent room.]
A facade is a kind of scenery thing. A facade has a room called the associated room.

Instead of entering a facade (called the building):
	let direct be the best route from the location to the associated room of the building;
	if direct is nothing, say "[We] [can't] [seem] to find a way inside [the noun].";
	otherwise try going direct.

Chapter 7 - Looking Through

[There are a few locations within the game where the player may look through something to get a peek into another room.]
A thing has some text called the other-side-description.

Looking through is an action applying to one visible thing.
Understand the commands "look" and "l" as something new. [Argh]
Understand "look" as looking.
Understand "look inside/in/into [something]" as searching.
Understand "look under [something]" as looking under.
Understand "look through [something]" as looking through.
Understand the command "l" as "look".

First check looking through a transparent container (this is the convert looking through transparent containers to searching rule):
	try searching the noun instead.

Check looking through something when the other-side-description of the noun is empty (this is the opaque looking through rule):
	say "[We] [can't] [see] through [the noun]." instead.

Carry out looking through (this is the standard looking through rule):
	say "[the other-side-description of the noun][paragraph break]".

Chapter 8 - Ranged Weapons

[And, really just because we can't have a MilSF-themed game without guns in it...]

A gun is a kind of thing. Understand "gun" as a gun.
An ammo clip is a kind of thing. An ammo clip has a number called the bullet count. The bullet count of an ammo clip is usually 30.
After printing the name of an ammo clip while taking inventory, say " (in which are [bullet count] rounds)".

Definition: a thing is ungunlike if it is not a gun.
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

A wreckage is a kind of thing.
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
			now the shot-result is glancing-hit;
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
				say "At point-blank range, [the armor] [stand] little chance: leaving a trail of searing hot pain, the bullet carves a path through [our] [one of]head[or]chest[at random] before coming out on the other side, leaving [our] innards distributed on [the room-floor-prop of the location][unless the location is an outdoor room] and the wall behind [us][end unless].";
				end the story saying "You have been shot";
			-- glancing-hit:
				say "[regarding the actor][They] [past participle of the verb hold] [their] [weapon] at an odd angle, and the shot [regarding one][glance] off [our] [one of]helmet[or]chest plate[or]shoulder plate[or]leg armor[at random], leaving [one of]a[or]a deep[or]another[or]yet another[then at random] gouge in the material.";
			-- shot-dodged:
				say "Fifteen years of military experience lead to some rather tuned reflexes, so [we] [dodge] in time to avoid the shot.";
			-- near-miss:
				say "[regarding the actor][Their] aim [are] slightly off. The bullet [regarding one][whirr] past [our] [one of]head[or]shoulder[or]chest[at random] and [if the location is an outdoor room]flies off into the distance[otherwise]embeds itself into the wall behind us[end if].";
			-- full-miss:
				say "Their aim is way off and the shot [if the location is an outdoor room]flies off into the distance[otherwise]embeds itself into the wall behind us[end if].";
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

A shwabolian is a kind of person. The description of a shwabolian is usually "An unsightly green humaniod yet lizard-looking creature, walking on two legs."
A corpse is a kind of wreckage. A corpse is usually fixed in place.
Instead of taking a corpse, say "You'd rather not carry a dead body around with you."
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
Carry out going:
	now turns-in-location is zero;
	continue the action.

Every turn (this is the aliens shooting rule):
	increase turns-in-location by one;
	if turns-in-location is at least two:
		let the hostile be a random shwabolian in the location;
		if the hostile is not nothing:
			let g be a random gun carried by the hostile;
			try the hostile shooting the player with g.

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
An east-wall is a kind of room-wall. Understand "east/eastern wall/--" as a west-wall. The default-east-wall is an east-wall. The printed name is "eastern wall."

[If we just wrote "A room has a room-top.", the property name would be equal to the kind name, confusing the compiler if we tried to create more instances of the kind later on.]
A room has an object called the room-top-prop. The room-top-prop of a room is usually the default-ceiling.
A room has an object called the room-floor-prop. The room-floor-prop of a room is usually the default-floor.
A room has a list of room-walls called the walls. The walls of a room is usually {default-north-wall, default-west-wall, default-west-wall, default-east-wall}.

The room-top-prop of an outdoor room is usually the default-sky.
The room-floor-prop of an outdoor room is usually the default-ground.
The walls of an outdoor room are usually {}.

After deciding the scope of the player when not in darkness:
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

Chapter 11 - Unthings

[This is another concept lifted from TADS's adv3 library: a thing denoting the absence of a thing.]
An unthing is a kind of thing. It is always scenery. The description is usually "[The printed name] isn't here."
Instead of doing something other than examining to an unthing, try examining the noun.

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

[We've spent A LOT of time in this room, so describe it in excruciating detail.]
Your cell is a room. "This is the room you have spent most of your time in, ever since being taken captive. To be honest, you've kind of lost track of how long that has been. [if the cot is in your cell][A cot] stands in one corner of the room. [end if]An air duct[if a grate is part of cell air duct] covered by an old grate[end if] is mounted in the wall near [if the cot is in the location]the cot[otherwise]where the cot once stood[end if][if the ventilation switch is switched on], exuding a constant stream of cool, fresh air (and the occasional drop of condensation, which falls to the ground with an annoyingly loud [italic type]plink[roman type])[end if]. [A sanitary station] [dash] a sort of hybrid toilet-shower-sink [dash] is built into a corner of the room. [if the metal door is closed][A metal door] lies to the north, keeping you securely in the cell.[otherwise][The metal door] northward is open, leading to a corridor.[end if]".

An air duct called cell air duct is in your cell.
Check attacking the cell air duct's grate when the noun is part of something:
	instead say "It's too far up to throw a good punch at the grate."
The description of the cell air duct's grate is "A rather flimsy, rusty grate covering the air duct. It looks like you could break it if you wanted to (although the presence of the camera has so far kept you from attempting anything)."

The metal door is north of your cell and south of the corridor. It is an openable closed lockable locked door.
The other-side-description is "[We] peek through the small duraplast window into the corridor outside. It is empty."
Instead of unlocking the metal door with something when the location is your cell, say "The door doens't have any lock or control mechanism on the inside."

The cot is a fixed in place enterable supporter in your cell. "A cot stands in one corner of the room." The description is "Flimsy frame, uncomfortable plastic surface [dash] it's a cot alright."
Understand "bed" or "cot" or "bunk" or "rack" or "sack" as the cot.

Some bedsheets are on the cot. "On the cot are some neatly folded bedsheets."
The description is "Plain white bedsheets. Thin, scratchy, and not quite warm enough to keep you comfortable. It seems like all expenses were spared here.[unless the bedsheets are handled] Your military discipline dictates that you neatly fold the bedsheets when you get up in the morning.[end if]".
Understand "plain" or "white" or "sheets" or "bed" as the bedsheets.

The sanitary station is a fixed in place enterable container in the cell. "A sanitary station [dash] a sort of hybrid toilet-shower-sink [dash] is built into a corner of the room." The description is "A brushed aluminum clamshell contraption for personal hygiene, not unlike showers you've used on some UNDC ships."
Understand "shower" or "toilet" or "head" as the sanitary station.
Instead of entering the sanitary station, say "You've already showered today."
After printing the name of the sanitary station, omit contents in listing.

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
Instead of taking the mangled cot frame, say "No point lugging [those] around."

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

The corridor is a room. "Write me."

West of the corridor is south of the control room. Index map with control room mapped northwest of corridor.
The control room is a room. "Write me."

A table is a scenery supporter in the control room.
On the table is a thing called a helmet. The initial appearance of the helmet is "Your[if we have examined the plates] missing[end if] helmet is sitting on a table in the middle of the room, with a number of wires attached to it.". The printed name is "[our] helmet".
Instead of wearing the helmet, say "Since the power and air supply are located in the torso pieces of the suit, wearing the helmet alone isn't terribly useful."
Before taking the helmet for the first time, say "You carefully disconnect the wires that connect the helmet to the computer systems in the room. Hopefully, your captors haven't messed anything up."

The control panel is in the control room. "A control desk and some screens are installed on the wall.". The description is "[control-panel-desc].". Understand "desk" or "screen" or "system" or "panel" or "panels" or "screens" or "surface" or "console" as the control panel.
To say control-panel-desc:
	if the controls switch is switched on:
		say "The screens show video feeds from various locations in the building[run paragraph on]";
		if the camera is in your cell, say "[if the mangled cot frame is in your cell or the ripped bedsheets are in your cell]. The havok you wrought in your cell is plainly visible[end if]";
		otherwise say ". One feed is missing [dash] presumably yours, considering that you broke the camera in your cell";
	otherwise:
		say "The screen is blank".

The prison warden's ID card is a thing. The description is "A purple-colored card with shwabolian writing on it.[if the player is wearing the armor] Your suit translates it as 'Shevok Kemalik, Warden'.[end if]". Understand "warden" or "guard" or "access" or "purple" as the ID card.
Instead of looking under the control panel, try searching the noun.
Instead of searching the control panel:
	now the player is carrying the ID card;
	say "Looking under [the control panel], you find a purple card, which you pocket.";
	rule succeeds.

ladder-top is privately-named scenery in the control room. The printed name is "ladder". Understand "ladder" or "rungs" as the ladder-top.
Instead of climbing ladder-top, try going down.

East of the corridor is south of the front office. Index map with front office mapped northeast of corridor.

The airlock is a locked door. "[airlock-desc].". The airlock is north of the front office and south of the prison antecourt.

To say airlock-desc:
	if the player is in the front office, say "The way out of the building, to the north, leads through [if the player has not been in the military complex plaza]what appears to be [end if]an airlock";
	otherwise say "The airlock leading into the cell complex lies to the south"
	
Report going through the airlock for the first time:
	say "You open the inner door and step into the intermediate space. [if the player is wearing the armor]Nothing obvious happens, but your suit alerts you that the air coming in from the outside is, shall we say, less than ideal[otherwise]As the clean air inside the airlock is replaced with the outside atmosphere, you quickly develop a searing headache -- you won't last long under these conditions[end if].[line break]The other door opens and you take a tentative step outside.".

The airlock's inner card reader is an unthing in the front office. The description is "The door doesn't seem to have a card reader. There must be another way to unlock it.".
Instead of locking the airlock with something when the location is the front office, say "The door doesn't seem to have a card reader. There must be another way to unlock it.".
Instead of unlocking the airlock with something when the location is the front office, say "The door doesn't seem to have a card reader. There must be another way to control it.".
	
Section 3 - The Storage Area

The storage space is east of the front office. "Bare-metal [shelves] line the walls. This seems to be the place where inmates' possessions are stored."

Some shelves are a scenery supporter in the storage space.
Understand "bare" or "metal" or "bare-metal" or "shelf" or "rack" as the shelves. Understand "shelves" or "racks" as the plural of shelves.
Some plates are on the shelves. "Pieces of armor plating lie on the shelves." The description is "[We] are fairly sure that these are the pieces of [our] battle armor. They seem to be intact, but an integral part [dash] the helmet [dash] is nowhere to be seen.." The printed name is "armor plates". Understand "armor/armour/armored/armoured/-- plates/plating" as the plates. They are fixed in place.
Instead of taking the plates, say "They're too bulky, and the plates alone won't do you much good."
Instead of wearing the plates, say "The plates alone won't do you much good."

Instead of putting the helmet on the shelves:
	now the helmet is nowhere;
	now the plates are nowhere;
	now the armor is on the shelves;
	say "You put the helmet with the armor plates, completing the set again."

Wearing the plates is armor-wear-preparation. Taking the plates is armor-wear-preparation.

Before armor-wear-preparation when the player is carrying the helmet:
	now the helmet is nowhere;
	now the plates are nowhere;
	now the armor is in the location;
	say "(donning the now-complete suit)[command clarification break]";
	try wearing the armor instead.

A ration bar is a kind of edible thing.
On the shelves are five ration bars.

Section 4 - Basement

The prison installations room is down from the control room. "This is where most of the installations and appliances keeping the cell complex running reside. [if the ventilation switch is switched on]A stiff breeze blows through this room, from the large machine on one wall, to the air ducts on the opposite wall. [end if]A ladder leads up[if bottom of the air duct is open], the air duct to your cell is on the northern wall[end if]."

An air duct called bottom of the air duct is in the prison installations room. It connects to the cell air duct.

some-air-ducts is scenery in the prison installations room. It is privately-named. The description of some-air-ducts is "They presumably lead to different rooms within the facility." The printed name is "some air ducts". Understand "air/-- ducts" as some-air-ducts.
Instead of doing something other than examining to some-air-ducts, say "They're not labeled, and you'd rather not wander through the air ducts aimlessly."

ladder-bottom is privately-named scenery in the installations room. The printed name is "ladder".
Understand "ladder" or "rungs" as the ladder-bottom.
Instead of climbing the ladder-bottom, try going up.

["Obfuscated Switches" have a label in "Shwabolian" writing, which is really just ROT13-encoded english. The armor can translate those, so we show the plain english labels when the player is wearing the armor.]
An obfuscated switch is a kind of device. An obfuscated switch is usually switched on.
An obfuscated switch has some text called the obf-label. An obfuscated switch has some text called the real-label.
The printed name of an obfuscated switch is usually "[if the player is wearing the armor][real-label][otherwise][obf-label][end if] switch".
The description of an obfuscated switch is usually "A large rotary switch[if the player is wearing the armor]. Your suit's translator shows the label as '[real-label]'[otherwise]labeled '[obf-label]'[end if].".
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

The lights switch is part of the switch panel. It is an obfuscated switch. The real-label is "LIGHTS". The obf-label is "YVTUGF". Understand "light" or "yvtugf" as the lights switch.
The ventilation switch is part of the panel. It is an obfuscated switch. The real-label is "VENTILATION". The obf-label is "IRAGVYNGVBA". Understand "iragvyngvba" as the ventilation switch.
The doors switch is part of the panel. It is an obfuscated switch. The real-label is "MAGLOCK". The obf-label is "ZNTYBPX". Understand "maglock" or "zntybpx" as the doors switch.
The controls switch is part of the panel. It is an obfuscated switch. The real-label is "CONTROLS". The obf-label is "PBAGEBYF". Understand "pbagebyf" as the controls switch.

Carry out switching off the lights switch:
	now all rooms in cell-complex are dark.
Carry out switching on the lights switch:
	now all rooms in cell-complex are lit.
Carry out switching off the doors switch:
	now all doors in cell-complex are unlocked.
Carry out switching on the doors switch:
	now all doors in cell-complex are locked.

Report switching off the ventilation switch:
	say "The ventilation machinery falls silent, and the wind in the room subsides."
Rule for printing the description of a dark room when the location is the installations room:
	say "It is pitch dark, save for a small light next to the lights switch beckoning you to turn the lights back on."

After deciding the scope of the player while in darkness and the location is the installations room:
	place the lights switch in scope.

Section 5 - Outside Area

Prison antecourt is an outdoor room. "Write me."

The prison docks are an outdoor room. They are east of the prison antecourt. "The prison is built on a tiny island in the ocean [dash] presumably to make escaping more difficult. A small dock extends into the water, away from the rocky shoreline.[line break]The shore, populated with buildings, lies a few hundred meters to the north. The prison antecourt is to your west."

The dock is a backdrop. It is in the prison docks and the shore docks. The description is "A floating plastic contraption with a metal frame. It wobbles as you try to stand on it."
Understand "plastic" or "contraption" as the dock.
Understand "jump off [the dock]" as getting off.
Instead of getting off the dock, try entering the water.

The water is a backdrop. It is in the prison docks and the shore docks. The description is "The water is murky, but the sea is smooth.".
Understand "ocean" or "sea" as the water.

Understand "jump in/into [something]" or "dive in/into [something]" as entering.
Does the player mean entering the water: it is likely.

Instead of jumping when the location is the prison docks or the location is the shore docks:
	say "(into the water)[command clarification break]";
	try entering the water.

Instead of entering the water:
	if the player is not wearing the armor, say "And swim all the way [if the location is the prison docks]to shore[otherwise]across[end if]? You'd never make it in time before the atmosphere here got the better of you.";
	otherwise try going down.

Chapter 2 - Underwater

A sea-room is a kind of room. The description of a sea-room is "You are standing knee-deep in the silt at the bottom of the ocean. The military complex is due north." A sea-room is usually dark. The printed name is usually "at the bottom of the ocean". A sea-room is always submerged. The room-top-prop of a sea-room is usually the sea. The room-floor-prop of a sea-room is usually the ocean floor. The walls of a sea-room are usually {}.

The sea-region is a region. Seabottom-1, seabottom-2, seabottom-3, and seabottom-4 are in the sea-region. Index map with room-colour of sea-region set to "Navy" and room-name-colour of sea-region set to "White".

Instead of going nowhere when the location is in the sea-region, say "Best not to wander around, lest you'll never find your way again."

The sea is a backdrop in the sea-region. The description is "There are about ten meter's worth of sea water above you. As you exhale, you can see the bubbles of your breath rising to the surface." Understand "ocean" or "sea" or "water" or "air/-- bubble/bubbles" as the sea.
Instead of examining up when the location is in the sea-region, try examining the sea.

The ocean floor is a backdrop in the sea-region. The description is "Silt has accumulated in the calmer waters between the shore and the prison island, enough to seriously hamper your movement down here." Understand "sea/ocean/-- bottom/ground/floor/silt" as the ocean floor.
Instead of taking the ocean floor, say "You scoop up a handful of silt, but it quickly runs through your fingers."

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
	say "While your armor is designed primarily for planetary and shipboard operations, it can also double as a space suit and diving equipment in a pinch (or so the manufacturer promises). While you had more chances than you'd care for to verify that is does make for a passable spacesuit, it may finally be time to put the 'diving' part of that claim to the test.[line break]You jump into the water, spreading your arms and legs to slow your descent..."; [blatantly ignoring the potential issue of barotrauma, but whatever]
	[pause the game; [for dramatic effect only]]
	say "About ten seconds later, you come to an abrupt halt as you land faceplate-first in the silt at the bottom of the sea.[line break]You scramble to your feet, wiping the muck off your faceplate. You can still breathe, and none of the electronics in your suit seem to have been fried [dash] so far, so good.";
	take 45 seconds.

The rocky cliffs are scenery in seabottom-1. "These cliffs are what the prison is built on top of." Understand "rocks" as the cliffs.
Instead of climbing the rocky cliffs:
	say "You climb up the cliffs[run paragraph on]";
	if a random chance of 1 in 2 succeeds:
		take 6 minutes;
		say ", but lose your purchase on the slippery rock and fall back down to the bottom of the sea.[line break]Luckily, the ground is soft and the water slowed your descent, so you didn't hurt yourself." instead;
	say ".";
	take 8 minutes;
	now the player is in the prison docks.
Instead of going up from seabottom-1 for more than the first time (this is the hint at climbing rule):
	say "While your armor's power assist usually keeps you from noticing its 50-or-so kilograms of heft, getting to the surface of the ocean would require a propeller of sorts, which is not provided.[line break](However, if you really must return, the cliffs look like you might stand a chance at climbing them.)"

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
Test act2setup with "purloin armor / wear armor / gonear incline / purloin ID card / down / up".

The shore docks are an outdoor room. They are up from seabottom-4 and north from seabottom-4. "The shoreline here seems more like an extension of the ocean floor you just walked: a gradual incline, rather than a sharp falloff. A dock extends into the water to allow loading and unloading boats without needing to drive them up against the shore. (Although no boats are to be seen.)[line break]The prison buildings lie to the south, across the water, and the military complex continues to the north.[paragraph break]You vaguely recall coming through here, weeks ago, sedated, a breathing apparatus in your face..."
Index map with shore docks mapped north of prison docks.

The muddy incline is scenery in the shore docks. "The muddy shore slopes down into the water. You can see the rut you left as you crawled up."
Understand "slope" or "rut" or "muck" or "mud" or "silt" or "shore" or "shoreline" as the incline.
Instead of climbing the muddy incline, try going south.
Before going south from the shore docks, say "You take a few tentative steps down the incline before falling on your ass and sliding the rest of the way down into the water."
Before going down from the shore docks for the first time, say "With more confidence than before, you jump off the end of the dock and sink to the bottom of the ocean again."

Rubbing it on is an action applying to two touchable things and requiring light.
Understand "rub [something] on/onto [something]" as rubbing it on.
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

Section 2 - The Plaza

The military complex plaza is an outdoor room. It is north of the shore docks. "Write me."

The command center door is north of the plaza and south of the entry hallway. It is an openable closed lockable locked door. The prison warden's ID card unlocks the command center door.
The command center door's card reader is a fixed in place thing in the plaza.
Instead of unlocking the card reader with something, try unlocking the command center door with the noun.
Instead of locking the card reader with something, try locking the command center door with the noun.

The force field is a door. It is east of the plaza and west of the hangar.
The force field can be enabled or disabled. The force field is enabled, open, and not openable.
Understand "forcefield" or "force-field" as the force field.

Check going [from the military complex plaza to the hangar] through the enabled force field:
	if the player is not wearing the armor, say "The force field does not let you pass." instead;
	if the armor is clean or the armor is blood-stained:
		say "The force field does not let you pass." instead;
	if the armor is muddy:
		say "[one of]Your dirty hand[regarding one][or]Your lower arm[regarding one][or]A mud-stained leg[regarding one][or]Your mud-caked hands[regarding two][then at random] [pass] through the force field, but not more." instead;
	if the armor is covered:
		say "Your mud-covered body passes through the force field with little resistance.";
		continue the action.

Chapter 4 - The Command Center

Section 1 - Hallways

The entry hallway is a room. "Write me."

The command center lobby is north of the entry hallway. "Write me."

Section 2 - Armory

The armory is west of the entry hallway. "Write me."

The ammo crate is a fixed in place container in the armory.
Instead of taking the ammo crate, say "It's too heavy and awkward to carry around."
Does the player mean taking the ammo crate: it is unlikely.

Some some-ammo-clips is in the crate. It is privately-named. The indefinite article is "some". The printed name is "ammo clips". Understand "clip" or "clips" or "ammo" or "ammunition" or "rounds" or "magazines" as some-ammo-clips.
ammo-temp-storage is a container. In it are ten ammo clips. 
Instead of taking some-ammo-clips:
	if the player is carrying at least three ammo clips:
		say "You have enough ammunition already." instead;
	otherwise:
		let the clips taken be three minus the number of ammo clips carried by the player;
		say "[Clips taken in words] clips: Taken.";
		repeat with i running from 1 to clips taken:
			let c be a random ammo clip in the ammo-temp-storage;
			now c is in the ammo crate;
			silently try taking c.

Some racks are a fixed in place supporter in the armory.
Understand "bare" or "metal" or "shelf" or "rack" as the racks. Understand "shelves" or "racks" as the plural of racks.
A rifle is a gun on the racks. The description is "A rifle of shwabolian design as you've seen on the battlefield often enough."
Instead of attacking the racks:
	say "You pull apart the frame of the shelf, giving you a piece of metal with a rather sharp edge.";
	now all things that are on the racks are in the location;
	now the racks are nowhere;
	now the player has the makeshift knife;
	rule succeeds.

The makeshift knife is a thing. The description is "A piece of metal you pulled out of the shelves in the armory. It happens to have a rather sharp edge."
Understand "make-shift" or "dagger" or "metal" or "frame" as the makeshift knife.

Section 3 - Nerve Center

The briefing room is east of the lobby. "Write me."

The ops center is north of the lobby. "This appears to be the nerve center of the operation [dash] whatever that may be. The walls are lined with screens and control surfaces, but most of them seem to be inactive."

The larger alien and the smaller alien are shwabolians in the ops center.
The description of the larger alien's corpse is "A well and truly dead shwabolian. [if closed]Blood is pooling around him from where your bullets hit their mark[otherwise]He is looking a bit worse for wear after you extracted the data crypt from inside him[end if]."

[I expect this will probably be the most controversial part of the game.
This wasn't really planned from the start, but I needed some puzzles and my brain basically went: "Why don't we do this, here's the text for it!" -- and that was the only idea I was going to get.]
Cutting it with is an action applying to two touchable things and requiring light.
Understand "cut up/-- [something] open/-- with/using [something preferably held]" as cutting it with.
Understand "dissect [something] with/using [something preferably held]" as cutting it with.
Understand "autopsy [something] with/using [something preferably held]" as cutting it with.
Understand "slice [something] open/-- with/using [something preferably held]" as cutting it with.
To cut is a verb.
Understand "stomach" or "belly" or "abdomen" as the larger alien's corpse.
The larger alien's corpse can be open[ or closed. The larger alien's corpse is closed].
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
		say "You double-check inside the creature's mouth, but no dice. With a sigh, you kneel down in the puddle of blood now surrounding the body. You carefully postion [the second noun], plunging it deep into the dead creature's abdominal area; guts, blood, and other bodily fluids spilling out and onto your armored legs as you cut.[line break]With the incision complete, you take a second to steel yourself before reaching into the abdominal cavity. After a minute or so of fishing around in the bloody soup, you find the object of your desire: a small data crypt, which the creature swallowed when you came into the room. It appears to be undamaged.[paragraph break]You feel like throwing up.";
	otherwise:
		say "In a process that defies any description, you retrieve the object of your desire: a small data crypt which the creature swallowed when you came into the room. It appears to be undamaged.";
	now the player has the data crypt;
	take 10 minutes;
	rule succeeds.

Check eating when the larger alien's corpse is open:
	say "After what you did, you don't think you could stomach anything." instead.

Check cutting something with something that is not the makeshift knife:
	say "[The second noun] [cannot cut] anything." instead.
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
Understand "retrieve [something] from [something]" or "extract [something] from [something]" as retrieving it from.
Instead of retrieving the data crypt from the larger alien's corpse:
	if the data crypt is not in the larger alien's corpse:
		say "You already have [the data crypt].";
		stop the action;
	if gore is allowed:
		if the player does not have the makeshift knife, say "You'll need some kind of tool to do that." instead;
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
Check retrieving something from something:
	try removing the noun from the second noun instead.

Report going to the ops center for the first time (this is the alien swallows key rule):
	say "As you enter the room, [the larger alien] hastily pulls a small device out of the control panel and swallows it. Then, the two reach for their weapons!".
The alien swallows key rule is listed last in the report going rules.

A data crypt is a thing. The description is "A small storage device you salvaged from [if gore is allowed]the innards of [end if]one of your captors."
Understand "small/-- swallowed/eaten object/thing/device" or "small/-- object/thing/device swallowed/eaten by the/-- large/larger/-- alien/shwabolian/lizard" or "small" or "device" as the data crypt.

[What I want to do after writing the above.]
Vomiting is an action applying to nothing.
Understand "vomit" or "throw up" or "puke" or "hurl" or "retch" or "ralph" or "barf" as vomiting when gore is allowed.
Check vomiting when the larger alien's corpse is not open:
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
Understand "vomitus" or "eject" or "former/-- contents of/-- your/my stomach/belly" as the vomit.
Instead of taking the vomit, say "How, by scooping it up in your hands? You'd rather not."

Test alien with "pull grate / crawl through duct / out / turn off maglock / up / take helmet / look under desk / s / e / e / take plates / w / open airlock / n / e / turn on helmet light / enter water / n / n / n / n / n / unlock door with card / n / w / take rifle and ammo / break rack / e / n / n / shoot larger with rifle / shoot smaller with rifle / cut larger corpse with knife / x me / x armor / x data crypt / throw up".

Chapter 5 - The Barracks

[This area doesn't really do anything useful, but it would be a bit weird if it were absent.]

The mess hall is west of the military complex plaza.

Some plain white tables are scenery in the mess hall.

The barracks are west of the mess hall.

Some bunks are in the barracks. "Four stacked bunk beds are lined up on the walls." They are fixed in place.
The description is "The non-folding, stacked version of the cot you spent the past weeks on, perhaps. From the looks of them, these bunks are only marginally more comfortable than what you had to sleep on."

The communal washroom is south of the barracks. "This would be the place where the garrison force (if one can call it that, given the size of the facility) takes care of personal hygiene. It is a sterile-looking room, white tiles covering the floor and the walls all the way up to the ceiling. Four sinks and mirrors are installed on one wall, four toilets on another, the remaining two have two showers each. It doesn't seem like the shwabolians care a whole lot about privacy, seeing as there are no dividers of any kind in the room.[line break]The only way out is north, back to the barracks."

Some toilets are scenery in the washroom.
Some sinks are scenery in the washroom.
Some mirrors are scenery in the washroom.
Instead of examining the mirrors, try examining yourself.
Some showers are scenery in the washroom.

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

To say wash-grime:
	if gore is allowed, say "blood";
	otherwise say "slime".

Chapter 6 - Hangar and Launch

Section 1 - The Hangar

The hangar is a room. "Write me."

The launch doors are a door. They are north of the hangar and south of the landing strip. They are closed.
Instead of opening or closing the launch doors, say "These doors appear to be operated remotely."

Section 2 - The Launch Pad

The landing strip is an outdoor room. "Write me."

Section 3 - The Launch Control Room

The control tower is up from the hangar. "Write me."

The large window is in the tower. It is fixed in place. "A large window overlooks the landing pad outside."

The air traffic control desk is in the control tower. "A large desk festooned with screens and buttons is mounted below the window." It is fixed in place.
The description is "This desk must be the place from which most of the air traffic going into and out of this place is controlled. It is festooned with screens, buttons, and switches, but three elements stick out: a switch labeled [switch-label of the force field switch], one labeled [switch-label of the launch doors switch], and a large red button."
Understand "screen" or "screens" or "buttons" or "switches" or "air-traffic" or "air-traffic-control" as the control desk.

The force field switch is an obfuscated switch. It is part of the control desk.
The real-label is "FORCE FIELD". The obf-label is "SBEPR SVRYQ".
Understand "forcefield" or "sbepr" or "svryq" or "sbeprsvryq" as the force field switch.
Carry out switching off the force field switch: now the force field is disabled.
Carry out switching on the force field switch: now the force field is enabled.

The launch doors switch is an obfuscated switch. It is part of the control desk.
The real-label is "LAUNCH DOORS". The obf-label is "YNHAPU QBBEF".
Understand "launchdoors" or "ynhapu" or "qbbef" or "ynhapuqbbef" as the launch doors switch.
Carry out switching off the launch doors switch:
	now the launch doors are open.
Report switching off the launch doors switch:
	say "You flip the switch, and the large doors separating the hangar from the launch pad slide open."
Carry out switching on the launch doors switch:
	now the launch doors are closed.
Report switching on the launch doors switch:
	say "You flip the switch, and the large doors separating the hangar from the launch pad slide shut."

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
After printing the name of the messenger ship, omit contents in listing.
The ship can be started. The ship is not started.

The notch is a scenery container in the messenger ship. The description is "[if the data crypt is not in the notch]A notch in one of the control panels, ready to accept something[otherwise]The data crypts rests in its place in the control panel[end if]."
Understand "recess" or "control" or "panel" or "aussparung" [;-)] as the notch.

The canopy is part of the messenger ship. The description is "A sort of glass dome covering the cockpit, allowing the pilot to look in all directions."
Understand "glass" or "dome" as the canopy.
Instead of looking through the canopy when the player is in the messenger ship:
	try looking;
	take 15 seconds in total;
	rule succeeds.

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
	say "The ship doesn't seem to want to power up.".
Carry out starting the messenger ship:
	now the messenger ship is started;
	take three minutes.
Report starting the messenger ship:
	say "You press the button that your suit indicates as being the main switch for the ship [dash] luckily, earth scientists were able to get their hands on a similar model of Shwabolian ship, so your suit is able to guide you through most of the pre-flight checks.[paragraph break]One by one, the systems of the messenger ship come alive around you. The ship is now ready for launch."

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
	say "You fire up the engines and take off..."; [TODO]
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

Planetary orbit is a vacuum room.
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
Understand "go [home-desc]" or "return [home-desc]" or "travel [home-desc]" as home-going.
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
	end the story finally saying "You have returned home".

Instead of going when the location is the planetary orbit, say "[We] don't really have anywhere to go in normal space."

Book 4 - Debug Commands - Not for Release

Air-draining is an action out of world and applying to nothing. Understand "air-drain" as air-draining.
Carry out air-draining:
	now the air of the armor is 10;
	say "[bracket]Drained.[close bracket][paragraph break]".

After reading a command (this is the ignore beta-comments rule):
	if the player's command matches the regular expression "^\p":
		say "(Noted.)";
		reject the player's command.

[From Example 388]
Waiting more is an action applying to one number.

Understand "wait [a time period]" or "wait for [a time period]" or "wait for a/an [a time period]" or "wait a/an [a time period]" as waiting more.

Carry out waiting more:
	let the target time be the time of day plus the time understood;
	decrease the target time by one minute;
	while the time of day is not the target time:
		take 60 seconds in total;
		follow the turn sequence rules.

[The one nuance here is that after our wait command occurs, the turn sequence rules will occur one more time. So we need to subtract one minute from the parsed time to make the turn end on the desired number of minutes.]

Report waiting more:
	say "It is now [time of day + 1 minute]."

[And if we want to ensure that the player doesn't (accidentally or intentionally) put the interpreter through a really long loop, we could put an upper limit on his patience:]

Check waiting more:
	if the time understood is greater than one hour, say "You really haven't got that kind of patience." instead.
