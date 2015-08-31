@echo off && setlocal ENABLEEXTENSIONS && pushd "%~dp0" && call "%~dp0scripts\base.bat" || exit /b %ERRORLEVEL%

set OKIBA_URL=https://github.com/neguse11/cm3d2_plugins_okiba/archive/master.zip
set OKIBA_ZIP=master.zip

set DP0=%~dp0
set OKIBA_ROOT=%DP0:~0,-1%

rmdir /s /q cm3d2_plugins_okiba-master >nul 2>&1

echo �A�[�J�C�u�u%OKIBA_URL%�v�̃_�E�����[�h�A�W�J��
powershell -Command "(New-Object Net.WebClient).DownloadFile('%OKIBA_URL%', '%OKIBA_ZIP%')"
if not exist "%OKIBA_ZIP%" (
  echo �A�[�J�C�u %OKIBA_ZIP% �̃_�E�����[�h�Ɏ��s���܂����B
  exit /b 1
)
powershell -Command "$s=new-object -com shell.application;$z=$s.NameSpace('%OKIBA_ROOT%\%OKIBA_ZIP%');foreach($i in $z.items()){$s.Namespace('%OKIBA_ROOT%').copyhere($i,0x14)}"
echo �A�[�J�C�u�̓W�J����
popd

xcopy /E /Y cm3d2_plugins_okiba-master . && exit /b 0

popd