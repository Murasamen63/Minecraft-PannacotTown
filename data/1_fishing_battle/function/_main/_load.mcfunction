#> 1_fishing_battle:_main/_load
#
# FishingBattle：ゲームモード変更時に読み込む
#
# @within tag/function minecraft:load



# coreストレージ変更
    data modify storage _pannacotown_:system GameEvent set value "FishingBattle"

# scoreboard
    scoreboard objectives add FSBT.System.GameTimer dummy
    scoreboard objectives add FSBT.Player.Score dummy
    scoreboard objectives add FSBT.System.Info dummy ""

# trigger
    scoreboard objectives add FSBT.Player.Achievement_Reward trigger "実績報酬"

# storage
    data merge storage 1_fishing_battle:system {GameState:"Ready"}
        #GameState:"Ready","Count","Play","Finish","End"
    data merge storage 1_fishing_battle:rule {GameMode:"",Timer:0,Team:{Enable:0b,Count:2}}
        #GameMode:"Rank","ScoreAttack","UncleGacha"
    execute unless data storage 1_fishing_battle:ranking Rank run data merge storage 1_fishing_battle:ranking {Rank:{1:{Name:[null],Score:0},2:{Name:[null],Score:0},3:{Name:[null],Score:0},4:{Name:[null],Score:0},5:{Name:[null],Score:0}},ScoreAttack:{1:{Name:[null],Score:0},2:{Name:[null],Score:0},3:{Name:[null],Score:0},4:{Name:[null],Score:0},5:{Name:[null],Score:0}},UncleGacha:{1:{Name:[null],Score:0},2:{Name:[null],Score:0},3:{Name:[null],Score:0},4:{Name:[null],Score:0},5:{Name:[null],Score:0}}}
    data merge storage 1_fishing_battle:shop_price {FishingRod:{DoubleRod:15,LureRod:70,RichRod:160,GamblingRod:180,SlotRod:230}}

# bossbar
    bossbar add 1_fishing_battle:game_timer "1_fishing_battle:game_timer"
    bossbar set 1_fishing_battle:game_timer color green
    bossbar set 1_fishing_battle:game_timer style notched_6
    bossbar set 1_fishing_battle:game_timer max 1
    bossbar set 1_fishing_battle:game_timer value 1
    bossbar set 1_fishing_battle:game_timer players @a

# 通知
    say TPF
