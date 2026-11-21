@echo off
chcp 65001 >nul
cd /d "%~dp0"
if not exist node_modules (
  echo Lan dau chay: dang cai thu vien, doi 1-3 phut...
  call npm install
)
echo.
echo ===== DIA CHI DE NHAP VAO APP TREN DIEN THOAI =====
echo (dien thoai phai cung Wi-Fi voi may tinh nay)
echo Tim dong "IPv4 Address" ben duoi, vi du 192.168.1.5  ^> nhap: 192.168.1.5
echo.
ipconfig | findstr /i "IPv4"
echo ====================================================
echo.
echo Neu Windows hoi Firewall: bam "Allow access" (Cho phep) o mang Private.
echo Dang bat Nhac theo qua (che do dien thoai)... Dong cua so nay la tat.
set LIVE_MODE=1
set LAN=1
set PORT=3007
start "" cmd /c "timeout /t 8 >nul & start http://localhost:3007"
npm run dev
pause
