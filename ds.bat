
@ECHO OFF
SETLOCAL
IF "%1"=="" GOTO MENU
SET M=%1
SET X=1
GOTO :AFTER_MENU
:MENU
CLS

ECHO.
ECHO Using Docusaurus
ECHO.
ECHO ---------------------------------------------
ECHO PRESS 1-9 to select your task, or 0 to EXIT
ECHO ---------------------------------------------
ECHO .
ECHO 1 - View English site
ECHO 2 - View French site
ECHO 3 - Translate French site
ECHO 4 - Create version
ECHO 5 - Build site
ECHO 6 - Serve site to check build
ECHO 7 - Deploy to github
ECHO 8 - Upgrade Docusaurus to latest 
ECHO 9 - Clear the cache, build etc 
ECHO 0 - EXIT
ECHO.

SET /P M= Type 1-8 or 9 then press ENTER:
:AFTER_MENU
IF %M%==1 GOTO ENGLISH
IF %M%==2 GOTO FRENCH
IF %M%==3 GOTO TRANSLATE
IF %M%==4 GOTO VERSION
IF %M%==5 GOTO BUILD
IF %M%==6 GOTO SERVE
IF %M%==7 GOTO DEPLOY
IF %M%==8 GOTO UPGRADE
IF %M%==9 GOTO CLEARC
IF %M%==0 GOTO EOF

:ENGLISH
ECHO Start English (npm run start)
npm run start
IF "%X%"== "1" GOTO :EOF
GOTO MENU

:FRENCH
ECHO Start French (npm run start -- --locale fr)
npm run start -- --locale fr
IF "%X%"== "1" GOTO :EOF
GOTO MENU

:TRANSLATE
ECHO Translate (npm run write-translations -- --locale fr)
npm run write-translations -- --locale fr
IF "%X%"== "1" GOTO :EOF
GOTO MENU

:DEPLOY
cmd /C "set GIT_USER=JenniBeadle&& yarn deploy"
pause
IF "%X%"== "1" GOTO :EOF
GOTO MENU

:VERSION
ECHO Version
npm run docusaurus docs:version x.x
pause
IF "%X%"== "1" GOTO :EOF
GOTO MENU

:UPGRADE
ECHO Upgrade
npm i @docusaurus/core@latest @docusaurus/preset-classic@latest @docusaurus/module-type-aliases@latest
pause
IF "%X%"== "1" GOTO :EOF
GOTO MENU

:BUILD
ECHO Build
npm run build
pause IF "%X%"== "1" GOTO :EOF
GOTO MENU

:SERVE
ECHO Serve (npm run serve)
npm run serve
IF "%X%"== "1" GOTO :EOF
GOTO MENU

:CLEARC
ECHO Docusarus clear (cache, build...) npm run docusaurus clear
npm run docusaurus clear
IF "%X%"== "1" GOTO :EOF
GOTO MENU

:EOF
