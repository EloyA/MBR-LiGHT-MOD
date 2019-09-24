; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Control Eloy
; Description ...: This file controls the "Eloy LiGHT MOD" Features
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: NguyenAnhHD
; Modified ......: LiGHT MOD (2019)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2019
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
#include-once

Func chkEnableSuperXP()
	If GUICtrlRead($g_hChkEnableSuperXP) = $GUI_CHECKED Then
		$g_bEnableSuperXP = True
		For $i = $g_hChkSkipZoomOutSX To $g_hLblRunTimeXP
			GUICtrlSetState($i, $GUI_ENABLE)
		Next
		GUICtrlSetState($g_hLblLockedSX, $GUI_HIDE)
	Else
		$g_bEnableSuperXP = False
		For $i = $g_hChkSkipZoomOutSX To $g_hLblRunTimeXP
			GUICtrlSetState($i, $GUI_DISABLE)
		Next
	EndIf
	radLblGoblinMapOpt()
EndFunc   ;==>chkEnableSuperXP

Func radLblGoblinMapOpt()
	If GUICtrlRead($g_hRdoGoblinPicnic) = $GUI_CHECKED Then
		$g_sGoblinMapOptSX = "Goblin Picnic"
		_GUI_Value_STATE("SHOW", $g_hLblGoblinPicnic1 & "#" & $g_hLblGoblinPicnic2)
		_GUI_Value_STATE("HIDE", $g_hLblTheArena1 & "#" & $g_hLblTheArena2)
		If GUICtrlRead($g_hChkEnableSuperXP) = $GUI_CHECKED Then GUICtrlSetState($g_hChkBKingSX, $GUI_ENABLE)
	ElseIf GUICtrlRead($g_hRdoTheArena) = $GUI_CHECKED Then
		$g_sGoblinMapOptSX = "The Arena"
		_GUI_Value_STATE("HIDE", $g_hLblGoblinPicnic1 & "#" & $g_hLblGoblinPicnic2)
		_GUI_Value_STATE("SHOW", $g_hLblTheArena1 & "#" & $g_hLblTheArena2)
		If GUICtrlRead($g_hChkEnableSuperXP) = $GUI_CHECKED Then GUICtrlSetState($g_hChkBKingSX, $GUI_UNCHECKED + $GUI_DISABLE)
	EndIf
EndFunc   ;==>radLblGoblinMapOpt

Func radActivateOptionSX()
	GUICtrlSetState($g_hRdoTrainingSX, $g_iActivateOptionSX = 1 ? $GUI_CHECKED : $GUI_UNCHECKED)
	GUICtrlSetState($g_hRdoAttackingSX, $g_iActivateOptionSX = 2 ? $GUI_CHECKED : $GUI_UNCHECKED)
EndFunc   ;==>radActivateOptionSX

Func radGoblinMapOptSX()
	GUICtrlSetState($g_hRdoGoblinPicnic, $g_iGoblinMapOptSX = 1 ? $GUI_CHECKED : $GUI_UNCHECKED)
	GUICtrlSetState($g_hRdoTheArena, $g_iGoblinMapOptSX = 2 ? $GUI_CHECKED : $GUI_UNCHECKED)
EndFunc   ;==>radGoblinMapOptSX

Func chkUseBotHumanization()
	If GUICtrlRead($g_hChkUseBotHumanization) = $GUI_CHECKED Then
		$g_bUseBotHumanization = True
		For $i = $g_hLabel1 To $g_hChkLookAtRedNotifications
			GUICtrlSetState($i, $GUI_ENABLE)
		Next
		cmbStandardReplay()
		cmbWarReplay()
	Else
		$g_bUseBotHumanization = False
		For $i = $g_hLabel1 To $g_hChkLookAtRedNotifications
			GUICtrlSetState($i, $GUI_DISABLE)
		Next
	EndIf
EndFunc   ;==>chkUseBotHumanization

