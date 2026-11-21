@echo off
chcp 65001 >nul
cd /d "%~dp0"
if not exist node_modules (
  echo Lan dau chay: dang cai thu vien, doi 1-3 phut...
  call npm install
)
echo Dang bat Nhac theo qua... Dong cua so nay la tat.
echo Link cho TikTok LIVE Studio: http://lvh.me:3007/?view=stage
set LIVE_MODE=1
set PORT=3007
start "" cmd /c "timeout /t 8 >nul & start http://localhost:3007"
npm run dev
pause
