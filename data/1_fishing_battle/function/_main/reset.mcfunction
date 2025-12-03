#> _core:_main/reset
#
# FishingBattle：リセット時に読み込む
#
# @within tag/function minecraft:load



# scoreboard
    scoreboard objectives remove 1FSBT.System.GameTimer
    scoreboard objectives remove 1FSBT.Player.Score
    scoreboard objectives remove 1FSBT.System.Info
    scoreboard objectives remove 1FSBT.Player.Achievement_Reward

# storage
    data remove storage 1_fishing_battle:system System
    data remove storage 1_fishing_battle:rule Rule
    data remove storage 1_fishing_battle:shop_price ShopPrice
    data modify storage _pannacotown_:system System.GameEvent set value "None"

# bossbar
    bossbar remove 1_fishing_battle:game_timer