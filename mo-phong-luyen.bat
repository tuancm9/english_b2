@echo off
title Phong luyen VSTEP B2
cd /d "%~dp0"

rem Fixed port: the browser remembers mic permission per address, so keep it the same.
set PORT=8765
set URL=http://localhost:%PORT%/phong-luyen-vstep-b2.html

set PY=
where py >nul 2>nul && set PY=py
if not defined PY where python >nul 2>nul && set PY=python
if not defined PY (
  echo Khong tim thay Python. Cai Python tai https://www.python.org/downloads/ roi chay lai file nay.
  pause
  exit /b 1
)

echo Dang mo Phong luyen VSTEP tai %URL%
echo Lan dau bam "Cho phep" micro, cac lan sau trinh duyet se nho.
echo Giu cua so nay mo trong luc hoc. Dong cua so (hoac bam Ctrl+C) de tat.
echo.

start "" "%URL%"
%PY% -m http.server %PORT% --bind 127.0.0.1
if errorlevel 1 (
  echo.
  echo Khong chay duoc may chu. Co the cong %PORT% dang duoc dung: neu trang da mo duoc thi cu dung binh thuong.
  pause
)