# macOS Spotlight Rebuilder

A bash script to completely rebuild the Spotlight index on modern macOS systems. This can help resolve search issues in Finder, Mail, and Microsoft Office applications, particularly after OS upgrades.

## Important Warning ⚠️

This script requires temporarily disabling System Integrity Protection (SIP). Always re-enable SIP when finished.

## Prerequisites

- macOS Ventura (13.0+), Sonoma, or Sequoia
- Administrator access
- SIP must be disabled before running the script

## Compatibility

- Tested on macOS Sequoia (14.0)
- Should work on macOS Sonoma (14.0) and Ventura (13.0)
- Works on both Intel and Apple Silicon Macs
- Compatible with Office 365 for Mac

## Preparation

### Prevent Mac from Sleeping
Before running the script, adjust your energy settings:

#### For Desktop Macs
1. Open System Settings > Energy
2. Turn on "Prevent automatic sleeping when the display is off"

#### For Laptop Macs
1. Open System Settings > Battery > Options
2. Turn on "Prevent automatic sleeping on power adapter when the display is off"
3. Keep your MacBook plugged into power

#### Additional Settings (Both)
1. Go to System Settings > Lock Screen
2. Set "Turn display off when inactive" to Never

Remember to restore these settings after the rebuild is complete.

## Disabling SIP

### For Intel Macs
1. Restart your Mac
2. Hold Command (⌘) + R immediately after restart until Apple logo appears
3. Click Utilities > Terminal
4. Enter: `csrutil disable`
5. Restart your Mac

### For Apple Silicon Macs
1. Shut down your Mac completely
2. Press and hold the power button until "Loading startup options" appears
3. Click Options, then Continue
4. Select an administrator account and enter password if prompted
5. Click Utilities > Terminal
6. Enter: `csrutil disable`
7. Type Y when prompted and enter your admin password
8. Restart your Mac

## Usage

1. Download `rebuild-spotlight.sh`
2. Open Terminal
3. Make the script executable:
   ```
   chmod +x rebuild-spotlight.sh
   ```
4. Run the script:
   ```
   sudo bash rebuild-spotlight.sh
   ```
5. The script will:
   - Stop Spotlight
   - Delete existing indexes
   - Restart Spotlight
   - Force reindexing
   - Show real-time monitoring of the rebuild process

## Re-enabling SIP

### For Intel Macs
1. Restart into Recovery Mode (Command + R at startup)
2. Click Utilities > Terminal
3. Enter: `csrutil enable`
4. Restart your Mac

### For Apple Silicon Macs
1. Shut down your Mac
2. Press and hold power button until startup options appear
3. Select Options > Continue
4. Click Utilities > Terminal
5. Enter: `csrutil enable`
6. Restart your Mac

## Post-Process

After the rebuild is complete:
1. Restore your original energy settings
2. Test Spotlight search functionality
3. Monitor for any remaining issues

## Notes

- Keep your Mac awake and plugged in during reindexing
- Reindexing may take several hours depending on drive size
- Monitor progress in the Terminal window
- Press Ctrl+C to stop the monitoring display

## Common Issues This May Fix

- Missing search results in Finder
- Incomplete email search in Mail or Microsoft Outlook
- Documents not appearing in Spotlight searches
- Inconsistent search results for recent files
- Microsoft Office 365 search problems
- Search issues after macOS upgrades

## Script Contents

The script performs these operations:
1. Checks for root privileges
2. Stops the Spotlight service
3. Removes existing Spotlight databases
4. Restarts the Spotlight service
5. Forces reindexing
6. Monitors the rebuild process

## Troubleshooting

If search issues persist after running the script:
- Ensure SIP was properly disabled before running
- Verify the rebuild completed (check Activity Monitor for mdworker processes)
- Make sure your Mac didn't sleep during the rebuild
- Check System Settings > Spotlight for excluded locations
- Verify your search locations aren't in Privacy exclusions

## Known Issues

- Some versions of macOS may require additional steps
- Performance may vary depending on system specifications
- Large drives may take several hours to reindex

## Contributing

Feel free to submit issues and enhancement requests! Please include your:
- macOS version
- Mac type (Intel/Apple Silicon)
- Specific search issues you're experiencing

## License

This script is released under the MIT License. Feel free to use and modify as needed.

## Changelog

- v1.0 (2023-12-20): Initial release
  - Added support for both Intel and Apple Silicon Macs
  - Included real-time monitoring of rebuild process
  - Tested on macOS Sequoia, Sonoma, and Ventura
  - Added sleep prevention instructions

## Safety Note

Always ensure you have a current backup of your system before performing system-level operations like this. While this script is safe when used correctly, having a backup is always recommended.

## Support

If you find this tool helpful, please star the repository and share it with others who might benefit from it.