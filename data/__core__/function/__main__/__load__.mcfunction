#> __core__:__main__/__load__
#
# __core__：ワールド起動時に読み込む
#
# @within tag/function minecraft:load



# scoreboard
    scoreboard objectives add PNCT.Const dummy
    scoreboard objectives add PNCT.Temp dummy

# storage
    execute unless data storage _pannacotown_:system GameEvent run data merge storage _pannacotown_:system {GameEvent:"None",Staff:[]}
        #GameEvent: "None","FishingBattle","WerewolfRPG"

# reset
    # TreasurePondFishing
        function 1_fishing_battle:_main/reset