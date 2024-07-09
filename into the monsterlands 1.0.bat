@echo off


:titleScreen
echo.
echo.
echo                 __               __    __                                                         
echo      __        /\ \__           /\ \__/\ \                                                        
echo     /\_\    ___\ \  _\   ____   \ \  _\ \ \___     ____  
echo     \/\ \  / __ \ \ \/  / __ \   \ \ \/\ \  __ \  / __ \
echo      \ \ \/\ \/\ \ \ \_/\ \_\ \   \ \ \_\ \ \ \ \/\  __/
echo       \ \_\ \_\ \_\ \__\ \____/    \ \__\\ \_\ \_\ \____\
echo        \/_/\/_/\/_/\/__/\/___/      \/__/ \/_/\/_/\/____/
echo                                       __                 ___                        __
echo                                      /\ \__             /\_ \                      /\ \           
echo       ___ ____    ____    ____    ___\ \  _\   ____  ___\_/\ \     ____     ____   \_\ \    ____  
echo      / __  __ \  / __ \  / __ \  /  __\ \ \/  / __ \/\  __\ \ \   / __ \   /  _ \  / _  \  /  __\ 
echo     /\ \/\ \/\ \/\ \_\ \/\ \/\ \/\___  \ \ \_/\  __/\ \ \/ \_\ \_/\ \_\ \_/\ \/\ \/\ \_\ \/\___  \
echo     \ \_\ \_\ \_\ \____/\ \_\ \_\/\____/\ \__\ \____\\ \_\ /\____\ \___ __\ \_\ \_\ \_____\/\____/
echo      \/_/\/_/\/_/\/___/  \/_/\/_/\/___/  \/__/\/____/ \/_/ \/____/\/__/\/_/\/_/\/_/\/____ /\/___/ 
echo.
echo.
echo                                                                a text-based game by Yustin Riopko
echo.
echo      ^> Press any key to continue.
pause >nul


:newGame
set location=route1_1
set combat=no
set enemy=none

set level=0
set maxHP=5
set HP=5
set agility=0
set wisdom=0
set attack=0
set strength=0
set finesse=0
set defense=0
set charisma=0
set /a AC=%defense% + 10

set luck=10
set exp=0


set weapon=none
set damage_min=1
set damage_max=1
set offhand=none
set head=none
set chest=none
set legs=none
set feet=none


set statpointready=no

set inventory=closed

set items=2
set item_apple=1
set item_bestfriendsnote=0
set item_favoritesweater=0
set item_goblinscimitar=0
set item_goldmedal=0
set item_healthpotion=0
set item_purplemushroom=0
set item_ruinedboots=0
set item_ruinedcap=0
set item_ruinedchaps=0
set item_ruinedtunic=0
set item_torch=1
set item_woodensword=0


set firsttime_tile_route1_1=no
set firsttime_tile_route1_3=no
set firsttime_tile_hometown_north=no
set firsttime_tile_hometown_south=no
set firsttime_tile_route2_2=no
set firsttime_tile_route2_3=no

set firsttime_tile_hometown_potionshop=no
set firsttime_tile_hometown_myhouse=no
set firsttime_tile_hometown_bestfriendshouse=no
set firsttime_tile_hometown_weaponshop=no


set route1_2_birdsong=unheard
set route1_2_ruinedcap=present
set route1_2_ruinedboots=present
set hometown_potionshop_potions=present
set hometown_myhouse_favoritesweater=present
set hometown_weaponshop_woodensword=present
set firstratencounter=no
set hometown_bestfriendshouse_note=present
set timesread_bestfriendsnote=0
set seen_darkswampyforestcorpse=no
set goblinchief=alive
set route2_8_mushrooms=present
set ovalfacedman=present
set ovalfacedman1=incomplete
set ovalfacedman_loot=not given





goto returnLocation

:gameover
echo.
echo    [Game Over.]
echo      ^> Press any key to start over.
pause >nul
echo.
echo.
goto titleScreen











:help
if "%help%" == "closed" (
echo    [You open the help screen.]
)
set help=open
echo.
echo    [HELP SCREEN.]
echo.
echo      ^> Tip 1: KEEP IT SIMPLE
echo         Use simple commands like "examine mushrooms" and "take sword."
echo         (Enter "1" to learn more about keeping it simple.)
echo.
echo      ^> Tip 2: EXPLORE THE WORLD
echo         Move with commands like "north," "go to house," or "leave"
echo         (Enter "2" to learn more about exploring the world.)
echo.
echo      ^> Tip 3: STAY SHARP
echo         "l" to look around, "i" to open inventory, and "s" to view stats
echo         (Enter "3" to learn more about staying sharp.)
echo.
echo      ^> From here you can "leave" (4).
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "" goto 
if "%input%" == "1" goto help_tip1
if "%input%" == "2" goto help_tip2
if "%input%" == "3" goto help_tip3
if "%input%" == "4" goto help_close
if "%input%" == "leave" goto help_close
if "%input%" == "done" goto help_close
if "%input%" == "exit" goto help_close
if "%input%" == "close" goto help_close
if "%input%" == "h" goto help_close
if "%input%" == "help" goto help_close
if "%input%" == "return" goto help_close

if "%input%" == "noInput" goto commandError
goto help


:help_tip1
echo.
echo      ^> Tip 1: KEEP IT SIMPLE
echo         Use basic commands to tell the game what your character does.
echo         Do not use capital letters. Do not use articles like "the" or "a."
echo         Exs. "look around," "examine mushrooms," "take sword," "talk to man"
goto help

:help_tip2
echo.
echo      ^> Tip 2: EXPLORE THE WORLD
echo         To move from one location to another, enter cardinal direction commands
echo         like "south" or "go east." Other movement commands might look like
echo         "go to house," "enter shop," or "leave."
goto help

:help_tip3
echo.
echo      ^> Tip 3: STAY SHARP
echo         There is always more than meets the eye at an immediate glance.
echo         You can use the following commands pretty much anytime:
echo          - "l" or "look" to learn more about your environment and view a map
echo          - "i" or "inventory" to see, examine, and use your items
echo          - "s" or "stats" to check your HP, levels, and other character info
goto help

:help_close
echo.
echo    [You close the help screen.]
set help=closed
goto returnLocation



:returnLocation
if "%inventory%" == "open" goto inventory
if "%location%" == "route1_1" goto tile_route1_1
if "%location%" == "route1_2" goto tile_route1_2
if "%location%" == "route1_3" goto tile_route1_3

if "%location%" == "hometown_north" goto tile_hometown_north
if "%location%" == "hometown_south" goto tile_hometown_south
if "%location%" == "hometown_potionshop" goto tile_hometown_potionshop
if "%location%" == "hometown_myhouse" goto tile_hometown_myhouse
if "%location%" == "hometown_weaponshop" goto tile_hometown_weaponshop
if "%location%" == "hometown_bestfriendshouse" goto tile_hometown_bestfriendshouse

if "%location%" == "route2_1" goto tile_route2_1
if "%location%" == "route2_2" goto tile_route2_2
if "%location%" == "route2_3" goto tile_route2_3
if "%location%" == "route2_4" goto tile_route2_4
if "%location%" == "route2_5" goto tile_route2_5
if "%location%" == "route2_6" goto tile_route2_6
if "%location%" == "ovalfacedman1" goto talkto_ovalfacedman1
if "%location%" == "ovalfacedman2" goto talkto_ovalfacedman2
if "%location%" == "route2_7" goto tile_route2_7
if "%location%" == "route2_7_corpse" goto route2_7_corpse
if "%location%" == "route2_8" goto tile_route2_8

:returnCombat
if "%enemy%" == "giant rat" goto combat_giantrat
if "%enemy%" == "goblin" goto combat_goblin
if "%enemy%" == "goblin chief" goto combat_goblinchief

