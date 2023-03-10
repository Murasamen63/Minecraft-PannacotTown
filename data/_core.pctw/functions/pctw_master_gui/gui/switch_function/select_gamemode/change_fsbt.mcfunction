#> _core.pctw:pctw_master_gui/gui/switch_function/select_gamemode/change_fsbt
#
# _core.pctw：MasterGUIのボタン「ゲームモード変更/ゲームモード：釣り大会」
#
# @within advancement _core.pctw:master_gui/select_gamemode/change_fsbt



#region 内容

# 機能
    ## インストール
        function fishing_battle:init/install

# GUI操作
    ## 効果音
        playsound ui.button.click voice @s ~ ~ ~ 1.0 1.0
    ## アイテム削除
        clear @s fishing_rod{PCTWMasterGUIChangeFSBT:1b}
    ## ページ更新
        function _core.pctw:pctw_master_gui/gui/pages/fishing_battle/top

# advancement削除
    advancement revoke @s only _core.pctw:master_gui/select_gamemode/change_fsbt

#endregion