#> 1_fishing_battle:_main/game_state/1_ready
#
# FishingBattle：ゲーム開始前に常時読み込む
# 
# @within function 1_fishing_battle:_main/_tick



# coreストレージ変更
    data modify storage _pannacotown_:system GameEvent set value "FishingBattle"

# bossbar
    ## 表示
        bossbar set 1_fishing_battle:game_timer visible true
    ## 名前編集
        #bossbar set 1_fishing_battle:game_timer name 
    
say test