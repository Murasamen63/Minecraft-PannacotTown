#> __core__:adv_reward/first_login
#
# __core__：ワールド入室時に達成するAdvancementの報酬
#
# @within advancement __core__:first_login
# @within function __core__:adv_reward/first_login

#> ScoreHolder
# @public
    #define $PNCT.PlayerID_Controler PNCT.Player.ID


# PlayerID
    ## 初プレイヤーの場合、初期化
        execute unless score $PNCT.PlayerID_Controler PNCT.Player.ID = $PNCT.PlayerID_Controler PNCT.Player.ID run scoreboard players set $PNCT.PlayerID_Controler PNCT.Player.ID 0
    ## PlayerID設定準備
        execute unless score @s PNCT.Player.ID = @s PNCT.Player.ID run scoreboard players set @s PNCT.Player.ID -1
    ## PlayerID増加
        execute store result score $PNCT.PlayerID_Controler PNCT.Player.ID run random value 1..
    ## 同IDが存在したらやり直し
        execute as @a[scores={PNCT.Player.ID=1..}] if score $PNCT.PlayerID_Controler PNCT.Player.ID = @s PNCT.Player.ID run return run function __core__:adv_reward/first_login
    ## 同IDが存在しなかったら、設定
        execute as @a unless score @s PNCT.Player.ID = $PNCT.PlayerID_Controler PNCT.Player.ID as @a[scores={PNCT.Player.ID=-1}] run scoreboard players operation @s PNCT.Player.ID = $PNCT.PlayerID_Controler PNCT.Player.ID