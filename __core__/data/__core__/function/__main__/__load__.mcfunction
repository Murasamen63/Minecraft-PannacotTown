#> __core__:__main__/__load__
#
# __core__：ワールド起動時に読み込む
#
# @within tag/function minecraft:load



# scoreboard
    scoreboard objectives add PNCT.Const dummy
    scoreboard objectives add PNCT.Temp dummy

# storage
    data modify storage _pannacotown_:system {} set value {GameEvent:"None"}
        #GameEvent: "None","FishingBattle","WerewolfRPG"

# datapack
    # TreasurePondFishing
    datapack disable "file/fishing_battle"