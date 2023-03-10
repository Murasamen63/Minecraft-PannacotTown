#> fishing_battle:main/game_state/1_ready
#
# fishing_battle：GameState 開始前の処理function
#
# @within function fishing_battle:main/_main



#region 内容

# gamemode設定
    ## サバイバルをアドベンチャーに変更
        execute as @a[gamemode=survival] run gamemode adventure @s

# Playerタグ管理
    ## advantureにタグ付与
        execute as @a[gamemode=adventure] at @s run tag @s add PCTW.FSBT.Player
    ## それ以外にタグ剥奪
        execute as @a[gamemode=!adventure] at @s run tag @s remove PCTW.FSBT.Player

# Map
    ## ショップ看板
        ### ダブル釣竿
            data merge block 5 0 22 {Text1:"{\"text\":\"\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/execute as @s[tag=PCTW.FSBT.Player] at @s run function fishing_battle:shop/trade/double_rod\"}}",Text2:"\"ダブル釣竿\"",Text3:"[\"\",{\"nbt\":\"Price.FishingRod.DoubleRod\",\"storage\":\"pctw:fishing_battle/shop_price\",\"bold\":true,\"color\":\"green\"},{\"text\":\"pt\",\"bold\":true,\"color\":\"green\"}]",GlowingText:1b}
        ### リッチ釣竿
            data merge block 8 0 17 {Text1:"{\"text\":\"\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/execute as @s[tag=PCTW.FSBT.Player] at @s run function fishing_battle:shop/trade/rich_rod\"}}",Text2:"\"リッチ釣竿\"",Text3:"[\"\",{\"nbt\":\"Price.FishingRod.RichRod\",\"storage\":\"pctw:fishing_battle/shop_price\",\"bold\":true,\"color\":\"green\"},{\"text\":\"pt\",\"bold\":true,\"color\":\"green\"}]",GlowingText:1b}
        ### 入れ食い釣竿
            data merge block 5 0 19 {Text1:"{\"text\":\"\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/execute as @s[tag=PCTW.FSBT.Player] at @s run function fishing_battle:shop/trade/lure_rod\"}}",Text2:"\"入れ食い釣竿\"",Text3:"[\"\",{\"nbt\":\"Price.FishingRod.LureRod\",\"storage\":\"pctw:fishing_battle/shop_price\",\"bold\":true,\"color\":\"green\"},{\"text\":\"pt\",\"bold\":true,\"color\":\"green\"}]",GlowingText:1b}
        ### 博打釣竿
            data merge block 10 0 17 {Text1:"{\"text\":\"\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/execute as @s[tag=PCTW.FSBT.Player] at @s run function fishing_battle:shop/trade/gambling_rod\"}}",Text2:"\"博打釣竿\"",Text3:"[\"\",{\"nbt\":\"Price.FishingRod.GamblingRod\",\"storage\":\"pctw:fishing_battle/shop_price\",\"bold\":true,\"color\":\"green\"},{\"text\":\"pt\",\"bold\":true,\"color\":\"green\"}]",GlowingText:1b}
        ### おじガチャ釣竿
            data merge block 12 0 19 {Text1:"{\"text\":\"\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/execute as @s[tag=PCTW.FSBT.Player] at @s run function fishing_battle:shop/trade/slot_rod\"}}",Text2:"\"おじガチャ釣竿\"",Text3:"[\"\",{\"nbt\":\"Price.FishingRod.SlotRod\",\"storage\":\"pctw:fishing_battle/shop_price\",\"bold\":true,\"color\":\"green\"},{\"text\":\"pt\",\"bold\":true,\"color\":\"green\"}]",GlowingText:1b}


# Timer
    ## アイテムからTimerに反映
        execute store result score $PCTW.FSBT.System PCTW.FSBT.GameTimer run clear @a clock{PCTWMasterGUIGameTimerFSBTMinute:1b} 0
        scoreboard players operation $PCTW.FSBT.System PCTW.FSBT.GameTimer *= #1200 PCTW.Core.Const
        execute store result storage pctw:fishing_battle/system System.Timer int 1 run scoreboard players get $PCTW.FSBT.System PCTW.FSBT.GameTimer
    ## 分を計算
        execute store result score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Minute run data get storage pctw:fishing_battle/system System.Timer
        scoreboard players operation $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Minute /= #1200 PCTW.Core.Const
    ## 秒を計算
        execute store result score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second run data get storage pctw:fishing_battle/system System.Timer
        scoreboard players operation $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second %= #1200 PCTW.Core.Const
        scoreboard players operation $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second /= #20 PCTW.Core.Const

