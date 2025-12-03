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
    data modify storage 1_fishing_battle:system {} set value {}
    data modify storage 1_fishing_battle:rule {} set value {}
    data modify storage 1_fishing_battle:shop_price {} set value {}

# bossbar
    bossbar remove 1_fishing_battle:game_timer