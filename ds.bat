ECHO OFF
CLS
:MENU

ECHO.
ECHO   Using Docusaurus
ECHO.
ECHO   ..................................................
ECHO   PRESS 1-6 to select your task, or 7 to EXIT.
ECHO   ..................................................
ECHO   .
ECHO   1 - View English site
ECHO   2 - View French site
ECHO   3 - Translate French site
ECHO   4 - Deploy to github
ECHO   5 - Create version
ECHO   6 - Upgrade Docusaurus to latest 
ECHO   7 - EXIT
ECHO.

SET /P M=  Type 1, 2, 3, 4, 5, 6 or 7 then press ENTER:
IF %M%==1 GOTO ENGLISH
IF %M%==2 GOTO FRENCH
IF %M%==3 GOTO TRANSLATE
IF %M%==4 GOTO DEPLOY
IF %M%==5 GOTO VERSION
IF %M%==6 GOTO UPGRADE
IF %M%==7 GOTO EOF

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

:EOF