# 情報表示
    ## bossbar反映
        ### 名称
            #### 個人戦
                ##### 3分以上
                    ###### 秒数が10以上(2桁)
                        execute if data storage pctw:fishing_battle/system System{Team:{Enable:0b}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 3601.. run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches 10.. run bossbar set pctw:fishing_battle/timer name ["","個人戦  ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"green"}," : ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"green"}]
                    ###### 秒数が9以下(1桁)
                        execute if data storage pctw:fishing_battle/system System{Team:{Enable:0b}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 3601.. run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches ..9 run bossbar set pctw:fishing_battle/timer name ["","個人戦  ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"green"}," : ",{"text":"0","color":"green"},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"green"}]
                ##### 1分～3分
                    ###### 秒数が10以上(2桁)
                        execute if data storage pctw:fishing_battle/system System{Team:{Enable:0b}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 1201..3600 run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches 10.. run bossbar set pctw:fishing_battle/timer name ["","個人戦  ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"yellow"}," : ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"yellow"}]
                    ###### 秒数が9以下(1桁)
                        execute if data storage pctw:fishing_battle/system System{Team:{Enable:0b}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 1201..3600 run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches ..9 run bossbar set pctw:fishing_battle/timer name ["","個人戦  ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"yellow"}," : ",{"text":"0","color":"yellow"},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"yellow"}]
                ##### 1分以下
                    ###### 秒数が10以上(2桁)
                        execute if data storage pctw:fishing_battle/system System{Team:{Enable:0b}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches ..1200 run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches 10.. run bossbar set pctw:fishing_battle/timer name ["","個人戦  ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"red"}," : ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"red"}]
                    ###### 秒数が9以下(1桁)
                        execute if data storage pctw:fishing_battle/system System{Team:{Enable:0b}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches ..1200 run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches ..9 run bossbar set pctw:fishing_battle/timer name ["","個人戦  ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"red"}," : ",{"text":"0","color":"red"},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"red"}]
            #### チーム戦
                ##### 3分以上
                    ###### 秒数が10以上(2桁)
                        execute if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 3601.. run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches 10.. run bossbar set pctw:fishing_battle/timer name ["","チーム戦  ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"green"}," : ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"green"}]
                    ###### 秒数が9以下(1桁)
                        execute if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 3601.. run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches ..9 run bossbar set pctw:fishing_battle/timer name ["","チーム戦  ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"green"}," : ",{"text":"0","color":"green"},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"green"}]
                ##### 1分～3分
                    ###### 秒数が10以上(2桁)
                        execute if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 1201..3600 run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches 10.. run bossbar set pctw:fishing_battle/timer name ["","チーム戦  ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"yellow"}," : ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"yellow"}]
                    ###### 秒数が9以下(1桁)
                        execute if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 1201..3600 run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches ..9 run bossbar set pctw:fishing_battle/timer name ["","チーム戦  ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"yellow"}," : ",{"text":"0","color":"yellow"},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"yellow"}]
                ##### 1分以下
                    ###### 秒数が10以上(2桁)
                        execute if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches ..1200 run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches 10.. run bossbar set pctw:fishing_battle/timer name ["","チーム戦  ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"red"}," : ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"red"}]
                    ###### 秒数が9以下(1桁)
                        execute if data storage pctw:fishing_battle/system System{Team:{Enable:1b}} if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches ..1200 run execute if score $PCTW.FSBT.System PCTW.FSBT.ShowTimer.Second matches ..9 run bossbar set pctw:fishing_battle/timer name ["","チーム戦  ",{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Minute"},"color":"red"}," : ",{"text":"0","color":"red"},{"score":{"name":"$PCTW.FSBT.System","objective":"PCTW.FSBT.ShowTimer.Second"},"color":"red"}]
        ### 色
            #### 3分以上
                execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 3601.. run bossbar set pctw:fishing_battle/timer color green
            #### 1分～3分
                execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches 1201..3600 run bossbar set pctw:fishing_battle/timer color yellow
            #### 1分以下
                execute if score $PCTW.FSBT.System PCTW.FSBT.GameTimer matches ..1200 run bossbar set pctw:fishing_battle/timer color red

#endregion