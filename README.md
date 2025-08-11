## Enhanced Virus Scanner for Lua Files

This README documents the comprehensive enhancements made to the virus scanner (`PenguScan.bat`) to improve detection of obfuscated malware in Lua files.

### Files in this directory:
- `PenguScan.bat` - Enhanced virus scanner with advanced obfuscation detection
- `server.lua` - Example of heavily obfuscated malicious Lua code
- `README.md` - This documentation file

### Major Improvements Made:

#### 1. Fixed Critical Issues:
- **Typo correction**: "resoures" → "resources"
- **Missing Malware D detection**: Added proper `findstr` command for Discord webhooks
- **Inconsistent file naming**: Standardized all output files to `Virus[X].txt` format
- **Outdated warning message**: Updated to reflect current threat landscape
- **Redundant detections**: Removed duplicate PerformHttpRequest checks

#### 2. Enhanced Threat Detection:
- **Expanded external site detection**: Now catches multiple suspicious domains
- **Improved obfuscation markers**: Better detection of script protection tools
- **Added new advanced patterns**: 4 new detection methods (AA-DD)

## Detection Coverage

The scanner now includes **35 different malware detection patterns**:

### Basic Malware Patterns:
- **Malware B** - Enchanced_Tabs malware: `Enchanced_Tabs`
- **Malware C** - helpCode backdoor: `helpCode`
- **Malware D** - Discord webhooks: `discord.com/api/webhooks/`
- **Malware E** - HTTPRequest calls: `HTTPRequest`
- **Malware F** - assert(load()) patterns: `assert.*load`
- **Malware H** - helperServer backdoor: `helperServer`

### Advanced Obfuscation Detection:
- **Malware O** - Suspicious external sites: `blazelock.eu`, `pastebin.com/raw`, `hastebin.com`
- **Malware P** - Script obfuscation markers: `MoonSecV2`, `Obfuscated`, `_G["\
- **Malware R** - Obfuscated load patterns: `load("\[0-9]`
- **Malware S** - String.char obfuscation: `string\.char`
- **Malware T** - Hex decode patterns: `tonumber.*16`
- **Malware U** - Numeric escape sequences: `\[0-9][0-9][0-9]\[0-9][0-9][0-9]`
- **Malware V** - Base64 decode patterns: `base64`
- **Malware W** - XOR obfuscation: `bit32\.bxor\|bit\.bxor`
- **Malware X** - Bytecode loading: `loadstring\|string\.dump`
- **Malware Y** - Suspicious concatenation: `\.\.\.\.\.`
- **Malware Z** - Encoded function calls: `getfenv\|setfenv\|debug\.getinfo`
- **Malware AA** - PerformHttpRequest calls: `PerformHttpRequest`
- **Malware BB** - Lua bytecode patterns: `\27Lua\|\x1bLua`
- **Malware CC** - Advanced string manipulation: `string\.gsub.*%%\|string\.format.*%%`
- **Malware DD** - Suspicious math operations: `math\.floor.*math\.random\|os\.time.*math`

### Modern FiveM Threat Detection:
- **Malware EE** - Cipher backdoor patterns: `function.*e.*d.*pcall.*assert.*load`
- **Malware FF** - RunCode backdoor functions: `RunCode\|runcode`
- **Malware GG** - OS execute commands: `os\.execute\|os\.getenv\|os\.remove\|os\.rename`
- **Malware HH** - IO operations: `io\.popen\|io\.read\|io\.open\|io\.write`
- **Malware II** - Debug functions: `debug\.getlocal\|debug\.getupvalue\|debug\.sethook`
- **Malware JJ** - FiveM resource manipulation: `StartResource\|StopResource\|GetCurrentServerEndpoint`

### Technical Analysis of server.lua:

`server.lua` contains heavily obfuscated malware that uses:
1. **Numeric escape sequences** (e.g., `\092`, `\108`, `\111`, `\097`, `\100`) to hide function names
2. **Dynamic string construction** using `load()` calls
3. **Base64-like encoding** mixed with octal escape sequences
4. **Multiple layers of obfuscation** to hide the actual malicious payload

The obfuscated code likely contains calls to `PerformHttpRequest` and other malicious functions, but these are hidden through the encoding techniques, making simple string searches ineffective.

### Usage:
1. Place `Virus_scan.bat` in your FiveM resources directory
2. Run the batch file
3. Check the generated `Virus[X].txt` files for detected threats
4. Review any flagged files manually to confirm malicious content

### Important Notes:
- **High-confidence threats**: Malware H and obfuscation patterns (R-DD) are reliable indicators
- **Potential false positives**: Malware D (Discord webhooks) and F (assert load) may flag legitimate code
- **Total coverage**: 35 different malware detection patterns
- **File naming**: All output files now use consistent `Virus[X].txt` naming convention

### Manual Inspection Points:
- **Check fxmanifest.lua files** for suspicious file references
- **Look for Base64 encoded content** in .ydr files and other resources
- **Verify all external URLs** found in scripts, especially non-Discord domains
- **Review any scripts with obfuscated variable names** (random letters/numbers)

### Advanced Protection:
- Consider implementing **runtime function blocking** for sensitive Lua functions
- Use **resource permission systems** to limit script capabilities
- Set up **Discord webhook alerts** for suspicious activity detection
- Regularly **audit script permissions** and external connections

### Common Backdoor Locations:
- Bottom of `client.lua`, `config.lua`, or `server.lua` files
- Hidden in obfuscated or encrypted script sections
- Embedded within legitimate-looking function calls
- Base64 encoded strings that decode to malicious code

### Removed/Cleaned Up:
- **Malware A (random_char)**: Removed outdated detection pattern with no documented relevance to modern threats
- Redundant PerformHttpRequest detections (consolidated into Malware AA)
- Outdated blazelock.eu specific detection (expanded to multiple suspicious sites)
- Inconsistent file naming (blazelock.txt, log_MoonSecV2.txt, etc.)