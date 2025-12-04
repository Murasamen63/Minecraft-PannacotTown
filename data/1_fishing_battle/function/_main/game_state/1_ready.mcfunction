#> 1_fishing_battle:_main/game_state/1_ready
#
# FishingBattle：ゲーム開始前に常時読み込む
# 
# @within function 1_fishing_battle:_main/_tick



# survival→adventure
    execute as @a[gamemode=survival] run tellraw @s "suv→adv"
    execute as @a[gamemode=survival] run gamemode adventure @s

# プレイヤー数検知
    execute store result storage 1_fishing_battle:system System.Player.Count int 1 run execute if entity @a[gamemode=adventure]

# bossbar
    ## 表示
        bossbar set 1_fishing_battle:game_timer visible true
    ## 名前編集
        #bossbar set 1_fishing_battle:game_timer name