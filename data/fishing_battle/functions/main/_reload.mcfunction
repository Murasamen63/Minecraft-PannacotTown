#> fishing_battle:main/_reload
#
# fishing_battle：初めに読み込むfunction
#
# @within function fishing_battle:init/install

#region 宣言

#> Score Holder
# @within function fishing_battle:**
    #define score_holder $PCTW.FSBT.System

#> Score Holder
# @within function fishing_battle:main/_main
    #define score_holder $PCTW.FSBT.GameState.Ready
    #define score_holder $PCTW.FSBT.GameState.CountDown
    #define score_holder $PCTW.FSBT.GameState.Play
    #define score_holder $PCTW.FSBT.GameState.End

#> Storage
# @within　* fishing_battle:**
    #define storage pctw:fishing_battle/system
    #define storage pctw:fishing_battle/ranking
    #define storage pctw:fishing_battle/shop_price

#> bossbar
# @within function fishing_battle:**
    #define bossbar pctw:fishing_battle/timer

#> Entity Tag
# @within function fishing_battle:**
    #define tag PCTW.FSBT.Player

#> PCTW.FSBT Item Tag
    # tag PCTWFSBTItems:1b
    # tag FSBTFishingRod:1b
    # tag FSBTShopTradeSign:1b
    # tag FSBTHookedItem:1b
    # tag FSBTNotPickedUpHookedItem:1b

#endregion



#region 内容

# scoreboard
    ## 作成
        ### GameState
            scoreboard objectives add PCTW.FSBT.GameState dummy
        ### GameTimer
            #### コアタイマー
                scoreboard objectives add PCTW.FSBT.GameTimer dummy
            #### 時間表記(分)
                scoreboard objectives add PCTW.FSBT.ShowTimer.Minute dummy
            #### 時間表記(秒)
                scoreboard objectives add PCTW.FSBT.ShowTimer.Second dummy
        ### Score
            #### 得点
                scoreboard objectives add PCTW.FSBT.Score dummy
            #### チームの合計得点
                scoreboard objectives add PCTW.FSBT.Score.Red dummy
                scoreboard objectives add PCTW.FSBT.Score.Blue dummy
                scoreboard objectives add PCTW.FSBT.Score.Yellow dummy
                scoreboard objectives add PCTW.FSBT.Score.Green dummy
        ### Info
            scoreboard objectives add PCTW.FSBT.Info dummy
    ## 設定
        ### GameState
            scoreboard players set $PCTW.FSBT.System PCTW.FSBT.GameState 0

# team
    ## 作成
        ### プレイヤーチーム
            team add FSBTPlayerTeamRed
            team add FSBTPlayerTeamBlue
            team add FSBTPlayerTeamYellow
            team add FSBTPlayerTeamGreen
    ## 設定
        ### FSBTPlayerTeamRed
            team modify FSBTPlayerTeamRed color red
        ### FSBTPlayerTeamBlue
            team modify FSBTPlayerTeamBlue color blue
        ### FSBTPlayerTeamYellow
            team modify FSBTPlayerTeamYellow color yellow
        ### FSBTPlayerTeamGreen
            team modify FSBTPlayerTeamGreen color green

# storage
    ## 作成
        ### Ranking
            execute unless data storage pctw:fishing_battle/ranking Ranking run data modify storage pctw:fishing_battle/ranking Ranking set value {1:{Name:[null],Score:0},2:{Name:[null],Score:0},3:{Name:[null],Score:0}}
        ### System
            data modify storage pctw:fishing_battle/system System set value {Timer:0,Team:{Enable:0b,Count:2}}
        ### Shop_Price
            execute unless data storage pctw:fishing_battle/shop_price Price run data modify storage pctw:fishing_battle/shop_price Price set value {FishingRod:{DoubleRod:0,LureRod:0,RichRod:0,GamblingRod:0,SlotRod:0}}

# bossbar
    ## 作成
        ### Timer
            bossbar add pctw:fishing_battle/timer ""
    ## 設定
        ### timer
            bossbar set pctw:fishing_battle/timer visible true
            bossbar set pctw:fishing_battle/timer players @a
            bossbar set pctw:fishing_battle/timer style notched_10
            bossbar set pctw:fishing_battle/timer color green
            bossbar set pctw:fishing_battle/timer max 1
            bossbar set pctw:fishing_battle/timer value 1

# xpbar
        execute as @a at @s run xp set @s 129 levels
        execute as @a at @s run xp set @s 1000 points
        execute as @a at @s run xp set @s 0 levels
    

# 通知
    ## 全体
        ### 表示
            title @a times 10 70 20
            title @a title ["",{"text":"・・・ ","bold":true,"italic":true},"『",{"text":"釣り大会","bold":true,"italic":true,"color":"aqua"},"』",{"text":" ・・・","bold":true,"italic":true}]
            tellraw @a ["","\n","  ゲームモードを 『",{"text":"釣り大会","bold":true,"italic":true,"underlined":true,"color":"aqua"},"』 に設定しました！","\n"]
        ### 効果音
            execute as @a at @s run playsound entity.player.levelup voice @s ~ ~ ~ 1.0 1.0
    ## スタッフ
        tellraw @a[tag=PCTW.Player.Staff] ["","\n",{"text":"  "},{"text":"・スタッフ","color":"gold"},"\n",{"text":"  "},{"selector":"@a[tag=PCTW.Player.Staff]"},"\n"]

#endregion