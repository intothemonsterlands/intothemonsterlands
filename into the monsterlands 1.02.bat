mode con:cols=105 lines=40

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
set statpointready=no
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

set light=no
set poison=no


set weapon=none
set damage_min=1
set damage_max=1
set offhand=none
set head=none
set chest=none
set legs=none
set feet=none


set inventory=closed

set items=2
set item_antidote=0
set item_apple=1
set item_bestfriendsnote=0
set item_broccoli=0
set item_bugegg=0
set item_bugmeat=0
set item_carrot=1
set item_favoritesweater=0
set item_goblinscimitar=0
set item_goldmedal=0
set item_hardhat=0
set item_healthpotion=0
set item=ironbuckler=0
set item_ironchainmail=0
set item_ironcoif=0
set item_irondirk=0
set item_ironfootguards=0
set item_ironshinguards=0
set item_leatherhood=0
set item_leatherpants=0
set item_leathershoes=0
set item_leathervest=0
set item_pickaxe=0
set item_potato=0
set item_purplemushroom=0
set item_ruinedmoccasins=0
set item_ruinedcap=0
set item_ruinedchaps=0
set item_ruinedtunic=0
set item_shinysequinedslippers=0
set item_spinach=1
set item_torch=1
set item_turnip=1
set item_woodensword=0


set firsttime_tile_route1_1=no
set firsttime_tile_route1_3=no
set firsttime_tile_hometown_north=no
set firsttime_tile_hometown_south=no
set firsttime_tile_route2_2=no
set firsttime_tile_route2_3=no

set firsttime_tile_route3_quainthut=no
set firsttime_tile_route3_tent=yes

set firsttime_tile_hometown_potionshop=no
set firsttime_tile_hometown_myhouse=no
set firsttime_tile_hometown_bestfriendshouse=no
set firsttime_tile_hometown_weaponshop=no


set route1_2_birdsong=unheard
set route1_2_ruinedcap=present
set route1_2_ruinedmoccasins=present
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


set quainthutcavefly=alive
set apothecary=present
set apothecarycutscene1=no
set givenapothecarysword=no
set route3_4_bugeggs=present
set route3_5_pickaxe=present
set route3_tent_ironshinguards=present
set route3_tent_antidote=present
set sturdytentcavefly=alive
set route3_7_bugeggs=present
set route3_7_woodensword=present
set route3_7_hardhat=present
set route3_8_bugeggs=present

set route3_8_ore=present
set giganticcentipede=alive




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
if "%input%" == "noInput" goto help

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

goto commandError


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
if "%combat%" == "yes" (
:returnCombat
if "%enemy%" == "giant rat" goto combat_giantrat
if "%enemy%" == "goblin" goto combat_goblin
if "%enemy%" == "goblin chief" goto combat_goblinchief
if "%enemy%" == "giant centipede" goto combat_giantcentipede
if "%enemy%" == "gigantic centipede" goto combat_giganticcentipede
if "%enemy%" == "cave fly" goto combat_cavefly
)
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

if "%location%" == "route3_1" goto tile_route3_1
if "%location%" == "route3_2" goto tile_route3_2
if "%location%" == "route3_quainthut" goto tile_route3_quainthut
if "%location%" == "route3_3" goto tile_route3_3
if "%location%" == "route3_4" goto tile_route3_4
if "%location%" == "route3_5" goto tile_route3_5
if "%location%" == "route3_tent" goto tile_route3_tent
if "%location%" == "route3_6" goto tile_route3_6
if "%location%" == "route3_7" goto tile_route3_7
if "%location%" == "route3_8" goto tile_route3_8

:returnCombat
if "%enemy%" == "giant rat" goto combat_giantrat
if "%enemy%" == "goblin" goto combat_goblin
if "%enemy%" == "goblin chief" goto combat_goblinchief
if "%enemy%" == "giant centipede" goto combat_giantcentipede
if "%enemy%" == "gigantic centipede" goto combat_giganticcentipede
if "%enemy%" == "cave fly" goto combat_cavefly

