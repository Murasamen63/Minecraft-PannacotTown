#> 1_fishing_battle:_main/game_state/1_ready
#
# FishingBattle：ゲーム開始前に常時読み込む
# 
# @within function 1_fishing_battle:_main/_tick

#> Public tag
# @Public
    #define tag PNCT.FSBT.Player
    #   FSBTプレイヤータグ



# survival→adventure
    execute as @a[gamemode=survival] run tellraw @s "suv→adv"
    execute as @a[gamemode=survival] run gamemode adventure @s

# プレイヤータグ
    ## 付与
        execute as @a[gamemode=adventure] run tag @s add PNCT.FSBT.Player
    ## 削除
        execute as @a[gamemode=!adventure] run tag @s remove PNCT.FSBT.Player

# プレイヤー数検知
    execute store result storage 1_fishing_battle:system System.Player.Count int 1 run execute if entity @a[gamemode=adventure]

# bossbar
    ## 設定
        bossbar set 1_fishing_battle:game_timer visible true
        bossbar set 1_fishing_battle:game_timer color green
        bossbar set 1_fishing_battle:game_timer max 1
        bossbar set 1_fishing_battle:game_timer value 1
    ## 名前編集
        #bossbar set 1_fishing_battle:game_timer name