#> _core:_main/_load
#
# FishingBattle：ゲームモード変更時に読み込む
#
# @within tag/function minecraft:load

    

# scoreboard
    scoreboard objectives add FSBT.System.GameTimer dummy
    scoreboard objectives add FSBT.Player.Score dummy
    scoreboard objectives add FSBT.System.Info dummy ""

# storage
    data merge storage fishing_battle:system {GameState:"Ready"}
        #GameState:"Ready","Count","Play","Finish","End"
    data merge storage fishing_battle:rule {GameMode:"",Timer:0,Team:{Enable:0b,Count:2}}
        #GameMode:"Rank","ScoreAttack","UncleGacha"
    execute unless data storage fishing_battle:ranking Rank run data merge storage fishing_battle:ranking {Rank:{1:{Name:[null],Score:0},2:{Name:[null],Score:0},3:{Name:[null],Score:0},4:{Name:[null],Score:0},5:{Name:[null],Score:0}},ScoreAttack:{1:{Name:[null],Score:0},2:{Name:[null],Score:0},3:{Name:[null],Score:0},4:{Name:[null],Score:0},5:{Name:[null],Score:0}},UncleGacha:{1:{Name:[null],Score:0},2:{Name:[null],Score:0},3:{Name:[null],Score:0},4:{Name:[null],Score:0},5:{Name:[null],Score:0}}}
    data merge storage fishing_battle:shop_price {FishingRod:{DoubleRod:15,LureRod:70,RichRod:160,GamblingRod:180,SlotRod:230}}

# bossbar
    bossbar add fishing_battle:game_timer "fishing_battle:game_timer"
    bossbar set fishing_battle:game_timer color green
    bossbar set fishing_battle:game_timer style notched_6
    bossbar set fishing_battle:game_timer max 1
    bossbar set fishing_battle:game_timer value 1
    bossbar set fishing_battle:game_timer visible true
    bossbar set fishing_battle:game_timer players @a

# 通知
    say TPF