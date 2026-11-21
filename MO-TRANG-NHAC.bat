@echo off
chcp 65001 >nul
cd /d "%~dp0"
rem Mo trang phat nhac voi che do TU PHAT TIENG (khong can bam vao man hinh).
rem Dung khi nguon Link trong TikTok LIVE Studio khong co tieng. Giu cua so nay mo trong luc live.
set URL=http://localhost:3007/?view=stage
where msedge >nul 2>nul && (
  start "" msedge --autoplay-policy=no-user-gesture-required --user-data-dir="%~dp0data\stage-profile" --window-size=420,260 --app=%URL%
  exit /b
)
start "" chrome --autoplay-policy=no-user-gesture-required --user-data-dir="%~dp0data\stage-profile" --window-size=420,260 --app=%URL%
