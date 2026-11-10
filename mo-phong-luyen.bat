@echo off
chcp 65001 >nul
title Phong luyen VSTEP B2
cd /d "%~dp0"

rem Fixed port: the browser remembers mic permission per address, so keep it the same.
set PORT=8765
set URL=http://localhost:%PORT%/phong-luyen-vstep-b2.html

set PY=
where py >nul 2>nul && set PY=py
if not defined PY where python >nul 2>nul && set PY=python
if not defined PY (
  echo Không tìm thấy Python. Cài Python tại https://www.python.org/downloads/ rồi chạy lại file này.
  pause
  exit /b 1
)

echo Đang mở Phòng luyện VSTEP tại %URL%
echo Lần đầu bấm "Cho phép" micro, các lần sau trình duyệt sẽ nhớ.
echo Giữ cửa sổ này mở trong lúc học. Đóng cửa sổ (hoặc bấm Ctrl+C) để tắt.
echo.

start "" "%URL%"
%PY% -m http.server %PORT% --bind 127.0.0.1
if errorlevel 1 (
  echo.
  echo Không chạy được máy chủ. Có thể cổng %PORT% đang được dùng: nếu trang đã mở được thì cứ dùng bình thường.
  pause
)
