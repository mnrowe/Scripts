:: Hide Command and Set Scope
@echo off
setlocal EnableExtensions

:: Customize Window
title Outlook-Easy

::::::::::::::::::::
:: WELCOME SCREEN ::
::::::::::::::::::::
color 0f
cls
echo  *****************  OUTLOOK-EASY  ****************************
echo  * Script to automate outlook tasks   			     *
echo  * Author: mrowe.w@gmail.com                                 *
echo  * --------------------------------------------------------- *
echo  *  1 W7/w8: OLD  					     *
echo  *  2 W7/W8: NEW   				             *
echo  *  							     *
echo  *  3 XP: OLD						     *
echo  *  4 XP: NEW						     *
echo  *************************************************************
echo.

set /p whatapp= Number: 

cls

set /p UserInputPath= user home folder: 

if %whatapp%==1 (
	Robocopy "C:\Users\%UserInputPath%\AppData\Roaming\microsoft\signatures" D:\userbackups\%UserInputPath%\backup\roaming\signatures *.* /e
	Robocopy "C:\Users\%UserInputPath%\AppData\Local\Microsoft\Outlook" D:\userbackups\%UserInputPath%\backup\local\OUTLOOK *.pst /e
	Robocopy "C:\Users\%UserInputPath%\AppData\Roaming\microsoft\outlook" D:\userbackups\%UserInputPath%\backup\roaming\autoc *.nk2 /e
	echo Done
	pause
) else if %whatapp%==2 (
	Robocopy "D:\userbackups\%UserInputPath%\backup\roaming\signatures" C:\Users\%UserInputPath%\AppData\Roaming\microsoft\signatures *.* /e
	Robocopy "D:\userbackups\%UserInputPath%\backup\local\OUTLOOK" C:\Users\%UserInputPath%\AppData\Local\Microsoft\Outlook *.pst /e
	Robocopy "D:\userbackups\%UserInputPath%\backup\roaming\autoc" C:\Users\%UserInputPath%\AppData\Roaming\microsoft\outlook *.nk2 /e
	echo Done
	pause
) else if %whatapp%==3 (
	Robocopy "C:\documents and settings\%UserInputPath%\application data\microsoft\signatures" D:\userbackups\%UserInputPath%\backup\roaming\signatures *.* /e
	Robocopy "C:\documents and settings\%UserInputPath%\local settings\application data\microsoft\outlook" D:\userbackups\%UserInputPath%\backup\local\OUTLOOK *.pst /e
	Robocopy "C:\documents and settings\%UserInputPath%\application data\microsoft\outlook" D:\userbackups\%UserInputPath%\backup\roaming\autoc *.nk2 /e
	echo Done
	pause
) else if %whatapp%==4 (
	Robocopy D:\userbackups\%UserInputPath%\backup\roaming\signatures "C:\documents and settings\%UserInputPath%\application data\microsoft\signatures" *.* /e
	Robocopy D:\userbackups\%UserInputPath%\backup\local\OUTLOOK "C:\documents and settings\%UserInputPath%\local settings\application data\microsoft\outlook" *.pst /e
	Robocopy D:\userbackups\%UserInputPath%\backup\roaming\autoc "C:\documents and settings\%UserInputPath%\application data\microsoft\outlook" *.nk2 /e
	echo Done
	pause
) else (
    echo invalid choice
)