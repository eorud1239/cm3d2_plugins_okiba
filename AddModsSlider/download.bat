@echo off && setlocal ENABLEEXTENSIONS && pushd "%~dp0" && call "..\scripts\base.bat" || exit /b 1

set "URL_PREFIX=https://raw.githubusercontent.com/CM3D2-01/CM3D2.AddModsSlider.Plugin/93c9644d35853f425654ccfc26941d86e15c84b3"
set "SRC_URL=%URL_PREFIX%/CM3D2.AddModsSlider.Plugin.cs"
set "SRC_FILE=CM3D2.AddModsSlider.Plugin.cs"

echo 「"%SRC_URL%"」から「"%SRC_FILE%"」をダウンロードします
powershell -Command "(New-Object Net.WebClient).DownloadFile('%SRC_URL%', '%SRC_FILE%')"

if not exist "%SRC_FILE%" (
  echo ダウンロードに失敗しました
  exit /b 1
)


echo ダウンロード完了

popd
exit /b 0
