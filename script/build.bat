@echo off
cd ../
rd docs /s /q
python -m mkdocs build
pause