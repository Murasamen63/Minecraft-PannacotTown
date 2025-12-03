#> __core__:__main__/__tick__
#
# __core：ワールド起動中、常時読み込む
#
# @within tag/function minecraft:tick



# TreasurePondFishing
    execute if data storage _pannacotown_:system {System:{GameEvent:"FishingBattle"}} run function 1_fishing_battle:_main/_tick