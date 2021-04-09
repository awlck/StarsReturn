"Return to the Stars" by Adrian Welcker

The story genre is "Science Fiction". The story headline is "An Interactive Escape".

Use american dialect and the serial comma.

Include Basic Screen Effects by Emily Short.

Release along with a website, an interpreter, and the source text.

[Include (-!% -r
-) before "ICL Commands" in "Output.i6t".]
Use OMIT_UNUSED_ROUTINES of 1.

To decide whether unicode is available:
	(- unicode_gestalt_ok -)

To say dash:
	if unicode is available, say unicode 8211;
	otherwise say "--".

To say CO2:
	if unicode is available, say "CO[unicode 8322]";
	otherwise say "CO2".

Book 1 - Mechanics

The carrying capacity of the player is three.

The description of the player is "[if the player is wearing the armor]In [our] armored suit [we] almost look soldierly again[otherwise][We]['ve] seen better days[end if]."

Chapter 1 - Armor, Air, and Toxicity

Section 1 - Armor

The player has a number called the air. The air of the player is 5.
The armor has a number called the air. The air of the armor is 100. The armor is wearable and proper-named. The printed name is "[our] armor". Understand "your/my/-- battle/combat/-- armor/armour/rattle" or "your/my/-- suit/set of/-- battle/combat/-- armor/armour" as the armor.
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

Section 2 - Toxicity, Vacuum

[Here we lay out what happens when the player ventures into a hostile environment without adequate protection.]

A room can be toxic, vacuum, or breathable. A room is usually breathable.

Every turn when the location is toxic (this is the toxic air draining rule):
	if the air of the player is zero:
		[say "Without the protection of your suit[if the player is wearing the armor][']s filters[end if], you succumb to the toxic atmosphere of this wholly hostile world.";]
		say "Without [unless the player is wearing the armor]the protection of your suit[otherwise]your suit's air supply[end if], you succumb to the toxic atmosphere of this wholly hostile world.";
		end the story saying "You have died";
	if the player is wearing the armor and the air of the armor is greater than zero:
		if the air of the armor is five:
			say "Your suit sounds an alarm as its air supply is getting close to being depleted.";
		decrease the air of the armor by one;
	otherwise:	
		decrease the air of the player by one.

Every turn when the location is vacuum (this is the vacuum air draining rule)[* Similar to the 'toxic' version above, but distinctly different]:
	if the player is not wearing the armor: [die immediately when not wearing the armor at all]
		say "Without a space suit of some description, you quickly perish in the vacuum.";
		end the story saying "You have asphyxiated";
	if the player is wearing the armor and the air of the armor is greater than zero:
		if the air of the armor is five, say "Your suit sounds an alarm as its air supply is getting close to being depleted.";
		decrease the air of the armor by one;
	otherwise if the player is wearing the armor and the air of the armor is zero:
		if the air of the player is five:
			say "The alarm grows more urgent as your suit's air reserve is now empty. As you take a final deep breath, you know that you have mere minutes left before you suffocate.";
		otherwise if the air of the player is zero:
			end the story saying "You have asphyxiated";
			stop;
		decrease the air of the player by one.

Every turn when the location is breathable (this is the air replenishment rule):
	now the air of the player is five;
	if the air of the armor is less than 100, increase the air of the armor by two.

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
	if the air of the armor is 100 or the location is not toxic, stop;
	if the air of the armor is greater than five:
		say "Air: [air of the armor] min";
	otherwise if the air of the armor is greater than zero:
		say "AIR: [air of the armor] MIN";
	otherwise:
		say "OUT OF AIR".

To say plain-air:
	if the location is toxic, say "NO AIR".

To say hud-environ-status:
	if the location is toxic:
		say "High levels of CO2";
	otherwise if the location is vacuum:
		say "No atmosphere";
	otherwise:
		say "Breathable".

[Twelve-hour AM/PM time is hardly applicable in a military context]
To say (relevant time - a time) as military time:
    let H be the hours part of relevant time;
    let M be the minutes part of relevant time;
    say "[if H is less than 10]0[end if][H][if M is less than 10]0[end if][M]hrs".

Chapter 2 - Dummy Objects for saying

