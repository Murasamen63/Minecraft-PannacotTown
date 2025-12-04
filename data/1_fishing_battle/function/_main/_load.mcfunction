#> 1_fishing_battle:_main/_load
#
# FishingBattle：ゲームモード変更時に読み込む
#
# @within tag/function minecraft:load



# coreストレージ変更
    data modify storage _pannacotown_:system System.GameEvent set value "FishingBattle"

# scoreboard
    scoreboard objectives add 1FSBT.System.GameTimer dummy
    scoreboard objectives add 1FSBT.Player.Score dummy
    scoreboard objectives add 1FSBT.System.Info dummy "情報"

# trigger
    scoreboard objectives add 1FSBT.Player.Achievement_Reward trigger "実績報酬"

# storage
    data modify storage 1_fishing_battle:system System set value {GameState:"Ready",Player:{Count:0}}
        #GameState:"Ready","Count","Play","Finish","End"
    data modify storage 1_fishing_battle:rule Rule set value {GameMode:"",Timer:0,Team:{Enable:0b,Count:2}}
        #GameMode:"Rank","ScoreAttack","UncleGacha"
    execute unless data storage 1_fishing_battle:ranking Ranking run data modify storage 1_fishing_battle:ranking Ranking set value {Rank:{1:{Name:[null],Score:0},2:{Name:[null],Score:0},3:{Name:[null],Score:0},4:{Name:[null],Score:0},5:{Name:[null],Score:0}},ScoreAttack:{1:{Name:[null],Score:0},2:{Name:[null],Score:0},3:{Name:[null],Score:0},4:{Name:[null],Score:0},5:{Name:[null],Score:0}},UncleGacha:{1:{Name:[null],Score:0},2:{Name:[null],Score:0},3:{Name:[null],Score:0},4:{Name:[null],Score:0},5:{Name:[null],Score:0}}}
    data modify storage 1_fishing_battle:shop_price ShopPrice set value {FishingRod:{DoubleRod:15,LureRod:70,RichRod:160,GamblingRod:180,SlotRod:230}}

# Team
    team add PlayerTeamRed "赤チーム"
    team add PlayerTeamBlue "青チーム"
    team add PlayerTeamGreen "緑チーム"
    team add PlayerTeamYellow "黄チーム"
    team add PlayerTeamPurple "紫チーム"

    team modify PlayerTeamRed color red
    team modify PlayerTeamBlue color blue
    team modify PlayerTeamGreen color green
    team modify PlayerTeamYellow color yellow
    team modify PlayerTeamPurple color light_purple
    
# bossbar
    bossbar add 1_fishing_battle:game_timer "1_fishing_battle:game_timer"

    bossbar set 1_fishing_battle:game_timer color green
    bossbar set 1_fishing_battle:game_timer style notched_6
    bossbar set 1_fishing_battle:game_timer max 1
    bossbar set 1_fishing_battle:game_timer value 1
    bossbar set 1_fishing_battle:game_timer players @a

# 通知
    say TPF
