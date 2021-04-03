"Return to the Stars" by Adrian Welcker

The story genre is "Science Fiction". The story headline is "An Interactive Escape".

Use american dialect and the serial comma.

Include Basic Screen Effects by Emily Short.

Release along with a website, an interpreter, and the source text.

To decide whether unicode is available:
	(- unicode_gestalt_ok -)

To say dash:
	if unicode is available, say unicode 8211;
	otherwise say "--".

Book 1 - Mechanics

The carrying capacity of the player is three.

The description of the player is "[if the player is wearing the armor]In [our] armored suit [we] almost look soldierly again[otherwise][We]['ve] seen better days[end if]."

Chapter 1 - Armor, Air, and Toxicity

Section 1 - Armor

The player has a number called the air. The air of the player is 5.
The armor has a number called the air. The air of the armor is 100. The armor is wearable and proper-named. The printed name is "[our] armor". Understand "your/my/-- battle/combat-- armor/armour/rattle" or "your/my/-- suit/set of/-- battle/combat/-- armor/armour" as the armor.
The pack is a part of the armor. It is a player's holdall. The carrying capacity of the player is 3.

[There is little point to the character lugging around the pieces of the armor, so we disallow explicit takes and skip the implicit one when wearing it.]
The carrying requirements rule does nothing when the current action is Wearing and the noun is the armor. The can't wear what's not held rule does nothing when the noun is the armor.
Instead of taking the armor when the implicitly taking activity is not going on:
	say "You should probably put on the armor, rather than lugging it around in pieces."

Report wearing the armor for the first time:
	say "You slip into the undersuit and latch the armored plates into place. As you slide on your helmet, the internal systems boot up, informing that everything is still in working order."; [TODO]
	rule succeeds.

[Likewise, immediately deposit the armor on the ground when taking it off.]
After taking off the armor:
	silently try dropping the armor;
	say "You take off the armor, setting the pieces down on the ground in front of you."
	
After wearing the armor (this is the take a deep breath rule):
	decrease the air of the armor by (5 minus the air of the player);
	now the air of the player is 5;
	continue the action.
	
Section 2 - Toxicity, Vacuum

[Here we lay out what happens when the player ventures into a hostile environment without adequate protection.]

A room can be toxic, vacuum, or breathable. A room is usually breathable.

Every turn when the location is toxic (this is the toxic air draining rule):
	if the air of the player is zero:
		say "Without the protection of your suit[if the player is wearing the armor][']s filters[end if], you succumb to the toxic atmosphere of this wholly hostile world.";
		end the story saying "You have died";
	if the player is wearing the armor and the air of the armor is greater than zero:
		if the air of the armor is five:
			say "Your suit sounds an alarm as its air supply is getting close to being depleted.";
		decrease the air of the armor by one;
	otherwise:
		if the air of the player is five and the player is wearing the armor, say "You notice the toxic gases seeping through the filters of your suit. You haven't got much time left.";			
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
	if the player is not wearing the armor, say "The air stings in your lungs as you force each breath in.";
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
		say "High levels of ammonia";
	otherwise if the location is vacuum:
		say "No atmosphere";
	otherwise:
		say "Breathable".

[Twelve-hour AM/PM time is hardly applicable in a military context]
To say (relevant time - a time) as military time:
    let H be the hours part of relevant time;
    let M be the minutes part of relevant time;
    say "[if H is less than 10]0[end if][H][if M is less than 10]0[end if][M]hrs".

Book 2 - Locations

Chapter 1 - Cell Complex

Section 1 - Main Parts

The cell is a room. "This is the room you have spent most of your time in, ever since being taken captive. To be honest, you've kind of lost track of how long that has been. [if the metal door is closed][A metal door] lies to the north, keeping you securely in the cell.[otherwise][The metal door] northward is open, leading to a corridor.[end if]"

The metal door is north of the cell and south of the corridor. It is an openable closed lockable locked door.

The corridor is a room.

West of the corridor is south of the control room. Index map with control room mapped northwest of corridor.
The control room is a room. "Write me."

A table is a scenery supporter in the control room.
The helmet is on the table. "Your[if we have examined the plates] missing[end if] helmet is sitting on a table in the middle of the room, with a number of wires attached to it."
Instead of wearing the helmet, say "Since the power and air supply are located in the torso pieces of the suit, wearing the helmet alone isn't terribly useful."

East of the corridor is south of the front office. Index map with front office mapped northeast of corridor.

The airlock is a door. "[airlock-desc]". The airlock is north of the front office and south of the military complex plaza.

To say airlock-desc:
	if the player is in the front office, say "The way out of the building, to the north, leads through [if the player has not been in the military complex plaza]what appears to be [end if]an airlock.";
	otherwise say "The airlock leading into the cell complex lies to the south."
	
Report going through the airlock for the first time:
	say "You open the inner door and step into the intermediate space. [if the player is wearing the armor]Nothing obvious happens, but your suit alerts you that the air coming in from the outside is, shall we say, less than ideal[otherwise]Every breath starts to sting as the clean air inside the airlock is replaced with the outside atmosphere -- you won't last long under these conditions[end if].[line break]The other door opens and you take a tentative step outside.".
	
Section 2 - The Storage Area

The storage space is east of the front office. "Write me." [The armor is in the storage space.]

Some shelves are a scenery supporter in the storage space. Understand "shelf/shelves/rack/racks" as the shelves.
Some plates are on the shelves. "Pieces of armor plating lie on the shelves." The description is "[We] are fairly sure that these are the pieces of [our] battle armor. They seem to be intact, but an integral part [dash] the helmet [dash] is nowhere to be seen.." The printed name is "armor plates". Understand "armor/armour/armored/armoured/-- plates/plating" as the plates. They are fixed in place.
Instead of taking the plates, say "The're too bulky, and the plates alone won't do you much good."
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

Chapter 2 - The Plaza

The military complex plaza is a toxic room.