[I hadn't decided on a name for the alien faction early on, so I created this dummy object and used a [the aliens] text substitution wherever I wanted to mention them in the story. Once I picked a name, I simply set the printed name of this object.]
Some aliens are a person. The printed name is "shwabolians". [Or something like that ???]

Chapter 3 - Concepts Can Be Known

A concept is a kind of value.

Knowledge relates one person to various concepts.
The verb to know means the knowledge relation.

The access codes are a concept.

Chapter 4 - Grates and Air Ducts

An air duct is a kind of fixed in place closed enterable transparent scenery container. An air duct is always improper-named.

A grate is a kind of thing. A grate is part of every air duct. A grate is always improper-named. The indefinite article of a grate is usually "the".

Understand the command "kick" as "attack".
To kick is a verb.

Check an actor attacking a grate when the noun is part of an air duct (this is the okay to kick in grates rule): rule succeeds.

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
	if the holder of the player is an air duct, now the noun is the holder of the player.

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

Understand "climb into [something]" as climbing.
Instead of climbing an air duct, try entering the noun.

Chapter 5 - Looking Through

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

Chapter 6 - Ranged Weapons

A gun is a kind of thing. An ammo clip is a kind of thing. An ammo clip has a number called the bullet count. The bullet count of an ammo clip is usually 30.

Definition: a thing is ungunlike if it is not a gun.

Shooting it with is an action applying to one touchable thing and one visible thing.
Understand "shoot [something ungunlike] with [a gun]" as shooting it with.
Understand "shoot [something] with [something]" as shooting it with.
Understand "shoot [something] at [something]" as shooting it with (with nouns reversed).
Understand "fire [something] at [something]" as shooting it with (with nouns reversed).
Understand "fire at [something] with [something]" as shooting it with.
Understand "fire at [something ungunlike] with [a gun]" as shooting it with.

Check shooting something with something:
	if the player is not carrying a gun, say "You are pathetically unarmed!" instead;
	if the second noun is not a gun, say "[The second noun] does not fire." instead;
	if the player is not carrying any ammo clips, say "You are all out of ammunition" instead;
	if the noun is the second noun, say "Nice trick if you can do it!" instead;
	if the noun is the player, say "That would be disastrous!" instead;
	if the noun is not the command center lock, say "Needless violence won't get you off this rock any faster. Also, you might still need [the noun] later on." instead.

To decide which number is the ammo-counter of (A - an ammo clip) (this is ammo-counting):
	decide on the bullet count of A.

To decide which number is the sum of (N - number) and (M - number) (this is summing): 
    decide on N + M.

Check shooting something with something when the player is carrying at least one ammo clip:
	let L be the list of ammo clips carried by the player;
	let S be the summing reduction of ammo-counting applied to L;
	if S is zero, say "You are all out of ammunition" instead.

Book 2 - Locations

Chapter 1 - Cell Complex

Cell-complex is a region. The cell, the corridor, the control room, the front office, the storage space, and the prison installations room are in cell-complex.

Section 1 - Main Parts

The cell is a room. "This is the room you have spent most of your time in, ever since being taken captive. To be honest, you've kind of lost track of how long that has been. [if the metal door is closed][A metal door] lies to the north, keeping you securely in the cell.[otherwise][The metal door] northward is open, leading to a corridor.[end if]"

An air duct called cell air duct is in the cell.
Check attacking the grate when the noun is part of something:
	instead say "It's too far up."

The metal door is north of the cell and south of the corridor. It is an openable closed lockable locked door.
The other-side-description is "[We] peek through the small duraplast window into the corridor outside."

The corridor is a room. "Write me."

West of the corridor is south of the control room. Index map with control room mapped northwest of corridor.
The control room is a room. "Write me."

A table is a scenery supporter in the control room.
On the table is a thing called a helmet. "Your[if we have examined the plates] missing[end if] helmet is sitting on a table in the middle of the room, with a number of wires attached to it."
Instead of wearing the helmet, say "Since the power and air supply are located in the torso pieces of the suit, wearing the helmet alone isn't terribly useful."
Before taking the helmet for the first time, say "You carefully disconnect the wires that connect the helmet to the computer systems in the room. Hopefully, [the aliens] haven't messed anything up."

East of the corridor is south of the front office. Index map with front office mapped northeast of corridor.

The airlock is a door. "[airlock-desc]". The airlock is north of the front office and south of the military complex plaza.

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

In the installations room is a scenery thing called some air ducts. The description of some air ducts is "They presumably lead to different rooms within the facility."
Instead of doing something other than examining to some air ducts, say "They're not labeled, and you'd rather not wander through the airducts aimlessly."

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

Chapter 2 - Plaza and Armory

Section 1 - The Plaza

The military complex plaza is a toxic room. The command center lock is here.

Section 2 - The Armory

The armory is west of the plaza. It is toxic.
The assault rifle is a gun in the armory.
In the armory are three ammo clips.

Chapter 3 - The Command Center

A room called the command center is north of the plaza.

Chapter 4 - The Hangar

The hangar is east of the plaza.

Chapter 5 - The Launch Pad

Section 1 - The Launch Pad

The landing strip is north of the hangar.

Section 2 - The Launch Control Room

The control tower is up from the hangar.

The large window is in the tower. It is fixed in place. "A large window overlooks the landing pad outside."

Chapter 6 - Space