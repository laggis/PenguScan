@echo off
set malwarefound=0
echo You must put this in your resoures directory!
echo [Penguin power] Welcome. Press enter to begin scanning. Warning It can give some false positive on some code but Malware G and H are 100% Malware
pause
echo [Penguin power] Malware A checked
findstr /s /m "random_char" *.lua >> log_random_char.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Malware B checked
findstr /s /m "Enchanced_Tabs" *.lua >> VirusB.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Malware C checked
findstr /s /m "helpCode" *.lua >> VirusC.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Malware D checked may be found in certain discord webhook for logging kills, chat and stuff like that. It can lead to a false positive, so check the code first before making change.
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Malware E checked
findstr /s /m "HTTPRequest" *.lua >> VirusE.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Malware F checked -- may be found in certain Cfx default resources, is a false positive
findstr /s /m "assert(load(" *.lua >> VirusF.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Malware G checked
findstr /s /m "PerformHttpRequest" *.lua >> VirusG.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Malware H checked
findstr /s /m "helperServer" *.lua >> VirusH.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Malware O checked Found site blazelock.eu/updatecheck.txt. Remove the line from the scripts!!
findstr /s /m "blazelock.eu/updatecheck.txt" *.lua >> blazelock.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Malware P checked It would site Protected_by_MoonSecV2. Remove the line from the scripts!!
findstr /s /m "Protected_by_MoonSecV2" *.lua >> log_MoonSecV2.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Malware Q - PerformHttpRequest
findstr /s /m "PerformHttpRequest" *.lua >> VirusQ.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Malware R - Obfuscated load patterns
findstr /s /m "load(\"\\[0-9]" *.lua >> VirusObfuscated.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Malware S - String.char obfuscation
findstr /s /m "string\.char" *.lua >> VirusStringChar.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Malware T - Hex decode patterns
findstr /s /m "tonumber.*16" *.lua >> VirusHexDecode.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Malware U - Numeric escape sequences
findstr /s /m "\\[0-9][0-9][0-9]\\[0-9][0-9][0-9]" *.lua >> VirusNumeric.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Malware V - Base64 decode patterns
findstr /s /m "base64" *.lua >> VirusBase64.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Malware W - XOR obfuscation
findstr /s /m "bit32\.bxor\|bit\.bxor" *.lua >> VirusXOR.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Malware X - Bytecode loading
findstr /s /m "loadstring\|string\.dump" *.lua >> VirusBytecode.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Malware Y - Suspicious concatenation
findstr /s /m "\.\.\.\.\." *.lua >> VirusConcat.txt
if %errorlevel%==0 (
set malwarefound=1
)
echo ------------------------------------
echo [Penguin power] Malware Z - Encoded function calls
findstr /s /m "getfenv\|setfenv\|debug\.getinfo" *.lua >> VirusEnvManip.txt
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