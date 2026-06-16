@echo off
title Pembersih Otomatis Folder Downloads

:: 1. Hapus file yang berusia 2 hari atau lebih tua
forfiles /p "%USERPROFILE%\Downloads" /s /m *.* /d -2 /c "cmd /c del /f /q @path"

:: 2. Hapus folder kosong yang berusia 2 hari atau lebih tua
forfiles /p "%USERPROFILE%\Downloads" /s /c "cmd /c if @isdir==TRUE rmdir /s /q @path" 2>nul