Func chkUseAltRClick()
	If GUICtrlRead($g_hChkUseAltRClick) = $GUI_CHECKED Then
		Local $UserChoice = MsgBox(4 + 48, "Warning !!!", GetTranslatedFileIni("MOD GUI Design - BotHumanization", "chkUseAltRClick_Info_01", "Full Random Click Is a Good Feature To Be As Less Bot-Like As Possible Because It Makes All Bot Clicks Random.") & _
				@CRLF & "" & @CRLF & GetTranslatedFileIni("MOD GUI Design - BotHumanization", "chkUseAltRClick_Info_02", "The Crazy @RoroTiti Use It All The Time An He Says There Is No Problem With It, But, It Still An Experimental Feature Which May Cause Unpredictable Problems.") & _
				@CRLF & "" & @CRLF & GetTranslatedFileIni("MOD GUI Design - BotHumanization", "chkUseAltRClick_Info_03", "So, Do you Want To Use It?") & @CRLF & "" & @CRLF & GetTranslatedFileIni("MOD GUI Design - BotHumanization", "chkUseAltRClick_Info_04", "PS : No Support Will Be Provided To You If You Use This Function."))
		If $UserChoice = 6 Then
			$g_bUseAltRClick = True
		Else
			$g_bUseAltRClick = False
			GUICtrlSetState($g_hChkUseAltRClick, $GUI_UNCHECKED)
		EndIf
	Else
		$g_bUseAltRClick = False
	EndIf
EndFunc   ;==>chkUseAltRClick

Func chkCollectAchievements()
	If GUICtrlRead($g_hChkCollectAchievements) = $GUI_CHECKED Then
		$g_bCollectAchievements = True
	Else
		$g_bCollectAchievements = False
	EndIf
EndFunc   ;==>chkCollectAchievements

Func chkLookAtRedNotifications()
	If GUICtrlRead($g_hChkLookAtRedNotifications) = $GUI_CHECKED Then
		$g_bLookAtRedNotifications = True
	Else
		$g_bLookAtRedNotifications = False
	EndIf
EndFunc   ;==>chkLookAtRedNotifications

Func cmbStandardReplay()
	If GUICtrlRead($g_hChkUseBotHumanization) = $GUI_CHECKED Then
		If (_GUICtrlComboBox_GetCurSel($g_acmbPriority[3]) > 0) Or (_GUICtrlComboBox_GetCurSel($g_acmbPriority[4]) > 0) Then
			For $i = $g_hLabel7 To $g_acmbPause[0]
				GUICtrlSetState($i, $GUI_ENABLE)
			Next
		Else
			For $i = $g_hLabel7 To $g_acmbPause[0]
				GUICtrlSetState($i, $GUI_DISABLE)
			Next
		EndIf
	EndIf
EndFunc   ;==>cmbStandardReplay

Func cmbWarReplay()
	If GUICtrlRead($g_hChkUseBotHumanization) = $GUI_CHECKED Then
		If _GUICtrlComboBox_GetCurSel($g_acmbPriority[10]) > 0 Then
			For $i = $g_hLabel13 To $g_acmbPause[1]
				GUICtrlSetState($i, $GUI_ENABLE)
			Next
		Else
			For $i = $g_hLabel13 To $g_acmbPause[1]
				GUICtrlSetState($i, $GUI_DISABLE)
			Next
		EndIf
	EndIf
EndFunc   ;==>cmbWarReplay

Func chkTrainLogoutMaxTime()
	If GUICtrlRead($g_hChkTrainLogoutMaxTime) = $GUI_CHECKED Then
		_GUI_Value_STATE("ENABLE", $g_hTxtTrainLogoutMaxTime & "#" & $g_hLblTrainLogoutMaxTime)
	Else
		_GUI_Value_STATE("DISABLE", $g_hTxtTrainLogoutMaxTime & "#" & $g_hLblTrainLogoutMaxTime)
	EndIf
EndFunc   ;==>chkTrainLogoutMaxTime