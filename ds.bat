ECHO OFF
CLS
:MENU

ECHO.
ECHO   Using Docusaurus
ECHO.
ECHO   ---------------------------------------------
ECHO    PRESS 1-8 to select your task, or 9 to EXIT
ECHO   ---------------------------------------------
ECHO   .
ECHO   1 - View English site
ECHO   2 - View French site
ECHO   3 - Translate French site
ECHO   4 - Create version
ECHO   5 - Build site
ECHO   6 - Serve site to check build
ECHO   7 - Deploy to github
ECHO   8 - Upgrade Docusaurus to latest 
ECHO   9 - EXIT
ECHO.

SET /P M=  Type 1-8 or 9 then press ENTER:
IF %M%==1 GOTO ENGLISH
IF %M%==2 GOTO FRENCH
IF %M%==3 GOTO TRANSLATE
IF %M%==4 GOTO VERSION
IF %M%==5 GOTO BUILD
IF %M%==6 GOTO SERVE
IF %M%==7 GOTO DEPLOY
IF %M%==8 GOTO UPGRADE
IF %M%==9 GOTO EOF

:ENGLISH
ECHO Start English
npm run start
GOTO MENU

:FRENCH
ECHO Start French
npm run start -- --locale fr
GOTO MENU

:TRANSLATE
ECHO Translate
npm run write-translations -- --locale fr
GOTO MENU


:DEPLOY
cmd /C "set GIT_USER=JenniBeadle&& yarn deploy"
GOTO MENU

:VERSION
ECHO Version
npm run docusaurus docs:version x.x
GOTO MENU

:UPGRADE
ECHO Upgrade
npm i @docusaurus/core@latest @docusaurus/preset-classic@latest @docusaurus/module-type-aliases@latest
GOTO MENU

:BUILD
ECHO Build
npm run build
GOTO MENU

:SERVE
ECHO Serve
npm run serve
GOTO MENU

:EOF