:commandError
echo.
echo    [That command doesn't work.]
echo      ^> Try something else.
if "%help%" == "open" (
goto help
)
if "%inventory%" == "open" (
goto inventory
)
if "%statpointready%" == "yes" (
goto levelup_booststat
)
goto returnLocation







:checklevelup
if %level% == 0 (
if %exp% GTR 0 goto levelup
)
if %level% == 1 (
if %exp% GTR 25 goto levelup
)
if %level% == 2 (
if %exp% GTR 75 goto levelup
)
if %level% == 3 (
if %exp% GTR 150 goto levelup
)
if %level% == 4 (
if %exp% GTR 250 goto levelup
)
goto returnLocation

:levelup
echo.
set /a level=%level% + 1
echo    [You level up to level %level%!]
set statpointready=yes
set /a HPlevelup=3 + %RANDOM% %% (5 - 3 + 1)
set /a maxHP=%maxHP% + %HPlevelup%
set /a HP=%HP% + %HPlevelup%
echo      ^> Your max HP increases by %HPlevelup%.
echo      ^> You have %HP%/%maxHP% HP.
echo      ^> Press any key to continue.
pause >nul
:levelup_booststat
echo.
echo    [You reached level %level%! Choose a stat to boost.]
echo      1. agility (This affects your chances to attack first and escape.)
echo      2. wisdom (Coming soon...)
echo      3. attack (This affects the accuracy of your attacks.)
echo      4. strength (This affects the power of your attacks.)
echo      5. finesse (This affects the critical hit chance of your attacks.)
echo      6. defense (This affects your chance to avoid attacks.)
echo      7. charisma (This affects the outcomes of social interactions.)
echo.
set input=noInput
set /p input=
if "%input%" == "" goto

if "%input%" == "1" goto levelup_booststat_agility
if "%input%" == "2" goto levelup_booststat_wisdom
if "%input%" == "3" goto levelup_booststat_attack
if "%input%" == "4" goto levelup_booststat_strength
if "%input%" == "5" goto levelup_booststat_finesse
if "%input%" == "6" goto levelup_booststat_defense
if "%input%" == "7" goto levelup_booststat_charisma

if "%input%" == "agility" goto levelup_booststat_agility
if "%input%" == "wisdom" goto levelup_booststat_wisdom
if "%input%" == "attack" goto levelup_booststat_attack
if "%input%" == "strength" goto levelup_booststat_strength
if "%input%" == "finesse" goto levelup_booststat_finesse
if "%input%" == "defense" goto levelup_booststat_defense
if "%input%" == "charisma" goto levelup_booststat_charisma

if "%input%" == "noInput" goto levelup_booststat
goto commandError

:levelup_booststat_agility
set /a agility=%agility% + 1
set statpointready=no
echo.
echo    [Your agility increases to %agility%.]
goto returnLocation

:levelup_booststat_wisdom
goto commandError
set /a wisdom=%wisdom% + 1
set statpointready=no
echo.
echo    [Your wisdom increases to %wisdom%.]
goto returnLocation

:levelup_booststat_attack
set /a attack=%attack% + 1
set statpointready=no
echo.
echo    [Your attack increases to %attack%.]
goto returnLocation

:levelup_booststat_strength
set /a strength=%strength% + 1
set statpointready=no
echo.
echo    [Your strength increases to %strength%.]
goto returnLocation

:levelup_booststat_finesse
set /a finesse=%finesse% + 1
set statpointready=no
echo.
echo    [Your finesse increases to %finesse%.]
goto returnLocation

:levelup_booststat_defense
set /a defense=%defense% + 1
set statpointready=no
set /a AC=%AC% + 1
echo.
echo    [Your defense increases to %defense%.]
goto returnLocation

:levelup_booststat_charisma
set /a charisma=%charisma% + 1
set statpointready=no
echo.
echo    [Your charisma increases to %charisma%.]
goto returnLocation












:look
echo.
if "%combat%" == "yes" (
if "%enemy%" == "giant rat" (
echo    [You examine the giant rat.]
echo      ^> Beasts like this did not used to stalk your peaceful village.
echo      ^> It must come from the monsterlands to the south.
goto combat_giantrat
)
if "%enemy%" == "goblin" (
echo    [You examine the goblin.]
echo      ^> Green skin, pointy ears, lean muscles.
echo      ^> Goblins are notoriously violent. Spare no mercy.
goto combat_goblin
)
if "%enemy%" == "goblin chief" (
echo    [You examine the goblin chief.]
echo      ^> Dark green skin, torn pointy ears, trained muscles, and rugged posture.
echo      ^> The gold medal around its neck glimmers in the darkness. It looks familiar.
echo      ^> Goblins are notoriously violent. Spare no mercy.
goto combat_goblinchief
)
)

echo    [You look around.]
if "%location%" == "route1_1" (
echo      ^> It's the only peaceful place near your small village.
echo.
echo                  ^|   ^|
echo                  ^+---^+
echo                  ^|   ^|
echo                  ^+---^+
echo                  ^| ~ ^|
echo                  ^+---^+
echo                  ^|   ^|
echo                  ^+---^+
echo                  ^|   ^|
)
if "%location%" == "route1_2" (
echo      ^> Flickering bars of light twinkle below the lush canopy.
echo.
echo.
echo                  ^+---^+
echo                  ^|   ^|
echo                  ^+---^+
echo                  ^| ~ ^|
echo                  ^+---^+
echo                  ^|   ^|
echo                  ^+---^+
echo                  ^|   ^|
)
if "%location%" == "route1_3" (
echo      ^> Very little light penetrates this tranquil shady place.
echo      ^> Coming here restores all your missing HP.
echo.
echo.
echo.
echo.
echo                  ^+---^+
echo                  ^| ~ ^|
echo                  ^+---^+
echo                  ^|   ^|
echo                  ^+---^+
echo                  ^|   ^|
)

if "%location%" == "hometown_north" (
echo      ^> The entire village is deserted.
echo      ^> There is the sense that something bad has happened.
echo      ^> You see a potion shop.
echo      ^> You see your house.
echo.
echo                  ^|   ^|
echo                  ^+---^+
echo                  ^|   ^|
echo                  ^+---^+
echo                  ^| @ ^|
echo                  ^+---^+
echo                  ^|   ^|
echo                  ^+---^+
echo                   ^| ^|
)
if "%location%" == "hometown_south" (
echo      ^> The entire village is deserted.
echo      ^> There is the sense that something bad has happened.
echo      ^> You see a weapon shop.
echo      ^> You see your best friend's house.
echo.
echo                  ^|   ^|
echo                  ^+---^+
echo                  ^|   ^|
echo                  ^+---^+
echo                  ^| @ ^|
echo                  ^+---^+
echo                   ^| ^|
echo                  ^+---^+
echo                  ^|   ^|
)
if "%location%" == "hometown_potionshop" (
echo      ^> The shop is deserted.
echo      ^> The shelves are barren, apparently cleared out in a hurry.
if "%hometown_potionshop_potions%" == "present" (
echo      ^> Two health potions remain on the counter.
)
echo.
echo.
echo.
echo.
echo                  ^+---^+
echo                  ^| * ^|
echo                  ^+- -^+
echo.
echo.
echo.
)
if "%location%" == "hometown_myhouse" (
echo      ^> It's your house, silly! You know how it looks.
echo      ^> Everything seems in order.
if "%hometown_myhouse_favoritesweater%" == "present" (
echo      ^> Your favorite sweater is here.
)
echo.
echo.
echo.
echo.
echo                  ^+---^+
echo                  ^| * ^|
echo                  ^+- -^+
echo.
echo.
echo.
)
if "%location%" == "hometown_weaponshop" (
echo      ^> The shop is deserted.
echo      ^> The racks are barren, apparently cleared out in a hurry.
if "%hometown_weaponshop_woodensword%" == "present" (
echo      ^> A wooden sword remains on the counter.
)
echo.
echo.
echo.
echo.
echo                  ^+- -^+
echo                  ^| * ^|
echo                  ^+---^+
echo.
echo.
echo.
)
if "%location%" == "hometown_bestfriendshouse" (
echo      ^> Your best friend is not here.
if "%hometown_bestfriendshouse_note%" == "present" (
echo      ^> There is a note on the table.
)
echo.
echo.
echo.
echo.
echo                  ^+- -^+
echo                  ^| * ^|
echo                  ^+---^+
echo.
echo.
echo.
)

if "%location%" == "route2_1" (
echo      ^> This bridge used to represent safety.
echo.
echo                  ^|   ^|
echo                  ^+---^+
echo                  ^|   ^|
echo                  ^+---^+
echo                   ^|~^|
echo                  ^+---^+
echo                  ^|   ^|
echo                  ^+---^+---^+--
echo                  ^|   ^|   ^|  
)
if "%location%" == "route2_2" (
echo      ^> Bubbles slowly swell and pop in the muck.
echo      ^> An old crooked sign protrudes at an angle from the mucky earth.
echo         ^> BEWARE
echo           MONSTERLANDS
echo           GOBLINS AHEAD
echo.
echo                  ^|   ^|
echo                  ^+---^+
echo                   ^| ^|
echo                  ^+---^+
echo                  ^| ~ ^|
echo                  ^+---^+---^+--
echo                  ^|   ^|   ^|  
echo                  ^+---^+---^+--
echo                  ^|   ^|   ^|  
)
if "%location%" == "route2_3" (
if NOT "%offhand%" == "torch" (
echo      ^> Without a torch equipped in your offhand, you can see almost nothing.
echo      ^> "i" to open inventory
goto returnLocation
)
echo      ^> Smart. This area could be dangerous.
echo.
echo                   ^| ^|
echo                  ^+---^+
echo                  ^|   ^|
echo                  ^+---^+---^+--
echo                  ^| ~ ^|   ^|  
echo                  ^+---^+---^+--
echo                  ^|   ^|   ^|  
echo                  ^+---^+   ^+--
echo                  ^|   ^|    ^|  
)
if "%location%" == "route2_4" (
if NOT "%offhand%" == "torch" (
echo      ^> Without a torch equipped in your offhand, you can see almost nothing.
echo      ^> "i" to open inventory
goto returnLocation
)
echo      ^> Sad droopy swamp trees blot out the sun.
echo.
echo               ^| ^|
echo              ^+---^+
echo              ^|   ^|
echo              ^+---^+---^+---^+
echo              ^|   ^| ~ ^|   ^|
echo              ^+---^+---^+---^+
echo              ^|   ^|   ^|   ^|
echo              ^+---^+   ^+---^+
echo              ^|   ^|    ^| ^|
)
if "%location%" == "route2_5" (
if NOT "%offhand%" == "torch" (
echo      ^> Without a torch equipped in your offhand, you can see almost nothing.
echo      ^> "i" to open inventory
goto returnLocation
)
echo      ^> Sad droopy swamp trees blot out the sun.
echo.
echo             ^|
echo            --^+
echo              ^|
echo            --^+---^+---^+
echo              ^|   ^| ~ ^|
echo            --^+---^+---^+
echo              ^|   ^|   ^|
echo            --^+   ^+---^+
echo              ^|    ^| ^|
)
if "%location%" == "route2_6" (
echo      ^> You see sad droopy swamp trees here and there.
if "%ovalfacedman%" == "present" (
echo      ^> An oval-faced man is waiting here somberly.
)
echo.
echo              ^|
echo            --^+---^+---^+
echo              ^|   ^|   ^|
echo            --^+---^+---^+
echo              ^|   ^| ~ ^|
echo            --^+   ^+---^+
echo              ^|    ^| ^|
echo            --^+   ^+---^+
echo                  ^|   ^|
)
if "%location%" == "route2_7" (
if NOT "%offhand%" == "torch" (
echo      ^> Without a torch equipped in your offhand, you can see almost nothing.
echo      ^> "i" to open inventory
goto returnLocation
)
echo      ^> The droopy swamp trees are thick here.
echo.
echo                  ^|   ^|
echo                  ^+---^+---^+--
echo                  ^|   ^|   ^|  
echo                  ^+---^+---^+--
echo                  ^| ~ ^|   ^|  
echo                  ^+---^+   ^+--
echo                  ^|   ^|    ^|  
echo                  ^+---^+   ^+-
echo                          ^|  
)
if "%location%" == "route2_8" (
if NOT "%offhand%" == "torch" (
echo      ^> Without a torch equipped in your offhand, you can see almost nothing.
echo      ^> "i" to open inventory
goto returnLocation
)
echo      ^> The droopy swamp trees are very thick here.
if "%route2_8_mushrooms%" == "present" (
echo      ^> Some purple mushrooms grow in the shade.
)
echo.
echo                  ^|   ^|   ^|  
echo                  ^+---^+---^+--
echo                  ^|   ^|   ^|  
echo                  ^+---^+   ^+--
echo                  ^| ~ ^|    ^|  
echo                  ^+---^+   ^+--
echo                          ^|  
echo                          ^+--
echo                          ^|  
)
goto returnLocation


:stats
echo    [You review your stats.]
echo      ^> You are level %level% (%exp% exp).
echo      ^> HP: %HP%/%maxHP%
echo      ^> agility: %agility%
echo      ^> attack: %attack%
echo      ^> strength: %strength%
echo      ^> finesse: %finesse%
echo      ^> defense: %defense% (AC: %AC%)
echo.
echo    [You observe your gear.]
echo      ^> weapon: %weapon%
echo      ^> off hand: %offhand%
echo      ^> head: %head%
echo      ^> chest: %chest%
echo      ^> legs: %legs%
echo      ^> feet: %feet%
if "%combat%" == "yes" goto returnCombat
goto returnLocation


:inventory
if "%inventory%" == "closed" (
echo.
echo    [You open your inventory.]
set inventory=open
)
echo.
echo    Your inventory contains...
if %items% LSS 1 (
echo      ... nothing.
set inventory=closed
goto returnLocation
)




if %item_apple% GTR 0 (
echo      ^> apple x%item_apple%
)

if %item_bestfriendsnote% GTR 0 (
echo      ^> best friend's note x%item_bestfriendsnote%
)

if %item_favoritesweater% GTR 0 (
echo      ^> favorite sweater x%item_favoritesweater%
if "%chest%" == "favorite sweater" (
echo         (equipped --- ^+1 attack^)
)
)
if %item_goblinscimitar% GTR 0 (
echo      ^> goblin scimitar x%item_goblinscimitar%
if "%weapon%" == "goblin scimitar" (
echo         (equipped --- 1-3^)
)
)
if %item_goldmedal% GTR 0 (
echo      ^> gold medal x%item_goldmedal%
)
if %item_healthpotion% GTR 0 (
echo      ^> health potion x%item_healthpotion%
)
if %item_purplemushroom% GTR 0 (
echo      ^> purple mushroom x%item_purplemushroom%
)

if %item_ruinedboots% GTR 0 (
echo      ^> ruined boots x%item_ruinedboots%
if "%feet%" == "ruined boots" (
echo         (equipped, ^+1 AC^)
)
)

if %item_ruinedcap% GTR 0 (
echo      ^> ruined cap x%item_ruinedcap%
if "%head%" == "ruined cap" (
echo         (equipped, ^+1 AC^)
)
)

if %item_ruinedchaps% GTR 0 (
echo      ^> ruined chaps x%item_ruinedchaps%
if "%legs%" == "ruined chaps" (
echo         (equipped, ^+1 AC^)
)
)

if %item_ruinedtunic% GTR 0 (
echo      ^> ruined tunic x%item_ruinedtunic%
if "%chest%" == "ruined tunic" (
echo         (equipped, ^+1 AC^)
)
)

if %item_torch% GTR 0 (
echo      ^> torch x%item_torch%
if "%offhand%" == "torch" (
echo         (equipped^)
)
)

if %item_woodensword% GTR 0 (
echo      ^> wooden sword x%item_woodensword%
if "%weapon%" == "wooden sword" (
echo         (equipped, 1-2^)
)
)





echo.
echo    "examine" or "use" an item
echo    "s" anytime to view stats
echo    "i" to close inventory
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "" goto 

if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats

if "%input%" == "use " goto 
if "%input%" == "examine " goto 
if "%input%" == "examine " goto 
if "%input%" == "discard " goto 

if %item_apple% GTR 0 (
if "%input%" == "apple" goto inventory_examine_apple
if "%input%" == "examine apple" goto inventory_examine_apple
if "%input%" == "look at apple" goto inventory_examine_apple
if "%input%" == "use apple" goto inventory_use_apple
if "%input%" == "eat apple" goto inventory_use_apple
)

if %item_bestfriendsnote% GTR 0 (
if "%input%" == "examine note" goto inventory_examine_bestfriendsnote
if "%input%" == "look at note" goto inventory_examine_bestfriendsnote
if "%input%" == "read note" goto inventory_examine_bestfriendsnote
if "%input%" == "use note" goto inventory_examine_bestfriendsnote

if "%input%" == "examine friends note" goto inventory_examine_bestfriendsnote
if "%input%" == "look at friends note" goto inventory_examine_bestfriendsnote
if "%input%" == "read friends note" goto inventory_examine_bestfriendsnote
if "%input%" == "use friends note" goto inventory_examine_bestfriendsnote

if "%input%" == "examine best friends note" goto inventory_examine_bestfriendsnote
if "%input%" == "look at best friends note" goto inventory_examine_bestfriendsnote
if "%input%" == "read best friends note" goto inventory_examine_bestfriendsnote
if "%input%" == "use best friends note" goto inventory_examine_bestfriendsnote

if "%input%" == "examine my best friends note" goto inventory_examine_bestfriendsnote
if "%input%" == "look at my best friends note" goto inventory_examine_bestfriendsnote
if "%input%" == "read my best friends note" goto inventory_examine_bestfriendsnote
if "%input%" == "use my best friends note" goto inventory_examine_bestfriendsnote

if "%input%" == "examine friend's note" goto inventory_examine_bestfriendsnote
if "%input%" == "look at friend's note" goto inventory_examine_bestfriendsnote
if "%input%" == "read friend's note" goto inventory_examine_bestfriendsnote
if "%input%" == "use friend's note" goto inventory_examine_bestfriendsnote

if "%input%" == "examine best friend's note" goto inventory_examine_bestfriendsnote
if "%input%" == "look at best friend's note" goto inventory_examine_bestfriendsnote
if "%input%" == "read best friend's note" goto inventory_examine_bestfriendsnote
if "%input%" == "use best friend's note" goto inventory_examine_bestfriendsnote

if "%input%" == "examine my best friend's note" goto inventory_examine_bestfriendsnote
if "%input%" == "look at my best friend's note" goto inventory_examine_bestfriendsnote
if "%input%" == "read my best friend's note" goto inventory_examine_bestfriendsnote
if "%input%" == "use my best friend's note" goto inventory_examine_bestfriendsnote

)

if %item_favoritesweater% GTR 0 (
if "%input%" == "favorite sweater" goto inventory_examine_favoritesweater
if "%input%" == "examine favorite sweater" goto inventory_examine_favoritesweater
if "%input%" == "look at favorite sweater" goto inventory_examine_favoritesweater
if "%input%" == "use favorite sweater" goto inventory_use_favoritesweater
if "%input%" == "sweater" goto inventory_examine_favoritesweater
if "%input%" == "examine sweater" goto inventory_examine_favoritesweater
if "%input%" == "look at sweater" goto inventory_examine_favoritesweater
if "%input%" == "use sweater" goto inventory_use_favoritesweater
)

if %item_goldmedal% GTR 0 (
if "%input%" == "examine gold medal" goto inventory_examine_goldmedal
if "%input%" == "examine medal" goto inventory_examine_goldmedal
if "%input%" == "look at gold medal" goto inventory_examine_goldmedal
if "%input%" == "look at medal" goto inventory_examine_goldmedal
if "%input%" == "gold medal" goto inventory_examine_goldmedal
if "%input%" == "medal" goto inventory_examine_goldmedal
)

if %item_goblinscimitar% GTR 0 (
if "%input%" == "goblin scimitar" goto inventory_examine_goblinscimitar
if "%input%" == "examine goblin scimitar" goto inventory_examine_goblinscimitar
if "%input%" == "look at goblin scimitar" goto inventory_examine_goblinscimitar
if "%input%" == "use goblin scimitar" goto inventory_use_goblinscimitar
if "%input%" == "scimitar" goto inventory_examine_goblinscimitar
if "%input%" == "examine scimitar" goto inventory_examine_goblinscimitar
if "%input%" == "look at scimitar" goto inventory_examine_goblinscimitar
if "%input%" == "use scimitar" goto inventory_use_goblinscimitar
)

if %item_healthpotion% GTR 0 (
if "%input%" == "health potion" goto inventory_examine_healthpotion
if "%input%" == "examine health potion" goto inventory_examine_healthpotion
if "%input%" == "look at health potion" goto inventory_examine_healthpotion
if "%input%" == "use health potion" goto inventory_use_healthpotion
if "%input%" == "drink health potion" goto inventory_use_healthpotion
if "%input%" == "potion" goto inventory_examine_healthpotion
if "%input%" == "examine potion" goto inventory_examine_healthpotion
if "%input%" == "look at potion" goto inventory_examine_healthpotion
if "%input%" == "use potion" goto inventory_use_healthpotion
if "%input%" == "drink potion" goto inventory_use_healthpotion
)

if %item_purplemushroom% GTR 0 (
if "%input%" == "examine purple mushroom" goto inventory_examine_purplemushroom
if "%input%" == "look at purple mushroom" goto inventory_examine_purplemushroom
if "%input%" == "purple mushroom" goto inventory_examine_purplemushroom
if "%input%" == "examine mushroom" gotoinventory_examine_purplemushroom
if "%input%" == "look at mushroom" gotoinventory_examine_purplemushroom
if "%input%" == "mushroom" goto inventory_examine_purplemushroom
if "%input%" == "examine purple mushrooms" goto inventory_examine_purplemushroom
if "%input%" == "look at purple mushrooms" goto inventory_examine_purplemushroom
if "%input%" == "purple mushrooms" goto inventory_examine_purplemushroom
if "%input%" == "examine mushrooms" goto inventory_examine_purplemushroom
if "%input%" == "look at mushrooms" goto inventory_examine_purplemushroom
if "%input%" == "mushrooms" goto inventory_examine_purplemushroom
)

if %item_ruinedboots% GTR 0 (
if "%input%" == "ruined boots" goto inventory_examine_ruinedboots
if "%input%" == "examine ruined boots" goto inventory_examine_ruinedboots
if "%input%" == "look at ruined boots" goto inventory_examine_ruinedboots
if "%input%" == "use ruined boots" goto inventory_use_ruinedboots
if "%input%" == "boots" goto inventory_examine_ruinedboots
if "%input%" == "examine boots" goto inventory_examine_ruinedboots
if "%input%" == "look at boots" goto inventory_examine_ruinedboots
if "%input%" == "use boots" goto inventory_use_ruinedboots
)

if %item_ruinedcap% GTR 0 (
if "%input%" == "ruined cap" goto inventory_examine_ruinedcap
if "%input%" == "examine ruined cap" goto inventory_examine_ruinedcap
if "%input%" == "look at ruined cap" goto inventory_examine_ruinedcap
if "%input%" == "use ruined cap" goto inventory_use_ruinedcap
if "%input%" == "cap" goto inventory_examine_ruinedcap
if "%input%" == "examine cap" goto inventory_examine_ruinedcap
if "%input%" == "look at cap" goto inventory_examine_ruinedcap
if "%input%" == "use cap" goto inventory_use_ruinedcap
)

if %item_ruinedchaps% GTR 0 (
if "%input%" == "ruined chaps" goto inventory_examine_ruinedchaps
if "%input%" == "examine ruined chaps" goto inventory_examine_ruinedchaps
if "%input%" == "look at ruined chaps" goto inventory_examine_ruinedchaps
if "%input%" == "use ruined chaps" goto inventory_use_ruinedchaps
if "%input%" == "chaps" goto inventory_examine_ruinedchaps
if "%input%" == "examine chaps" goto inventory_examine_ruinedchaps
if "%input%" == "look at chaps" goto inventory_examine_ruinedchaps
if "%input%" == "use chaps" goto inventory_use_ruinedchaps
)

if %item_ruinedtunic% GTR 0 (
if "%input%" == "ruined tunic" goto inventory_examine_ruinedtunic
if "%input%" == "examine ruined tunic" goto inventory_examine_ruinedtunic
if "%input%" == "look at ruined tunic" goto inventory_examine_ruinedtunic
if "%input%" == "use ruined tunic" goto inventory_use_ruinedtunic
if "%input%" == "tunic" goto inventory_examine_ruinedtunic
if "%input%" == "examine tunic" goto inventory_examine_ruinedtunic
if "%input%" == "look at tunic" goto inventory_examine_ruinedtunic
if "%input%" == "use tunic" goto inventory_use_ruinedtunic
)

if %item_torch% GTR 0 (
if "%input%" == "torch" goto inventory_examine_torch
if "%input%" == "look at torch" goto inventory_examine_torch
if "%input%" == "examine torch" goto inventory_examine_torch
if "%input%" == "use torch" goto inventory_use_torch
)

if %item_woodensword% GTR 0 (
if "%input%" == "wooden sword" goto inventory_examine_woodensword
if "%input%" == "examine wooden sword" goto inventory_examine_woodensword
if "%input%" == "look at wooden sword" goto inventory_examine_woodensword
if "%input%" == "use wooden sword" goto inventory_use_woodensword
if "%input%" == "sword" goto inventory_examine_woodensword
if "%input%" == "examine sword" goto inventory_examine_woodensword
if "%input%" == "look at sword" goto inventory_examine_woodensword
if "%input%" == "use sword" goto inventory_use_woodensword
)




if "%input%" == "i" (
set inventory=closed
if "%combat%" == "yes" goto returnCombat
goto returnLocation
)
if "%input%" == "inventory" (
set inventory=closed
if "%combat%" == "yes" goto returnCombat
goto returnLocation
)
if "%input%" == "close" (
set inventory=closed
if "%combat%" == "yes" goto returnCombat
goto returnLocation
)
if "%input%" == "close inventory" (
set inventory=closed
if "%combat%" == "yes" goto returnCombat
goto returnLocation
)
if "%input%" == "done" (
set inventory=closed
if "%combat%" == "yes" goto returnCombat
goto returnLocation
)
if "%input%" == "leave" (
set inventory=closed
if "%combat%" == "yes" goto returnCombat
goto returnLocation
)

goto commandError


:inventory_examine_goldmedal
echo.
echo    [You examine the gold medal.]
echo      ^> This familiar medal glimmers like hope.
goto inventory



:inventory_examine_apple
echo.
echo    [You examine the apple.]
echo      ^> Red and delicious.
echo      ^> "use apple" from inventory to recover up to 5 HP.
goto inventory

:inventory_use_apple
set /a HPdeficit=%maxHP% - %HP%
echo.
echo    [You eat an apple.]
if %HPdeficit% LSS 5 (
echo      ^> You recover %HPdeficit% HP.
set /a HP=%HP% + %HPdeficit%
)
if %HPdeficit% GTR 4 (
echo      ^> You recover 5 HP.
set /a HP=%HP% + 5
)
echo      ^> You have %HP%/%maxHP% HP.
set /a items=%items% - 1
set /a item_apple=%item_apple% - 1
goto inventory

:inventory_examine_bestfriendsnote
echo.
echo    [You read your best friend's note.]
echo.
echo    It explains everything.
echo      ^> "... So that's why we're headed to Pinesville down south.
echo      ^> "Yes... into the monsterlands.
echo      ^> "We'll have to make it through the dark swampy forest first.
echo      ^> "Join us if you can. Look out for goblins."
if %timesread_bestfriendsnote% LSS 1 (
echo      ^> You feel sad... yet understanding and inspired. --- :^)
set /a luck=%luck% + 3
set /a timesread_bestfriendsnote=%timesread_bestfriendsnote% + 1
)
if "%inventory%" == "closed" goto returnLocation
goto inventory

:inventory_examine_favoritesweater
echo.
echo    [You examine your favorite sweater.]
echo      ^> So cozy.
echo      ^> +1 attack
echo      ^> "use favorite sweater" from inventory to equip or unequip
if "%inventory%" == "closed" goto returnLocation
goto inventory

:inventory_use_favoritesweater
echo.
if "%chest%" == "favorite sweater" (
echo    [You unequip your favorite sweater.]
echo      ^> -1 attack
set chest=none
set /a attack=%attack% - 1
goto inventory
)
if "%chest%" == "none" (
echo    [You equip your favorite sweater.]
echo      ^> So cozy.
echo      ^> +1 attack
echo      ^> "use favorite sweater" from inventory to equip or unequip
set chest=favorite sweater
set /a attack=%attack% + 1
goto inventory
)
echo    [You try to equip an item, but the slot is full.]
echo      ^> "use" the other item to unequip it first.
goto inventory


:inventory_examine_goblinscimitar
echo.
echo    [You examine the goblin scimitar.]
echo      ^> A sharp, curved wooden blade.
echo      ^> 1-3 damage.
echo      ^> "use goblin scimitar" from inventory to equip or unequip
if "%inventory%" == "closed" goto returnLocation
goto inventory

:inventory_use_goblinscimitar
echo.
if "%weapon%" == "goblin scimitar" (
echo    [You unequip the goblin scimitar.]
set weapon=none
set damage_min=1
set damage_max=1
goto inventory
)
if "%weapon%" == "none" (
echo    [You equip the goblin scimitar.]
echo      ^> A sharp, curved wooden blade.
echo      ^> 1-3 damage.
echo      ^> "use goblin scimitar" from inventory to equip or unequip
set weapon=goblin scimitar
set damage_min=1
set damage_max=3
goto inventory
)
echo    [You try to equip an item, but the slot is full.]
echo      ^> "use" the other item to unequip it first.
goto inventory



:inventory_examine_healthpotion
echo.
echo    [You examine the health potion.]
echo      ^> A swirling, translucent red mixture.
echo      ^> "use health potion" from inventory to recover up to 10 HP.
if "%inventory%" == "closed" goto returnLocation
goto inventory

:inventory_use_healthpotion
set /a HPdeficit=%maxHP% - %HP%
echo.
echo    [You drink a health potion.]
if %HPdeficit% LSS 10 (
echo      ^> You recover %HPdeficit% HP.
set /a HP=%HP% + %HPdeficit%
)
if %HPdeficit% GTR 9 (
echo      ^> You recover 10 HP.
set /a HP=%HP% + 10
)
echo      ^> You have %HP%/%maxHP% HP.
set /a items=%items% - 1
set /a item_healthpotion=%item_healthpotion% - 1
goto inventory

:inventory_examine_purplemushroom
echo.
echo    [You examine the purple mushroom.]
echo      ^> The lumpy cap is violet with magenta spots. Don't eat it!
if "%inventory%" == "closed" goto returnLocation
goto inventory







:inventory_examine_ruinedboots
echo.
echo    [You examine the ruined boots.]
echo      ^> This foot protection is a little worse for wear.
echo      ^> +1 AC
echo      ^> "use ruined boots" from inventory to equip or unequip
if "%inventory%" == "closed" goto returnLocation
goto inventory

:inventory_use_ruinedboots
echo.
if "%feet%" == "ruined boots" (
echo    [You unequip the ruined boots.]
echo      ^> -1 AC
set feet=none
set /a AC=%AC% - 1
goto inventory
)
if "%feet%" == "none" (
echo    [You equip the ruined boots.]
echo      ^> This foot protection is a little worse for wear.
echo      ^> +1 AC
echo      ^> "use ruined boots" from inventory to equip or unequip
set feet=ruined boots
set /a AC=%AC% + 1
goto inventory
)
echo    [You try to equip an item, but the slot is full.]
echo      ^> "use" the other item to unequip it first.
goto inventory








:inventory_examine_ruinedcap
echo.
echo    [You examine the ruined cap.]
echo      ^> A tattered head covering riddled with holes and tears.
echo      ^> +1 AC
echo      ^> "use ruined cap" from inventory to equip or unequip
if "%inventory%" == "closed" goto returnLocation
goto inventory

:inventory_use_ruinedcap
echo.
if "%head%" == "ruined cap" (
echo    [You unequip the ruined cap.]
echo      ^> -1 AC
set head=none
set /a AC=%AC% - 1
goto inventory
)
if "%head%" == "none" (
echo    [You equip the ruined cap.]
echo      ^> A tattered head covering riddled with holes and tears.
echo      ^> +1 AC
echo      ^> "use ruined cap" from inventory to equip or unequip
set head=ruined cap
set /a AC=%AC% + 1
goto inventory
)
echo    [You try to equip an item, but the slot is full.]
echo      ^> "use" the other item to unequip it first.
goto inventory





:inventory_examine_ruinedchaps
echo.
echo    [You examine the ruined chaps.]
echo      ^> Padded leg protection, tattered and torn.
echo      ^> +1 AC
echo      ^> "use ruined chaps" from inventory to equip or unequip
if "%inventory%" == "closed" goto returnLocation
goto inventory

:inventory_use_ruinedchaps
echo.
if "%legs%" == "ruined cap" (
echo    [You unequip the ruined chaps.]
echo      ^> -1 AC
set legs=none
set /a AC=%AC% - 1
goto inventory
)
if "%legs%" == "none" (
echo    [You equip the ruined chaps.]
echo      ^> Padded leg protection, tattered and torn.
echo      ^> +1 AC
echo      ^> "use ruined chaps" from inventory to equip or unequip
set legs=ruined chaps
set /a AC=%AC% + 1
goto inventory
)
echo    [You try to equip an item, but the slot is full.]
echo      ^> "use" the other item to unequip it first.
goto inventory










:inventory_examine_ruinedtunic
echo.
echo    [You examine the ruined tunic.]
echo      ^> A tattered chest covering with X-shaped damage.
echo      ^> +1 AC
echo      ^> "use ruined tunic" from inventory to equip or unequip
if "%inventory%" == "closed" goto returnLocation
goto inventory

:inventory_use_ruinedtunic
echo.
if "%chest%" == "ruined tunic" (
echo    [You unequip the ruined tunic.]
echo      ^> -1 AC
set chest=none
set /a AC=%AC% - 1
goto inventory
)
if "%chest%" == "none" (
echo    [You equip the ruined tunic.]
echo      ^> A tattered chest covering with X-shaped damage.
echo      ^> +1 AC
echo      ^> "use ruined tunic" from inventory to equip or unequip
set chest=ruined tunic
set /a AC=%AC% + 1
goto inventory
)
echo    [You try to equip an item, but the slot is full.]
echo      ^> "use" the other item to unequip it first.
goto inventory




:inventory_examine_torch
echo.
echo    [You examine the torch.]
echo      ^> Held in the off hand as a light source.
echo      ^> "use torch" from inventory to equip or unequip
if "%inventory%" == "closed" goto returnLocation
goto inventory

:inventory_use_torch
echo.
if "%offhand%" == "torch" (
echo    [You extinguish and unequip the torch.]
set offhand=none
goto inventory
)
if "%offhand%" == "none" (
echo    [You light and equip the torch.]
echo      ^> Held in the off hand as a light source.
echo      ^> "use torch" from inventory to equip or unequip
set offhand=torch
goto inventory
)
echo    [You try to equip an item, but the slot is full.]
echo      ^> "use" the other item to unequip it first.
goto inventory


:inventory_examine_woodensword
echo.
echo    [You examine the wooden sword.]
echo      ^> Better than nothing.
echo      ^> 1-2 damage.
echo      ^> "use wooden sword" from inventory to equip or unequip
if "%inventory%" == "closed" goto returnLocation
goto inventory

:inventory_use_woodensword
echo.
if "%weapon%" == "wooden sword" (
echo    [You unequip the wooden sword.]
set weapon=none
set damage_min=1
set damage_max=1
goto inventory
)
if "%weapon%" == "none" (
echo    [You equip the wooden sword.]
echo      ^> Better than nothing.
echo      ^> 1-2 damage.
echo      ^> "use wooden sword" to unequip
set weapon=wooden sword
set damage_min=1
set damage_max=2
goto inventory
)
echo    [You try to equip an item, but the slot is full.]
echo      ^> "use" the other item to unequip it first.
goto inventory






















:combat_attack
echo.
echo    [You attack.]
set /a attackroll=1 + %RANDOM% %% (20 - 1 + 1)
set /a attackroll=%attackroll% + %attack%
if %attackroll% LSS %enemyAC% (
echo      ^> You miss.
if %agility% == %enemyagility% goto combat_enemyattack
if %agility% GTR %enemyagility% goto combat_enemyattack
if %enemyagility% GTR %agility% goto returnCombat
)
set /a damage=%damage_min% + %RANDOM% %% (%damage_max% - %damage_min% + 1)
set /a damage=%damage% + %strength%
set /a effectiveFinesse=%finesse% * 10
set /a critChance=1 + %RANDOM% %% (100 - 1 + 1)
set /a critChance=%critChance% - %effectiveFinesse%
if %critChance% LSS %luck% (
set /a damage=%damage% * 2
echo      ^> Critical hit!
)

echo      ^> You deal %damage% damage.
set /a enemyHP=%enemyHP% - %damage%
if %enemyHP% LSS 1 (
goto youwin
)
if %agility% GTR %enemyagility% goto combat_enemyattack
if %agility% == %enemyagility% goto combat_enemyattack
goto returnCombat

:combat_enemyattack
if "%enemy%" == "giant rat" goto giantrat_attack
if "%enemy%" == "goblin" goto goblin_attack
if "%enemy%" == "goblin chief" goto goblinchief_attack

:youwin
if "%enemy%" == "giant rat" goto youwin_giantrat
if "%enemy%" == "goblin" goto youwin_goblin
if "%enemy%" == "goblin chief" goto youwin_goblinchief

:youescape
echo.
if "%enemy%" == "goblin chief" goto youcantescape
if %agility% GTR %enemyagility% (
echo    [You escape!]
set combat=no
set enemy=none
goto returnLocation
)
:youcantescape
echo    [You can't escape!]
goto returnCombat






:encounter_giantrat
set combat=yes
set enemy=giant rat
set enemymaxHP_min=2
set enemymaxHP_max=4
set /a enemymaxHP=%enemymaxHP_min% + %RANDOM% %% (%enemymaxHP_max% - %enemymaxHP_min% + 1)
set enemyHP=%enemymaxHP%
set enemydamage_min=1
set enemydamage_max=1
set enemyattack=0
set enemyAC=5
set enemyagility=-2
:combat_giantrat
echo.
echo    You are fighting a giant rat (%enemyHP%/%enemymaxHP% HP).
echo      ^> You have %HP%/%maxHP% HP.
echo      ^> "a" to attack, "l" to look
echo      ^> "i" to open inventory, "s" to view stats.
echo      ^> "e" to escape
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "" goto 

if %agility% == %enemyagility% (
if "%input%" == "1" goto combat_attack
if "%input%" == "a" goto combat_attack
if "%input%" == "attack" goto combat_attack
)

if %agility% GTR %enemyagility% (
if "%input%" == "1" goto combat_attack
if "%input%" == "a" goto combat_attack
if "%input%" == "attack" goto combat_attack
)

if %enemyagility% GTR %agility% (
if "%input%" == "1" goto giantrat_attack
if "%input%" == "a" goto giantrat_attack
if "%input%" == "attack" goto giantrat_attack
)


if "%input%" == "run away" goto youescape
if "%input%" == "run" goto youescape
if "%input%" == "e" goto youescape
if "%input%" == "escape" goto youescape
if "%input%" == "flee" goto youescape
if "%input%" == "leave" goto youescape

if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look

if "%input%" == "look at giant rat" goto look
if "%input%" == "examine giant rat" goto look
if "%input%" == "look at rat" goto look
if "%input%" == "examine rat" goto look
goto combat_giantrat



:giantrat_attack
echo.
echo    [The giant rat attacks.]
set /a attackroll=1 + %RANDOM% %% (20 - 1 + 1)
set /a attackroll=%attackroll% + %enemyattack%
if %attackroll% LSS %AC% (
echo      ^> It misses.
if %agility% == %enemyagility% goto returnCombat
if %agility% GTR %enemyagility% goto returnCombat
if %enemyagility% GTR %agility% goto combat_attack
)
set /a damage=%enemydamage_min% + %RANDOM% %% (%enemydamage_max% - %enemydamage_min% + 1)

set /a critChance=1 + %RANDOM% %% (100 - 1 + 1)
if %critChance% LSS 6 (
set /a damage=%damage% * 2
echo      ^> Critical hit!
)

echo      ^> You take %damage% damage.
set /a HP=%HP% - %damage%
if %HP% LSS 1 (
goto youdie
)
if %enemyagility% GTR %agility% goto combat_attack
goto combat_giantrat

:youwin_giantrat
echo.
echo    [You win!]
echo      ^> The giant rat is slain.
echo      ^> You gain %enemymaxHP% exp.
set combat=no
set enemy=none
set /a exp=%exp% + %enemymaxHP%
goto checklevelup

:youdie
echo.
echo    [You die!]
echo      ^> Press any key to continue.
pause >nul
goto gameover








:encounter_goblin
set combat=yes
set enemy=goblin
set enemymaxHP_min=4
set enemymaxHP_max=7
set /a enemymaxHP=%enemymaxHP_min% + %RANDOM% %% (%enemymaxHP_max% - %enemymaxHP_min% + 1)
set enemyHP=%enemymaxHP%
set enemydamage_min=1
set enemydamage_max=2
set enemyattack=1
set enemyAC=7
set enemyagility=1
:combat_goblin
echo.
echo    You are fighting a goblin (%enemyHP%/%enemymaxHP% HP).
echo      ^> You have %HP%/%maxHP% HP.
echo      ^> "a" to attack, "l" to look
echo      ^> "i" to open inventory, "s" to view stats.
echo      ^> "e" to escape
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "" goto 

if %agility% == %enemyagility% (
if "%input%" == "1" goto combat_attack
if "%input%" == "a" goto combat_attack
if "%input%" == "attack" goto combat_attack
)

if %agility% GTR %enemyagility% (
if "%input%" == "1" goto combat_attack
if "%input%" == "a" goto combat_attack
if "%input%" == "attack" goto combat_attack
)

if %enemyagility% GTR %agility% (
if "%input%" == "1" goto goblin_attack
if "%input%" == "a" goto goblin_attack
if "%input%" == "attack" goto goblin_attack
)


if "%input%" == "run away" goto youescape
if "%input%" == "run" goto youescape
if "%input%" == "e" goto youescape
if "%input%" == "escape" goto youescape
if "%input%" == "flee" goto youescape
if "%input%" == "leave" goto youescape

if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look

if "%input%" == "look at goblin" goto look
if "%input%" == "examine goblin" goto look
goto combat_goblin



:goblin_attack
echo.
echo    [The goblin attacks.]
set /a attackroll=1 + %RANDOM% %% (20 - 1 + 1)
set /a attackroll=%attackroll% + %enemyattack%
if %attackroll% LSS %AC% (
echo      ^> It misses.
if %agility% == %enemyagility% goto returnCombat
if %agility% GTR %enemyagility% goto returnCombat
if %enemyagility% GTR %agility% goto combat_attack
)
set /a damage=%enemydamage_min% + %RANDOM% %% (%enemydamage_max% - %enemydamage_min% + 1)

set /a critChance=1 + %RANDOM% %% (100 - 1 + 1)
if %critChance% LSS 12 (
set /a damage=%damage% * 2
echo      ^> Critical hit!
)

echo      ^> You take %damage% damage.
set /a HP=%HP% - %damage%
if %HP% LSS 1 (
goto youdie
)
if %enemyagility% GTR %agility% goto combat_attack
goto combat_goblin

:youwin_goblin
echo.
echo    [You win!]
echo      ^> The goblin is slain.
echo      ^> You gain %enemymaxHP% exp.
echo.
echo    [You take one goblin scimitar.]
echo      ^> "i" to open inventory
set /a items=%items% + 1
set /a item_goblinscimitar=%item_goblinscimitar% + 1
set combat=no
set enemy=none
set /a exp=%exp% + %enemymaxHP%
goto checklevelup










:encounter_goblinchief
set combat=yes
set enemy=goblin chief
set enemymaxHP_min=12
set enemymaxHP_max=15
set /a enemymaxHP=%enemymaxHP_min% + %RANDOM% %% (%enemymaxHP_max% - %enemymaxHP_min% + 1)
set enemyHP=%enemymaxHP%
set enemydamage_min=1
set enemydamage_max=3
set enemyattack=2
set enemyAC=9
set enemyagility=-1
:combat_goblinchief
echo.
echo    You are fighting the goblin chief (%enemyHP%/%enemymaxHP% HP).
echo      ^> You have %HP%/%maxHP% HP.
echo      ^> He wears a shiny gold medal.
echo      ^> "a" to attack, "l" to look
echo      ^> "i" to open inventory, "s" to view stats.
echo      ^> "e" to escape
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "" goto 

if %agility% == %enemyagility% (
if "%input%" == "1" goto combat_attack
if "%input%" == "a" goto combat_attack
if "%input%" == "attack" goto combat_attack
)

if %agility% GTR %enemyagility% (
if "%input%" == "1" goto combat_attack
if "%input%" == "a" goto combat_attack
if "%input%" == "attack" goto combat_attack
)

if %enemyagility% GTR %agility% (
if "%input%" == "1" goto goblinchief_attack
if "%input%" == "a" goto goblinchief_attack
if "%input%" == "attack" goto goblinchief_attack
)

if "%input%" == "run away" goto youescape
if "%input%" == "run" goto youescape
if "%input%" == "e" goto youescape
if "%input%" == "escape" goto youescape
if "%input%" == "flee" goto youescape
if "%input%" == "leave" goto youescape

if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look

if "%input%" == "look at goblin" goto look
if "%input%" == "examine goblin" goto look
if "%input%" == "look at goblin chief" goto look
if "%input%" == "examine goblin chief" goto look
goto combat_goblinchief



:goblinchief_attack

set /a enemyspecialmovechance=1 + %RANDOM% %% (10 - 1 + 1)
if %enemyspecialmovechance% LSS 4 goto goblinchief_specialattack

echo.
echo    [The goblin chief attacks.]
set /a attackroll=1 + %RANDOM% %% (20 - 1 + 1)
set /a attackroll=%attackroll% + %enemyattack%
if %attackroll% LSS %AC% (
echo      ^> It misses.
if %agility% == %enemyagility% goto returnCombat
if %agility% GTR %enemyagility% goto returnCombat
if %enemyagility% GTR %agility% goto combat_attack
)
set /a damage=%enemydamage_min% + %RANDOM% %% (%enemydamage_max% - %enemydamage_min% + 1)

set /a critChance=1 + %RANDOM% %% (100 - 1 + 1)
if %critChance% LSS 19 (
set /a damage=%damage% * 2
echo      ^> Critical hit!
)

echo      ^> You take %damage% damage.
set /a HP=%HP% - %damage%
if %HP% LSS 1 (
goto youdie
)
if %enemyagility% GTR %agility% goto combat_attack
goto combat_goblinchief

:goblinchief_specialattack
echo.
echo    [The goblin chief attacks twice!]
set /a attackroll=1 + %RANDOM% %% (20 - 1 + 1)
set /a attackroll=%attackroll% + %enemyattack%
if %attackroll% LSS %AC% (
echo      ^> The first attack misses.
goto goblinchief_specialattack_attack2
)
set /a damage=%enemydamage_min% + %RANDOM% %% (%enemydamage_max% - %enemydamage_min% + 1)

set /a critChance=1 + %RANDOM% %% (100 - 1 + 1)
if %critChance% LSS 19 (
set /a damage=%damage% * 2
echo      ^> Critical hit!
)

echo      ^> The first attack deals %damage% damage.
set /a HP=%HP% - %damage%
:goblinchief_specialattack_attack2
set /a attackroll=1 + %RANDOM% %% (20 - 1 + 1)
set /a attackroll=%attackroll% + %enemyattack%
if %attackroll% LSS %AC% (
echo      ^> The second attack misses.
if %agility% == %enemyagility% goto returnCombat
if %agility% GTR %enemyagility% goto returnCombat
if %enemyagility% GTR %agility% goto combat_attack
)
set /a damage=%enemydamage_min% + %RANDOM% %% (%enemydamage_max% - %enemydamage_min% + 1)

set /a critChance=1 + %RANDOM% %% (100 - 1 + 1)
if %critChance% LSS 19 (
set /a damage=%damage% * 2
echo      ^> Critical hit!
)

echo      ^> The second attack deals %damage% damage.
set /a HP=%HP% - %damage%

if %HP% LSS 1 (
goto youdie
)
if %enemyagility% GTR %agility% goto combat_attack
goto combat_goblinchief

:youwin_goblinchief
echo.
echo    [You win!]
echo      ^> The goblin chief is slain.
echo      ^> You gain %enemymaxHP% exp.
echo.
echo    [You take the familiar gold medal and two goblin scimitars.]
echo      ^> "i" to open inventory
set /a items=%items% + 3
set /a item_goldmedal=%item_goldmedal% + 1
set /a item_goblinscimitar=%item_goblinscimitar% + 2
set goblinchief=dead
set combat=no
set enemy=none
set /a exp=%exp% + %enemymaxHP%
goto checklevelup









:tile_route1_1
if "%location%" == "route1_2" (
echo.
echo    [You walk south and exit the peaceful forest.]
)
if "%location%" == "hometown_north" (
echo.
echo    [You walk north and exit the village.]
)
set location=route1_1
echo.
echo  ~ You are in a peaceful field near your hometown.
echo      ^> To the north is a peaceful forest.
echo      ^> To the south is your village.
if "%firsttime_tile_route1_1%" == "no" (
echo      ^> "h" for help
echo      ^> "l" to look around
set firsttime_tile_route1_1=yes
)
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "" goto 

if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look
if "%input%" == "h" goto help
if "%input%" == "help" goto help

if "%input%" == "north" goto tile_route1_2
if "%input%" == "go north" goto tile_route1_2
if "%input%" == "forest" goto tile_route1_2
if "%input%" == "go forest" goto tile_route1_2
if "%input%" == "go to forest" goto tile_route1_2
if "%input%" == "enter forest" goto tile_route1_2
if "%input%" == "peaceful forest" goto tile_route1_2
if "%input%" == "go peaceful forest" goto tile_route1_2
if "%input%" == "go to peaceful forest" goto tile_route1_2
if "%input%" == "enter peaceful forest" goto tile_route1_2

if "%input%" == "south" goto tile_hometown_north
if "%input%" == "go south" goto tile_hometown_north
if "%input%" == "enter village" goto tile_hometown_north
if "%input%" == "go to village" goto tile_hometown_north
if "%input%" == "enter hometown" goto tile_hometown_north
if "%input%" == "go to hometown" goto tile_hometown_north
if "%input%" == "noInput" goto returnLocation
goto commandError


:route1_2_randomeventcheck
set location=route1_2
set /a randomeventchance=1 + %RANDOM% %% (100 - 1 + 1)

if %randomeventchance% LSS 15 (
if "%route1_2_birdsong%" == "unheard" (
set route1_2_birdsong=heard
echo      ^> A calm and inspiring bird song echoes through the peaceful forest. --- :^)
set /a luck=%luck% + 4
)
)
if %randomeventchance% GTR 63 (
if "%route1_2_ruinedboots%" == "present" (
echo      ^> Hey, it's your old boots! You used to play here all the time. --- :^)
echo      ^> Wonder if they still fit...
echo.
echo    [You take a pair of ruined boots.]
echo      ^> "i" to open inventory
set route1_2_ruinedboots=absent
set /a luck=%luck% + 3
set /a items=%items% + 1
set /a item_ruinedboots=%item_ruinedboots% + 1
goto tile_route1_2_continued
)
if "%route1_2_ruinedcap%" == "present" (
echo      ^> An abandoned bird nest lies at the foot of a tree.
echo      ^> Upon closer inspection, it appears to be built around an old cap.
echo.
echo    [You take one ruined cap.]
echo      ^> "i" to open inventory
set route1_2_ruinedcap=absent
set /a items=%items% + 1
set /a item_ruinedcap=%item_ruinedcap% + 1
)
)
goto tile_route1_2_continued


:tile_route1_2
if "%location%" == "route1_1" (
echo.
echo    [You walk north and enter the peaceful forest.]
goto route1_2_randomeventcheck
)
if "%location%" == "route1_3" (
echo.
echo    [You walk south within the peaceful forest, and the trees thin out.]
goto route1_2_randomeventcheck
)
:tile_route1_2_continued
set location=route1_2
echo.
echo  ~ You are in a peaceful forest, far north of your village.
echo      ^> To the north the forest thickens.
echo      ^> To the south the forest opens up into a peaceful field.
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "" goto 

if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look
if "%input%" == "h" goto help
if "%input%" == "help" goto help

if "%input%" == "north" goto tile_route1_3
if "%input%" == "go north" goto tile_route1_3
if "%input%" == "south" goto tile_route1_1
if "%input%" == "go south" goto tile_route1_1
if "%input%" == "go to field" goto tile_route1_1
if "%input%" == "field" goto tile_route1_1
if "%input%" == "enter field" goto tile_route1_1
if "%input%" == "go to peaceful field" goto tile_route1_1
if "%input%" == "peaceful field" goto tile_route1_1
if "%input%" == "enter peaceful field" goto tile_route1_1
if "%input%" == "leave" goto tile_route1_1
if "%input%" == "exit" goto tile_route1_1
if "%input%" == "leave forest" goto tile_route1_1
if "%input%" == "exit forest" goto tile_route1_1
if "%input%" == "leave peaceful forest" goto tile_route1_1
if "%input%" == "exit peaceful forest" goto tile_route1_1

if "%input%" == "noInput" goto returnLocation
goto commandError

:route1_3_restoration
set /a HPdeficit=%maxHP% - %HP%
echo      ^> You recover %HPdeficit% HP.
set /a HP=%maxHP%
goto route1_3_postrestoration

:tile_route1_3
echo.
if "%location%" == "route1_2" (
echo    [You walk north into the deepest part of the peaceful forest.]
if %HP% LSS %maxHP% goto route1_3_restoration
)
:route1_3_postrestoration
set location=route1_3
echo.
echo  ~ You are in the deepest part of a peaceful forest, far north of your village.
echo      ^> The forest extends to the south.
if "%firsttime_tile_route1_3%" == "no" (
echo      ^> "h" for help
echo      ^> "l" to look around
set firsttime_tile_route1_3=yes
)
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "" goto 

if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look
if "%input%" == "h" goto help
if "%input%" == "help" goto help

if "%input%" == "leave" goto tile_route1_2
if "%input%" == "south" goto tile_route1_2
if "%input%" == "go south" goto tile_route1_2
if "%input%" == "noInput" goto returnLocation
goto commandError





























:hometown_north_randomencountercheck
set /a randomencounterchance=1 + %RANDOM% %% (100 - 1 + 1)
if "%firstratencounter%" == "yes" (
if %randomencounterchance% LSS 21 (
echo      ^> A giant rat appears!
set location=hometown_north
goto encounter_giantrat
)
)
goto tile_hometown_north_continued


:tile_hometown_north
if "%location%" == "route1_1" (
echo.
echo    [You walk south and enter the village.]
goto hometown_north_randomencountercheck
)
if "%location%" == "hometown_south" (
echo.
echo    [You walk north within the village.]
goto hometown_north_randomencountercheck
)
if "%location%" == "hometown_potionshop" (
echo.
echo    [You exit the potion shop. The dusty door chimes tinkle solemnly.]
goto hometown_north_randomencountercheck
)
if "%location%" == "hometown_myhouse" (
echo.
echo    [You exit your house.]
goto hometown_north_randomencountercheck
)
:tile_hometown_north_continued
set location=hometown_north
echo.
echo  @ You are in your hometown, on the north side.
echo      ^> To the north is a peaceful field.
echo      ^> To the south the village extends.
if "%firsttime_tile_hometown_north%" == "no" (
echo      ^> "h" for help
echo      ^> "l" to look around
set firsttime_tile_hometown_north=yes
)
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "" goto 

if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look
if "%input%" == "h" goto help
if "%input%" == "help" goto help

if "%input%" == "leave" goto tile_route1_1
if "%input%" == "north" goto tile_route1_1
if "%input%" == "go north" goto tile_route1_1
if "%input%" == "field" goto tile_route1_1
if "%input%" == "go to field" goto tile_route1_1
if "%input%" == "enter field" goto tile_route1_1
if "%input%" == "peaceful field" goto tile_route1_1
if "%input%" == "go to peaceful field" goto tile_route1_1
if "%input%" == "enter peaceful field" goto tile_route1_1
if "%input%" == "south" goto tile_hometown_south
if "%input%" == "go south" goto tile_hometown_south

if "%input%" == "potion shop" goto tile_hometown_potionshop
if "%input%" == "enter potion shop" goto tile_hometown_potionshop
if "%input%" == "go to potion shop" goto tile_hometown_potionshop
if "%input%" == "go in potion shop" goto tile_hometown_potionshop
if "%input%" == "shop" goto tile_hometown_potionshop
if "%input%" == "enter shop" goto tile_hometown_potionshop
if "%input%" == "go to shop" goto tile_hometown_potionshop
if "%input%" == "go in shop" goto tile_hometown_potionshop

if "%input%" == "house" goto tile_hometown_myhouse
if "%input%" == "go to house" goto tile_hometown_myhouse
if "%input%" == "go in house" goto tile_hometown_myhouse
if "%input%" == "enter house" goto tile_hometown_myhouse
if "%input%" == "my house" goto tile_hometown_myhouse
if "%input%" == "enter my house" goto tile_hometown_myhouse
if "%input%" == "go to my house" goto tile_hometown_myhouse
if "%input%" == "go in my house" goto tile_hometown_myhouse
if "%input%" == "home" goto tile_hometown_myhouse
if "%input%" == "go home" goto tile_hometown_myhouse
if "%input%" == "enter home" goto tile_hometown_myhouse

if "%input%" == "noInput" goto returnLocation
goto commandError


:tile_hometown_potionshop
if "%location%" == "hometown_north" (
echo.
echo    [You enter the potion shop. The dusty door chimes tinkle solemnly.]
)
set location=hometown_potionshop
echo.
echo  * You are inside the potion shop in your hometown
echo      ^> From here you can leave.
if "%firsttime_tile_hometown_potionshop%" == "no" (
echo      ^> "h" for help
echo      ^> "l" to look around
set firsttime_tile_hometown_potionshop=yes
)
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "" goto 

if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look
if "%input%" == "h" goto help
if "%input%" == "help" goto help

if "%hometown_potionshop_potions%" == "present" (
if "%input%" == "take potion" goto hometown_potionshop_takepotion
if "%input%" == "take potions" goto hometown_potionshop_takepotion
if "%input%" == "take 2 potions" goto hometown_potionshop_takepotion
if "%input%" == "take two potions" goto hometown_potionshop_takepotion
if "%input%" == "take health potion" goto hometown_potionshop_takepotion
if "%input%" == "take health potions" goto hometown_potionshop_takepotion
if "%input%" == "take 2 health potions" goto hometown_potionshop_takepotion
if "%input%" == "take two health potions" goto hometown_potionshop_takepotion

if "%input%" == "potion" goto inventory_examine_healthpotion
if "%input%" == "potions" goto inventory_examine_healthpotion
if "%input%" == "health potion" goto inventory_examine_healthpotion
if "%input%" == "health potions" goto inventory_examine_healthpotion
if "%input%" == "look potion" goto inventory_examine_healthpotion
if "%input%" == "look potions" goto inventory_examine_healthpotion
if "%input%" == "look health potion" goto inventory_examine_healthpotion
if "%input%" == "look health potions" goto inventory_examine_healthpotion
if "%input%" == "look at potion" goto inventory_examine_healthpotion
if "%input%" == "look at potions" goto inventory_examine_healthpotion
if "%input%" == "look at health potion" goto inventory_examine_healthpotion
if "%input%" == "look at health potions" goto inventory_examine_healthpotion
if "%input%" == "examine potion" goto inventory_examine_healthpotion
if "%input%" == "examine potions" goto inventory_examine_healthpotion
if "%input%" == "examine health potion" goto inventory_examine_healthpotion
if "%input%" == "examine health potions" goto inventory_examine_healthpotion
)

if "%input%" == "leave" goto tile_hometown_north
if "%input%" == "exit" goto tile_hometown_north
if "%input%" == "leave potion shop" goto tile_hometown_north
if "%input%" == "exit potion shop" goto tile_hometown_north
if "%input%" == "leave shop" goto tile_hometown_north
if "%input%" == "exit shop" goto tile_hometown_north
if "%input%" == "noInput" goto returnLocation
goto commandError

:hometown_potionshop_takepotion
echo.
echo    [You take two health potions.]
echo      ^> "i" to open inventory
set hometown_potionshop_potions=absent
set /a items=%items% + 2
set /a item_healthpotion=%item_healthpotion% + 2
goto returnLocation





:tile_hometown_myhouse
if "%location%" == "hometown_north" (
echo.
echo    [You enter your house.]
)
set location=hometown_myhouse
echo.
echo  * You are inside your house in your hometown.
echo      ^> From here you can leave.
if "%firsttime_tile_hometown_myhouse%" == "no" (
echo      ^> "h" for help
echo      ^> "l" to look around
set firsttime_tile_hometown_myhouse=yes
)
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "" goto 

if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look
if "%input%" == "h" goto help
if "%input%" == "help" goto help

if "%hometown_myhouse_favoritesweater%" == "present" (
if "%input%" == "take sweater" goto hometown_myhouse_favoritesweater
if "%input%" == "take favorite sweater" goto hometown_myhouse_favoritesweater

if "%input%" == "sweater" goto inventory_examine_favoritesweater
if "%input%" == "examine sweater" goto inventory_examine_favoritesweater
if "%input%" == "look sweater" goto inventory_examine_favoritesweater
if "%input%" == "look at sweater" goto inventory_examine_favoritesweater
if "%input%" == "favorite sweater" goto inventory_examine_favoritesweater
if "%input%" == "examine favorite sweater" goto inventory_examine_favoritesweater
if "%input%" == "look favorite sweater" goto inventory_examine_favoritesweater
if "%input%" == "look at favorite sweater" goto inventory_examine_favoritesweater
)

if "%input%" == "leave" goto tile_hometown_north
if "%input%" == "exit" goto tile_hometown_north
if "%input%" == "leave house" goto tile_hometown_north
if "%input%" == "exit house" goto tile_hometown_north
if "%input%" == "leave my house" goto tile_hometown_north
if "%input%" == "exit my house" goto tile_hometown_north
if "%input%" == "noInput" goto returnLocation
goto commandError

:hometown_myhouse_favoritesweater
echo.
echo    [You take 1 favorite sweater.]
echo      ^> "i" to open inventory
set hometown_myhouse_favoritesweater=absent
set /a items=%items% + 1
set /a item_favoritesweater=%item_favoritesweater% + 1
goto returnLocation




:hometown_south_randomencountercheck
if "%location%" == "hometown_weaponshop" (
if "%firstratencounter%" == "no" (
echo      ^> A giant rat appears!
set location=hometown_south
set firstratencounter=yes
goto encounter_giantrat
)
)

set /a randomencounterchance=1 + %RANDOM% %% (10 - 1 + 1)
if "%firstratencounter%" == "yes" (
if %randomencounterchance% == 1 (
echo      ^> A giant rat appears!
set location=hometown_south
goto encounter_giantrat
)
)
goto tile_hometown_south_continued

:tile_hometown_south
if "%location%" == "route2_1" (
echo.
echo    [You walk north and enter the village.]
goto hometown_south_randomencountercheck
)
if "%location%" == "hometown_north" (
echo.
echo    [You walk south within the village.]
goto hometown_south_randomencountercheck
)
if "%location%" == "hometown_weaponshop" (
echo.
echo    [You exit the weapon shop.]
goto hometown_south_randomencountercheck
)
if "%location%" == "hometown_bestfriendshouse" (
echo.
echo    [You exit your best friend's house.]
goto hometown_south_randomencountercheck
)

:tile_hometown_south_continued
set location=hometown_south
echo.
echo  @ You are in your hometown, on the south side.
echo      ^> To the north the village extends.
echo      ^> To the south is a bridge.
if "%firsttime_tile_hometown_south%" == "no" (
echo      ^> "h" for help
echo      ^> "l" to look around
set firsttime_tile_hometown_south=yes
)
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "" goto 

if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look
if "%input%" == "h" goto help
if "%input%" == "help" goto help

if "%input%" == "north" goto tile_hometown_north
if "%input%" == "go north" goto tile_hometown_north
if "%input%" == "leave" goto tile_route2_1
if "%input%" == "south" goto tile_route2_1
if "%input%" == "go south" goto tile_route2_1
if "%input%" == "weapon shop" goto tile_hometown_weaponshop
if "%input%" == "enter weapon shop" goto tile_hometown_weaponshop
if "%input%" == "go to weapon shop" goto tile_hometown_weaponshop
if "%input%" == "go in weapon shop" goto tile_hometown_weaponshop
if "%input%" == "shop" goto tile_hometown_weaponshop
if "%input%" == "enter shop" goto tile_hometown_weaponshop
if "%input%" == "go to shop" goto tile_hometown_weaponshop
if "%input%" == "go in shop" goto tile_hometown_weaponshop

if "%input%" == "house" goto tile_hometown_bestfriendshouse
if "%input%" == "go to house" goto tile_hometown_bestfriendshouse
if "%input%" == "go in house" goto tile_hometown_bestfriendshouse
if "%input%" == "friend's house" goto tile_hometown_bestfriendshouse
if "%input%" == "enter friend's house" goto tile_hometown_bestfriendshouse
if "%input%" == "go to friend's house" goto tile_hometown_bestfriendshouse
if "%input%" == "go in friend's house" goto tile_hometown_bestfriendshouse
if "%input%" == "friends house" goto tile_hometown_bestfriendshouse
if "%input%" == "enter friends house" goto tile_hometown_bestfriendshouse
if "%input%" == "go to friends house" goto tile_hometown_bestfriendshouse
if "%input%" == "go in friends house" goto tile_hometown_bestfriendshouse
if "%input%" == "best friend's house" goto tile_hometown_bestfriendshouse
if "%input%" == "enter best friend's house" goto tile_hometown_bestfriendshouse
if "%input%" == "go to best friend's house" goto tile_hometown_bestfriendshouse
if "%input%" == "go in best friend's house" goto tile_hometown_bestfriendshouse
if "%input%" == "best friends house" goto tile_hometown_bestfriendshouse
if "%input%" == "enter best friends house" goto tile_hometown_bestfriendshouse
if "%input%" == "go to best friends house" goto tile_hometown_bestfriendshouse
if "%input%" == "go in best friends house" goto tile_hometown_bestfriendshouse
if "%input%" == "my friend's house" goto tile_hometown_bestfriendshouse
if "%input%" == "enter my friend's house" goto tile_hometown_bestfriendshouse
if "%input%" == "go to my friend's house" goto tile_hometown_bestfriendshouse
if "%input%" == "go in my friend's house" goto tile_hometown_bestfriendshouse
if "%input%" == "my friends house" goto tile_hometown_bestfriendshouse
if "%input%" == "enter my friends house" goto tile_hometown_bestfriendshouse
if "%input%" == "go to my friends house" goto tile_hometown_bestfriendshouse
if "%input%" == "go in my friends house" goto tile_hometown_bestfriendshouse
if "%input%" == "my best friend's house" goto tile_hometown_bestfriendshouse
if "%input%" == "enter my best friend's house" goto tile_hometown_bestfriendshouse
if "%input%" == "go to my best friend's house" goto tile_hometown_bestfriendshouse
if "%input%" == "go in my best friend's house" goto tile_hometown_bestfriendshouse
if "%input%" == "my best friends house" goto tile_hometown_bestfriendshouse
if "%input%" == "enter my best friends house" goto tile_hometown_bestfriendshouse
if "%input%" == "go to my best friends house" goto tile_hometown_bestfriendshouse
if "%input%" == "go in my best friends house" goto tile_hometown_bestfriendshouse
if "%input%" == "noInput" goto returnLocation
goto commandError

:tile_hometown_weaponshop
if "%location%" == "hometown_south" (
echo.
echo    [You enter the weapon shop.]
)
set location=hometown_weaponshop
echo.
echo  * You are inside the weapon shop in your hometown.
echo      ^> From here you can leave.
if "%firsttime_tile_hometown_weaponshop%" == "no" (
echo      ^> "h" for help
echo      ^> "l" to look around
set firsttime_tile_hometown_weaponshop=yes
)
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "" goto 

if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look
if "%input%" == "h" goto help
if "%input%" == "help" goto help

if "%hometown_weaponshop_woodensword%" == "present" (
if "%input%" == "take sword" goto hometown_weaponshop_woodensword
if "%input%" == "take wooden sword" goto hometown_weaponshop_woodensword

if "%input%" == "sword" goto inventory_examine_woodensword
if "%input%" == "examine sword" goto inventory_examine_woodensword
if "%input%" == "look sword" goto inventory_examine_woodensword
if "%input%" == "look at sword" goto inventory_examine_woodensword
if "%input%" == "wooden sword" goto inventory_examine_woodensword
if "%input%" == "examine wooden sword" goto inventory_examine_woodensword
if "%input%" == "look wooden sword" goto inventory_examine_woodensword
if "%input%" == "look at wooden sword" goto inventory_examine_woodensword
)


if "%input%" == "leave" goto tile_hometown_south
if "%input%" == "exit" goto tile_hometown_south
if "%input%" == "leave weapon shop" goto tile_hometown_south
if "%input%" == "exit weapon shop" goto tile_hometown_south
if "%input%" == "leave shop" goto tile_hometown_south
if "%input%" == "exit shop" goto tile_hometown_south

if "%input%" == "noInput" goto returnLocation
goto commandError

:hometown_weaponshop_woodensword
echo.
echo    [You take one wooden sword.]
echo      ^> "i" to open inventory
set hometown_weaponshop_woodensword=absent
set /a items=%items% + 1
set /a item_woodensword=%item_woodensword% + 1
goto returnLocation







:tile_hometown_bestfriendshouse
if "%location%" == "hometown_south" (
echo.
echo    [You enter your best friend's house.]
)
set location=hometown_bestfriendshouse
echo.
echo  * You are inside your best friend's house, in your hometown.
echo      ^> From here you can leave.
if "%firsttime_tile_hometown_bestfriendshouse%" == "no" (
echo      ^> "h" for help
echo      ^> "l" to look around
set firsttime_tile_hometown_bestfriendshouse=yes
)
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "" goto 

if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look
if "%input%" == "h" goto help
if "%input%" == "help" goto help

if "%hometown_bestfriendshouse_note%" == "present" (
if "%input%" == "take note" goto hometown_bestfriendshouse_note
if "%input%" == "take friends note" goto hometown_bestfriendshouse_note
if "%input%" == "take best friends note" goto hometown_bestfriendshouse_note
if "%input%" == "take my friends note" goto hometown_bestfriendshouse_note
if "%input%" == "take my best friends note" goto hometown_bestfriendshouse_note
if "%input%" == "take friend's note" goto hometown_bestfriendshouse_note
if "%input%" == "take best friend's note" goto hometown_bestfriendshouse_note
if "%input%" == "take my friend's note" goto hometown_bestfriendshouse_note
if "%input%" == "take my best friend's note" goto hometown_bestfriendshouse_note


if "%input%" == "note" goto inventory_examine_bestfriendsnote
if "%input%" == "look at note" goto inventory_examine_bestfriendsnote
if "%input%" == "examine note" goto inventory_examine_bestfriendsnote
if "%input%" == "read note" goto inventory_examine_bestfriendsnote
if "%input%" == "use note" goto inventory_examine_bestfriendsnote

if "%input%" == "friends note" goto inventory_examine_bestfriendsnote
if "%input%" == "examine friends note" goto inventory_examine_bestfriendsnote
if "%input%" == "look at friends note" goto inventory_examine_bestfriendsnote
if "%input%" == "read friends note" goto inventory_examine_bestfriendsnote
if "%input%" == "use friends note" goto inventory_examine_bestfriendsnote

if "%input%" == "best friends note" goto inventory_examine_bestfriendsnote
if "%input%" == "examine best friends note" goto inventory_examine_bestfriendsnote
if "%input%" == "look at best friends note" goto inventory_examine_bestfriendsnote
if "%input%" == "read best friends note" goto inventory_examine_bestfriendsnote
if "%input%" == "use best friends note" goto inventory_examine_bestfriendsnote

if "%input%" == "my best friends note" goto inventory_examine_bestfriendsnote
if "%input%" == "look at my best friends note" goto inventory_examine_bestfriendsnote
if "%input%" == "read my best friends note" goto inventory_examine_bestfriendsnote
if "%input%" == "use my best friends note" goto inventory_examine_bestfriendsnote
if "%input%" == "examine my best friends note" goto inventory_examine_bestfriendsnote
if "%input%" == "look at my best friends note" goto inventory_examine_bestfriendsnote
if "%input%" == "read my best friends note" goto inventory_examine_bestfriendsnote
if "%input%" == "use my best friends note" goto inventory_examine_bestfriendsnote

if "%input%" == "friend's note" goto inventory_examine_bestfriendsnote
if "%input%" == "examine friend's note" goto inventory_examine_bestfriendsnote
if "%input%" == "look at friend's note" goto inventory_examine_bestfriendsnote
if "%input%" == "read friend's note" goto inventory_examine_bestfriendsnote
if "%input%" == "use friend's note" goto inventory_examine_bestfriendsnote

if "%input%" == "best friend's note" goto inventory_examine_bestfriendsnote
if "%input%" == "examine best friend's note" goto inventory_examine_bestfriendsnote
if "%input%" == "look at best friend's note" goto inventory_examine_bestfriendsnote
if "%input%" == "read best friend's note" goto inventory_examine_bestfriendsnote
if "%input%" == "use best friend's note" goto inventory_examine_bestfriendsnote

if "%input%" == "my best friend's note" goto inventory_examine_bestfriendsnote
if "%input%" == "examine my best friend's note" goto inventory_examine_bestfriendsnote
if "%input%" == "look at my best friend's note" goto inventory_examine_bestfriendsnote
if "%input%" == "read my best friend's note" goto inventory_examine_bestfriendsnote
if "%input%" == "use my best friend's note" goto inventory_examine_bestfriendsnote




)

if "%input%" == "leave" goto tile_hometown_south
if "%input%" == "exit" goto tile_hometown_south
if "%input%" == "leave house" goto tile_hometown_south
if "%input%" == "exit house" goto tile_hometown_south
if "%input%" == "leave friends house" goto tile_hometown_south
if "%input%" == "exit friends house" goto tile_hometown_south
if "%input%" == "leave best friends house" goto tile_hometown_south
if "%input%" == "exit best friends house" goto tile_hometown_south
if "%input%" == "leave friend's house" goto tile_hometown_south
if "%input%" == "exit friend's house" goto tile_hometown_south
if "%input%" == "leave best friend's house" goto tile_hometown_south
if "%input%" == "exit best friend's house" goto tile_hometown_south
if "%input%" == "leave my friends house" goto tile_hometown_south
if "%input%" == "exit my friends house" goto tile_hometown_south
if "%input%" == "leave my best friends house" goto tile_hometown_south
if "%input%" == "exit my best friends house" goto tile_hometown_south
if "%input%" == "leave my friend's house" goto tile_hometown_south
if "%input%" == "exit my friend's house" goto tile_hometown_south
if "%input%" == "leave my best friend's house" goto tile_hometown_south
if "%input%" == "exit my best friend's house" goto tile_hometown_south

if "%input%" == "noInput" goto returnLocation
goto commandError

:hometown_bestfriendshouse_note
echo.
echo    [You take your best friend's note.]
echo      ^> "i" to open inventory
set hometown_bestfriendshouse_note=absent
set /a items=%items% + 1
set /a item_bestfriendsnote=%item_bestfriendsnote% + 1
goto returnLocation





:tile_route2_1
if "%location%" == "hometown_south" (
echo.
echo    [You walk south and exit the village.]
)
if "%location%" == "route2_2" (
echo.
echo    [You walk north, onto a large bridge.]
)
set location=route2_1
echo.
echo  ~ You are on the large bridge between your village and the monsterlands.
echo      ^> To the north is your village.
echo      ^> To the south are the monsterlands.
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "" goto 

if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look
if "%input%" == "h" goto help
if "%input%" == "help" goto help

if "%input%" == "north" goto tile_hometown_south
if "%input%" == "go north" goto tile_hometown_south
if "%input%" == "south" goto tile_route2_2
if "%input%" == "go south" goto tile_route2_2
if "%input%" == "leave" goto tile_route2_2
if "%input%" == "monsterlands" goto tile_route2_2
if "%input%" == "go monsterlands" goto tile_route2_2
if "%input%" == "enter monsterlands" goto tile_route2_2
if "%input%" == "monster lands" goto tile_route2_2
if "%input%" == "go monster lands" goto tile_route2_2
if "%input%" == "enter monster lands" goto tile_route2_2
if "%input%" == "noInput" goto returnLocation
goto commandError

:tile_route2_2
if "%location%" == "route2_1" (
echo.
echo    [You walk south into the monsterlands.]
)
if "%location%" == "route2_3" (
echo.
echo    [You walk north and exit the dark swampy forest.]
)
set location=route2_2
echo.
echo  ~ You are in a swamp near your village.
echo      ^> To the north is a bridge.
echo      ^> To the south is a dark swampy forest.
if "%firsttime_tile_route2_2%" == "no" (
echo      ^> "h" for help
echo      ^> "l" to look around
set firsttime_tile_route2_2=yes
)
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "" goto 

if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look
if "%input%" == "h" goto help
if "%input%" == "help" goto help

if "%input%" == "read sign" goto readsign_route2_2
if "%input%" == "examine sign" goto readsign_route2_2
if "%input%" == "look sign" goto readsign_route2_2
if "%input%" == "look at sign" goto readsign_route2_2
if "%input%" == "sign" goto readsign_route2_2

if "%input%" == "north" goto tile_route2_1
if "%input%" == "go north" goto tile_route2_1
if "%input%" == "south" goto tile_route2_3
if "%input%" == "go south" goto tile_route2_3
if "%input%" == "enter forest" goto tile_route2_3
if "%input%" == "go to forest" goto tile_route2_3
if "%input%" == "enter swampy forest" goto tile_route2_3
if "%input%" == "go to swampy forest" goto tile_route2_3
if "%input%" == "enter dark swampy forest" goto tile_route2_3
if "%input%" == "go to dark swampy forest" goto tile_route2_3
if "%input%" == "enter dark forest" goto tile_route2_3
if "%input%" == "go to dark forest" goto tile_route2_3
if "%input%" == "forest" goto tile_route2_3
if "%input%" == "swampy forest" goto tile_route2_3
if "%input%" == "dark swampy forest" goto tile_route2_3
if "%input%" == "dark forest" goto tile_route2_3
if "%input%" == "noInput" goto returnLocation
goto commandError

:readsign_route2_2
echo.
echo    [You look at the sign.]
echo.
echo    An old crooked sign protrudes at an angle from the mucky earth.
echo      ^> BEWARE
echo      ^> MONSTERLANDS
echo      ^> GOBLINS AHEAD
goto tile_route2_2


:tile_route2_3
if "%location%" == "route2_2" (
echo.
echo    [You walk south and enter the dark swampy forest.]
)
if "%location%" == "route2_4" (
echo.
echo    [You walk west, and the trees thin out.]
)
set location=route2_3
echo.
echo  ~ You are in a dark swampy forest.
echo      ^> There is light to the north.
echo      ^> The forest extends to the east.
echo      ^> The forest extends to the south.
if "%firsttime_tile_route2_3%" == "no" (
echo      ^> "h" for help
echo      ^> "l" to look around
set firsttime_tile_route2_3=yes
)
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "" goto 

if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look
if "%input%" == "h" goto help
if "%input%" == "help" goto help

if "%input%" == "north" goto tile_route2_2
if "%input%" == "go north" goto tile_route2_2
if "%input%" == "light" goto tile_route2_2
if "%input%" == "go to light" goto tile_route2_2
if "%input%" == "go toward light" goto tile_route2_2
if "%input%" == "leave" goto tile_route2_2
if "%input%" == "leave forest" goto tile_route2_2
if "%input%" == "leave dark swampy forest" goto tile_route2_2
if "%input%" == "south" goto tile_route2_7
if "%input%" == "go south" goto tile_route2_7
if "%input%" == "east" goto tile_route2_4
if "%input%" == "go east" goto tile_route2_4
if "%input%" == "noInput" goto returnLocation
goto commandError

:tile_route2_4
if "%location%" == "route2_3" (
echo.
echo    [You walk east within the dark swampy forest.]
echo      ^> A goblin appears!
set location=route2_4
goto encounter_goblin
)
if "%location%" == "route2_5" (
echo.
echo    [You walk west within the dark swampy forest.]
echo      ^> A goblin appears!
set location=route2_4
goto encounter_goblin
)
set location=route2_4
echo.
echo  ~ You are in a dark swampy forest.
echo      ^> The forest extends to the west.
echo      ^> The forest extends to the east.
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "" goto 

if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look
if "%input%" == "h" goto help
if "%input%" == "help" goto help

if "%input%" == "west" goto tile_route2_3
if "%input%" == "go west" goto tile_route2_3
if "%input%" == "east" goto tile_route2_5
if "%input%" == "go east" goto tile_route2_5
if "%input%" == "noInput" goto returnLocation
goto commandError





:route2_5_randomeventcheck
set location=route2_5
set /a randomeventchance=1 + %RANDOM% %% (100 - 1 + 1)
if %randomeventchance% LSS 11 (
echo      ^> You view something vividly violet.
echo.
echo    [You take one purple mushroom.]
echo      ^> "i" to open inventory
set /a items=%items% + 1
set /a item_purplemushroom=%item_purplemushroom% + 1
goto returnLocation
)
if %randomeventchance% GTR 89 (
echo      ^> As you tread, a slimy vine unravels and wraps around your ankle.
if NOT "%weapon%" == "none" (
echo      ^> The vine deals 1 damage, before you hack it down with your weapon.
set /a HP=%HP% - 1
if %HP% LSS 1 goto youdie
)
if "%weapon%" == "none" (
echo      ^> The vine deals 3 damage, before you swat it away.
set /a HP=%HP% - 3
if %HP% LSS 1 goto youdie
)
)
goto returnLocation


echo.
echo    [You take three purple mushrooms.]
echo      ^> "i" to open inventory
set route2_8_mushrooms=absent
set /a items=%items% + 3
set /a item_purplemushroom=%item_purplemushroom% + 3
goto returnLocation





:tile_route2_5
if "%location%" == "route2_4" (
echo.
echo    [You walk east, and the trees thin out.]
goto route2_5_randomeventcheck
)
if "%location%" == "route2_6" (
echo.
echo    [You walk north and enter the dark swampy forest.]
goto route2_5_randomeventcheck
)
set location=route2_5
echo.
echo  ~ You are in a dark swampy forest.
echo      ^> The forest extends to the west.
echo      ^> There is light to the south.
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "" goto 

if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look
if "%input%" == "h" goto help
if "%input%" == "help" goto help

if "%input%" == "west" goto tile_route2_4
if "%input%" == "go west" goto tile_route2_4
if "%input%" == "south" goto tile_route2_6
if "%input%" == "go south" goto tile_route2_6
if "%input%" == "light" goto tile_route2_6
if "%input%" == "go to light" goto tile_route2_6
if "%input%" == "go toward light" goto tile_route2_6
if "%input%" == "leave" goto tile_route2_6
if "%input%" == "leave forest" goto tile_route2_6
if "%input%" == "leave dark swampy forest" goto tile_route2_6
if "%input%" == "exit" goto tile_route2_6
if "%input%" == "exit forest" goto tile_route2_6
if "%input%" == "exit dark swampy forest" goto tile_route2_6
if "%input%" == "noInput" goto returnLocation
goto commandError

:tile_route2_6
if "%location%" == "route1_5" (
echo.
echo    [You walk south and exit the dark swampy forest.]
)
set location=route2_6
echo.
echo  ~ You are in a foggy swamp.
if "%ovalfacedman%" == "present" (
echo.
echo      ^> An oval-faced man is waiting here somberly.
)
echo      ^> To the north is a dark swampy forest.
echo      ^> (Coming soon: To the south there is a shaky wooden bridge...)
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "" goto 

if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look
if "%input%" == "h" goto help
if "%input%" == "help" goto help

if "%ovalfacedman%" == "present" (
if "%input%" == "man" goto examine_ovalfacedman
if "%input%" == "oval faced man" goto examine_ovalfacedman
if "%input%" == "ovalfaced man" goto examine_ovalfacedman
if "%input%" == "oval-faced man" goto examine_ovalfacedman
if "%input%" == "him" goto examine_ovalfacedman
if "%input%" == "examine man" goto examine_ovalfacedman
if "%input%" == "examine oval faced man" goto examine_ovalfacedman
if "%input%" == "examine ovalfaced man" goto examine_ovalfacedman
if "%input%" == "examine oval-faced man" goto examine_ovalfacedman
if "%input%" == "examine him" goto examine_ovalfacedman
if "%input%" == "look at man" goto examine_ovalfacedman
if "%input%" == "look at oval faced man" goto examine_ovalfacedman
if "%input%" == "look at ovalfaced man" goto examine_ovalfacedman
if "%input%" == "look at oval-faced man" goto examine_ovalfacedman
if "%input%" == "look at him" goto examine_ovalfacedman
if "%input%" == "talk to man" goto talkto_ovalfacedman
if "%input%" == "talk to oval faced man" goto talkto_ovalfacedman
if "%input%" == "talk to ovalfaced man" goto talkto_ovalfacedman
if "%input%" == "talk to oval-faced man" goto talkto_ovalfacedman
if "%input%" == "talk to him" goto talkto_ovalfacedman
if "%input%" == "speak to man" goto talkto_ovalfacedman
if "%input%" == "speak to oval faced man" goto talkto_ovalfacedman
if "%input%" == "speak to ovalfaced man" goto talkto_ovalfacedman
if "%input%" == "speak to oval-faced man" goto talkto_ovalfacedman
if "%input%" == "speak to him" goto talkto_ovalfacedman
if "%input%" == "go to man" goto talkto_ovalfacedman
if "%input%" == "go to oval faced man" goto talkto_ovalfacedman
if "%input%" == "go to ovalfaced man" goto talkto_ovalfacedman
if "%input%" == "go to oval-faced man" goto talkto_ovalfacedman
if "%input%" == "go to him" goto talkto_ovalfacedman
)

if "%input%" == "north" goto tile_route2_5
if "%input%" == "go north" goto tile_route2_5
if "%input%" == "enter forest" goto tile_route2_5
if "%input%" == "go to forest" goto tile_route2_5
if "%input%" == "enter swampy forest" goto tile_route2_5
if "%input%" == "go to swampy forest" goto tile_route2_5
if "%input%" == "enter dark swampy forest" goto tile_route2_5
if "%input%" == "go to dark swampy forest" goto tile_route2_5
if "%input%" == "enter dark forest" goto tile_route2_5
if "%input%" == "go to dark forest" goto tile_route2_5
if "%input%" == "forest" goto tile_route2_5
if "%input%" == "swampy forest" goto tile_route2_5
if "%input%" == "dark swampy forest" goto tile_route2_5
if "%input%" == "dark forest" goto tile_route2_5
if "%input%" == "noInput" goto returnLocation
goto commandError

:examine_ovalfacedman
echo.
echo    [You examine the somber, oval-faced man.]
echo      ^> You recognize him from your village. He seems worried.
echo      ^> For whom does he wait?
goto tile_route2_6

:talkto_ovalfacedman
if "%ovalfacedman1%" == "complete" goto talkto_ovalfacedman2
:talkto_ovalfacedman1
set location=ovalfacedman1
echo.
echo    [You talk to the somber, oval-faced man.]
echo      ^> You recognize him from your village. He seems worried.
echo      ^> "Wow," he says. "You made it through the dark swampy forest.
echo      ^> "Did you see the village hero?
echo      ^> "He went back to find survivors and never returned."
echo.
echo    [What do you say?]
echo      1. No, I didn't see him.
if "%seen_darkswampyforestcorpse%" == "yes" (
echo      2. Yes, but he was slain.
)
echo.
set input=noInput
set /p input=
if "%input%" == "1" goto talkto_ovalfacedman1_no
if "%input%" == "no" goto talkto_ovalfacedman1_no
if "%input%" == "2" goto talkto_ovalfacedman1_yes
if "%input%" == "yes" goto talkto_ovalfacedman1_yes
if "%input%" == "noInput" (
goto talkto_ovalfacedman1
)
goto commandError


:talkto_ovalfacedman1_no
echo.
if "%seen_darkswampyforestcorpse%" == "yes" (
echo    [You consider saying you have not seen the hero whom you have seen.]
echo      ^> The oval-faced man looks so worried. You couldn't lie to him.
goto talkto_ovalfacedman1
)
echo    [You say you haven't seen the hero.]
echo      ^> "Well, he's definitely still in there," the oval-faced man says.
echo      ^> "If you see him, tell him I'm still waiting."
if %charisma% GTR 0 (
if "%ovalfacedman_loot%" == "not given" (
echo      ^> The oval-faced man looks down at your bare feet.
echo      ^> "Here," he adds. "You seem nice; should have these."
echo.
echo    [You receive a health potion and some ruined boots.]
echo      ^> "i" to open inventory
set ovalfacedman_loot=given
set /a items=%items% + 2
set /a item_healthpotion=%item_healthpotion% + 1
set /a item_ruinedboots=%item_ruinedboots% + 1
)
)
goto tile_route2_6


:talkto_ovalfacedman1_yes
if "%seen_darkswampyforestcorpse%" == "no" (
echo.
echo    [You consider saying you have seen the hero whom you have not seen.]
echo      ^> The oval-faced man looks so worried. You couldn't lie to him.
goto talkto_ovalfacedman1
)
:talkto_ovalfacedman2
set location=ovalfacedman2
set ovalfacedman1=complete
echo.
echo    [You tell the oval-faced man what happened to the hero.]
echo      ^> "No..." he says. "That can't be.
echo      ^> "Did you find the hero's gold medal?"
echo.
echo    [What do you say?]
echo      1. No, I didn't see it.
if %item_goldmedal% GTR 0 (
echo      2. Yes, but the hero wasn't wearing it...
)
echo.
set input=noInput
set /p input=
if "%input%" == "1" goto talkto_ovalfacedman2_no
if "%input%" == "no" goto talkto_ovalfacedman2_no
if "%input%" == "2" goto talkto_ovalfacedman2_yes
if "%input%" == "yes" goto talkto_ovalfacedman2_yes
if "%input%" == "noInput" (
goto talkto_ovalfacedman2
)
goto commandError

:talkto_ovalfacedman2_no
if %item_goldmedal% GTR 0 (
echo.
echo    [You consider saying you do not have the medal that you have.]
echo      ^> For how long would the oval-faced man wait here?
echo      ^> You couldn't lie to him.
goto talkto_ovalfacedman2
)
echo.
echo    [You shake your head and shrug empty-handedly.]
echo      ^> "Then the hero must be alive," the oval-faced man concludes.
echo      ^> "If you see him, tell him I'm still waiting."
if %charisma% GTR 0 (
if "%ovalfacedman_loot%" == "not given" (
echo      ^> The oval-faced man looks down at your bare feet.
echo      ^> "Here," he adds. "You seem nice; should have these."
echo.
echo    [You receive a health potion and some ruined boots.]
echo      ^> "i" to open inventory
set ovalfacedman_loot=given
set /a items=%items% + 2
set /a item_healthpotion=%item_healthpotion% + 1
set /a item_ruinedboots=%item_ruinedboots% + 1
)
)
goto tile_route2_6

:talkto_ovalfacedman2_yes
if %item_goldmedal% LSS 1 (
echo.
echo    [You consider saying you have the medal that you do not have.]
echo      ^> The oval-faced man looks so worried. You couldn't lie to him.
goto talkto_ovalfacedman2
)
:talkto_ovalfacedman3
echo.
set /a item_goldmedal=%item_goldmedal% - 1
echo    [You hand over the gold medal as proof.]
echo      ^> You gain 20 exp.
set /a exp=%exp% + 20
echo      ^> "I... I guess it's true...
echo      ^> "Thank you for the closure."
if %charisma% GTR 0 (
if "%ovalfacedman_loot%" == "not given" (
echo      ^> The oval-faced man looks down at your bare feet.
echo      ^> "Here," he adds. "You seem nice; should have these."
echo.
echo    [You receive a health potion and some ruined boots.]
echo      ^> "i" to open inventory
set ovalfacedman_loot=given
set /a items=%items% + 2
set /a item_healthpotion=%item_healthpotion% + 1
set /a item_ruinedboots=%item_ruinedboots% + 1
)
)

if "%legs%" == "none" (
echo      ^> There is an awkward pause.
echo      ^> "Oh, and you should probably put these on too," he adds.
)
echo      ^> Then the oval-faced man nods goodbye and departs.
echo.
if "%legs%" == "none" (
echo    [You receive some ruined chaps.]
echo      ^> "i" to open inventory
set /a items=%items% + 1
set /a item_ruinedchaps=%item_ruinedchaps% + 1
)
set ovalfacedman=absent
set location=route2_6
goto checklevelup
goto returnLocation

:route2_7_corpse
set seen_darkswampyforestcorpse=yes
set location=route2_7_corpse
echo.
echo    [As you travel, you spot a corpse.]
echo      ^> This man was renowned in your hometown for defending it from monsters.
echo      ^> He used to wear a gold medal bestowed upon him by the villagers.
echo.
echo    [What do you do?]
echo      1. investigate the body from afar
echo      2. investigate and loot the body
echo      3. say a prayer for the hero
echo      4. ignore the body
echo.
set input=noInput
set /p input=
if "%input%" == "" goto 

if "%input%" == "1" goto route2_7_corpse_investigatethebody
if "%input%" == "investigate" goto route2_7_corpse_investigatethebody
if "%input%" == "investigate body" goto route2_7_corpse_investigatethebody
if "%input%" == "investigate the body" goto route2_7_corpse_investigatethebody

if "%input%" == "2" goto route2_7_corpse_lootthebody
if "%input%" == "loot" goto route2_7_corpse_lootthebody
if "%input%" == "loot body" goto route2_7_corpse_lootthebody
if "%input%" == "loot the body" goto route2_7_corpse_lootthebody

if "%input%" == "3" goto route2_7_corpse_sayaprayer
if "%input%" == "pray" goto route2_7_corpse_sayaprayer
if "%input%" == "prayer" goto route2_7_corpse_sayaprayer
if "%input%" == "say prayer" goto route2_7_corpse_sayaprayer
if "%input%" == "say a prayer" goto route2_7_corpse_sayaprayer

if "%input%" == "4" goto route2_7_corpse_ignorethebody
if "%input%" == "ignore" goto route2_7_corpse_ignorethebody
if "%input%" == "ignore body" goto route2_7_corpse_ignorethebody
if "%input%" == "ignore the body" goto route2_7_corpse_ignorethebody

if "%input%" == "noInput" goto route2_7_corpse
goto commandError

:route2_7_corpse_investigatethebody
echo.
echo    [You investigate the body.]
echo      ^> You don't see the gold medal.
echo      ^> This man was slashed to death by a ruthless foe.
echo      ^> His body sports a gruesome X-shaped wound.
echo      ^> There must be serious danger in the darkest parts of this swampy forest.
goto tile_route2_7

:route2_7_corpse_lootthebody
echo.
echo    [You loot the body.]
echo      ^> It sports a gruesome X-shaped wound, but the tunic may still be useful.
echo      ^> You don't see the gold medal.
echo.
echo    [You take one ruined tunic.]
echo      ^> "i" to open inventory
set /a items=%items% + 1
set /a item_ruinedtunic=%item_ruinedtunic% + 1
goto tile_route2_7

:route2_7_corpse_sayaprayer
set /a randomexp=10 + %RANDOM% %% (20 - 10 + 1)
set /a randomluck=7 + %RANDOM% %% (12 - 7 + 1)
echo.
echo    [You say a prayer.]
echo      ^> The spirit is guided to a better place. --- :^)
echo      ^> It has imparted some of its wisdom.
echo      ^> You gain %randomexp% exp.
set /a exp=%exp% + %randomexp%
set /a luck=%luck% + %randomluck%
set location=route2_7
goto checklevelup

:route2_7_corpse_ignorethebody
echo.
echo    [You ignore the body.]
echo      ^> You march south, probably into the face of danger.
goto tile_route2_7


:tile_route2_7
if "%location%" == "route2_3" (
echo.
echo    [You walk south, deeper into the dark swampy forest.]
if "%seen_darkswampyforestcorpse%" == "no" goto route2_7_corpse
)
if "%location%" == "route2_8" (
echo.
echo    [You walk north within the dark swamp forest.]
)
set location=route2_7
echo.
echo  ~ You are in a dark swampy forest.
echo      ^> The forest extends to the north.
echo      ^> The forest extends to the south and gets very dark.
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "" goto 

if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look
if "%input%" == "h" goto help
if "%input%" == "help" goto help

if "%input%" == "north" goto tile_route2_3
if "%input%" == "go north" goto tile_route2_3
if "%input%" == "south" goto tile_route2_8
if "%input%" == "go south" goto tile_route2_8
if "%input%" == "noInput" goto returnLocation
goto commandError

:tile_route2_8
if "%location%" == "route2_7" (
echo.
echo    [You walk south, as deep as you can into the dark swampy forest.]
if "%goblinchief%" == "alive" (
echo      ^> The goblin chief appears!
set location=route2_8
set goblinchief=dead
goto encounter_goblinchief
)
)

set location=route2_8
echo.
echo  ~ You are in the depths of a very dark swampy forest.
echo      ^> The forest extends to the north.
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "" goto 

if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look
if "%input%" == "h" goto help
if "%input%" == "help" goto help

if "%route2_8_mushrooms%" == "present" (
if "%input%" == "take mushrooms" goto route2_8_mushrooms
if "%input%" == "take purple mushrooms" goto route2_8_mushrooms
if "%input%" == "take mushroom" goto route2_8_mushrooms
if "%input%" == "take purple mushrooms" goto route2_8_mushrooms

if "%input%" == "mushrooms" goto inventory_examine_purplemushroom
if "%input%" == "purple mushrooms" goto inventory_examine_purplemushroom
if "%input%" == "mushroom" goto inventory_examine_purplemushroom
if "%input%" == "purple mushrooms" goto inventory_examine_purplemushroom
if "%input%" == "look mushrooms" goto inventory_examine_purplemushroom
if "%input%" == "look purple mushrooms" goto inventory_examine_purplemushroom
if "%input%" == "look mushroom" goto inventory_examine_purplemushroom
if "%input%" == "look purple mushrooms" goto inventory_examine_purplemushroom
if "%input%" == "look at mushrooms" goto inventory_examine_purplemushroom
if "%input%" == "look at purple mushrooms" goto inventory_examine_purplemushroom
if "%input%" == "look at mushroom" goto inventory_examine_purplemushroom
if "%input%" == "look at purple mushrooms" goto inventory_examine_purplemushroom
if "%input%" == "examine mushrooms" goto inventory_examine_purplemushroom
if "%input%" == "examine purple mushrooms" goto inventory_examine_purplemushroom
if "%input%" == "examine mushroom" goto inventory_examine_purplemushroom
if "%input%" == "examine purple mushrooms" goto inventory_examine_purplemushroom
)

if "%input%" == "north" goto tile_route2_7
if "%input%" == "go north" goto tile_route2_7
if "%input%" == "noInput" goto returnLocation
goto commandError

:route2_8_mushrooms
echo.
echo    [You take three purple mushrooms.]
echo      ^> "i" to open inventory
set route2_8_mushrooms=absent
set /a items=%items% + 3
set /a item_purplemushroom=%item_purplemushroom% + 3
goto returnLocation




