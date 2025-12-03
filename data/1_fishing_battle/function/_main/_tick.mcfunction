#> 1_fishing_battle:_main/_tick
#
# FishingBattle：ゲームモード中、常時読み込む
# 
# @within tag/function minecraft:tick



# GameState
    execute if data storage 1_fishing_battle:system {GameState:"Ready"} run function 1_fishing_battle:_main/game_state/1_ready
    execute if data storage 1_fishing_battle:system {GameState:"Count"} run function 1_fishing_battle:_main/game_state/2_count
    execute if data storage 1_fishing_battle:system {GameState:"Play"} run function 1_fishing_battle:_main/game_state/3_play
    execute if data storage 1_fishing_battle:system {GameState:"Finish"} run function 1_fishing_battle:_main/game_state/4_finish
    execute if data storage 1_fishing_battle:system {GameState:"End"} run function 1_fishing_battle:_main/game_state/5_end