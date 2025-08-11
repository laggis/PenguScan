@echo off
set malwarefound=0
echo You must put this in your resources directory!
echo [Penguin power] Welcome. Press enter to begin scanning. Warning: Some detections may give false positives, but Malware H and obfuscation patterns (R-Z) are high-confidence threats
pause
echo ------------------------------------
echo [Penguin power] Enchanced_Tabs malware checked
findstr /s /m "Enchanced_Tabs" *.lua >> VirusB.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] helpCode backdoor checked
findstr /s /m "helpCode" *.lua >> VirusC.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Discord webhooks checked (may be false positive)
findstr /s /m "discord\.com/api/webhooks" *.lua >> VirusD.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] HTTPRequest calls checked
findstr /s /m "HTTPRequest" *.lua >> VirusE.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] assert(load()) patterns checked (may be false positive in CFX resources)
findstr /s /m "assert(load(" *.lua >> VirusF.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] helperServer backdoor checked
findstr /s /m "helperServer" *.lua >> VirusH.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Suspicious external sites checked
findstr /s /m "blazelock\.eu\|pastebin\.com/raw\|hastebin\.com" *.lua >> VirusO.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Script obfuscation markers checked
findstr /s /m "Protected_by_MoonSecV2\|Obfuscated\|_G\[\"\\" *.lua >> VirusP.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Obfuscated load patterns checked
findstr /s /m "load(\"\\[0-9]" *.lua >> VirusR.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] String.char obfuscation checked
findstr /s /m "string\.char" *.lua >> VirusS.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Hex decode patterns checked
findstr /s /m "tonumber.*16" *.lua >> VirusT.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Numeric escape sequences checked
findstr /s /m "\\[0-9][0-9][0-9]\\[0-9][0-9][0-9]" *.lua >> VirusU.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Base64 decode patterns checked
findstr /s /m "base64" *.lua >> VirusV.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] XOR obfuscation checked
findstr /s /m "bit32\.bxor\|bit\.bxor" *.lua >> VirusW.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Bytecode loading checked
findstr /s /m "loadstring\|string\.dump" *.lua >> VirusX.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Suspicious concatenation checked
findstr /s /m "\.\.\.\.\." *.lua >> VirusY.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Encoded function calls checked
findstr /s /m "getfenv\|setfenv\|debug\.getinfo" *.lua >> VirusZ.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] PerformHttpRequest calls checked
findstr /s /m "PerformHttpRequest" *.lua >> VirusAA.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Lua bytecode patterns checked
findstr /s /m "\\27Lua\|\\x1bLua" *.lua >> VirusBB.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Advanced string manipulation checked
findstr /s /m "string\.gsub.*%%\|string\.format.*%%" *.lua >> VirusCC.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Suspicious math operations checked
findstr /s /m "math\.floor.*math\.random\|os\.time.*math" *.lua >> VirusDD.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Cipher backdoor patterns checked
findstr /s /m "function.*e.*d.*pcall.*assert.*load" *.lua >> VirusEE.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] RunCode backdoor functions checked
findstr /s /m "RunCode\|runcode" *.lua >> VirusFF.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] OS execute commands checked
findstr /s /m "os\.execute\|os\.getenv\|os\.remove\|os\.rename" *.lua >> VirusGG.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] IO operations checked
findstr /s /m "io\.popen\|io\.read\|io\.open\|io\.write" *.lua >> VirusHH.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Debug functions checked
findstr /s /m "debug\.getlocal\|debug\.getupvalue\|debug\.sethook" *.lua >> VirusII.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] FiveM resource manipulation checked
findstr /s /m "StartResource\|StopResource\|GetCurrentServerEndpoint" *.lua >> VirusJJ.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------

if %malwarefound%==1 (
echo [Penguin power] Malware found! Check the above logged bad resource files. They contain malicious code. Use source comparison to remove it.
) else (
echo [Penguin power] No malware found.
)
pause