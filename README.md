# MarCombat
A game, to conquer the world.

# TO DO, IN ORDER:
1: Conversation scene
    - Make the VS text pop/bounce, like size... so put center at center; boom sound
2: Story Mode controller
    - on lose, restart game, no continue
    - fighting self as "[Name]'s Self-Doubt"
3: Character selection scene
4: Polish
5: Multiplayer
- vs AI, fighting self as "Nega[Name]"

# IDEAS HEAP
- Ox Anna fight:
    - when hit, overplay the hit to head, and drop and slide there; pause, then get up, sound, and trot to the edge of screen, turn around, swipe leg like bulls do, particles some smoke out the nose, and go again
    - takes place on roof, include off the side of the building so that:
        - if the killing blow comes from the right (tossing player to the right) they fall off the building :)
        - if the killing blow comes from the left (player is on the right) they get gored, slammed on the ground, and trampled
    - if Oksana joins us as a player, she's still our first boss after self-doubt, but her story is different because of it; also, Ox Anna becomes a secret code :)
- conversation scene:
    - need one where player says "Hey!" and the opponent says "I don't like you" and they both go into fight pose, just because
    - maybe one for Kelsie v John (either way) where one asks how the other pronounces "gif" and the other says "gif" and they fight

# Littler To-Dos:
- add "finish him/her" sound
- add "PLAYER wins" sound
- more level backgrounds, and related effects (sounds, etc.)
    - catwalk, cafe, courtyard?, admissions, galleries, back hallway, break room, etc.
    - related sounds, etc (Pete in distance)
- bot specials working
- visually enhance Terje's special animation

# POLISH
- sound levels, better sound effects where necessary
- bug fixes and testing
- don't modulate the UI name bars
- outside weather? snow, rain, clear, night, etc.
- light effects?

# PRIORITY BUG FIXES
- chance of attack animations not cancelling and both players getting hit
    - possible solutions:
        - CODED, NOW TEST: stop AnimationPlayer, deactivate tree, reactivate tree WORKS?!?!?
            - works, but also seems to freeze player(s) sometimes, so need to see if tree is being disabled and can't return
        - AttackCircle and HitBox active/enabled switches are always opposite; this way you can't get hit while punching and vice versa; this doesn't remove the possibility of double hitting, tho, just lowers it
        - use advance method on the victim's animation to end it quicker
        - ?
- Terje
    - when facing left, fatality throws backwards and around
        - solution: don't let people walk past each other or throw?