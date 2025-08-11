# Virus Scanner Enhancement

## Overview
This folder contains an enhanced virus scanner for detecting malware in Lua files, specifically designed to catch both simple and obfuscated malicious code.

## Files
- `Virus_scan.bat` - Enhanced virus scanner with multiple detection methods
- `server.lua` - **MALICIOUS FILE** - Contains heavily obfuscated malware

## What Was Fixed

### Original Problem
The original virus scanner used hex escape sequences that `findstr` couldn't interpret:
```batch
findstr /s /m "\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74" *.lua
```
This was looking for literal hex characters instead of the actual string "PerformHttpRequest".

### Improvements Made

1. **Fixed hex pattern issue** - Changed to search for actual string:
   ```batch
   findstr /s /m "PerformHttpRequest" *.lua >> VirusQ.txt
   ```

2. **Added obfuscation detection** for sophisticated malware like in `server.lua`:
   - **Malware R**: Detects obfuscated load patterns `load("\\[0-9]`
   - **Malware S**: Finds string.char obfuscation `string\.char`
   - **Malware T**: Catches hex decode patterns `tonumber.*16`
   - **Malware U**: Detects numeric escape sequences `\\[0-9][0-9][0-9]\\[0-9][0-9][0-9]`

## Why These Changes Matter

The `server.lua` file contains malware that:
- Uses numeric escape sequences like `\116\81\73\50\108...`
- Hides "PerformHttpRequest" and other dangerous functions in encoded strings
- Dynamically constructs malicious code at runtime
- Evades simple string-based detection

The enhanced scanner now catches these sophisticated obfuscation techniques.

## Usage
Run `Virus_scan.bat` to scan all .lua files in the current directory. The scanner will:
- Create separate log files for each malware type detected
- Report if any malicious patterns are found
- Recommend using source comparison to remove malicious code

## ⚠️ WARNING
**The `server.lua` file in this folder is MALICIOUS and should be deleted or quarantined immediately!**

---
*Enhanced by AI Assistant to improve malware detection capabilities*