#> 1_fishing_battle:_main/_tick
#
# FishingBattle：ゲームモード中、常時読み込む
# 
# @within tag/function minecraft:tick



# GameState
    execute if data storage 1_fishing_battle:system {System:{GameState:"Ready"}} run function 1_fishing_battle:_main/game_state/1_ready
    execute if data storage 1_fishing_battle:system {System:{GameState:"Count"}} run function 1_fishing_battle:_main/game_state/2_count
    execute if data storage 1_fishing_battle:system {System:{GameState:"Play"}} run function 1_fishing_battle:_main/game_state/3_play
    execute if data storage 1_fishing_battle:system {System:{GameState:"Finish"}} run function 1_fishing_battle:_main/game_state/4_finish
    execute if data storage 1_fishing_battle:system {System:{GameState:"End"}} run function 1_fishing_battle:_main/game_state/5_end