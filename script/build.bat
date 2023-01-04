@echo off
cd ../
rd site /s /q
python -m mkdocs build
pause