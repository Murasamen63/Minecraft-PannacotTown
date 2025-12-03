#> _core:_main/reset
#
# FishingBattle：リセット時に読み込む
#
# @within tag/function minecraft:load



# scoreboard
    scoreboard objectives remove FSBT.System.GameTimer
    scoreboard objectives remove FSBT.Player.Score
    scoreboard objectives remove FSBT.System.Info

# storage
    data modify storage 1_fishing_battle:system {} set value {}
    data modify storage 1_fishing_battle:rule {} set value {}
    data modify storage 1_fishing_battle:shop_price {} set value {}

# bossbar
    bossbar remove 1_fishing_battle:game_timer