:commandError
echo.
echo    [That command doesn't work.]
echo      ^> Try something else.
if "%help%" == "open" goto help
if "%inventory%" == "open" goto inventory
if "%statpointready%" == "yes" goto levelup_booststat

if "%rummagingthroughyourwoodenweapons%" == "yes" goto apothecarycutscene1_yes

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

if "%input%" == "noInput" goto levelup_booststat

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
set /a AC=%AC% + 1
set statpointready=no
echo.
echo    [Your defense increases to %defense%.]
goto returnLocation

:levelup_booststat_charisma
set /a charisma=%charisma% + 1
set statpointready=no
echo.
echo    [Your charisma increases to %charisma%.]
goto returnLocation




:map
echo.
echo    [You check your map.]
if "%location%" == "route1_1" (
echo      ~ You are here ^(wilderness^).
echo      N You can go "north" from here.
echo      S You can go "south" from here.
echo.
echo                  ^|   ^|
echo                  ^+---^+
echo                  ^| N ^|
echo                  ^+---^+
echo                  ^| ~ ^|
echo                  ^+---^+
echo                  ^| S ^|
echo                  ^+---^+
echo                  ^|   ^|
)
if "%location%" == "route1_2" (
echo      ~ You are here ^(wilderness^).
echo      N You can go "north" from here.
echo      S You can go "south" from here.
echo.
echo                  ^+---^+
echo                  ^| N ^|
echo                  ^+---^+
echo                  ^| ~ ^|
echo                  ^+---^+
echo                  ^| S ^|
echo                  ^+---^+
echo                  ^|   ^|
)
if "%location%" == "route1_3" (
echo      ~ You are here ^(wilderness^).
echo      S You can go "south" from here.
echo.
echo.
echo.
echo                  ^+---^+
echo                  ^| ~ ^|
echo                  ^+---^+
echo                  ^| S ^|
echo                  ^+---^+
echo                  ^|   ^|
)
if "%location%" == "hometown_north" (
echo      @ You are here ^(civilization^).
echo      N You can go "north" from here.
echo      S You can go "south" from here.
echo.
echo                  ^|   ^|
echo                  ^+---^+
echo                  ^| N ^|
echo                  ^+---^+
echo                  ^| @ ^|
echo                  ^+---^+
echo                  ^| S ^|
echo                  ^+---^+
echo                   ^| ^|
)
if "%location%" == "hometown_south" (
echo      @ You are here ^(civilization^).
echo      N You can go "north" from here.
echo      S You can go "south" from here.
echo.
echo                  ^|   ^|
echo                  ^+---^+
echo                  ^| N ^|
echo                  ^+---^+
echo                  ^| @ ^|
echo                  ^+---^+
echo                   ^|S^|
echo                  ^+---^+
echo                  ^|   ^|
)
if "%location%" == "hometown_potionshop" (
echo      * You are here ^(inside^).
echo        ^(From here you can "leave."^)
echo.
echo.
echo.
echo                  ^+---^+
echo                  ^| ^* ^|
echo                  ^+- -^+
echo.
echo.
echo.
)
if "%location%" == "hometown_myhouse" (
echo      * You are here ^(inside^).
echo        ^(From here you can "leave."^)
echo.
echo.
echo.
echo.
echo                  ^+---^+
echo                  ^| ^* ^|
echo                  ^+- -^+
echo.
echo.
echo.
)
if "%location%" == "hometown_weaponshop" (
echo      * You are here ^(inside^).
echo        ^(From here you can "leave."^)
echo.
echo.
echo.
echo.
echo                  ^+- -^+
echo                  ^| ^* ^|
echo                  ^+---^+
echo.
echo.
echo.
)
if "%location%" == "hometown_bestfriendshouse" (
echo      * You are here ^(inside^).
echo        ^(From here you can "leave."^)
echo.
echo.
echo.
echo.
echo                  ^+- -^+
echo                  ^| ^* ^|
echo                  ^+---^+
echo.
echo.
echo.
)

if "%location%" == "route2_1" (
echo      ~ You are here ^(wilderness^).
echo      N You can go "north" from here.
echo      S You can go "south" from here.
echo.
echo                  ^|   ^|
echo                  ^+---^+
echo                  ^| N ^|
echo                  ^+---^+
echo                   ^|~^|
echo                  ^+---^+
echo                  ^| S ^|
echo                  ^+---^+---^+--
echo                  ^|   ^|   ^|  
)
if "%location%" == "route2_2" (
echo      ~ You are here ^(wilderness^).
echo      N You can go "north" from here.
echo      S You can go "south" from here.
echo.
echo                  ^|   ^|
echo                  ^+---^+
echo                   ^|N^|
echo                  ^+---^+
echo                  ^| ~ ^|
echo                  ^+---^+---^+--
echo                  ^| S ^|   ^|  
echo                  ^+---^+---^+--
echo                  ^|   ^|   ^|  
)
if "%location%" == "route2_3" (
if "%light%" == "no" (
echo      ^> Without a source of light, you can see almost nothing.
echo      ^> "i" to open inventory
goto returnLocation
)
echo      ~ You are here ^(wilderness^).
echo      N You can go "north" from here.
echo      E You can go "east" from here.
echo      S You can go "south" from here.
echo.
echo                   ^| ^|
echo                  ^+---^+
echo                  ^| N ^|
echo                  ^+---^+---^+--
echo                  ^| ~ ^| E ^|  
echo                  ^+---^+---^+--
echo                  ^| S ^|   ^|  
echo                  ^+---^+   ^+--
echo                  ^|   ^|    ^|  
)
if "%location%" == "route2_4" (
if "%light%" == "no" (
echo      ^> Without a source of light, you can see almost nothing.
echo      ^> "i" to open inventory
goto returnLocation
)
echo      ~ You are here ^(wilderness^).
echo      W You can go "west from here.
echo      E You can go "east" from here.
echo.
echo               ^| ^|
echo              ^+---^+
echo              ^|   ^|
echo              ^+---^+---^+---^+
echo              ^| W ^| ~ ^| E ^|
echo              ^+---^+---^+---^+
echo              ^|   ^|   ^|   ^|
echo              ^+---^+   ^+---^+
echo              ^|   ^|    ^| ^|
)
if "%location%" == "route2_5" (
if "%light%" == "no" (
echo      ^> Without a source of light, you can see almost nothing.
echo      ^> "i" to open inventory
goto returnLocation
)
echo      ~ You are here ^(wilderness^).
echo      W You can go "west" from here.
echo      S You can go "south" from here.
echo.
echo             ^|
echo            --^+
echo              ^|
echo            --^+---^+---^+
echo              ^| W ^| ~ ^|
echo            --^+---^+---^+
echo              ^|   ^| S ^|
echo            --^+   ^+---^+
echo              ^|    ^| ^|
)
if "%location%" == "route2_6" (
echo      ~ You are here ^(wilderness^).
echo      N You can go "north" from here.
echo      S You can go "south" from here.
echo.
echo              ^|
echo            --^+---^+---^+
echo              ^|   ^| N ^|
echo            --^+---^+---^+
echo              ^|   ^| ~ ^|
echo            --^+   ^+---^+
echo              ^|    ^|S^|
echo            --^+   ^+---^+
echo                  ^|   ^|
)
if "%location%" == "route2_7" (
if "%light%" == "no" (
echo      ^> Without a source of light, you can see almost nothing.
echo      ^> "i" to open inventory
goto returnLocation
)
echo      ~ You are here ^(wilderness^).
echo      N You can go "north" from here.
echo      S You can go "south" from here.
echo.
echo                  ^|   ^|
echo                  ^+---^+---^+--
echo                  ^| N ^|   ^|  
echo                  ^+---^+---^+--
echo                  ^| ~ ^|   ^|  
echo                  ^+---^+   ^+--
echo                  ^| S ^|    ^|  
echo                  ^+---^+   ^+--
echo                          ^|  
)
if "%location%" == "route2_8" (
if "%light%" == "no" (
echo      ^> Without a source of light, you can see almost nothing.
echo      ^> "i" to open inventory
goto returnLocation
)
echo      ~ You are here ^(wilderness^).
echo      N You can go "north" from here.
echo.
echo                  ^|   ^|   ^|  
echo                  ^+---^+---^+--
echo                  ^| N ^|   ^|  
echo                  ^+---^+   ^+--
echo                  ^| ~ ^|    ^|  
echo                  ^+---^+   ^+--
echo                          ^|  
echo                          ^+--
echo                          ^|  
)

if "%location%" == "route3_1" (
echo      ~ You are here ^(wilderness^).
echo      N You can go "north" from here.
echo      S You can go "south" from here.
echo.
echo              ^|   ^|   ^|
echo            --^+---^+---^+
echo              ^|   ^| N ^|
echo            --^+   ^+---^+
echo              ^|    ^|~^|
echo            --^+   ^+---^+
echo                  ^| S ^|
echo            --^+---^+---^+---^+--
echo              ^|   ^|   ^|   ^|
)
if "%location%" == "route3_2" (
echo      ~ You are here ^(wilderness^).
echo      N You can go "north" from here.
echo      S You can go "south" from here.
echo.
echo              ^|   ^|   ^|
echo            --^+   ^+---^+
echo              ^|    ^|N^|
echo            --^+   ^+---^+
echo                  ^| ~ ^|
echo            --^+---^+---^+---^+--
echo              ^|   ^| S ^|   ^|
echo            --^+---^+---^+---^+--
echo                  ^|   ^|
)
if "%location%" == "route3_quainthut" (
echo      * You are here ^(inside^).
echo        ^(From here you can "leave."^)
echo.
echo.
echo.
echo.
echo                  ^+---^+
echo                  ^| ^* 
echo                  ^+---^+
echo.
echo.
echo.
)
if "%location%" == "route3_tent" (
echo      * You are here ^(inside^).
echo        ^(From here you can "leave."^)
echo.
echo.
echo.
echo                     .
echo                    / \
echo                   / ^* \
echo                  ^+- -^+
echo.
echo.
echo.
)
if "%location%" == "route3_3" (
if "%light%" == "no" (
echo      ^> Without a source of light, you can see almost nothing.
echo      ^> "i" to open inventory
goto returnLocation
)
echo      ~ You are here ^(wilderness^).
echo      N You can go "north" from here.
echo      W You can go "west" from here.
echo      E You can go "east from here.
echo      S You can go "south" from here.
echo.
echo              ^|    ^| ^|
echo            --^+   ^+---^+
echo                  ^| N ^|
echo            --^+---^+---^+---^+--
echo              ^| W ^| ~ ^| E ^|
echo            --^+---^+---^+---^+--
echo                  ^| S ^|
echo                  ^+---^+
echo.
)
if "%location%" == "route3_4" (
if "%light%" == "no" (
echo      ^> Without a source of light, you can see almost nothing.
echo      ^> "i" to open inventory
goto returnLocation
)
echo      ~ You are here ^(wilderness^).
echo      N You can go "north" from here.
echo.
echo.
echo                  ^|   ^|
echo            --^+---^+---^+---^+--
echo              ^|   ^| N ^|   ^|
echo            --^+---^+---^+---^+--
echo                  ^| ~ ^|
echo                  ^+---^+
echo.
echo.
echo.
)
if "%location%" == "route3_5" (
if "%light%" == "no" (
echo      ^> Without a source of light, you can see almost nothing.
echo      ^> "i" to open inventory
goto returnLocation
)
echo      ~ You are here ^(wilderness^).
echo      W You can go "west" from here.
echo      E You can go "east" from here.
echo.
echo.
echo               ^| ^|
echo              ^+---^+
echo              ^|   ^|
echo            --^+---^+---^+---^+__
echo              ^| W ^| ~ ^| E ^|__
echo            --^+---^+---^+---^+
echo              ^|   ^|    ^| ^|
echo              ^+---^+   ^+---^+
echo                      ^|   ^|
echo.
)
if "%location%" == "route3_6" (
echo      ~ You are here ^(wilderness^).
echo      W You can go "west" from here.
echo      s You can go "south" from here.
echo.
echo             ^|
echo            --^+
echo              ^|
echo            --^+---^+---^+___^+--
echo              ^|   ^| ~ ^| E ^|
echo            --^+---^+---^+---^+--
echo              ^|    ^|S^|
echo            --^+   ^+---^+
echo                  ^|   ^|
echo.
)

if "%location%" == "route3_7" (
if "%light%" == "no" (
echo      ^> Without a source of light, you can see almost nothing.
echo      ^> "i" to open inventory
goto returnLocation
)
echo      ~ You are here ^(wilderness^).
echo      W You can go "west" from here.
echo      E You can go "east" from here.
echo.
echo.
echo              ^|   ^|    ^| ^|
echo              ^+---^+   ^+---^+
echo                      ^|   ^|
echo              ^+---^+---^+---^+--
echo              ^| W ^| ~ ^| E ^|
echo              ^+---^+---^+---^+--
echo                      ^|   ^|
echo                      ^+---^+
echo.
)
if "%location%" == "route3_8" (
if "%light%" == "no" (
echo      ^> Without a source of light, you can see almost nothing.
echo      ^> "i" to open inventory
goto returnLocation
)
echo      ~ You are here ^(wilderness^).
echo      E You can go "east" from here.
echo.
echo.
echo                  ^|   ^|    ^|
echo                  ^+---^+   ^+--
echo                          ^|
echo                  ^+---^+---^+--
echo                  ^| ~ ^| E ^|
echo                  ^+---^+---^+--
echo                          ^|
echo                          ^+--
echo.
)
echo.
echo      ^> "l" to look around
goto returnLocation




:look

echo.
if "%combat%" == "yes" (
if "%enemy%" == "giant rat" (
echo    [You examine the giant rat.]
echo      ^> Beasts like this did not used to stalk your peaceful village.
echo      ^> It must come from the monsterlands to the south.
)
if "%enemy%" == "goblin" (
echo    [You examine the goblin.]
echo      ^> Green skin, pointy ears, lean muscles.
echo      ^> Goblins are notoriously violent. Spare no mercy.
)
if "%enemy%" == "goblin chief" (
echo    [You examine the goblin chief.]
echo      ^> Dark green skin, torn pointy ears, trained muscles, and rugged posture.
echo      ^> The gold medal around its neck glimmers in the darkness. It looks familiar.
echo      ^> Goblins are notoriously violent. Spare no mercy.
)
if "%enemy%" == "giant centipede" (
echo    [You examine the giant centipede.]
echo      ^> The 5-foot-long monster rears up like a cobra, baring poisonous claws.
echo      ^> Its exoskeleton clatters raucously as its appendages clack together.
echo      ^> Its body emits viscous ooze and a repulsive, fetid stink.
)
if "%enemy%" == "gigantic centipede" (
echo    [You examine the gigantic centipede.]
echo      ^> The 10-foot-long poisonous monster towers, rearing up like a cobra.
echo      ^> Its exoskeleton clatters raucously as its appendages clack together.
echo      ^> Its body emits viscous ooze and a repulsive, fetid stink.
)
if "%enemy%" == "cave fly" (
echo    [You examine the cave fly.]
echo      ^> It's about a foot tall, buzzing around in the air.
echo      ^> Two round red compound eyes reflect dozens of your image back at you.
echo      ^> A long, coiled proboscis emerges from its face for sucking blood.
)

goto returnLocation
)



echo    [You look around.]
if "%location%" == "route1_1" (
echo      ^> It's the only peaceful place near your small village.
)
if "%location%" == "route1_2" (
echo      ^> Flickering bars of light twinkle below the lush canopy.
)
if "%location%" == "route1_3" (
echo      ^> This place is tranquil and shady. It has magical properties.
echo      ^> Coming here restores all your missing HP.
)

if "%location%" == "hometown_north" (
echo      ^* You see a potion shop.
echo      ^* You see your house.
echo      ^> The entire village is deserted.
echo      ^> There is the sense that something bad has happened.
)
if "%location%" == "hometown_south" (
echo      ^* You see a weapon shop.
echo      ^* You see your best friend's house.
echo      ^> The entire village is deserted.
echo      ^> There is the sense that something bad has happened.
)
if "%location%" == "hometown_potionshop" (
echo      ^> The shop is deserted.
echo      ^> The shelves are barren, apparently cleared out in a hurry.
if "%hometown_potionshop_potions%" == "present" (
echo      ^> Two health potions remain on the counter.
)
)
if "%location%" == "hometown_myhouse" (
echo      ^> It's your house, silly! You know how it looks.
echo      ^> Everything seems in order.
if "%hometown_myhouse_favoritesweater%" == "present" (
echo      ^> Your favorite sweater is here.
)
)
if "%location%" == "hometown_weaponshop" (
echo      ^> The shop is deserted.
echo      ^> The racks are barren, apparently cleared out in a hurry.
if "%hometown_weaponshop_woodensword%" == "present" (
echo      ^> A wooden sword remains on the counter.
)
)
if "%location%" == "hometown_bestfriendshouse" (
echo      ^> Your best friend is not here.
if "%hometown_bestfriendshouse_note%" == "present" (
echo      ^> There is a note on the table.
)
)
if "%location%" == "route2_1" (
echo      ^> This bridge used to represent safety.
)
if "%location%" == "route2_2" (
echo      ^> Bubbles slowly swell and pop in the muck.
echo      ^> An old crooked sign protrudes at an angle from the mucky earth.
echo         ^> BEWARE
echo           MONSTERLANDS
echo           GOBLINS AHEAD
)
if "%location%" == "route2_3" (
if "%light%" == "no" (
echo      ^> Without a source of light, you can see almost nothing.
echo      ^> "i" to open inventory
goto returnLocation
)
echo      ^> Smart. This area could be dangerous.
)
if "%location%" == "route2_4" (
if "%light%" == "no" (
echo      ^> Without a source of light, you can see almost nothing.
echo      ^> "i" to open inventory
goto returnLocation
)
echo      ^> Sad droopy swamp trees blot out the sun.
)
if "%location%" == "route2_5" (
if "%light%" == "no" (
echo      ^> Without a source of light, you can see almost nothing.
echo      ^> "i" to open inventory
goto returnLocation
)
echo      ^> Sad droopy swamp trees blot out the sun.
)
if "%location%" == "route2_6" (
echo      ^> You see sad droopy swamp trees here and there.
if "%ovalfacedman%" == "present" (
echo      ^> An oval-faced man is waiting here somberly.
)
)
if "%location%" == "route2_7" (
if "%light%" == "no" (
echo      ^> Without a source of light, you can see almost nothing.
echo      ^> "i" to open inventory
goto returnLocation
)
echo      ^> The droopy swamp trees are thick here.
)
if "%location%" == "route2_8" (
if "%light%" == "no" (
echo      ^> Without a source of light, you can see almost nothing.
echo      ^> "i" to open inventory
goto returnLocation
)
echo      ^> The droopy swamp trees are very thick here.
if "%route2_8_mushrooms%" == "present" (
echo      ^> Some purple mushrooms grow in the shade.
)
)




if "%location%" == "route3_1" (
echo      ^> The bridge sways beneath your feet.
)
if "%location%" == "route3_2" (
echo      ^> The field is characterized by gray stones and sparse tufts of green grass.
echo      ^> You see a quaint hut.
)

if "%location%" == "route3_quainthut" (
echo      ^> The apothecary from your hometown is here.
echo      ^> Apparently this is his hut. There are ingredients and paraphernalia about.
)
if "%location%" == "route3_3" (
if "%light%" == "no" (
echo      ^> Without a source of light, you can see almost nothing.
echo      ^> "i" to open inventory
goto returnLocation
)
echo      ^> Basically a crossroads inside a cave.
)
if "%location%" == "route3_4" (
if "%light%" == "no" (
echo      ^> Without a source of light, you can see almost nothing.
echo      ^> "i" to open inventory
goto returnLocation
)
echo      ^> Monsters dug this tunnel and cavern out of the stone.
if "%route3_4_bugeggs%" == "present" (
echo      ^> There are some bug eggs here.
)
)
if "%location%" == "route3_5" (
if "%light%" == "no" (
echo      ^> Without a source of light, you can see almost nothing.
echo      ^> "i" to open inventory
goto returnLocation
)
echo      ^> You see a sturdy tent.
if "%route3_5_pickaxe%" == "present" (
echo      ^> There is a pickaxe on the ground.
)
)
if "%location%" == "route3_tent" (
if "%light%" == "no" (
echo      ^> Without a source of light, you can see almost nothing.
echo      ^> "i" to open inventory
goto returnLocation
)
echo      ^> This tent is made of animal hide.
echo      ^> There were probably more tents before the camp was abandoned.
if "%route3_tent_ironshinguards%" == "present" (
echo      ^> Someone left their iron shinguards.
)
if "%route3_tent_antidote%" == "present" (
echo      ^> There is an antidote.
)
)
if "%location%" == "route3_6" (
echo      ^> Outside the cave, this cliff drops off steep.
)

if "%location%" == "route3_7" (
if "%light%" == "no" (
echo      ^> Without a source of light, you can see almost nothing.
echo      ^> "i" to open inventory
goto returnLocation
)
echo      ^> The stench is overwhelming here. A disgusting monster is emitting it.
if "%route3_7_bugeggs%" == "present" (
echo      ^> There are some bug eggs here.
)
)
if "%location%" == "route3_8" (
if "%light%" == "no" (
echo      ^> Without a source of light, you can see almost nothing.
echo      ^> "i" to open inventory
goto returnLocation
)
echo      ^> Monsters dug this tunnel and cavern out of the stone.
if "%route3_8_bugeggs%" == "present" (
echo      ^> There are many bug eggs here.
if "%route3_8_ore%" == "present" (
echo      ^> You see an ore vein.
)
)
)
echo      ^> "m" to view map
goto returnLocation















:stats
echo.
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
goto returnLocation


:inventory
if "%inventory%" == "closed" (
echo.
echo    [You check your inventory.]
)
echo.
echo    [You have %items% item(s) to "examine" or "use."]

if %item_antidote% GTR 0 (
echo      ^> antidote x%item_antidote%
)


if %item_apple% GTR 0 (
echo      ^> apple x%item_apple%
)

if %item_bestfriendsnote% GTR 0 (
echo      ^> best friend's note x%item_bestfriendsnote%
)

if %item_bugegg% GTR 0 (
echo      ^> bug egg x%item_bugegg%
)

if %item_bugmeat% GTR 0 (
echo      ^> bug meat x%item_bugmeat%
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
if %item_hardhat% GTR 0 (
echo      ^> hardhat x%item_hardhat%
if "%head%" == "hardhat" (
echo         (equipped, ^+1 defense^)
)
)
if %item_healthpotion% GTR 0 (
echo      ^> health potion x%item_healthpotion%
)

if %item_ironshinguards% GTR 0 (
echo      ^> iron shinguards x%item_ironshinguards%
if "%legs%" == "iron shinguards" (
echo         (equipped, ^+1 defense^)
)
)

if %item_ruinedchaps% GTR 0 (
echo      ^> ruined chaps x%item_ruinedchaps%
if "%legs%" == "ruined chaps" (
echo         (equipped, ^+1 AC^)
)
)

if %item_pickaxe% GTR 0 (
echo      ^> pickaxe x%item_pickaxe%
if "%weapon%" == "pickaxe" (
echo         (equipped --- 1-4^)
)
)

if %item_purplemushroom% GTR 0 (
echo      ^> purple mushroom x%item_purplemushroom%
)

if %item_ruinedmoccasins% GTR 0 (
echo      ^> ruined moccasins x%item_ruinedmoccasins%
if "%feet%" == "ruined moccasins" (
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

goto returnLocation


:inventoryCommands

if "%input%" == "noInput" goto returnLocation

if %item_antidote% GTR 0 (
if "%input%" == "antidote" goto inventory_examine_antidote
if "%input%" == "examine antidote" goto inventory_examine_antidote
if "%input%" == "look at antidote" goto inventory_examine_antidote
if "%input%" == "use antidote" goto inventory_use_antidote
if "%input%" == "drink antidote" goto inventory_use_antidote
)

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


if %item_bugegg% GTR 0 (
if "%input%" == "examine egg" goto inventory_examine_bugegg
if "%input%" == "look at egg" goto inventory_examine_bugegg
if "%input%" == "egg" goto inventory_examine_bugegg
if "%input%" == "examine bug egg" goto inventory_examine_bugegg
if "%input%" == "look at bug egg" goto inventory_examine_bugegg
if "%input%" == "bug egg" goto inventory_examine_bugegg
if "%input%" == "examine bugegg" goto inventory_examine_bugegg
if "%input%" == "look at bugegg" goto inventory_examine_bugegg
if "%input%" == "bugegg" goto inventory_examine_bugegg
if "%input%" == "use egg" goto inventory_use_bugegg
if "%input%" == "eat egg" goto inventory_use_bugegg
if "%input%" == "use bugegg" goto inventory_use_bugegg
if "%input%" == "eat bugegg" goto inventory_use_bugegg
if "%input%" == "use bug egg" goto inventory_use_bugegg
if "%input%" == "eat bug egg" goto inventory_use_bugegg
)

if %item_bugmeat% GTR 0 (
if "%input%" == "examine meat" goto inventory_examine_bugmeat
if "%input%" == "look at meat" goto inventory_examine_bugmeat
if "%input%" == "meat" goto inventory_examine_bugmeat
if "%input%" == "examine bug meat" goto inventory_examine_bugmeat
if "%input%" == "look at bug meat" goto inventory_examine_bugmeat
if "%input%" == "bug meat" goto inventory_examine_bugmeat
if "%input%" == "examine bugmeat" goto inventory_examine_bugmeat
if "%input%" == "look at bugmeat" goto inventory_examine_bugmeat
if "%input%" == "bugmeat" goto inventory_examine_bugmeat
if "%input%" == "use meat" goto inventory_use_bugmeat
if "%input%" == "eat meat" goto inventory_use_bugmeat
if "%input%" == "use bugmeat" goto inventory_use_bugmeat
if "%input%" == "eat bugmeat" goto inventory_use_bugmeat
if "%input%" == "use bug meat" goto inventory_use_bugmeat
if "%input%" == "eat bug meat" goto inventory_use_bugmeat
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

if %item_ironshinguards% GTR 0 (
if "%input%" == "iron shinguards" goto inventory_examine_ironshinguards
if "%input%" == "examine iron shinguards" goto inventory_examine_ironshinguards
if "%input%" == "look at iron shinguards" goto inventory_examine_ironshinguards
if "%input%" == "use iron shinguards" goto inventory_use_ironshinguards
if "%input%" == "shinguards" goto inventory_examine_ironshinguards
if "%input%" == "examine shinguards" goto inventory_examine_ironshinguards
if "%input%" == "look at shinguards" goto inventory_examine_ironshinguards
if "%input%" == "use shinguards" goto inventory_use_ironshinguards
)

if %item_hardhat% GTR 0 (
if "%input%" == "examine hat" goto inventory_examine_hardhat
if "%input%" == "look at hat" goto inventory_examine_hardhat
if "%input%" == "hat" goto inventory_examine_hardhat
if "%input%" == "examine hard hat" goto inventory_examine_hardhat
if "%input%" == "look at hard hat" goto inventory_examine_hardhat
if "%input%" == "hard hat" goto inventory_examine_hardhat
if "%input%" == "examine hardhat" goto inventory_examine_hardhat
if "%input%" == "look at hardhat" goto inventory_examine_hardhat
if "%input%" == "hardhat" goto inventory_examine_hardhat
if "%input%" == "use hat" goto inventory_use_hardhat
if "%input%" == "eat hat" goto inventory_use_hardhat
if "%input%" == "use hardhat" goto inventory_use_hardhat
if "%input%" == "eat hardhat" goto inventory_use_hardhat
if "%input%" == "use hard hat" goto inventory_use_hardhat
if "%input%" == "eat hard hat" goto inventory_use_hardhat
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

if %item_leathermoccasins% GTR 0 (
if "%input%" == "leather moccasins" goto inventory_examine_leathermoccasins
if "%input%" == "examine leather moccasins" goto inventory_examine_leathermoccasins
if "%input%" == "look at leather moccasins" goto inventory_examine_leathermoccasins
if "%input%" == "use leather moccasins" goto inventory_use_leathermoccasins
if "%input%" == "moccasins" goto inventory_examine_leathermoccasins
if "%input%" == "examine moccasins" goto inventory_examine_leathermoccasins
if "%input%" == "look at moccasins" goto inventory_examine_leathermoccasins
if "%input%" == "use moccasins" goto inventory_use_leathermoccasins
)

if %item_pickaxe% GTR 0 (
if "%input%" == "examine axe" goto inventory_examine_pickaxe
if "%input%" == "look at axe" goto inventory_examine_pickaxe
if "%input%" == "axe" goto inventory_examine_pickaxe
if "%input%" == "examine pick axe" goto inventory_examine_pickaxe
if "%input%" == "look at pick axe" goto inventory_examine_pickaxe
if "%input%" == "pick axe" goto inventory_examine_pickaxe
if "%input%" == "examine pickaxe" goto inventory_examine_pickaxe
if "%input%" == "look at pickaxe" goto inventory_examine_pickaxe
if "%input%" == "pickaxe" goto inventory_examine_pickaxe
if "%input%" == "use axe" goto inventory_use_pickaxe
if "%input%" == "use pickaxe" goto inventory_use_pickaxe
if "%input%" == "use pick axe" goto inventory_use_pickaxe
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

if %item_leatherhood% GTR 0 (
if "%input%" == "leather hood" goto inventory_examine_leatherhood
if "%input%" == "examine leather hood" goto inventory_examine_leatherhood
if "%input%" == "look at leather hood" goto inventory_examine_leatherhood
if "%input%" == "use leather hood" goto inventory_use_leatherhood
if "%input%" == "hood" goto inventory_examine_leatherhood
if "%input%" == "examine hood" goto inventory_examine_leatherhood
if "%input%" == "look at hood" goto inventory_examine_leatherhood
if "%input%" == "use hood" goto inventory_use_leatherhood
)

if %item_leatherpants% GTR 0 (
if "%input%" == "leather pants" goto inventory_examine_leatherpants
if "%input%" == "examine leather pants" goto inventory_examine_leatherpants
if "%input%" == "look at leather pants" goto inventory_examine_leatherpants
if "%input%" == "use leather pants" goto inventory_use_leatherpants
if "%input%" == "pants" goto inventory_examine_leatherpants
if "%input%" == "examine pants" goto inventory_examine_leatherpants
if "%input%" == "look at pants" goto inventory_examine_leatherpants
if "%input%" == "use pants" goto inventory_use_leatherpants
)

if %item_leathershoes% GTR 0 (
if "%input%" == "leather shoes" goto inventory_examine_leathershoes
if "%input%" == "examine leather shoes" goto inventory_examine_leathershoes
if "%input%" == "look at leather shoes" goto inventory_examine_leathershoes
if "%input%" == "use leather shoes" goto inventory_use_leathershoes
if "%input%" == "shoes" goto inventory_examine_leathershoes
if "%input%" == "examine shoes" goto inventory_examine_leathershoes
if "%input%" == "look at shoes" goto inventory_examine_leathershoes
if "%input%" == "use shoes" goto inventory_use_leathershoes
)

if %item_shinysequinedslippers% GTR 0 (

if "%input%" == "slippers" goto inventory_examine_shinysequinedslippers
if "%input%" == "examine slippers" goto inventory_examine_shinysequinedslippers
if "%input%" == "look at slippers" goto inventory_examine_shinysequinedslippers
if "%input%" == "use slippers" goto inventory_use_shinysequinedslippers
if "%input%" == "use slippers" goto inventory_use_shinysequinedslippers
if "%input%" == "shiny slippers" goto inventory_examine_shinysequinedslippers
if "%input%" == "examine shiny slippers" goto inventory_examine_shinysequinedslippers
if "%input%" == "look at shiny slippers" goto inventory_examine_shinysequinedslippers
if "%input%" == "use shiny slippers" goto inventory_use_shinysequinedslippers
if "%input%" == "sequined slippers" goto inventory_examine_shinysequinedslippers
if "%input%" == "examine sequined slippers" goto inventory_examine_shinysequinedslippers
if "%input%" == "look at sequined slippers" goto inventory_examine_shinysequinedslippers
if "%input%" == "use sequined slippers" goto inventory_use_shinysequinedslippers
if "%input%" == "slippers" goto inventory_examine_shinysequinedslippers
if "%input%" == "examine slippers" goto inventory_examine_shinysequinedslippers
if "%input%" == "look at slippers" goto inventory_examine_shinysequinedslippers
if "%input%" == "use slippers" goto inventory_use_shinysequinedslippers
if "%input%" == "shiny sequined slippers" goto inventory_examine_shinysequinedslippers
if "%input%" == "examine shiny sequined slippers" goto inventory_examine_shinysequinedslippers
if "%input%" == "look at shiny sequined slippers" goto inventory_examine_shinysequinedslippers
if "%input%" == "use shiny sequined slippers" goto inventory_use_shinysequinedslippers
if "%input%" == "sss" goto inventory_examine_shinysequinedslippers
if "%input%" == "examine sss" goto inventory_examine_shinysequinedslippers
if "%input%" == "look at sss" goto inventory_examine_shinysequinedslippers
if "%input%" == "use sss" goto inventory_use_shinysequinedslippers

)

if %item_leathervest% GTR 0 (
if "%input%" == "leather vest" goto inventory_examine_leathervest
if "%input%" == "examine leather vest" goto inventory_examine_leathervest
if "%input%" == "look at leather vest" goto inventory_examine_leathervest
if "%input%" == "use leather vest" goto inventory_use_leathervest
if "%input%" == "vest" goto inventory_examine_leathervest
if "%input%" == "examine vest" goto inventory_examine_leathervest
if "%input%" == "look at vest" goto inventory_examine_leathervest
if "%input%" == "use vest" goto inventory_use_leathervest
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

goto commandError










:inventory_examine_pickaxe
echo.
echo    [You examine the pickaxe.]
echo      ^> Not designed as a weapon, but not designed as a toy either.
echo      ^> 1-4 damage.
echo      ^> "use pickaxe" to mine or, or to equip or unequip
if "%inventory%" == "closed" goto returnLocation
goto returnLocation


:inventory_use_pickaxe
if %item_pickaxe% LSS 1 goto commandError
set /a miningmodifier=%strength%
set /a miningmodifier=%miningmodifier% + %finesse%
set /a miningmodifier=%miningmodifier% / 2

if "%location%" == "route3_8" goto mining_route3_8
goto inventory_use_pickaxe_continued

:inventory_use_pickaxe_continued
echo.
if "%weapon%" == "pickaxe" (
echo    [You unequip the pickaxe.]
set weapon=none
set damage_min=1
set damage_max=1
goto returnLocation
)
if "%weapon%" == "none" (
echo    [You equip the pickaxe.]
echo      ^> Not designed as a weapon, but it can do some damage.
echo      ^> 1-4 damage.
echo      ^> "use pickaxe" to equip or unequip
set weapon=pickaxe
set damage_min=1
set damage_max=4
goto returnLocation
)
echo    [You try to equip an item, but the slot is full.]
echo      ^> "use" the other item to unequip it first.
goto returnLocation





:inventory_examine_antidote
echo.
echo    [You examine the antidote.]
echo      ^> A swirling, translucent green mixture.
echo      ^> "use antidote" to recover up to 5 HP and cure poison.
if "%inventory%" == "closed" goto returnLocation
goto returnLocation

:inventory_use_antidote
set /a HPdeficit=%maxHP% - %HP%
echo.
echo    [You drink an antidote.]
if "%poison%" == "yes" (
echo      ^> You recover from your poisoning.
set poison=no
set /a agility=%agility% + 1
)
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
set /a item_antidote=%item_antidote% - 1
goto returnLocation

:inventory_examine_purplemushroom
echo.
echo    [You examine the purple mushroom.]
echo      ^> The lumpy cap is violet with magenta spots. Don't eat it!
if "%inventory%" == "closed" goto returnLocation
goto returnLocation




:inventory_examine_apple
echo.
echo    [You examine the apple.]
echo      ^> Red and delicious.
echo      ^> "use apple" to recover up to 5 HP.
goto returnLocation

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
goto returnLocation



:inventory_examine_bugmeat
echo.
echo    [You examine the bug meat.]
echo      ^> Not appetizing, yet edible in a pinch.
echo      ^> "use bug meat" to recover up to 3 HP.
goto returnLocation

:inventory_use_bugmeat
set /a HPdeficit=%maxHP% - %HP%
echo.
echo    [You eat bug meat.]
if %HPdeficit% LSS 3 (
echo      ^> You recover %HPdeficit% HP.
set /a HP=%HP% + %HPdeficit%
)
if %HPdeficit% GTR 2 (
echo      ^> You recover 3 HP.
set /a HP=%HP% + 3
)
echo      ^> You have %HP%/%maxHP% HP.
set /a items=%items% - 1
set /a item_bugmeat=%item_bugmeat% - 1
goto returnLocation


:inventory_examine_bugegg
echo.
echo    [You examine the bug egg.]
echo      ^> Potion ingredient; poisonous when eaten.
echo      ^> "use bug egg" to recover up to 1 HP.
goto returnLocation

:inventory_use_bugegg
set /a HPdeficit=%maxHP% - %HP%
echo.
echo    [You eat a bug egg.]
if %HPdeficit% LSS 1 (
echo      ^> You recover %HPdeficit% HP.
set /a HP=%HP% + %HPdeficit%
)
if %HPdeficit% GTR 0 (
echo      ^> You recover 1 HP.
set /a HP=%HP% + 1
)
echo      ^> You have %HP%/%maxHP% HP.
set /a items=%items% - 1
set /a item_bugegg=%item_bugegg% - 1
set poison=yes
set /a agility=%agility% - 1
goto returnLocation



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
goto returnLocation

:inventory_examine_favoritesweater
echo.
echo    [You examine your favorite sweater.]
echo      ^> So cozy.
echo      ^> +1 attack
echo      ^> "use favorite sweater" to equip or unequip
if "%inventory%" == "closed" goto returnLocation
goto returnLocation

:inventory_use_favoritesweater
echo.
if "%chest%" == "favorite sweater" (
echo    [You unequip your favorite sweater.]
echo      ^> -1 attack
set chest=none
set /a attack=%attack% - 1
goto returnLocation
)
if "%chest%" == "none" (
echo    [You equip your favorite sweater.]
echo      ^> So cozy.
echo      ^> +1 attack
echo      ^> "use favorite sweater" to equip or unequip
set chest=favorite sweater
set /a attack=%attack% + 1
goto returnLocation
)
echo    [You try to equip an item, but the slot is full.]
echo      ^> "use" the other item to unequip it first.
goto returnLocation


:inventory_examine_goblinscimitar
echo.
echo    [You examine the goblin scimitar.]
echo      ^> A sharp, curved wooden blade.
echo      ^> 1-3 damage.
echo      ^> "use goblin scimitar" to equip or unequip
if "%inventory%" == "closed" goto returnLocation
goto returnLocation

:inventory_use_goblinscimitar
echo.
if "%weapon%" == "goblin scimitar" (
echo    [You unequip the goblin scimitar.]
set weapon=none
set damage_min=1
set damage_max=1
goto returnLocation
)
if "%weapon%" == "none" (
echo    [You equip the goblin scimitar.]
echo      ^> A sharp, curved wooden blade.
echo      ^> 1-3 damage.
echo      ^> "use goblin scimitar" to equip or unequip
set weapon=goblin scimitar
set damage_min=1
set damage_max=3
goto returnLocation
)
echo    [You try to equip an item, but the slot is full.]
echo      ^> "use" the other item to unequip it first.
goto returnLocation

:inventory_examine_goldmedal
echo.
echo    [You examine the gold medal.]
echo      ^> This familiar medal glimmers like hope.
goto returnLocation


:inventory_examine_healthpotion
echo.
echo    [You examine the health potion.]
echo      ^> A swirling, translucent red mixture.
echo      ^> "use health potion" to recover up to 10 HP.
if "%inventory%" == "closed" goto returnLocation
goto returnLocation

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
goto returnLocation



:inventory_examine_ironshinguards
echo.
echo    [You examine the iron shinguards.]
echo      ^> Basic metal leg protection.
echo      ^> +1 defense
echo      ^> "use iron shinguards" to equip or unequip
if "%inventory%" == "closed" goto returnLocation
goto returnLocation

:inventory_use_ironshinguards
echo.
if "%legs%" == "iron shinguards" (
echo    [You unequip the iron shinguards.]
echo      ^> -1 defense
set legs=none
set /a defense=%defense% - 1
set /a AC=%AC% - 1
goto returnLocation
)
if "%legs%" == "none" (
echo    [You equip the iron shinguards.]
echo      ^> Basic metal leg protection.
echo      ^> +1 defense
echo      ^> "use iron shinguards" to equip or unequip
set legs=iron shinguards
set /a defense=%defense% + 1
set /a AC=%AC% + 1
goto returnLocation
)
echo    [You try to equip an item, but the slot is full.]
echo      ^> "use" the other item to unequip it first.
goto returnLocation



:inventory_examine_purplemushroom
echo.
echo    [You examine the purple mushroom.]
echo      ^> The lumpy cap is violet with magenta spots. Don't eat it!
if "%inventory%" == "closed" goto returnLocation
goto returnLocation



:inventory_examine_ruinedmoccasins
echo.
echo    [You examine the ruined moccasins.]
echo      ^> This foot protection is a little worse for wear.
echo      ^> +1 AC
echo      ^> "use ruined moccasins" to equip or unequip
if "%inventory%" == "closed" goto returnLocation
goto returnLocation

:inventory_use_ruinedmoccasins
echo.
if "%feet%" == "ruined moccasins" (
echo    [You unequip the ruined moccasins.]
echo      ^> -1 AC
set feet=none
set /a AC=%AC% - 1
goto returnLocation
)
if "%feet%" == "none" (
echo    [You equip the ruined moccasins.]
echo      ^> This foot protection is a little worse for wear.
echo      ^> +1 AC
echo      ^> "use ruined moccasins" to equip or unequip
set feet=ruined moccasins
set /a AC=%AC% + 1
goto returnLocation
)
echo    [You try to equip an item, but the slot is full.]
echo      ^> "use" the other item to unequip it first.
goto returnLocation




:inventory_examine_hardhat
echo.
echo    [You examine the hardhat.]
echo      ^> A very durable head covering usually used in caves, such as for mining.
echo      ^> +1 defense
echo      ^> "use hardhat" to equip or unequip
if "%inventory%" == "closed" goto returnLocation
goto returnLocation

:inventory_use_hardhat
echo.
if "%head%" == "hardhat" (
echo    [You unequip the hardhat.]
echo      ^> -1 defense
set head=none
set /a defense=%defense% - 1
set /a AC=%AC% - 1
goto returnLocation
)
if "%head%" == "none" (
echo    [You equip the hardhat.]
echo      ^> A very durable head covering usually used in caves, such as for mining.
echo      ^> +1 defense
echo      ^> "use hardhat" to equip or unequip
set head=hardhat
set /a defense=%defense% + 1
set /a AC=%AC% + 1
goto returnLocation
)
echo    [You try to equip an item, but the slot is full.]
echo      ^> "use" the other item to unequip it first.
goto returnLocation



:inventory_examine_ruinedcap
echo.
echo    [You examine the ruined cap.]
echo      ^> A tattered head covering riddled with holes and tears.
echo      ^> +1 AC
echo      ^> "use ruined cap" to equip or unequip
if "%inventory%" == "closed" goto returnLocation
goto returnLocation

:inventory_use_ruinedcap
echo.
if "%head%" == "ruined cap" (
echo    [You unequip the ruined cap.]
echo      ^> -1 AC
set head=none
set /a AC=%AC% - 1
goto returnLocation
)
if "%head%" == "none" (
echo    [You equip the ruined cap.]
echo      ^> A tattered head covering riddled with holes and tears.
echo      ^> +1 AC
echo      ^> "use ruined cap" to equip or unequip
set head=ruined cap
set /a AC=%AC% + 1
goto returnLocation
)
echo    [You try to equip an item, but the slot is full.]
echo      ^> "use" the other item to unequip it first.
goto returnLocation





:inventory_examine_ruinedchaps
echo.
echo    [You examine the ruined chaps.]
echo      ^> Padded leg protection, tattered and torn.
echo      ^> +1 AC
echo      ^> "use ruined chaps" to equip or unequip
if "%inventory%" == "closed" goto returnLocation
goto returnLocation

:inventory_use_ruinedchaps
echo.
if "%legs%" == "ruined cap" (
echo    [You unequip the ruined chaps.]
echo      ^> -1 AC
set legs=none
set /a AC=%AC% - 1
goto returnLocation
)
if "%legs%" == "none" (
echo    [You equip the ruined chaps.]
echo      ^> Padded leg protection, tattered and torn.
echo      ^> +1 AC
echo      ^> "use ruined chaps" to equip or unequip
set legs=ruined chaps
set /a AC=%AC% + 1
goto returnLocation
)
echo    [You try to equip an item, but the slot is full.]
echo      ^> "use" the other item to unequip it first.
goto returnLocation










:inventory_examine_ruinedtunic
echo.
echo    [You examine the ruined tunic.]
echo      ^> A tattered chest covering with X-shaped damage.
echo      ^> +1 AC
echo      ^> "use ruined tunic" to equip or unequip
if "%inventory%" == "closed" goto returnLocation
goto returnLocation

:inventory_use_ruinedtunic
echo.
if "%chest%" == "ruined tunic" (
echo    [You unequip the ruined tunic.]
echo      ^> -1 AC
set chest=none
set /a AC=%AC% - 1
goto returnLocation
)
if "%chest%" == "none" (
echo    [You equip the ruined tunic.]
echo      ^> A tattered chest covering with X-shaped damage.
echo      ^> +1 AC
echo      ^> "use ruined tunic" to equip or unequip
set chest=ruined tunic
set /a AC=%AC% + 1
goto returnLocation
)
echo    [You try to equip an item, but the slot is full.]
echo      ^> "use" the other item to unequip it first.
goto returnLocation



:inventory_examine_shinysequinedslippers
echo.
echo    [You examine the shiny sequined slippers.]
echo      ^> So suave!
echo      ^> ^+1 agility
echo      ^> ^+1 charisma
echo      ^> "use slippers" to equip or unequip
if "%inventory%" == "closed" goto returnLocation
goto returnLocation

:inventory_use_shinysequinedslippers
echo.
if "%feet%" == "shiny sequined slippers" (
echo    [You unequip the shiny sequined slippers.]
echo      ^> -1 agility
echo      ^> -1 charisma
echo      ^> "use slippers" to equip or unequip
set feet=none
set /a agility=%agility% - 1
set /a charisma=%charisma% - 1
goto returnLocation
)
if "%feet%" == "none" (
echo    [You equip the shiny sequined slippers.]
echo      ^> ^+1 agility
echo      ^> ^+1 charisma
echo      ^> "use slippers" to equip or unequip
set feet=shiny sequined slippers
set /a agility=%agility% + 1
set /a charisma=%charisma% + 1
goto returnLocation
)
echo    [You try to equip an item, but the slot is full.]
echo      ^> "use" the other item to unequip it first.
goto returnLocation






:inventory_examine_torch
echo.
echo    [You examine the torch.]
echo      ^> Held in the off hand as a light source.
echo      ^> "use torch" to equip or unequip
if "%inventory%" == "closed" goto returnLocation
goto returnLocation

:inventory_use_torch
echo.
if "%offhand%" == "torch" (
echo    [You extinguish and unequip the torch.]
set offhand=none
set light=no
goto returnLocation
)
if "%offhand%" == "none" (
echo    [You light and equip the torch.]
echo      ^> Held in the off hand as a light source.
echo      ^> "use torch" to equip or unequip
set offhand=torch
set light=yes
goto returnLocation
)
echo    [You try to equip an item, but the slot is full.]
echo      ^> "use" the other item to unequip it first.
goto returnLocation


:inventory_examine_woodensword
echo.
echo    [You examine the wooden sword.]
echo      ^> Better than nothing.
echo      ^> 1-2 damage.
echo      ^> "use wooden sword" to equip or unequip
if "%inventory%" == "closed" goto returnLocation
goto returnLocation

:inventory_use_woodensword
echo.
if "%weapon%" == "wooden sword" (
echo    [You unequip the wooden sword.]
set weapon=none
set damage_min=1
set damage_max=1
goto returnLocation
)
if "%weapon%" == "none" (
echo    [You equip the wooden sword.]
echo      ^> Better than nothing.
echo      ^> 1-2 damage.
echo      ^> "use wooden sword" to unequip
set weapon=wooden sword
set damage_min=1
set damage_max=2
goto returnLocation
)
echo    [You try to equip an item, but the slot is full.]
echo      ^> "use" the other item to unequip it first.
goto returnLocation






















:combat_attack
echo.
echo    [You attack.]
set /a attackroll=1 + %RANDOM% %% (20 - 1 + 1)
set /a attackroll=%attackroll% + %attack%
if "%poison%" == "yes" (
set /a attackroll=%attackroll% - 5
)
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
if "%poison%" == "yes" (
set /a damage=%damage% / 2
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
if "%enemy%" == "giant centipede" goto giantcentipede_attack
if "%enemy%" == "gigantic centipede" goto giganticcentipede_attack
if "%enemy%" == "cave fly" goto cavefly_attack

:youwin
if "%enemy%" == "giant rat" goto youwin_giantrat
if "%enemy%" == "goblin" goto youwin_goblin
if "%enemy%" == "goblin chief" goto youwin_goblinchief
if "%enemy%" == "giant centipede" goto youwin_giantcentipede
if "%enemy%" == "gigantic centipede" goto youwin_giganticcentipede
if "%enemy%" == "cave fly" goto youwin_cavefly

:youescape
echo.
if "%enemy%" == "goblin chief" goto youcantescape
if "%enemy%" == "gigantic centipede" goto youcantescape
if %agility% GTR %enemyagility% (
echo    [You escape!]
set combat=no
set enemy=none
goto returnLocation
)
:youcantescape
echo    [You can't escape!]
goto returnLocation





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
if "%poison%" == "yes" (
echo      ^> You are poisoned (agility, accuracy, power affected^).
)
echo      ^> "a" to attack, "l" to look
echo      ^> "i" to open inventory, "s" to view stats.
echo      ^> "e" to escape
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "noInput" goto returnLocation

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

goto inventoryCommands
goto commandError



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
if "%poison%" == "yes" (
echo      ^> You are poisoned (agility, accuracy, power affected^).
)
echo      ^> "a" to attack, "l" to look
echo      ^> "i" to open inventory, "s" to view stats.
echo      ^> "e" to escape
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "noInput" goto returnLocation

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

goto inventoryCommands
goto commandError



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
if "%poison%" == "yes" (
echo      ^> You are poisoned (agility, accuracy, power affected^).
)
echo      ^> "a" to attack, "l" to look
echo      ^> "i" to open inventory, "s" to view stats.
echo      ^> "e" to escape
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "noInput" goto returnLocation

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

goto inventoryCommands
goto commandError



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








:encounter_giantcentipede
set combat=yes
set enemy=giant centipede
set enemymaxHP_min=6
set enemymaxHP_max=11
set /a enemymaxHP=%enemymaxHP_min% + %RANDOM% %% (%enemymaxHP_max% - %enemymaxHP_min% + 1)
set enemyHP=%enemymaxHP%
set enemydamage_min=1
set enemydamage_max=4
set enemyattack=1
set enemyAC=13
set enemyagility=3
set enemyCritChance=14
:combat_giantcentipede
echo.
echo    You are fighting a giant centipede (%enemyHP%/%enemymaxHP% HP).
echo      ^> You have %HP%/%maxHP% HP.
if "%poison%" == "yes" (
echo      ^> You are poisoned (agility, accuracy, power affected^).
)
echo      ^> "a" to attack, "l" to look
echo      ^> "i" to open inventory, "s" to view stats.
echo      ^> "e" to escape
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "noInput" goto returnLocation

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
if "%input%" == "1" goto giantcentipede_attack
if "%input%" == "a" goto giantcentipede_attack
if "%input%" == "attack" goto giantcentipede_attack
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

if "%input%" == "look at giant centipede" goto look
if "%input%" == "examine giant centipede" goto look
if "%input%" == "look at centipede" goto look
if "%input%" == "examine centipede" goto look

goto inventoryCommands
goto commandError



:giantcentipede_attack

set /a enemyspecialmovechance=1 + %RANDOM% %% (10 - 1 + 1)
if %enemyspecialmovechance% LSS 3 goto giantcentipede_specialattack

echo.

echo    [The giant centipede attacks.]
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
if %critChance% LSS %enemyCritChance% (
set /a damage=%damage% * 2
echo      ^> Critical hit!
)

echo      ^> You take %damage% damage.

set /a HP=%HP% - %damage%
if %HP% LSS 1 (
goto youdie
)
if %enemyagility% GTR %agility% goto combat_attack
goto combat_giantcentipede


:giantcentipede_specialattack
echo.
echo    [The giant centipede attacks with a poisonous claw!]
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
if "%poison%" == "no" (
echo      ^> You are poisoned.
set poison=yes
set /a agility=%agility% - 1
)
set /a HP=%HP% - %damage%
if %HP% LSS 1 (
goto youdie
)
if %enemyagility% GTR %agility% goto combat_attack
goto combat_giantcentipede

:youwin_giantcentipede
echo.
echo    [You win!]
echo      ^> The giant centipede is slain.
echo      ^> You gain %enemymaxHP% exp.
echo.
echo    [You take two bug meat.]
echo      ^> "i" to open inventory
set /a items=%items% + 2
set /a item_bugmeat=%item_bugmeat% + 1
set combat=no
set enemy=none
set /a exp=%exp% + %enemymaxHP%
goto checklevelup





:encounter_giganticcentipede
set combat=yes
set enemy=gigantic centipede
set enemymaxHP_min=16
set enemymaxHP_max=21
set /a enemymaxHP=%enemymaxHP_min% + %RANDOM% %% (%enemymaxHP_max% - %enemymaxHP_min% + 1)
set enemyHP=1
set enemydamage_min=2
set enemydamage_max=5
set enemyattack=3
set enemyAC=13
set enemyagility=3
set enemyCritChance=20
:combat_giganticcentipede
echo.
echo    You are fighting a gigantic centipede (%enemyHP%/%enemymaxHP% HP).
echo      ^> You have %HP%/%maxHP% HP.
if "%poison%" == "yes" (
echo      ^> You are poisoned (agility, accuracy, power affected^).
)
echo      ^> "a" to attack, "l" to look
echo      ^> "i" to open inventory, "s" to view stats.
echo      ^> "e" to escape
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "noInput" goto returnLocation

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
if "%input%" == "1" goto giganticcentipede_attack
if "%input%" == "a" goto giganticcentipede_attack
if "%input%" == "attack" goto giganticcentipede_attack
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

if "%input%" == "look at gigantic centipede" goto look
if "%input%" == "examine gigantic centipede" goto look
if "%input%" == "look at centipede" goto look
if "%input%" == "examine centipede" goto look

goto inventoryCommands
goto commandError



:giganticcentipede_attack

set /a enemyspecialmovechance=1 + %RANDOM% %% (10 - 1 + 1)
if %enemyspecialmovechance% LSS 6 goto giganticcentipede_specialattack

echo.
echo    [The gigantic centipede attacks.]
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
if %critChance% LSS %enemyCritChance% (
set /a damage=%damage% * 2
echo      ^> Critical hit!
)

echo      ^> You take %damage% damage.
set /a HP=%HP% - %damage%
if %HP% LSS 1 (
goto youdie
)
if %enemyagility% GTR %agility% goto combat_attack
goto combat_giganticcentipede

:giganticcentipede_specialattack
echo.
echo    [The gigantic centipede attacks with a poisonous claw!]
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
if "%poison%" == "no" (
echo      ^> You are poisoned.
set poison=yes
set /a agility=%agility% - 1
)
set /a HP=%HP% - %damage%
if %HP% LSS 1 (
goto youdie
)
if %enemyagility% GTR %agility% goto combat_attack
goto combat_giganticcentipede


:youwin_giganticcentipede
echo.
echo    [You win!]
echo      ^> The gigantic centipede is slain.
echo      ^> You gain %enemymaxHP% exp.
echo.
echo    [You take three bug meat and three bug eggs.]
echo      ^> "i" to open inventory
set /a items=%items% + 6
set /a item_bugmeat=%item_bugmeat% + 3
set /a item_bugegg=%item_bugegg% + 3
set giganticcentipede=dead
set combat=no
set enemy=none
set /a exp=%exp% + %enemymaxHP%
goto checklevelup






:encounter_cavefly
set combat=yes
set enemy=cave fly
set enemymaxHP_min=4
set enemymaxHP_max=9
set /a enemymaxHP=%enemymaxHP_min% + %RANDOM% %% (%enemymaxHP_max% - %enemymaxHP_min% + 1)
set enemyHP=%enemymaxHP%
set enemydamage_min=1
set enemydamage_max=3
set enemyattack=0
set enemyAC=10
set enemyagility=2
set enemyCritChance=6
:combat_cavefly
echo.
echo    You are fighting a cave fly (%enemyHP%/%enemymaxHP% HP).
echo      ^> You have %HP%/%maxHP% HP.
if "%poison%" == "yes" (
echo      ^> You are poisoned (agility, accuracy, power affected^).
)
echo      ^> "a" to attack, "l" to look
echo      ^> "i" to open inventory, "s" to view stats.
echo      ^> "e" to escape
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "noInput" goto returnLocation

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
if "%input%" == "1" goto cavefly_attack
if "%input%" == "a" goto cavefly_attack
if "%input%" == "attack" goto cavefly_attack
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

if "%input%" == "look at cave fly" goto look
if "%input%" == "examine cave fly" goto look
if "%input%" == "look at fly" goto look
if "%input%" == "examine fly" goto look

goto inventoryCommands
goto commandError



:cavefly_attack

set /a enemyspecialmovechance=1 + %RANDOM% %% (10 - 1 + 1)
if %enemyspecialmovechance% LSS 3 goto cavefly_specialattack

echo.
echo    [The cave fly attacks.]
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
if %critChance% LSS %enemyCritChance% (
set /a damage=%damage% * 2
echo      ^> Critical hit!
)

echo      ^> You take %damage% damage.
set /a HP=%HP% - %damage%
if %HP% LSS 1 (
goto youdie
)
if %enemyagility% GTR %agility% goto combat_attack
goto combat_cavefly

:cavefly_specialattack
echo.
echo    [The cave fly attacks with its draining proboscis!]
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
if %critChance% LSS %enemyCritChance% (
set /a damage=%damage% * 2
echo      ^> Critical hit!
)

echo      ^> You take %damage% damage.
set /a enemyHPdeficit=%enemymaxHP% - %enemyHP%
set enemyhealing=%damage%
if %enemyhealing% GTR %enemyHPdeficit% (
set enemyhealing=%enemyHPdeficit%
)
echo      ^> The cave fly recovers %enemyhealing% HP.
set /a enemyHP=%enemyHP% + %enemyhealing%
set /a HP=%HP% - %damage%
if %HP% LSS 1 (
goto youdie
)
if %enemyagility% GTR %agility% goto combat_attack
goto combat_cavefly

:youwin_cavefly
echo.
echo    [You win!]
echo      ^> The cave fly is slain.
echo      ^> You gain %enemymaxHP% exp.
echo.
echo    [You take one bug meat.]
echo      ^> "i" to open inventory
set /a items=%items% + 1
set /a item_bugmeat=%item_bugmeat% + 1
set combat=no
set enemy=none
set /a exp=%exp% + %enemymaxHP%
if "%location%" == "route3_quainthut" (
set quainthutcavefly=dead
)
if "%location%" == "route3_5" (
set sturdytentcavefly=dead
)
goto checklevelup














:art_route1_1



set firsttime_tile_route1_1=yes
goto returnLocation
















:cheat2
echo.
echo    [You use cheat 2 to teleport to the swamp south of the dark swampy forest.]
echo      ^> ^+5 strength
echo      ^> ^10 attack
set /a strength=%strength% + 5
set /a attack=%attack% + 10
set location=route2_6
goto returnLocation










:tile_route1_1
if "%firsttime_tile_route1_1%" == "no" goto art_route1_1
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
if "%input%" == "noInput" goto returnLocation

if "%input%" == "" goto 

if "%input%" == "cheat2" goto cheat2

if "%input%" == "m" goto map
if "%input%" == "map" goto map
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

goto inventoryCommands
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
if "%route1_2_ruinedmoccasins%" == "present" (
echo      ^> Hey, it's your old moccasins! You used to play here all the time. --- :^)
echo      ^> Wonder if they still fit...
echo.
echo    [You take a pair of ruined moccasins.]
echo      ^> "i" to open inventory
set route1_2_ruinedmoccasins=absent
set /a luck=%luck% + 3
set /a items=%items% + 1
set /a item_ruinedmoccasins=%item_ruinedmoccasins% + 1
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
if "%input%" == "noInput" goto returnLocation

if "%input%" == "" goto 

if "%input%" == "m" goto map
if "%input%" == "map" goto map
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

goto inventoryCommands
goto commandError

:route1_3_restoration
set /a HPdeficit=%maxHP% - %HP%
echo      ^> You recover %HPdeficit% HP.
set /a HP=%maxHP%
goto route1_3_postrestoration

:tile_route1_3
if "%location%" == "route1_2" (
echo.
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
if "%input%" == "noInput" goto returnLocation

if "%input%" == "" goto 

if "%input%" == "m" goto map
if "%input%" == "map" goto map
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

goto inventoryCommands
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
echo      ^> The village extends to the south.
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
if "%input%" == "noInput" goto returnLocation

if "%input%" == "" goto 

if "%input%" == "m" goto map
if "%input%" == "map" goto map
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

goto inventoryCommands
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
if "%input%" == "noInput" goto returnLocation

if "%input%" == "" goto 

if "%input%" == "m" goto map
if "%input%" == "map" goto map
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

goto inventoryCommands
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
if "%input%" == "noInput" goto returnLocation

if "%input%" == "" goto 

if "%input%" == "m" goto map
if "%input%" == "map" goto map
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

goto inventoryCommands
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
echo      ^> The village extends to the north.
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
if "%input%" == "noInput" goto returnLocation

if "%input%" == "" goto 

if "%input%" == "m" goto map
if "%input%" == "map" goto map
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

if "%input%" == "bridge" goto tile_route2_1
if "%input%" == "cross bridge" goto tile_route2_1
if "%input%" == "go to bridge" goto tile_route2_1
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

goto inventoryCommands
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
if "%input%" == "noInput" goto returnLocation

if "%input%" == "" goto 

if "%input%" == "m" goto map
if "%input%" == "map" goto map
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

goto inventoryCommands
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
if "%input%" == "noInput" goto returnLocation

if "%input%" == "" goto 

if "%input%" == "m" goto map
if "%input%" == "map" goto map
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

goto inventoryCommands
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
if "%input%" == "noInput" goto returnLocation

if "%input%" == "" goto 

if "%input%" == "m" goto map
if "%input%" == "map" goto map
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

goto inventoryCommands
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
if "%input%" == "noInput" goto returnLocation

if "%input%" == "" goto 

if "%input%" == "m" goto map
if "%input%" == "map" goto map
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

goto inventoryCommands
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
if "%input%" == "noInput" goto returnLocation

if "%input%" == "" goto 

if "%input%" == "m" goto map
if "%input%" == "map" goto map
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
if "%input%" == "leave dark forest" goto tile_route2_2
if "%input%" == "leave swampy forest" goto tile_route2_2
if "%input%" == "exit" goto tile_route2_2
if "%input%" == "exit forest" goto tile_route2_2
if "%input%" == "exit dark swampy forest" goto tile_route2_2
if "%input%" == "exit dark forest" goto tile_route2_2
if "%input%" == "exit swampy forest" goto tile_route2_2
if "%input%" == "south" goto tile_route2_7
if "%input%" == "go south" goto tile_route2_7
if "%input%" == "east" goto tile_route2_4
if "%input%" == "go east" goto tile_route2_4

goto inventoryCommands
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
if "%input%" == "noInput" goto returnLocation

if "%input%" == "" goto 

if "%input%" == "m" goto map
if "%input%" == "map" goto map
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

goto inventoryCommands
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
if "%input%" == "noInput" goto returnLocation

if "%input%" == "" goto 

if "%input%" == "m" goto map
if "%input%" == "map" goto map
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
if "%input%" == "leave dark forest" goto tile_route2_6
if "%input%" == "leave swampy forest" goto tile_route2_6

if "%input%" == "exit" goto tile_route2_6
if "%input%" == "exit forest" goto tile_route2_6
if "%input%" == "exit dark swampy forest" goto tile_route2_6
if "%input%" == "exit swampy forest" goto tile_route2_6
if "%input%" == "exit dark forest" goto tile_route2_6

goto inventoryCommands
goto commandError

:tile_route2_6
if "%location%" == "route2_5" (
echo.
echo    [You walk south and exit the dark swampy forest.]
)
if "%location%" == "route3_1" (
echo.
echo    [You step off the shaky wooden bridge into a foggy swamp.]
)
set location=route2_6
echo.
echo  ~ You are in a foggy swamp.
if "%ovalfacedman%" == "present" (
echo.
echo      ^> An oval-faced man is waiting here somberly.
)
echo      ^> To the north is a dark swampy forest.
echo      ^> To the south there is a shaky wooden bridge.
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "noInput" goto returnLocation

if "%input%" == "" goto 

if "%input%" == "m" goto map
if "%input%" == "map" goto map
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

if "%input%" == "south" goto tile_route3_1
if "%input%" == "go south" goto tile_route3_1

if "%input%" == "bridge" goto tile_route3_1
if "%input%" == "wooden bridge" goto tile_route3_1
if "%input%" == "shaky wooden bridge" goto tile_route3_1
if "%input%" == "shaky bridge" goto tile_route3_1
if "%input%" == "go to bridge" goto tile_route3_1
if "%input%" == "go to wooden bridge" goto tile_route3_1
if "%input%" == "go to shaky wooden bridge" goto tile_route3_1
if "%input%" == "go to shaky bridge" goto tile_route3_1
if "%input%" == "go on bridge" goto tile_route3_1
if "%input%" == "go on wooden bridge" goto tile_route3_1
if "%input%" == "go on shaky wooden bridge" goto tile_route3_1
if "%input%" == "go on shaky bridge" goto tile_route3_1
if "%input%" == "cross bridge" goto tile_route3_1
if "%input%" == "cross wooden bridge" goto tile_route3_1
if "%input%" == "cross shaky wooden bridge" goto tile_route3_1
if "%input%" == "cross shaky bridge" goto tile_route3_1

goto inventoryCommands
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
if "%input%" == "noInput" goto returnLocation
if "%input%" == "1" goto talkto_ovalfacedman1_no
if "%input%" == "no" goto talkto_ovalfacedman1_no
if "%input%" == "2" goto talkto_ovalfacedman1_yes
if "%input%" == "yes" goto talkto_ovalfacedman1_yes
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
echo    [You receive a health potion and some ruined moccasins.]
echo      ^> "i" to open inventory
set ovalfacedman_loot=given
set /a items=%items% + 2
set /a item_healthpotion=%item_healthpotion% + 1
set /a item_ruinedmoccasins=%item_ruinedmoccasins% + 1
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
if "%input%" == "noInput" goto returnLocation

if "%input%" == "1" goto talkto_ovalfacedman2_no
if "%input%" == "no" goto talkto_ovalfacedman2_no
if "%input%" == "2" goto talkto_ovalfacedman2_yes
if "%input%" == "yes" goto talkto_ovalfacedman2_yes

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
echo    [You receive a health potion and some ruined moccasins.]
echo      ^> "i" to open inventory
set ovalfacedman_loot=given
set /a items=%items% + 2
set /a item_healthpotion=%item_healthpotion% + 1
set /a item_ruinedmoccasins=%item_ruinedmoccasins% + 1
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
echo      ^> "Thank you for the closure." --- :^)
if %charisma% GTR 0 (
if "%ovalfacedman_loot%" == "not given" (
echo      ^> The oval-faced man looks down at your bare feet.
echo      ^> "Here," he adds. "You seem nice; should have these."
echo.
echo    [You receive a health potion and some ruined moccasins.]
echo      ^> "i" to open inventory
set /a luck=%luck% + 5
set ovalfacedman_loot=given
set /a items=%items% + 2
set /a item_healthpotion=%item_healthpotion% + 1
set /a item_ruinedmoccasins=%item_ruinedmoccasins% + 1
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
if "%input%" == "noInput" goto returnLocation

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
if "%input%" == "noInput" goto returnLocation

if "%input%" == "" goto 

if "%input%" == "m" goto map
if "%input%" == "map" goto map
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

goto inventoryCommands
goto commandError

:tile_route2_8
if "%location%" == "route2_7" (
echo.
echo    [You walk south, as deep as you can into the dark swampy forest.]
if "%goblinchief%" == "alive" (
echo      ^> The goblin chief appears!
set location=route2_8
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
if "%input%" == "noInput" goto returnLocation

if "%input%" == "" goto 

if "%input%" == "m" goto map
if "%input%" == "map" goto map
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
if "%input%" == "take purple mushroom" goto route2_8_mushrooms

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

goto inventoryCommands
goto commandError

:route2_8_mushrooms
echo.
echo    [You take three purple mushrooms.]
echo      ^> "i" to open inventory
set route2_8_mushrooms=absent
set /a items=%items% + 3
set /a item_purplemushroom=%item_purplemushroom% + 3
goto returnLocation











:tile_route3_1
if "%location%" == "route2_6" (
echo.
echo    [You step onto the shaky wooden bridge.]
)
if "%location%" == "route3_2" (
echo.
echo    [You step onto the shaky wooden bridge.]
)

set location=route3_1
echo.
echo  ~ You are on a shaky wooden bridge.
echo      ^> To the north is a foggy swamp.
echo      ^> To the south is a rocky field.
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=

if "%input%" == "noInput" goto returnLocation

if "%input%" == "" goto 

if "%input%" == "m" goto map
if "%input%" == "map" goto map
if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look
if "%input%" == "h" goto help
if "%input%" == "help" goto help


if "%input%" == "north" goto tile_route2_6
if "%input%" == "go north" goto tile_route2_6
if "%input%" == "swamp" goto tile_route2_6
if "%input%" == "foggy swamp" goto tile_route2_6
if "%input%" == "go to swamp" goto tile_route2_6
if "%input%" == "go to foggy swamp" goto tile_route2_6
if "%input%" == "enter swamp" goto tile_route2_6
if "%input%" == "enter foggy swamp" goto tile_route2_6

if "%input%" == "south" goto tile_route3_2
if "%input%" == "go south" goto tile_route3_2
if "%input%" == "field" goto tile_route3_2
if "%input%" == "rocky field" goto tile_route3_2
if "%input%" == "go to field" goto tile_route3_2
if "%input%" == "go to rocky field" goto tile_route3_2
if "%input%" == "enter field" goto tile_route3_2
if "%input%" == "enter rocky field" goto tile_route3_2


goto inventoryCommands
goto commandError




:route3_2_randomencountercheck

set /a randomencounterchance=1 + %RANDOM% %% (10 - 1 + 1)
if %randomencounterchance% LSS 3 (
echo      ^> A giant cave fly appears!
set location=route3_2
goto encounter_cavefly
)
goto tile_route3_2_continued

:tile_route3_2
if "%location%" == "route3_1" (
echo.
echo    [You step off the shaky wooden bridge into a rocky field.]
)
if "%location%" == "route3_3" (
echo.
echo    [You walk north and exit the dark fetid cave.]
)
:tile_route3_2_continued
set location=route3_2
echo.
echo  ~ You are in a rocky field near a fetid cave.
echo      ^> To the north is a shaky wooden bridge.
echo      ^> To the south is the entrance to a dark fetid cave.
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=

if "%input%" == "noInput" goto returnLocation

if "%input%" == "" goto 

if "%input%" == "north" goto tile_route3_1
if "%input%" == "go north" goto tile_route3_1
if "%input%" == "bridge" goto tile_route3_1
if "%input%" == "wooden bridge" goto tile_route3_1
if "%input%" == "shaky wooden bridge" goto tile_route3_1
if "%input%" == "shaky bridge" goto tile_route3_1
if "%input%" == "go to bridge" goto tile_route3_1
if "%input%" == "go to wooden bridge" goto tile_route3_1
if "%input%" == "go to shaky wooden bridge" goto tile_route3_1
if "%input%" == "go to shaky bridge" goto tile_route3_1
if "%input%" == "go on bridge" goto tile_route3_1
if "%input%" == "go on wooden bridge" goto tile_route3_1
if "%input%" == "go on shaky wooden bridge" goto tile_route3_1
if "%input%" == "go on shaky bridge" goto tile_route3_1
if "%input%" == "cross bridge" goto tile_route3_1
if "%input%" == "cross wooden bridge" goto tile_route3_1
if "%input%" == "cross shaky wooden bridge" goto tile_route3_1
if "%input%" == "cross shaky bridge" goto tile_route3_1

if "%input%" == "hut" goto route3_2_examine_quainthut
if "%input%" == "quaint hut" goto route3_2_examine_quainthut
if "%input%" == "house" goto route3_2_examine_quainthut
if "%input%" == "look at hut" goto route3_2_examine_quainthut
if "%input%" == "look at quaint hut" goto route3_2_examine_quainthut
if "%input%" == "look at house" goto route3_2_examine_quainthut
if "%input%" == "examine hut" goto route3_2_examine_quainthut
if "%input%" == "examine quaint hut" goto route3_2_examine_quainthut
if "%input%" == "examine house" goto route3_2_examine_quainthut


if "%input%" == "go to hut" goto tile_route3_quainthut
if "%input%" == "go to quaint hut" goto tile_route3_quainthut
if "%input%" == "go to house" goto tile_route3_quainthut
if "%input%" == "go in hut" goto tile_route3_quainthut
if "%input%" == "go in quaint hut" goto tile_route3_quainthut
if "%input%" == "go in house" goto tile_route3_quainthut
if "%input%" == "go into hut" goto tile_route3_quainthut
if "%input%" == "go into quaint hut" goto tile_route3_quainthut
if "%input%" == "go into house" goto tile_route3_quainthut
if "%input%" == "go inside hut" goto tile_route3_quainthut
if "%input%" == "go inside quaint hut" goto tile_route3_quainthut
if "%input%" == "go inside house" goto tile_route3_quainthut
if "%input%" == "enter hut" goto tile_route3_quainthut
if "%input%" == "enter quaint hut" goto tile_route3_quainthut
if "%input%" == "enter house" goto tile_route3_quainthut
if "%input%" == "go in" goto tile_route3_quainthut
if "%input%" == "go inside" goto tile_route3_quainthut



if "%input%" == "south" goto tile_route3_3
if "%input%" == "go south" goto tile_route3_3
if "%input%" == "cave" goto tile_route3_3
if "%input%" == "fetid cave" goto tile_route3_3
if "%input%" == "dark cave" goto tile_route3_3
if "%input%" == "dark fetid cave" goto tile_route3_3
if "%input%" == "go to cave" goto tile_route3_3
if "%input%" == "go to fetid cave" goto tile_route3_3
if "%input%" == "go to dark cave" goto tile_route3_3
if "%input%" == "go to dark fetid cave" goto tile_route3_3
if "%input%" == "go in cave" goto tile_route3_3
if "%input%" == "go in fetid cave" goto tile_route3_3
if "%input%" == "go in dark cave" goto tile_route3_3
if "%input%" == "go in dark fetid cave" goto tile_route3_3
if "%input%" == "enter cave" goto tile_route3_3
if "%input%" == "enter fetid cave" goto tile_route3_3
if "%input%" == "enter dark cave" goto tile_route3_3
if "%input%" == "enter dark fetid cave" goto tile_route3_3
if "%input%" == "cave entrance" goto tile_route3_3
if "%input%" == "fetid cave entrance" goto tile_route3_3
if "%input%" == "dark cave entrance" goto tile_route3_3
if "%input%" == "dark fetid cave entrance" goto tile_route3_3
if "%input%" == "go to cave entrance" goto tile_route3_3
if "%input%" == "go to fetid cave entrance" goto tile_route3_3
if "%input%" == "go to dark cave entrance" goto tile_route3_3
if "%input%" == "go to dark fetid cave entrance" goto tile_route3_3
if "%input%" == "go in cave entrance" goto tile_route3_3
if "%input%" == "go in fetid cave entrance" goto tile_route3_3
if "%input%" == "go in dark cave entrance" goto tile_route3_3
if "%input%" == "go in dark fetid cave entrance" goto tile_route3_3
if "%input%" == "enter cave entrance" goto tile_route3_3
if "%input%" == "enter fetid cave entrance" goto tile_route3_3
if "%input%" == "enter dark cave entrance" goto tile_route3_3
if "%input%" == "enter dark fetid cave entrance" goto tile_route3_3

if "%input%" == "m" goto map
if "%input%" == "map" goto map
if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look
if "%input%" == "h" goto help
if "%input%" == "help" goto help


goto inventoryCommands
goto commandError







:apothecarycutscene1
echo. 
echo    [A feeble man pops up from behind the table.]
echo      ^> It's the apothecary from your village.
echo      ^> "I'm saved!" he says. "You swatted the bug!"
echo      ^> "I got attacked in the cave nearby and dropped my wooden sword.
echo      ^> "I'm really only able to brandish a light wooden weapon these days.
echo      ^> "You don't have a wooden weapon for me, do you?"
echo.
echo    [What do you say?]
echo      1. No, I don't.
echo      2. Yes, let's see here...
echo.
set input=noInput
set /p input=
if "%input%" == "noInput" goto returnLocation
if "%input%" == "1" goto apothecarycutscene1_no
if "%input%" == "no" goto apothecarycutscene1_no
if "%input%" == "2" goto apothecarycutscene1_yes
if "%input%" == "yes" goto apothecarycutscene1_yes
goto commandError

:apothecarycutscene1_no
echo. 
echo    [You shake your head.]
echo      ^> "Okay," the apothecary says. "Guess I'll die here."
set apothecarycutscene1=yes
goto returnLocation
rummagingthroughyourwoodenweapons
:apothecarycutscene1_yes
set apothecarycutscene1=yes
set rummagingthroughyourwoodenweapons=yes
echo.
echo    [You rummage through your inventory for wooden weapons...]
if %item_woodensword% LSS 1 (
if %item_goblinscimitar% LSS 1 (
echo      ^> You have no wooden weapons.
echo      ^> "Okay," the apothecary says. "Guess I'll die here."
set rummagingthroughyourwoodenweapons=no
goto returnLocation
)
)
if %item_goblinscimitar% GTR 0 (
echo      ^> goblin scimitar x%item_goblinscimitar%
if "%weapon%" == "goblin scimitar" (
echo         (equipped --- 1-3^)
)
)
if %item_woodensword% GTR 0 (
echo      ^> wooden sword x%item_woodensword%
if "%weapon%" == "wooden sword" (
echo         (equipped, 1-2^)
)
)
echo.
echo    [What weapon do you offer to the apothecary?]
if %item_goblinscimitar% GTR 0 (
echo      ^> goblin scimitar
)
if %item_woodensword% GTR 0 (
echo      ^> wooden sword
)
echo      ^> none
echo.
set input=noInput
set /p input=
if "%input%" == "noInput" goto returnLocation
if %item_woodensword% GTR 0 (
if "%input%" == "sword" goto apothecaryoffer_woodensword
if "%input%" == "wooden sword" goto apothecaryoffer_woodensword
)
if %item_goblinscimitar% GTR 0 (
if "%input%" == "scimitar" goto apothecaryoffer_goblinscimitar
if "%input%" == "goblin scimitar" goto apothecaryoffer_goblinscimitar
if "%input%" == "goblin" goto apothecaryoffer_goblinscimitar
)
if "%input%" == "none" goto apothecarycutscene1_no
goto commandError

:apothecaryoffer_woodensword
set apothecarycutscene1=yes
set rummagingthroughyourwoodenweapons=no
echo.
if NOT "%weapon%" == "wooden sword" (
echo    [You offer up a wooden sword.]
set /a items=%items% - 1
set /a item_woodensword=%item_woodensword% - 1
)
if "%weapon%" == "wooden sword" (
if %item_woodensword% == 1 (
echo    [You unequip and offer up your wooden sword.]
set weapon=none
set damage_min=1
set damage_max=1
set /a items=%items% - 1
set /a item_woodensword=%item_woodensword% - 1
)
)
echo.
echo      ^> The apothecary brandishes the weapon a few times, pleased. --- :^)
echo      ^> "Yes!" he says. "Here, take this. For now it's my only one.
echo      ^> "I'll make more potions if you bring me ingredients."
echo.
echo    [You receive one antidote.]
set /a luck=%luck% + 1
set /a items=%items% + 1
set /a item_antidote=%item_antidote% + 1
set givenapothecarysword=yes
goto returnLocation


:apothecaryoffer_goblinscimitar
set rummagingthroughyourwoodenweapons=no
set apothecarycutscene1=yes
echo.
if NOT "%weapon%" == "goblin scimitar" (
echo    [You offer up a goblin scimitar.]
set /a items=%items% - 1
set /a item_goblinscimitar=%item_goblinscimitar% - 1
)
if "%weapon%" == "goblin scimitar" (
if %item_goblinscimitar% == 1 (
echo    [You unequip and offer up your goblin scimitar.]
set weapon=none
set damage_min=1
set damage_max=1
set /a items=%items% - 1
set /a item_goblinscimitar=%item_goblinscimitar% - 1
)
)
echo.
echo      ^> The apothecary brandishes the weapon a few times, pleased. --- :^)
echo      ^> "Yes!" he says. "Here, take this. For now it's my only one.
echo      ^> "I'll make more potions if you bring me ingredients."
echo.
echo    [You receive one antidote.]
set /a luck=%luck% + 2
set /a items=%items% + 1
set /a item_antidote=%item_antidote% + 1
set givenapothecarysword=yes
goto returnLocation


:route3_2_examine_quainthut
echo.
echo    [You examine the quaint hut.]
echo      ^> It's been standing a few years, but it's not that well built.
echo      ^> "enter hut" to go inside
goto tile_route3_2

:tile_route3_quainthut
if "%location%" == "route3_2" (
echo.
echo    [You enter the quaint hut.]
if "%quainthutcavefly%" == "alive" (
echo      ^> A cave fly appears!
set location=route3_quainthut
goto encounter_cavefly                                                              
)
)

if "%apothecarycutscene1%" == "no" goto apothecarycutscene1
:tile_route3_quainthut_continued
set location=route3_quainthut
echo.
echo  * You are inside a quaint hut in a rocky field.
echo      ^> The apothecary from your village is here.
echo      ^> From here you can leave.
if "%firsttime_tile_route3_quainthut%" == "no" (
echo      ^> "h" for help
echo      ^> "l" to look around
set firsttime_tile_route3_quainthut=yes
)
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "noInput" goto returnLocation

if "%input%" == "" goto 


if "%input%" == "leave hut" goto tile_route3_2
if "%input%" == "exit hut" goto tile_route3_2
if "%input%" == "leave quaint hut" goto tile_route3_2
if "%input%" == "exit quaint hut" goto tile_route3_2
if "%input%" == "leave house" goto tile_route3_2
if "%input%" == "exit house" goto tile_route3_2

if "%input%" == "enter field" goto tile_route3_2
if "%input%" == "go to field" goto tile_route3_2
if "%input%" == "enter rocky field" goto tile_route3_2
if "%input%" == "go to rock field" goto tile_route3_2
if "%input%" == "go back" goto tile_route3_2
if "%input%" == "back" goto tile_route3_2
if "%input%" == "exit" goto tile_route3_2
if "%input%" == "leave" goto tile_route3_2

if "%apothecary%" == "present" (
if "%input%" == "man" goto examine_apothecary
if "%input%" == "feeble man" goto examine_apothecary
if "%input%" == "him" goto examine_apothecary
if "%input%" == "examine man" goto examine_apothecary
if "%input%" == "examine feeble man" goto examine_apothecary
if "%input%" == "examine him" goto examine_apothecary
if "%input%" == "look at man" goto examine_apothecary
if "%input%" == "look at feeble man" goto examine_apothecary
if "%input%" == "look at him" goto examine_apothecary

if "%input%" == "talk to man" goto talkto_apothecary
if "%input%" == "talk to feeble man" goto talkto_apothecary
if "%input%" == "talk to him" goto talkto_apothecary
if "%input%" == "speak to man" goto talkto_apothecary
if "%input%" == "speak to feeble man" goto talkto_apothecary
if "%input%" == "speak to him" goto talkto_apothecary
if "%input%" == "go to man" goto talkto_apothecary
if "%input%" == "go to feeble man" goto talkto_apothecary
if "%input%" == "go to him" goto talkto_apothecary

if "%input%" == "apothecary" goto examine_apothecary
if "%input%" == "feeble apothecary" goto examine_apothecary
if "%input%" == "him" goto examine_apothecary
if "%input%" == "examine apothecary" goto examine_apothecary
if "%input%" == "examine feeble apothecary" goto examine_apothecary
if "%input%" == "examine him" goto examine_apothecary
if "%input%" == "look at apothecary" goto examine_apothecary
if "%input%" == "look at feeble apothecary" goto examine_apothecary
if "%input%" == "look at him" goto examine_apothecary

if "%input%" == "talk to apothecary" goto talkto_apothecary
if "%input%" == "talk to feeble apothecary" goto talkto_apothecary
if "%input%" == "talk to him" goto talkto_apothecary
if "%input%" == "speak to apothecary" goto talkto_apothecary
if "%input%" == "speak to feeble apothecary" goto talkto_apothecary
if "%input%" == "speak to him" goto talkto_apothecary
if "%input%" == "go to apothecary" goto talkto_apothecary
if "%input%" == "go to feeble apothecary" goto talkto_apothecary
if "%input%" == "go to him" goto talkto_apothecary
)


if "%input%" == "m" goto map
if "%input%" == "map" goto map
if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look
if "%input%" == "h" goto help
if "%input%" == "help" goto help


goto inventoryCommands
goto commandError



:examine_apothecary
echo.
echo    [You examine the apothecary.]
echo      ^> He does not look very strong, but he is adept with his craft.
echo      ^> "talk to apothecary" to chat
goto returnLocation

:talkto_apothecary
if "%givenapothecarysword%" == "no" goto apothecarycutscene1
echo.
echo    [You talk to the apothecary.]
echo      ^> "I'll make more potions if you bring me ingredients," he says.
echo      ^> "For now I'm going to rest and practice with my new sword.
echo      ^> "But be on the look out for purple mushrooms, bug eggs, and vegetables."
goto returnLocation

:tile_route3_3
if "%location%" == "route3_2" (
echo.
echo    [You walk south and enter the dark fetid cave.]
)
if "%location%" == "route3_4" (
echo.
echo    [You walk north back through the small tunnel.]
)
if "%location%" == "route3_5" (
echo.
echo    [You walk west within the dark fetid cave.]
)
if "%location%" == "route3_7" (
echo.
echo    [You walk east within the dark fetid cave.]
)
set location=route3_3
echo.
echo  ~ You are in a dark fetid cave.
echo      ^> There is light to the north.
echo      ^> The cave extends to the west.
echo      ^> The cave extends to the east.
echo      ^> To the south there is a small tunnel.
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=

if "%input%" == "noInput" goto returnLocation

if "%input%" == "" goto 

if "%input%" == "north" goto tile_route3_2
if "%input%" == "go north" goto tile_route3_2
if "%input%" == "light" goto tile_route3_2
if "%input%" == "go to light" goto tile_route3_2
if "%input%" == "go toward light" goto tile_route3_2
if "%input%" == "leave" goto tile_route3_2
if "%input%" == "exit" goto tile_route3_2
if "%input%" == "leave cave" goto tile_route3_2
if "%input%" == "exit cave" goto tile_route3_2
if "%input%" == "leave fetid cave" goto tile_route3_2
if "%input%" == "exit fetid cave" goto tile_route3_2
if "%input%" == "leave dark fetid cave" goto tile_route3_2
if "%input%" == "exit dark fetid cave" goto tile_route3_2
if "%input%" == "leave dark cave" goto tile_route3_2
if "%input%" == "exit dark cave" goto tile_route3_2


if "%input%" == "east" goto tile_route3_5
if "%input%" == "go east" goto tile_route3_5
if "%input%" == "camp" goto tile_route3_5
if "%input%" == "mining camp" goto tile_route3_5
if "%input%" == "abandoned mining camp" goto tile_route3_5
if "%input%" == "go to camp" goto tile_route3_5
if "%input%" == "go to mining camp" goto tile_route3_5
if "%input%" == "go to abandoned mining camp" goto tile_route3_5
if "%input%" == "enter camp" goto tile_route3_5
if "%input%" == "enter mining camp" goto tile_route3_5
if "%input%" == "enter abandoned mining camp" goto tile_route3_5

if "%input%" == "west" goto tile_route3_7
if "%input%" == "go west" goto tile_route3_7


if "%input%" == "south" goto tile_route3_4
if "%input%" == "go south" goto tile_route3_4
if "%input%" == "tunnel" goto tile_route3_4
if "%input%" == "south tunnel" goto tile_route3_4
if "%input%" == "small tunnel" goto tile_route3_4
if "%input%" == "enter tunnel" goto tile_route3_4
if "%input%" == "enter south tunnel" goto tile_route3_4
if "%input%" == "enter small tunnel" goto tile_route3_4
if "%input%" == "go to tunnel" goto tile_route3_4
if "%input%" == "go to south tunnel" goto tile_route3_4
if "%input%" == "go to small tunnel" goto tile_route3_4
if "%input%" == "go in tunnel" goto tile_route3_4
if "%input%" == "go in south tunnel" goto tile_route3_4
if "%input%" == "go in small tunnel" goto tile_route3_4



if "%input%" == "m" goto map
if "%input%" == "map" goto map
if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look
if "%input%" == "h" goto help
if "%input%" == "help" goto help


goto inventoryCommands
goto commandError



:tile_route3_4
if "%location%" == "route3_3" (
echo.
echo    [You walk south through the small tunnel until you reach a dark claustrophic cavern.]
echo      ^> A giant centipede appears!
set location=route3_4
goto encounter_giantcentipede
)
set location=route3_4
echo.
echo  ~ You are in a dark claustrophic cavern in a dark fetid cave.
echo      ^> North is the only way from here.
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=

if "%input%" == "noInput" goto returnLocation

if "%input%" == "north" goto tile_route3_3
if "%input%" == "go north" goto tile_route3_3
if "%input%" == "leave" goto tile_route3_3
if "%input%" == "exit" goto tile_route3_3
if "%input%" == "go back" goto tile_route3_3
if "%input%" == "back" goto tile_route3_3

if "%input%" == "take egg" goto takebugeggs_route3
if "%input%" == "take eggs" goto takebugeggs_route3
if "%input%" == "take bug egg" goto takebugeggs_route3
if "%input%" == "take bug eggs" goto takebugeggs_route3

if "%input%" == "m" goto map
if "%input%" == "map" goto map
if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look
if "%input%" == "h" goto help
if "%input%" == "help" goto help


goto inventoryCommands
goto commandError



:tile_route3_5
if "%location%" == "route3_tent" (
echo.
echo    [You exit the sturdy tent.]
if "%sturdytentcavefly%" == "alive" (
echo      ^> A cave fly appears!
set location=route3_route3_5
goto encounter_cavefly                                                              
)

)
if "%location%" == "route3_3" (
echo.
echo    [You walk east within the dark fetid cave.]
)
if "%location%" == "route3_6" (
echo.
echo    [You walk west and enter the dark fetid cave.]
)

set location=route3_5
echo.
echo  ~ You are in an abandoned mining camp, inside a dark fetid cave.
echo      ^> The cave extends to the west.
echo      ^> There is light to the east.
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=

if "%input%" == "noInput" goto returnLocation

if "%input%" == "" goto 



if "%input%" == "go to tent" goto tile_route3_tent
if "%input%" == "enter tent" goto tile_route3_tent
if "%input%" == "go in tent" goto tile_route3_tent
if "%input%" == "go inside tent" goto tile_route3_tent
if "%input%" == "go to sturdy tent" goto tile_route3_tent
if "%input%" == "enter sturdy tent" goto tile_route3_tent
if "%input%" == "go in sturdy tent" goto tile_route3_tent
if "%input%" == "go inside sturdy tent" goto tile_route3_tent
if "%input%" == "go to it" goto tile_route3_tent
if "%input%" == "enter it" goto tile_route3_tent
if "%input%" == "go in it" goto tile_route3_tent
if "%input%" == "go inside it" goto tile_route3_tent
if "%input%" == "go in" goto tile_route3_tent
if "%input%" == "go inside" goto tile_route3_tent
if "%input%" == "enter" goto tile_route3_tent

if "%input%" == "look at tent" goto examinesturdytent
if "%input%" == "examine tent" goto examinesturdytent
if "%input%" == "look at sturdy tent" goto examinesturdytent
if "%input%" == "examine sturdy tent" goto examinesturdytent
if "%input%" == "look at it" goto examinesturdytent
if "%input%" == "examine it" goto examinesturdytent

if "%route3_5_pickaxe%" == "present" (
if "%input%" == "take axe" goto takeroute3_5pickaxe
if "%input%" == "axe" goto takeroute3_5pickaxe
if "%input%" == "look at axe" goto takeroute3_5pickaxe
if "%input%" == "examine axe" goto takeroute3_5pickaxe
if "%input%" == "take pickaxe" goto takeroute3_5pickaxe
if "%input%" == "pickaxe" goto takeroute3_5pickaxe
if "%input%" == "look at pickaxe" goto takeroute3_5pickaxe
if "%input%" == "examine pickaxe" goto takeroute3_5pickaxe
if "%input%" == "take pick axe" goto takeroute3_5pickaxe
if "%input%" == "pick axe" goto takeroute3_5pickaxe
if "%input%" == "look at pick axe" goto takeroute3_5pickaxe
if "%input%" == "examine pick axe" goto takeroute3_5pickaxe
if "%input%" == "take pick" goto takeroute3_5pickaxe
if "%input%" == "pick" goto takeroute3_5pickaxe
if "%input%" == "look at pick" goto takeroute3_5pickaxe
if "%input%" == "examine pick" goto takeroute3_5pickaxe
)

if "%input%" == "west" goto tile_route3_7
if "%input%" == "go west" goto tile_route3_7
if "%input%" == "east" goto tile_route3_6
if "%input%" == "go east" goto tile_route3_6
if "%input%" == "light" goto tile_route3_6
if "%input%" == "go to light" goto tile_route3_6
if "%input%" == "go toward light" goto tile_route3_6
if "%input%" == "leave" goto tile_route3_6
if "%input%" == "exit" goto tile_route3_6
if "%input%" == "leave cave" goto tile_route3_6
if "%input%" == "exit cave" goto tile_route3_6
if "%input%" == "leave fetid cave" goto tile_route3_6
if "%input%" == "exit fetid cave" goto tile_route3_6
if "%input%" == "leave dark fetid cave" goto tile_route3_6
if "%input%" == "exit dark fetid cave" goto tile_route3_6
if "%input%" == "leave dark cave" goto tile_route3_6
if "%input%" == "exit dark cave" goto tile_route3_6

if "%input%" == "m" goto map
if "%input%" == "map" goto map
if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look
if "%input%" == "h" goto help
if "%input%" == "help" goto help


goto inventoryCommands
goto commandError



:takeroute3_5pickaxe
echo.
echo    [You take the pickaxe.]
echo      ^> Not designed as a weapon, but not designed as a toy either.
echo      ^> "i" to open inventory
set /a items=%items% + 1
set /a item_pickaxe=%item_pickaxe% + 1
set route3_5_pickaxe=absent
goto returnLocation



:examinesturdytent
echo.
echo    [You enter the sturdy tent.]
echo      ^> Maybe there were more before, but this is the only tent left.
echo      ^> It's big enough to "enter"
goto returnLocation

:tile_route3_tent
if "%location%" == "route3_5" (
echo.
echo    [You enter the sturdy tent.]
)
set location=route3_tent
echo.
echo  * You are inside a sturdy tent in a mining camp in a dark fetid cave.
echo      ^> From here you can leave.
if "%firsttime_tile_route3_tent%" == "no" (
echo      ^> "h" for help
echo      ^> "l" to look around
set firsttime_tile_route3_tent=yes
)
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "noInput" goto returnLocation

if "%input%" == "" goto 

if "%input%" == "leave tent" goto tile_route3_5
if "%input%" == "exit tent" goto tile_route3_5
if "%input%" == "leave sturdy tent" goto tile_route3_5
if "%input%" == "exit sturdy tent" goto tile_route3_5
if "%input%" == "leave house" goto tile_route3_5
if "%input%" == "exit house" goto tile_route3_5
if "%input%" == "go back" goto tile_route3_5
if "%input%" == "back" goto tile_route3_5
if "%input%" == "back out" goto tile_route3_5
if "%input%" == "exit" goto tile_route3_5
if "%input%" == "leave" goto tile_route3_5

if "%route3_tent_antidote%" == "present" (
if "%input%" == "take antidote" goto takeroute3tentantidote
if "%input%" == "antidote" goto inventory_examine_antidote
if "%input%" == "look at antidote" goto inventory_examine_antidote
if "%input%" == "examine antidote" goto inventory_examine_antidote
)


if "%route3_tent_ironshinguards%" == "present" (
if "%input%" == "take shinguards" goto takeroute3tentshinguards
if "%input%" == "take iron shinguards" goto takeroute3tentshinguards
if "%input%" == "shinguards" goto inventory_examine_shinguards
if "%input%" == "iron shinguards" goto inventory_examine_shinguards
if "%input%" == "look at shinguards" goto inventory_examine_shinguards
if "%input%" == "look at iron shinguards" goto inventory_examine_shinguards
if "%input%" == "examine shinguards" goto inventory_examine_shinguards
if "%input%" == "examine iron shinguards" goto inventory_examine_shinguards
)

if "%input%" == "m" goto map
if "%input%" == "map" goto map
if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look
if "%input%" == "h" goto help
if "%input%" == "help" goto help


goto inventoryCommands
goto commandError



:takeroute3tentshinguards
echo.
echo    [You take the iron shinguards.]
echo      ^> "i" to open inventory
set /a items=%items% + 1
set /a item_ironshinguards=%item_ironshinguards% + 1
set route3_tent_ironshinguards=absent
goto returnLocation


:takeroute3tentantidote
echo.
echo    [You take one antidote.]
echo      ^> "i" to open inventory
set /a items=%items% + 1
set /a item_antidote=%item_antidote% + 1
set route3_tent_antidote=absent
goto returnLocation




:tile_route3_6
if "%location%" == "route3_5" (
echo.
echo    [You walk east and exit the dark fetid cave.]
)
set location=route3_6
echo.
echo  ~ You are at a rocky cliff near a dark fetid cave.
echo      ^> To the west is the entrance to a dark fetid cave.
echo      ^> (Coming soon: To the east is a small, modest bridge.)
echo      ^> (Coming soon: To the south is the bridge to Pineseville.)
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=

if "%input%" == "noInput" goto returnLocation

if "%input%" == "" goto 

if "%input%" == "west" goto tile_route3_5
if "%input%" == "go west" goto tile_route3_5
if "%input%" == "cave" goto tile_route3_5
if "%input%" == "fetid cave" goto tile_route3_5
if "%input%" == "dark cave" goto tile_route3_5
if "%input%" == "dark fetid cave" goto tile_route3_5
if "%input%" == "go to cave" goto tile_route3_5
if "%input%" == "go to fetid cave" goto tile_route3_5
if "%input%" == "go to dark cave" goto tile_route3_5
if "%input%" == "go to dark fetid cave" goto tile_route3_5
if "%input%" == "go in cave" goto tile_route3_5
if "%input%" == "go in fetid cave" goto tile_route3_5
if "%input%" == "go in dark cave" goto tile_route3_5
if "%input%" == "go in dark fetid cave" goto tile_route3_5
if "%input%" == "enter cave" goto tile_route3_5
if "%input%" == "enter fetid cave" goto tile_route3_5
if "%input%" == "enter dark cave" goto tile_route3_5
if "%input%" == "enter dark fetid cave" goto tile_route3_5
if "%input%" == "cave entrance" goto tile_route3_5
if "%input%" == "fetid cave entrance" goto tile_route3_5
if "%input%" == "dark cave entrance" goto tile_route3_5
if "%input%" == "dark fetid cave entrance" goto tile_route3_5
if "%input%" == "go to cave entrance" goto tile_route3_5
if "%input%" == "go to fetid cave entrance" goto tile_route3_5
if "%input%" == "go to dark cave entrance" goto tile_route3_5
if "%input%" == "go to dark fetid cave entrance" goto tile_route3_5
if "%input%" == "go in cave entrance" goto tile_route3_5
if "%input%" == "go in fetid cave entrance" goto tile_route3_5
if "%input%" == "go in dark cave entrance" goto tile_route3_5
if "%input%" == "go in dark fetid cave entrance" goto tile_route3_5
if "%input%" == "enter cave entrance" goto tile_route3_5
if "%input%" == "enter fetid cave entrance" goto tile_route3_5
if "%input%" == "enter dark cave entrance" goto tile_route3_5
if "%input%" == "enter dark fetid cave entrance" goto tile_route3_5


if "%input%" == "m" goto map
if "%input%" == "map" goto map
if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look
if "%input%" == "h" goto help
if "%input%" == "help" goto help


goto inventoryCommands
goto commandError





:route3_7_randomeventcheck
set location=route3_7
set /a randomeventchance=1 + %RANDOM% %% (100 - 1 + 1)

if %randomeventchance% LSS 46 (
echo      ^> A cave fly appears!
set location=route3_7
goto encounter_cavefly
)

if %randomeventchance% GTR 70 (
if "%route3_7_hardhat%" == "present" (
echo      ^> There's a hardhat over there.
echo      ^> Someone must have skedaddled out of here in a hurry and forgotten it.
echo.
echo    [You take one hardhat.]
echo      ^> "i" to open inventory
set route3_7_hardhat=absent
set /a items=%items% + 1
set /a item_hardhat=%item_hardhat% + 1
goto tile_route3_7_continued
)
if "%route3_7_woodensword%" == "present" (
echo      ^> There's a wooden sword over there.
echo      ^> Someone must have skedaddled out of here in a hurry and forgotten it.
echo.
echo    [You take one wooden sword.]
echo      ^> "i" to open inventory
set route3_7_woodensword=absent
set /a items=%items% + 1
set /a item_woodensword=%item_woodensword% + 1
)
)
goto tile_route3_7_continued






:tile_route3_7
if "%location%" == "route3_3" (
echo.
echo    [You walk west within the dark fetid cave.]
goto route3_7_randomeventcheck
)
if "%location%" == "route3_8" (
echo.
echo    [You walk east back through the small tunnel.]
goto route3_7_randomeventcheck
)
:tile_route3_7_continued
set location=route3_7
echo.
echo  ~ You are in a dark fetid cave.
echo      ^> To the west there is a small tunnel.
echo      ^> The cave extends to the east.
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=

if "%input%" == "noInput" goto returnLocation

if "%input%" == "" goto 

if "%input%" == "west" goto tile_route3_8
if "%input%" == "go west" goto tile_route3_8
if "%input%" == "tunnel" goto tile_route3_8
if "%input%" == "south tunnel" goto tile_route3_8
if "%input%" == "small tunnel" goto tile_route3_8
if "%input%" == "enter tunnel" goto tile_route3_8
if "%input%" == "enter south tunnel" goto tile_route3_8
if "%input%" == "enter small tunnel" goto tile_route3_8
if "%input%" == "go to tunnel" goto tile_route3_8
if "%input%" == "go to south tunnel" goto tile_route3_8
if "%input%" == "go to small tunnel" goto tile_route3_8
if "%input%" == "go in tunnel" goto tile_route3_8
if "%input%" == "go in south tunnel" goto tile_route3_8
if "%input%" == "go in small tunnel" goto tile_route3_8
if "%input%" == "east" goto tile_route3_3
if "%input%" == "go east" goto tile_route3_3

if "%input%" == "take egg" goto takebugeggs_route3
if "%input%" == "take eggs" goto takebugeggs_route3
if "%input%" == "take bug egg" goto takebugeggs_route3
if "%input%" == "take bug eggs" goto takebugeggs_route3

if "%input%" == "m" goto map
if "%input%" == "map" goto map
if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look
if "%input%" == "h" goto help
if "%input%" == "help" goto help


goto inventoryCommands
goto commandError






:tile_route3_8
if "%location%" == "route3_7" (
echo.
echo    [You walk west through the small tunnel until you reach an agoraphobic cavern.]
if "%giganticcentipede%" == "alive" (
echo      ^> A gigantic centipede appears!
set location=route3_8
goto encounter_giganticcentipede                                                                  
)
)
set location=route3_8
echo.
echo  ~ You are in a dark agoraphobic cavern in a dark fetid cave.
echo      ^> East is the only way from here
echo.
echo    [What do you do?]
echo.
set input=noInput
set /p input=
if "%input%" == "noInput" goto returnLocation

if "%input%" == "" goto 

if "%input%" == "east" goto tile_route3_7
if "%input%" == "go east" goto tile_route3_7
if "%input%" == "leave" goto tile_route3_7
if "%input%" == "exit" goto tile_route3_7
if "%input%" == "go back" goto tile_route3_7
if "%input%" == "back" goto tile_route3_7

if "%input%" == "take egg" goto takebugeggs_route3
if "%input%" == "take eggs" goto takebugeggs_route3
if "%input%" == "take bug egg" goto takebugeggs_route3
if "%input%" == "take bug eggs" goto takebugeggs_route3

if "%input%" == "mine" goto inventory_use_pickaxe
if "%input%" == "mine ore" goto inventory_use_pickaxe
if "%input%" == "mine ore vein" goto inventory_use_pickaxe
if "%input%" == "mine vein" goto inventory_use_pickaxe
if "%input%" == "mine iron" goto inventory_use_pickaxe
if "%input%" == "mine iron ore" goto inventory_use_pickaxe
if "%input%" == "mine iron ore vein" goto inventory_use_pickaxe
if "%input%" == "mine iron vein" goto inventory_use_pickaxe
if "%input%" == "ore" goto examineorevein_route3_8
if "%input%" == "ore vein" goto examineorevein_route3_8
if "%input%" == "vein" goto examineorevein_route3_8
if "%input%" == "look at ore" goto examineorevein_route3_8
if "%input%" == "look at ore vein" goto examineorevein_route3_8
if "%input%" == "look at vein" goto examineorevein_route3_8
if "%input%" == "examine ore" goto examineorevein_route3_8
if "%input%" == "examine ore vein" goto examineorevein_route3_8
if "%input%" == "examine vein" goto examineorevein_route3_8
if "%input%" == "prospect ore" goto examineorevein_route3_8
if "%input%" == "prospect ore vein" goto examineorevein_route3_8
if "%input%" == "prospect vein" goto examineorevein_route3_8


if "%input%" == "m" goto map
if "%input%" == "map" goto map
if "%input%" == "i" goto inventory
if "%input%" == "inventory" goto inventory
if "%input%" == "s" goto stats
if "%input%" == "stats" goto stats
if "%input%" == "l" goto look
if "%input%" == "look" goto look
if "%input%" == "look around" goto look
if "%input%" == "h" goto help
if "%input%" == "help" goto help

goto inventoryCommands
goto commandError

:examineorevein_route3_8
echo.
echo    [You prospect the ore vein.]
if "%route3_8_ore%" == "present" (
echo      ^> Iron ore.
echo      ^> "mine ore" or "use pickaxe."
)
if "%route3_8_ore%" == "absent" (
echo      ^> No ore remains.
)
goto returnLocation


:mining_route3_8
if "%route3_8_ore%" == "absent" goto inventory_use_pickaxe_continued
set oretype=iron
set oremined_min=0
set oremined_max=1
set /a oremined=%oremined_min% + %RANDOM% %% (%oremined_max% - %oremined_min% + 1)
set /a oremined=%oremined% + %miningmodifier%
echo.
echo    [You swing your pickaxe, a combination of strength and finesse.]
echo      ^> You mine %oremined% %oretype% ore!
echo      ^> "i" to open inventory
if %oremined% GTR 0 set route3_8_ore=absent
goto returnLocation






:takebugeggs_route3
set /a bugeggsfound=2 + %RANDOM% %% (4 - 2 + 1)

if "%location%" == "route3_8" (
set /a bugeggsfound=%bugeggsfound% + 2
)

if "%location%" == "route3_4" (
if "%route3_4_bugeggs%" == "absent" goto commandError
)
if "%location%" == "route3_7" (
if "%route3_7_bugeggs%" == "absent" goto commandError
)
if "%location%" == "route3_8" (
if "%route3_8_bugeggs%" == "absent" goto commandError
)

echo.
echo    [You take %bugeggsfound% bug eggs.]
echo      ^> "i" to open inventory
set /a items=%items% + %bugeggsfound%
set /a item_bugegg=%item_bugegg% + %bugeggsfound%

if "%location%" == "route3_4" (
set route3_4_bugeggs=absent
)
if "%location%" == "route3_7" (
set %route3_7_bugeggs=absent
)
if "%location%" == "route3_8" (
set %route3_8_bugeggs=absent
)


goto returnLocation
)

goto commandError
