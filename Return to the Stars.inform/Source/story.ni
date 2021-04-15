"Return to the Stars" by Adrian Welcker

The story genre is "Science Fiction". The story headline is "An Interactive Escape".

Release along with a website, an interpreter, and the source text.

Book 1 - Preamble

Use american dialect and the serial comma.

Include Basic Screen Effects by Emily Short.

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

Requesting credits is an action out of world applying to nothing.
Understand "credits" or "about" as requesting credits.

Carry out requesting credits:
	say the banner text;
	say "[line break]Built using the following extensions:[line break][complete list of extension credits][line break]";
	say the playtesters.

To say the playtesters:
	say "[bold type]Playtesters[roman type]: none yet...".

Table of Final Question Options (continued)
final question wording	only if victorious	topic	final response rule	final response activity
"read some author's NOTES about this story"	true	"author/author's/-- note/notes"	author's notes rule	--

This is the author's notes rule:
	say "Thank you for playing 'Return to the Stars'![paragraph break]The general premise of needing to escape from captivity on an alien world occurred to me in early 2018, but as things often go in life, I was busy with other projects, so the idea was set aside and mostly forgotten about. The announcement of ParserComp 2021 brought the concept back to my mind, I reduced the scope somewhat, and in April [']21 I finally sat down and started working on the implementation in earnest [dash] partially out of sheer boredom, some five months into Germany's second COVID lockdown. Its release marks the first time I actually finish and publish a piece of IF.[paragraph break]With the minor history lesson out of the way, it is time for some acknowledgements. While it is often said in writing circles that 'everything has been done before', and that it's all about the individual author's take on a certain concept, I think it is only fair for me to acknowledge the major source of inspiration for 'Return': Marko Kloos['] [italic type]Frontlines[roman type] novel series. (And probably half a dozen others, subconsciously, but that's usually the one that comes to my mind when I think 'military SF'. I highly recommend it.) As such, the appearance of certain names or phrases, such as [italic type]space-borne infantry[roman type], is no coincidence. (Rest assured, however, that this is not just a barely-concealed fanficion.)".

Book 2 - Mechanics

The carrying capacity of the player is three.

The description of the player is "[if the player is wearing the armor and the armor is clean]In [our] armored suit [we] almost look soldierly again[otherwise if the player is wearing the armor and the armor is muddy]Covered in a generous amount of ocean mud [dash] [we] [haven't] looked this bad since bootcamp, probably. [We]['re] not sure whether [we] look particularly fierce or particularly ridiculous[otherwise][We]['ve] seen better days[end if]."

Chapter 1 - Time

