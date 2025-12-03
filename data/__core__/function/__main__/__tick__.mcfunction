#> __core__:__main__/__tick__
#
# __core：ワールド起動中、常時読み込む
#
# @within tag/function minecraft:tick



# TreasurePondFishing
    execute unless data storage _pannacotown_:system {GameEvent:"FishingBattle"} run function 1_fishing_battle:_main/_tick