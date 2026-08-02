System Shock 2 - Scary Monsters AI Enhancement v1.03
by RoSoDude https://rosodudemods.wordpress.com/

This is a standalone AI enhancement mod, intended to redress some of the cheese tactics that allow the player to declaw enemies and make them less scary than they should be. The core identities of each enemy type are unchanged, but responses are tweaked to allow them to better challenge the player. Melee enemies will no longer wait for the player to come to a stop before attempting to attack, the Pipe Hybrid's laughably slow vertical swings are brought in line with their lightning fast horizontal swings, the lackadaisical Grenade Hybrids will now actually attempt to hit the player, Midwives back away from the player more quickly and ward them off with swift melee swipes, Shotgun Hybrids and Monkeys are harder to lock down with melee stagger, Cyborg Assassins will slip away and begin attacking from range more reliably, Spiders now use their leap as a lunging attack, and Rumblers use a greater variety of attacks with fixed hitboxes.

There is a separate module that equips the Cyborg Assassin with a Laser Rapier to use in melee range. Load this module above Scary Monsters; not compatible with Rebirth.

Compatible with vanilla or SCP Beta 4, but overwrites the motiondb.bin file and conflicts with any other mod that replaces it. I've included the edited motions (\motions\*.mi) and motion schemas (\mschema\*.moc) for other modders to use; however only the compiled motiondb.bin is functional. Not compatible with Secmod, which includes its own AI expansions. Requires SS2 v2.48 patch or above.

Credits:
ThiefsieFool for pointers on editing the motion database, Secmod's Assassin Rapier model and attachment setup
sarge945 for fixed Assassin Rapier model
sarge945, Voyager, and Jobesky for beta testing

#### Changelist ####
-Fixed Pipe Hybrids, Spiders, Monkeys, Midwives, and Rumblers refusing to attack backpedaling players in melee
	-Enemies now always attempt to attack once in melee range regardless of player speed
	-Accompanying changes to desired attack range for some enemies
-Fixed Big Droids, Shotgun Hybrids, Grenade Hybrids, Midwives, and Cyborg Assassins firing through objects (e.g. Cargo Bay crates, Metacreative Barrier)
-Fixed Turrets failing to hit the player at point blank range
-Laser Turret projectiles are 25% slower
-Rick Turret projectiles are 33% slower
-Pipe Hybrid uppercut is 67% faster
-Pipe Hybrid overhand swings are 33% faster
-Pipe Hybrid left and right side swipes are 17% slower
-Shotgun Hybrid firing attacks are 7% faster
-Shotgun Hybrid pain stagger is 25% faster
-Shotgun Hybrid backstep is 25% faster
-Grenade Hybrid throws are 100% faster
-Monkey running flail now counts as an attack
-Monkey melee swipes are 43% faster
-Monkey backstep is 100% faster and goes 100% further
-Monkey run is 23% faster
-Fixed Midwife melee swipes being unable to hit crouching players
-Midwife melee swipes are 33% faster
-Midwife slap attack is slightly less likely than other attacks
-Midwife pain stagger is 25% faster
-Midwife backstep is 43% faster and goes 20% further
-Midwife sidestep is 11% faster and goes 20% further
-Midwife combat walk is 25% faster
-Cyborg Assassin immediately turns to attack after fleeing instead of fidgeting
-Cyborg Assassin pain stagger is 82% faster
-Cyborg Assasssin run is 14% faster
-Cyborg Assassin backstep is 25% faster and goes 60% further
-Cyborg Assassin walk/sidestep (rare) is 25% faster
-Spider leap now counts as an attack on the descent
-Spider leap attack is more likely to occur
-Spider no longer freezes in place instead of attacking
-Spider melee swipes are 33% faster
-Spider run is 33% faster
-Baby Spider leap now counts as an attack on the descent
-Baby Spider leap attack is more likely to occur
-Baby Spider melee swipes are 33% faster
-Baby Spider run is 100% faster
-Rumbler combo attacks active hitbox duration lowered to better match animations
-Rumbler combo attacks are almost as likely as the overhand swipes
-Rumbler melee swipes are 11% faster
-Rumbler backstep/frontstep are 54% faster and go 100% further
-Rumbler has a chance to sidestep or fronstep instead of backstepping
-Rumbler pain stagger is 54% faster
-Rumbler has a chance of dodging in any direction instead of staggering on hit
-Rumbler search actions are 11% faster