[Time is a somewhat important concept in this story, so we give it a little extra attention.]
The work duration is a number that varies.
The work duration variable translates into I6 as "time_rate".[* Reusing the existing I6-level variable for how many minutes should pass each turn, which is applied by the "Advance Time Rule". This is usually just set to 1 throughout the course of the game: I7 doesn't normally touch it.]

The time allotment rules are a rulebook producing a number.

The last time allotment rule (this is the default time rule): rule succeeds with result 1.

Every turn (this is the apply action-specific time rule):
	let the work duration be the number produced by the time allotment rules;[* we could just as well have written each time allotment rule to set 'work duration' directly, but this feels better]
	follow the air supply rules for the location.

Chapter 2 - Armor, Air, and Toxicity

Section 1 - Armor

The player has a number called the air. The air of the player is 5.
The armor has a number called the air. The air of the armor is 100.
The armor is wearable and proper-named. The printed name is "[our] armor". Understand "your/my/-- battle/combat/-- armor/armour/rattle" or "your/my/-- suit/set of/-- battle/combat/-- armor/armour" as the armor.
The armor can be muddy or clean. The armor is clean.
The description of the armor is "It is sometimes said that a soldier's best friend is his weapon [dash] but that hasn't really been true in a while now, with weapons being issued and turned in as needed. Your armor, however, has traveled to many a world with you, and saved your hide more than once. You're glad to have it back.[line break]It is fitted with a helmet lamp and a carrying pack, and it can double as a space suit, providing air in hostile environments.[if the armor is muddy][paragraph break]It will need a good cleaning after being dragged across the bottom of the ocean, but it still seems to be working fine.[end if]".

The pack is a part of the armor. It is a player's holdall. The carrying capacity of the player is 3.

[There is little point to the character lugging around the pieces of the armor, so we disallow explicit takes and skip the implicit one when wearing it.]
The carrying requirements rule does nothing when the current action is Wearing and the noun is the armor. The can't wear what's not held rule does nothing when the noun is the armor.
Instead of taking the armor when the implicitly taking activity is not going on:
	say "You should probably put on the armor, rather than lugging it around in pieces."

Report wearing the armor for the first time:
	say "You slip into the undersuit and latch the armored plates into place. As you slide on your helmet, the internal systems start up, informing that everything is still in working order."; [TODO]
	rule succeeds.

[Likewise, immediately deposit the armor on the ground when taking it off.]
After taking off the armor:
	silently try dropping the armor;
	say "You take off the armor, setting the pieces down on the ground in front of you."
	
After wearing the armor (this is the take a deep breath rule):
	decrease the air of the armor by (5 minus the air of the player);
	now the air of the player is 5;
	continue the action.

There is a device called the helmet lamp.[* This somewhat stilted syntax is the only way we can force Inform to create "the helmet lamp" and (later on) "a helmet" as separate things. By default, Inform would assume that "helmet" is merely a shorthand form of "helmet lamp" and treat them as one object -- causing errors, because they aren't, of course.] It is part of the armor.
Understand "helmet/-- lamp/light" as the helmet lamp.
Carry out switching on the helmet lamp: now the helmet lamp is lit.
Carry out switching off the helmet lamp: now the helmet lamp is not lit.

[With the armor's air supply and filtration system active, we don't smell much.]
Check smelling when the player is wearing the armor and the location is not breathable:
	say "With the armor's air supply system now active, you smell absolutely nothing at all." instead.

[Conversely...]
Check smelling when the player is wearing the armor and the location is breathable and the armor is muddy:
	say "You have a hard time smelling anything but the rancid fish smell emanating from the mud on your armor." instead.

Instead of smelling the armor when the player is not wearing the armor and the armor is muddy, say "It smells like old fish.".

[The following is gleaned from Michael J. Robert's "Return to Ditch Day":]
Instead of rubbing the armor when the armor is muddy, say "You try to wipe the mud off, but all you really accomplish is smearing it around."

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
		if the air of the player is five, say "The alarm grows more urgent as your suit's air reserve is now empty. As you take a final deep breath, you know that you have mere minutes left before you suffocate.";
		decrease the air of the player by d.

An air supply rule for a room that is not breathable when the player is not wearing the armor:
	decrease the air of the player by the work duration.

An air supply rule for a breathable room (this is the air replenishment rule):
	now the air of the player is five;
	if the player is wearing the armor:
		if the air of the armor is less than 100, increase the air of the armor by five times the work duration;
		if the air of the armor is greater than 100, now the air of the armor is 100.

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

[Give the player an explicit nudge when they venture outside without protection]
After going to a toxic room for at least the second time:
	if the player is not wearing the armor, say "Your headache quickly returns as you venture outside again";
	continue the action.

Section 3 - Status Bar

Table of HUD status
left	central (a text)	right
"[location]"	--	"[time of day as military time]"
"[hud-environ-status]"	--	"[hud-air]"

Table of plain status
left	central (a text)	right
"[location]"	--	"[plain-air]"

Rule for constructing the status line when the player is wearing the armor:
	fill status bar with the Table of HUD status;
	rule succeeds.
Rule for constructing the status line when the player is not wearing the armor:
	fill status bar with the Table of plain status;
	rule succeeds.

To say hud-air:
	[if the air of the armor is than 100 and the location is toxic:]
	if the air of the armor is 100 or (the location is not toxic and the location is not submerged), stop;
	if the air of the armor is greater than five:
		say "Air: [air of the armor] min";
	otherwise if the air of the armor is greater than zero:
		say "AIR: [air of the armor] MIN";
	otherwise:
		say "OUT OF AIR".

To say plain-air:
	if the location is not breathable, say "NO AIR".

To say hud-environ-status:
	if the location is toxic:
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

Chapter 3 - Dummy Objects for saying

[I hadn't decided on a name for the alien faction early on, so I created this dummy object and used a [the aliens] text substitution wherever I wanted to mention them in the story. Once I picked a name, I simply set the printed name of this object.]
Some aliens are a person. The printed name is "shwabolians". [Or something like that ???]

Chapter 4 - Concepts Can Be Known

A concept is a kind of value.

Knowledge relates one person to various concepts.
The verb to know means the knowledge relation.

The access codes are a concept.

Chapter 5 - Grates and Air Ducts

An air duct is a kind of fixed in place closed enterable transparent scenery container. An air duct is always improper-named.

A grate is a kind of thing. A grate is part of every air duct. A grate is always improper-named. The indefinite article of a grate is usually "the".
Understand "flimsy/rusty/old/-- grate/grid/grating/bars" as a grate.

Understand the command "kick" or "bash" as "attack".
To kick is a verb.

The block attacking rule does nothing when the noun is a grate.
Does the player mean attacking a grate when the player is in an air duct: it is likely.

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

Crawling into is an action applying to one touchable thing. Understand "crawl through/into/up/down/-- [an air duct]" as crawling into. Understand "crawl" as crawling into.
To crawl is a verb.

Rule for supplying a missing noun while crawling into:
	if the holder of the player is an air duct, now the noun is the holder of the player;
	say "(through the air duct)[command clarification break]".

Check an actor crawling into a closed air duct (called the conduit) when the player is not in the conduit (this is the can't crawl through grates rule):
	instead say "The grate is in the way."

Check an actor crawling into something that is not an air duct (this is the default block crawling rule):
	instead say "[The actor] [can't] crawl through [regarding the noun][them]."

Carry out an actor crawling into an air duct (this is the travel through air ducts rule):
	let the target be the other end of the noun;
	if the actor is the player, say "[We] [crawl] through the ducts, air rushing past [our] face." (A);
	if the target is open, now the actor is in the holder of the target;
	otherwise now the actor is in the target.

Report an actor crawling into an air duct (this is the report air duct travel rule):
	if the actor is not the player, say "[The actor] [crawl] out of sight." (A)

Understand "climb in/into [something]" as climbing.
Instead of climbing an air duct, try entering the noun.

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
Understand "look through [something]" as looking through.
Understand the command "l" as "look".

Check looking through a transparent container (this is the convert looking through transparent containers to searching rule):
	try searching the noun instead.

Carry out looking through something when the other-side-description of the noun is empty (this is the opaque looking through rule):
	say "[We] [can't] [see] through [the noun]."

Carry out looking through (this is the standard looking through rule):
	say "[the other-side-description of the noun][paragraph break]".

Chapter 8 - Ranged Weapons

[I am as of yet unsure whether this will ever be used.]

A gun is a kind of thing. An ammo clip is a kind of thing. An ammo clip has a number called the bullet count. The bullet count of an ammo clip is usually 30.

Definition: a thing is ungunlike if it is not a gun.
Definition: an ammo clip is empty rather than non-empty if its bullet count is less than one.

Shooting it with is an action applying to one touchable thing and one visible thing.
Understand "shoot [something ungunlike] with [a gun]" as shooting it with.
Understand "shoot [something] with [something]" as shooting it with.
Understand "shoot [something] at [something]" as shooting it with (with nouns reversed).
Understand "fire [something] at [something]" as shooting it with (with nouns reversed).
Understand "fire at [something] with [something]" as shooting it with.
Understand "fire at [something ungunlike] with [a gun]" as shooting it with.
The shooting it with action has an object called the clip shot from.

To shoot is a verb. To fire is a verb. To discard is a verb.

A wreckage is a kind of thing.
Wrecking relates one wreckage (called the remains) to one thing.
The verb to be the original of means the wrecking relation.
The verb to be the remains of means the reversed wrecking relation.

Setting action variables for an actor shooting something with something:
	let cnt be 30;
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
	now the remains of the target is in the holder of the target;
	now the target is nowhere;
	if the clip shot from is empty, now the clip shot from is nowhere.

Report an actor shooting something (called the target) with a gun (called the weapon) (this is the default report shooting rule):
	if the actor is the player:
		say "[We] [fire] a three-shot burst from [the weapon] at [the target], utterly destroying [them]." (A);
		if the clip shot from is empty, say "[We] [discard] the expended ammo clip." (B);
	otherwise:
		say "[The actor] [fire] at [the target]." (C)

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

Instead of entering a room-floor when the holder of the player is not the location, try exiting.
Instead of entering a room-floor when the holder of the player is the location, say "But [we] [are] already firmly standing on the ground."

Book 3 - Locations

Chapter 1 - Cell Complex and Prison Island

Test prison with "x me / i / smell / look through door / get on cot / get up / pull grate / enter duct / crawl / kick grate / out / switch doors off / up / x helmet / take helmet / s / e / e / x plates / take plates / x armor / x me / i / w / open airlock / n / smell / e / jump / u / x down / x up / take silt / w / n / n / n / n / x me / x armor".

Cell-complex is a region. Your cell, the corridor, the control room, the front office, the storage space, and the prison installations room are in cell-complex.

The silence is a backdrop in cell-complex.
Instead of doing something other than listening to the silence, say "The absence of sound is, of course, intangible."
Instead of listening to the location when the silence is in the location, try listening to the silence.
Instead of listening to the silence:
	say "It has been eerily quiet for a few days now. Gone are the footsteps, the occasional shouting, the idle chit-chat of the guards. Now you hear nothing but the faint noise of the ventilation system."

Section 1 - Main Parts

[We've spent A LOT of time in this room, so describe it in excruciating detail.]
Your cell is a room. "This is the room you have spent most of your time in, ever since being taken captive. To be honest, you've kind of lost track of how long that has been. [A cot] stands in one corner of the room. An air duct covered by an old grate is mounted in the wall near the cot[if the ventilation switch is switched on], exuding a constant stream of cool, fresh air (and the occasional drop of condensation, which falls to the ground with an annoyingly loud [italic type]plink[roman type])[end if]. [A sanitary station] [dash] a sort of hybrid toilet-shower-sink [dash] is built into a corner of the room. [if the metal door is closed][A metal door] lies to the north, keeping you securely in the cell.[otherwise][The metal door] northward is open, leading to a corridor.[end if]"

An air duct called cell air duct is in your cell.
Check attacking the cell air duct's grate when the noun is part of something:
	instead say "It's too far up to throw a good punch at the grate."
The description of the cell air duct's grate is "A rather flimsy, rusty grate covering the air duct. It looks like you could break it if you tried hard enough."

The metal door is north of your cell and south of the corridor. It is an openable closed lockable locked door.
The other-side-description is "[We] peek through the small duraplast window into the corridor outside. It is empty."

The cot is a fixed in place enterable supporter in your cell. "A cot stands in one corner of the room." The description is "Flimsy frame, uncomfortable plastic surface [dash] it's a cot alright."
Understand "bed" or "cot" or "bunk" or "rack" or "sack" as the cot.
After printing the name of the cot, omit contents in listing.

Some bedsheets are on the cot. "On the cot are some neatly folded bedsheets." The description is "Plain white bedsheets. Thin, scratchy, and not quite warm enough to keep you comfortable. It seems like all expenses were spared here.[unless the bedsheets are handled]Your military discipline dictates that you neatly fold the bedsheets when you get up in the morning.[end if]"

The sanitary station is an enterable container in the cell. "A sanitary station [dash] a sort of hybrid toilet-shower-sink [dash] is built into a corner of the room." The description is "A brushed aluminum clamshell contraption for personal hygiene, not unlike showers you've used on some UNDC ships."
After printing the name of the sanitary station, omit contents in listing. 

[And here is our first custom room part.]
The cell floor is a room-floor. The description is "The floor has a grey, rubbery non-slip surface." Understand "grey/-- rubber/rubbery/rubberized/rubberised/plastic/-- cell/-- floor" as the cell floor.
The room-floor-prop of your cell is the cell floor.

The corridor is a room. "Write me."

West of the corridor is south of the control room. Index map with control room mapped northwest of corridor.
The control room is a room. "Write me."

A table is a scenery supporter in the control room.
On the table is a thing called a helmet. "Your[if we have examined the plates] missing[end if] helmet is sitting on a table in the middle of the room, with a number of wires attached to it."
Instead of wearing the helmet, say "Since the power and air supply are located in the torso pieces of the suit, wearing the helmet alone isn't terribly useful."
Before taking the helmet for the first time, say "You carefully disconnect the wires that connect the helmet to the computer systems in the room. Hopefully, [the aliens] haven't messed anything up."

East of the corridor is south of the front office. Index map with front office mapped northeast of corridor.

The airlock is a door. "[airlock-desc]". The airlock is north of the front office and south of the prison antecourt.

To say airlock-desc:
	if the player is in the front office, say "The way out of the building, to the north, leads through [if the player has not been in the military complex plaza]what appears to be [end if]an airlock.";
	otherwise say "The airlock leading into the cell complex lies to the south."
	
Report going through the airlock for the first time:
	say "You open the inner door and step into the intermediate space. [if the player is wearing the armor]Nothing obvious happens, but your suit alerts you that the air coming in from the outside is, shall we say, less than ideal[otherwise]As the clean air inside the airlock is replaced with the outside atmosphere, you quickly develop a searing headache -- you won't last long under these conditions[end if].[line break]The other door opens and you take a tentative step outside.".
	
Section 2 - The Storage Area

The storage space is east of the front office. "Write me."

Some shelves are a scenery supporter in the storage space. Understand "shelf/shelves/rack/racks" as the shelves.
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
	try wearing the armor instead.

Section 3 - Basement

The prison installations room is down from the control room. "This is where most of the installations and appliances keeping the cell complex running reside. [if the ventilation switch is switched on]A stiff breeze blows through this room, from the large machine on one wall, to the air ducts on the opposite wall. [end if]A ladder leads up[if bottom of the air duct is open], the air duct to your cell is on the northern wall[end if]."

An air duct called bottom of the air duct is in the prison installations room. It connects to the cell air duct.

some-air-ducts is scenery in the prison installations room. It is privately-named. The description of some-air-ducts is "They presumably lead to different rooms within the facility." The printed name is "some air ducts". Understand "air/-- ducts" as some-air-ducts.
Instead of doing something other than examining to some-air-ducts, say "They're not labeled, and you'd rather not wander through the airducts aimlessly."

A ladder is scenery in the installations room. Instead of climbing the ladder, try going up.

A switch is a kind of device. A switch is usually switched on.
Check turning a switch:
	if the noun is switched on, try switching off the noun instead;
	otherwise try switching on the noun instead.

The switch panel is in the installations room. "On one of the walls is a panel with a number of large switches on it." It is fixed in place. The description is "A number of large rotary switches are attached to this panel. One is labeled 'LIGHTS', the next 'VENTILATION', a third 'DOORS', and one is labeled 'CONTROLS'".

The lights switch is part of the switch panel. It is a switch. The description is "A large rotary switch labeled 'LIGHTS'." Understand "light" as the lights switch.
The ventilation switch is part of the panel. It is a switch. The description is "A large rotary switch labeled 'VENTILATION'."
The doors switch is part of the panel. It is a switch. The description is "A large rotary switch labeled 'DOORS'."
The controls switch is part of the panel. It is a switch. The description is "A large rotary switch labeled 'CONTROLS'."

Carry out switching off the lights switch:
	now all rooms in cell-complex are dark.
Carry out switching on the lights switch:
	now all rooms in cell-complex are lit.

Rule for printing the description of a dark room when the location is the installations room:
	say "It is pitch dark, save for a small light next to the lights switch beckoning you to switch the lights back on."

After deciding the scope of the player while in darkness and the location is the installations room:
	place the lights switch in scope.

Section 4 - The Antecourt

Prison antecourt is an outdoor room. "Write me."

Section 5 - The Dock

The prison docks are an outdoor room. They are east of the prison antecourt. "Write me."

The water is an enterable scenery container in the prison docks.

Instead of entering the water when the player is wearing the armor, try going down.

Understand "jump in/into [something]" as entering when the location is the prison docks.
Does the player mean entering something that is not a container: it is unlikely.
Does the player mean entering the water: it is likely.

Instead of jumping when the location is the prison docks:
	say "(in the water)[command clarification break]";
	try entering the water.

Instead of entering the water when the player is not wearing the armor, say "And swim all the way to shore? You'd never make it in time before the atmosphere here got the better of you."

Chapter 2 - Underwater

A sea-room is a kind of room. The description of a sea-room is "You are standing knee-deep in the silt at the bottom of the ocean. The military complex is due north." A sea-room is usually dark. The printed name is usually "at the bottom of the ocean". A sea-room is always submerged. The room-top-prop of a sea-room is usually nothing. The room-floor-prop of a sea-room is usually nothing. The walls of a sea-room are usually {}.

The sea-region is a region. Seabottom-1, seabottom-2, seabottom-3, and seabottom-4 are in the sea-region.

Instead of going nowhere when the location is in the sea-region, say "Best not to wander around, lest you'll never find your way again."

The sea is a backdrop in the sea-region. The description is "There are about ten meter's worth of sea water above you. As you exhale, you can see the bubbles of your breath rising to the surface." Understand "ocean" or "sea" or "water" or "air/-- bubble/bubbles" as the sea.
Instead of examining up when the location is in the sea-region, try examining the sea.

The ocean floor is a backdrop in the sea-region. The description is "Silt has accumulated in the calmer waters between the shore and the prison island, enough to seriously hamper your movement down here." Understand "sea/ocean/-- bottom/floor/silt" as the ocean floor.
Instead of taking the ocean floor, say "You scoop up a handful of silt, but it quickly runs through your fingers."
Instead of examining down when the location is in the sea-region, try examining the ocean floor.

Instead of entering the ocean floor: say "You'd feel a bit silly lying in the silt."

Instead of going up in the sea-region, say "While your armor's power assist usually keeps you from noticing its 50-or-so kilograms of heft, getting to the surface of the ocean would require a propeller of sorts, which is not provided."

Instead of going up in seabottom-4, try going north.

seabottom-1 is a sea-room. It is down from the prison docks. "You are standing knee-deep in the silt at the bottom of the ocean. The rocky cliffs of the prison island lie to the south, the military complex is due north."

Before going down to seabottom-1 for the first time:
	say "While your armor is designed primarily for planetary and shipboard operations, it can also double as a space suit and diving equipment in a pinch (or so the manufacturer promises). While you had more chances than you'd care for to verify that is does make for a passable spacesuit, it may finally be time to put the 'diving' part of that claim to the test.[line break]You jump into the water, spreading your your arms and legs to slow your descent..."; [blatantly ignoring the potential issue of barotrauma, but whatever]
	[pause the game; [for dramatic effect only]]
	say "About ten seconds later, you come to an abrupt halt as you land faceplate-first in the silt at the bottom of the sea.[line break]You scramble to your feet, wiping the muck off your faceplate. You can still breathe, and none of the electronics in your suit seem to have been fried [dash] so far, so good."

The rocky cliffs are scenery in seabottom-1. "These cliffs are what the prison is built on top of." Understand "rocks" as the cliffs.
Instead of climbing the rocky cliffs:
	say "You climb up the cliffs[run paragraph on]";
	if a random chance of 1 in 2 succeeds, say ", but lose your purchase on the slippery rock and fall back down to the bottom of the sea.[line break]Luckily, the ground is soft and the water slowed your descent, so you didn't hurt yourself." instead;
	say ".";
	now the player is in the prison docks.
A time allotment rule for climbing the rocky cliffs:
	rule succeeds with result 8.
Instead of going up from seabottom-1 for more than the first time (this is the hint at climbig rule):
	say "While your armor's power assist usually keeps you from noticing its 50-or-so kilograms of heft, getting to the surface of the ocean would require a propeller of sorts, which is not provided.[line break](However, if you really must return, the cliffs look like you might stand a chance at climbing them.)"

seabottom-2 is a sea-room. It is north of seabottom-1.

seabottom-3 is a sea-room. It is north of seabottom-2.

seabottom-4 is a sea-room. It is north of seabottom-3. "You are standing knee-deep in the silt at the bottom of the ocean. The ground is sloping upwards to the north."

Before going north from seabottom-4 for the first time:
	say "You slowly make your way up the muddy incline [dash] half walking, half crawling [dash] until you finally reach dry land again.".
Carry out going north from seabottom-4 (this is the armor dirtying rule):
	now the armor is muddy;
	continue the action.

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
	continue the action.

A time allotment rule for going from a room in the sea-region (this is the walking in the sea takes longer rule):
	rule succeeds with result 5.

Chapter 3 - Military Complex Proper

The shore docks are an outdoor room. They are up from seabottom-4 and north from seabottom-4.

Section 1 - The Plaza

The military complex plaza is an outdoor room. It is north of the shore docks. The command center lock is here.

Section 2 - The Armory

The armory is west of the plaza. It is toxic.
The assault rifle is a gun in the armory.
In the armory are three ammo clips.

Chapter 4 - The Command Center

A room called the command center is north of the plaza.

Chapter 5 - The Hangar

The hangar is east of the plaza.

Chapter 6 - The Launch Pad

Section 1 - The Launch Pad

The landing strip is north of the hangar. It is an outdoor room.

Section 2 - The Launch Control Room

The control tower is up from the hangar.

The large window is in the tower. It is fixed in place. "A large window overlooks the landing pad outside."

Chapter 7 - Space
