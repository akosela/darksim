Universal Ultimate Difficulty Mod

==============
== Overview ==
==============

Northon's Ultimate Difficulty Mod for Thief and Thief 2 is a series of tweaks to
the original game that makes far-reaching changes to games' behaviors in an
effort to give seasoned Thief players a greater challenge. Being made in a time
long before the niceties of NewDark's dbmod system were introduced, it is
implemented as a gamesys replacement, meaning that it is fundamentally
incompatible with any modified game systems or missions that include a custom
one.

This is a conversion of the original mod to use NewDark's dbmods (DMLs). This
means that it will work in combination with the vast majority of game systems,
including the modern patched resources and FMs. Along with this, it will work
with Thief, Thief Gold, and Thief 2. See the original readme for information
about the included changes.

================
== Installing ==
================

This package can installed by either using the Dark Engine Mod Manager to
install directly from the archive or by manually extracting its contents to an
enabled mod directory. An installation running NewDark 1.27 or newer is
required. No additional configuration is necessary.

=====================
== Original README ==
=====================

====================================
Ultimate Difficulty Mod for Thief2
====================================

If you are like me, the original missions (as great as they are) and many FMs are lacking in the suspense and immersion they once had.  You know all of the tricks of the game.  You know just how much you can push your luck with a guard and still avoid being noticed.  You find it too simple to run around a mission, black-jacking every guard in sight and casually chucking their body into some dim corner.  Sure, there are self-imposed styles of play that can add challenge back into the game, but to me at least, they detract from the immersion.  And they don’t change the fundamentals of the gameplay all that much.

In January I got a spiffy new computer with EAX capability et al, and I felt the desire to replay my two favorite games.  But I wanted more of a challenge.  I have ghosted before and while that was good fun, it wasn’t exactly what I was looking for.  What I wanted was the same feeling I had when I originally played my first mission of Thief two years ago.  That nervous hesitation, that uncertainty about just how much I could get away with without being detected and that feeling of fear and panic after being spotted.  So I set out to create a custom gamesys for Thief that would change certain aspects of the gameplay in fundamental ways, in the direction of increased realism and difficulty.

After months spent toiling with Dromed, I have produced a new gamesys for Thief2 with the following improvements and modifications in gameplay:


* A lone guard who is alerted and makes a confirmed sighting of Garret or a body, searches for him, and gives up, will run to alert others instead of returning to his regular patrol.  After that however, he will resume his patrol.
* The AI vision cones have been completely redesigned to given them better distance vision, a more accurate loss of acuity over distance, and to eliminate Garrets ability to use leaning tricks to blackjack guards while alerted.
* I have heavily modified the dynamics of noise creation as a result of Garrets footsteps.  Running on wood and cobblestone now has the potential to alert guards within a few meters.  This means you will have to *walk* up behind them for a successful blackjack.  Also, creeping on marble, metal, or gravel is actually *quieter* and no longer alerts guards thus eliminating the need to tap the forward key and creep-crouch.
* Garret is now more visible to AIs as the visgem will indicate.  To offset this new disadvantage, I have increased the bonus Garret receives for crouching and sticking close to walls.
* Bodies are now MUCH harder to hide.  Forget about tossing your victim in a shadowy spot on a well patrolled hall.  Only two things may effectively hide a body now: a physical barrier, or an area of nearly absolute darkness.
* The AI have been made faster, especially zombies (who are now a real threat to an experienced player!)
* Residual alertness on guards who have been raised to level 3 now increases their perceptiveness by a considerable margin.
* Yelling made by guards during combat or searching travels further and is heard more easily by other guards.
* Blackjacking someone makes a minor sound disturbance.
* A collapsing body makes a minor sound disturbance. (both of these are not loud enough to alert anyone but simply attract their attention if already alerted or perhaps illicit a "Who's their?"..."Musta been rats" response )

Usage instructions:
To play with the custom gamesys, your simplest option is to backup your old dark.gam and replace it with the new one.  Load up Thief and be prepared to find a whole new challenge awaiting you in the missions you have grown to love.  Any fan mission that doesn’t use its own custom gamesys will experience the changes as well.
To restore your original Thief version, simply copy the DARK.GAM file you backed up (or off your CD) back into the Thief directory.

==============================
Tips for playing with the new difficulty:
==============================

-Never try to run up behind a guard to blackjack them (unless they are the dimwitted ones that work for Bafford) Your default mode of travel should probably be walking from now on.
-Be much more prudent when hiding bodies.
-Take more time to consider your course of action and plan from the shadows.
-Blackjacking is now a more risky tactic and should be used sparingly.
-Plan your escape tactics ahead of time as the AIs won’t be quite so easy to evade anymore.
-Be prepared to resort to less-conventional tactics to overcome a situation.  Spots that were possible to sneak through on expert will be much harder if not impossible with this gamesys.
-If guards are nearby, you may be forced to creep while walking upstairs to remain unheard.  This is because the noise Garret makes is a measure of his total speed, not what movement mode you are using.


====================================
If your have any bugs to report, feel free to email me at jmartens@student.cs.uwaterloo.ca.  I am 'Northon' on TTLG. Distribute these files to your heart’s content.  A fan-mission author who wants to use my gamesys as a base for their own is free to do so.
