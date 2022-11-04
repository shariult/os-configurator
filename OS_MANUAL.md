# Linux Mint

A Guide on setting up Linux mint after installation. Most of the instructions below can be applied to other Linux OS also.

## Update Manager

1. After installing Mint configure update manager first. Select best server for fetching update and switch on/off update settings.
2. After Fixing Preference, install update.
3. Drivers
4. Install available drivers.
5. Restart
6. Transfer User Files

## Mint Settings

- Backgrounds: Select a Background
- Themes: Window Borders
- Account Details: Set account image
- Applets: Network Data Usage Monitor
- Date and Time: Use 24h clock (off), Display date (on), Display seconds (on)
- Desktop: Computer + Home + Trash + Mounted Drives (off)
- Input Method: Ibus (select), iBus Preference: Input Method > Add > Bangla (Bangladesh) > OpenBangla Keyboard, Restart
- Languages: Region (Select English)
- Preferred Application: Removable Media (off)
- Privacy: Remember recently accessed file (off)
- Screensaver: Customize > Allow floating clock and album art widget (off) + Show media player controls (off) + Show album art (off)
- Startup Applications: mintwelcome + Print Queue Applet + Support for NVIDIA Prime + Warpinator (off)
- Windows: Behavior > Special key to move and resize window (Super)
- Disks: Turn on 'Enable Write Cache' in linux root partition
- Sound: Output > Volume (100%), Sounds>Starting Cinnamon+Leaving Cinnamon (off), Settings > Maximum volume (150%)
- Firewall: Turn on
- Login Window: Settings > Activate numlock (on)
- Change Terminal && Text editor theme

## Shortcuts

1. Keyboard > Shortcuts > General: Show the workspace selection screen (ADD 'Super+Tab')
2. Keyboard > Shortcuts > Windows: Minimize window (Add 'Alt+f2'), Maximize window (Add 'Alt+f3')
3. Keyboard > Shortcuts > Windows > Inter-workspace: Move window to left workspace (Alt+Super+Left), Move window to right workspace (Alt+Super+Right)
4. Keyboard > Shortcuts > Workspaces: Switch to left workspace ('Ctrl+Super+Left'), Switch to right workspace ('Ctrl+Super+Right')
5. Keyboard > Shortcuts > System > Lock screen (ADD 'Super+L')
6. Keyboard > Shortcuts > Add Custom Shortcuts: Name= XKill, Command= xkill, (ADD ctrl + esc)

## LibreOffice Tweaks

- Disable java for fast startup in settings
- View > User Interface > Tabbed
- Settings > View > Icon Style > sifr dark
- Tools > Options > Libreoffice writer > Basic fonts

## Firefox Settings

- Configure Settings
- Play DRM Content

## Clean System

- Open 'Bleachbit' > cache + temporary files + trash > clean
- Open 'Bleachbit Root' > apt > clean

## Fix SMPlayer

Launch SMPlayer and go to Option > Preferences > General > Video (tab). Then select/type "x11" for Output driver and click on the "Apply" button.

## VPN Start

```bash
sudo openvpn $HOME/.vpn-configs/jp-free-01.protonvpn.com.udp.ovpn
sudo openvpn $HOME/.vpn-configs/jp-free-02.protonvpn.com.udp.ovpn
sudo openvpn $HOME/.vpn-configs/jp-free-03.protonvpn.com.udp.ovpn
sudo openvpn $HOME/.vpn-configs/nl-free-01.protonvpn.com.udp.ovpn
sudo openvpn $HOME/.vpn-configs/nl-free-02.protonvpn.com.udp.ovpn
sudo openvpn $HOME/.vpn-configs/nl-free-03.protonvpn.com.udp.ovpn
sudo openvpn $HOME/.vpn-configs/nl-free-04.protonvpn.com.udp.ovpn
sudo openvpn $HOME/.vpn-configs/nl-free-05.protonvpn.com.udp.ovpn
sudo openvpn $HOME/.vpn-configs/nl-free-06.protonvpn.com.udp.ovpn
sudo openvpn $HOME/.vpn-configs/nl-free-07.protonvpn.com.udp.ovpn
sudo openvpn $HOME/.vpn-configs/nl-free-08.protonvpn.com.udp.ovpn
sudo openvpn $HOME/.vpn-configs/nl-free-09.protonvpn.com.udp.ovpn
sudo openvpn $HOME/.vpn-configs/nl-free-10.protonvpn.com.udp.ovpn
sudo openvpn $HOME/.vpn-configs/nl-free-11.protonvpn.com.udp.ovpn
sudo openvpn $HOME/.vpn-configs/us-free-01.protonvpn.com.udp.ovpn
sudo openvpn $HOME/.vpn-configs/us-free-02.protonvpn.com.udp.ovpn
sudo openvpn $HOME/.vpn-configs/us-free-03.protonvpn.com.udp.ovpn
sudo openvpn $HOME/.vpn-configs/us-free-04.protonvpn.com.udp.ovpn
sudo openvpn $HOME/.vpn-configs/us-free-05.protonvpn.com.udp.ovpn
sudo openvpn $HOME/.vpn-configs/us-free-06.protonvpn.com.udp.ovpn
sudo openvpn $HOME/.vpn-configs/us-free-07.protonvpn.com.udp.ovpn
sudo openvpn $HOME/.vpn-configs/us-free-08.protonvpn.com.udp.ovpn
sudo openvpn $HOME/.vpn-configs/us-free-09.protonvpn.com.udp.ovpn
```

## Categories for '.desktop'

Main Categories: AudioVideo, Audio, Video, Development, Education, Game, Graphics, Network, Office, Settings, Utility

SubCategories: Building, Debugger, IDE, GUIDesigner, Profiling, RevisionControl, Translation, Calendar, ContactManagement, Database, Dictionary, Chart, Email, Finance, FlowChart, PDA, ProjectManagement, Presentation, Spreadsheet, WordProcessor, 2DGraphics, VectorGraphics, RasterGraphics, 3DGraphics, Scanning, OCR, Photography, Publishing, Viewer, TextTools, DesktopSettings, HardwareSettings, Printing, PackageManager, Dialup, InstantMessaging, Chat, IRCClient, FileTransfer, HamRadio, News, P2P, RemoteAccess, Telephony, TelephonyTools, VideoConference, WebBrowser, WebDevelopment, Midi, Mixer, Sequencer, Tuner, TV, AudioVideoEditing, Player, Recorder, DiscBurning, ActionGame, AdventureGame, ArcadeGame, BoardGame, BlocksGame, CardGame, KidsGame, LogicGame, RolePlaying, Simulation, SportsGame, StrategyGame, Art, Construction, Music, Languages, Science, ArtificialIntelligence, Astronomy, Biology, Chemistry, ComputerScience, DataVisualization, Economy, Electricity, Geography, Geology, Geoscience, History, ImageProcessing, Literature, Math, NumericalAnalysis, MedicalSoftware, Physics, Robotics, Sports, ParallelComputing, Amusement, Archiving, Compression, Electronics, Emulator, Engineering, FileTools, FileManager, TerminalEmulator, Filesystem, Monitor, Security, Accessibility, Calculator, Clock, TextEditor, Documentation, Core, KDE, GNOME, GTK, Qt, Motif, Java, ConsoleOnly

## Configuration for Time and Date Desklet in Linux Mint

```json
{
  "description": "A fork desklet that displays the time and date",
  "prevent-decorations": false,
  "uuid": "TimeAndDate@nightflame",
  "name": "Time and Date Desklet",
  "timeFormat": "%I:%M %p",
  "timeSize": "64pt",
  "dateFormat": "%A,%e %B",
  "dateSize": "32pt",
  "author": "none",
  "last-edited": 1639025017
}
```

## Fix Front Panel Sound Issue

In the BIOS settings change "HD audio" to "AC97".

```bash
sudo xed /usr/share/pulseaudio/alsa-mixer/paths/analog-output-headphones.conf
```

In the file above, find the section `[Element Front]`. In the line "switch" change from "mute" to "off":

```
[Element Front]
switch = off
volume = zero
```

## Game Launch Options

Steam Proton GE location: `~/.steam/root/compatibilitytools.d/`. Use following tweaks only if game crashes or error occurs,

- Seraph: If having issue use this command, `PROTON_USE_WINED3D=1 %command%`
- Skyrim: Use Proton GE and this command, `WINEDDLOVERRIDES="xaudio2_7=n,b" PULSE_LATENCY_MSEC=90 %command%`
- Fallout 4: Use Proton GE and this command, `WINEDLLOVERRIDES=”xaudio2_7=n,b” PROTON_NO_ESYNC=1 %command%`

# Windows

A Guide on setting up Windows after installation.

## Windows Installation

1. Fix Time
2. Personalize > Desktop icons
3. File Explorer: View > Options > Open Explorer to, Privacy
4. C:\\ Drive > Properties > Allow files on this drive... (Uncheck)
5. Indexing options
6. Turn on System restore
7. [Debloat Windows](https://github.com/Sycnex/Windows10Debloater) and [O&O shutup 10](https://www.oo-software.com/en/shutup10)
8. Install Drivers
9. Unpin applications + Defragment settings
10. Restart
11. Fix taskbar + Sleep settings + User folder locations + User account + Task manager settings + Disable fast startup(optional) + Restart
12. Windows update
13. Restart
14. Activate .Net 3.5 + Store update and install (Windows terminal) + Settings
15. Install fonts + Adobe AppData > Applications > Photoshop fix > Firewall block + Microsoft office + Restart
16. PowerToys + ninite.com + Browser, Nomacs etc. + Settings
17. Transfer Software Settings
18. Additional Applications
19. Developer Applications
20. Settings

## Softwares

**Ninite:** 7-zip, Adopt openjdk x64 17, Chrome, Filezilla, Firefox, Imgburn, K-lite codec pack, qBittorrent, Revo Uninstaller.

**Softwares:** Internet download manager, Joplin, Nomacs, Okular, OpenVPN, SetupAvro, Typora, VirtualBox.

**Development and Design Tools:** Anaconda, Bootstrap studio, Devdocs, Dia, Git, MongoDB, MongoDB compass, Node.JS, XAMPP, Composer, Sublime text, VSCode, Jetbrains(Optional).

## Windows Settings

- System: Display (Night Light), Sound (Master Volume), Notifications & actions (Edit your quick actions), Power & sleep, Multitasking, Clipboard
- Devices: Bluetooth (status), Typing (Advanced keyboard settings), Autoplay (Use AutoPlay...)
- Network & Internet: Mobile hotspot
- Apps: Default Apps
- Accounts: Sign in Options (Restart apps)
- Search > Permission & history (SafeSearch, History)
- Privacy > \*
- UWP App Settings

## Software Settings

**7-zip:** File association, change extract directory

**Chrome:** Sign in and Sync

**Firefox:** Sync, settings, sign in

**Avro:** Interface, Local/Language Settings(bangladesh)

**Filezilla:** Update

**IDM:** Icons, temp folder

**Imgburn:** Tools > Settings > turn off sound

**Joplin:** General, Sync, Appearance, Application, Shortcuts

**K-lite codec:** run .reg file

**qBittorrent:** Behavior(Check for updates), Downloads(Folders)

**Revo Uninstaller:** General(Check for updates), Tools > Autorun Manager

**Typora:** General(Update, Advanced Settings), Editor(Indent Size on Save), Image(When insert), Markdown(Code Fences)

**MongoDB, MySQL, PHP:** Add to path

**Sublime text & VSCode:** import settings and plugins

**Xampp:** xampp-conrol.ini permission, Config(default editor, startup servers), Apache > Config > httpd.conf

## Debloat Windows

```powershell
Get-AppxPackage -AllUsers *3dbuilder* | Remove-AppxPackage
Get-AppxPackage -AllUsers *windowsalarms* | Remove-AppxPackage
Get-AppxPackage -AllUsers *windowscalculator* | Remove-AppxPackage
Get-AppxPackage -AllUsers *windowscommunicationsapps* | Remove-AppxPackage
Get-AppxPackage -AllUsers *windowscamera* | Remove-AppxPackage
Get-AppxPackage -AllUsers *officehub* | Remove-AppxPackage
Get-AppxPackage -AllUsers *skypeapp* | Remove-AppxPackage
Get-AppxPackage -AllUsers *getstarted* | Remove-AppxPackage
Get-AppxPackage -AllUsers *zunemusic* | Remove-AppxPackage
Get-AppxPackage -AllUsers *windowsmaps* | Remove-AppxPackage
Get-AppxPackage -AllUsers *solitairecollection* | Remove-AppxPackage
Get-AppxPackage -AllUsers *bingfinance* | Remove-AppxPackage
Get-AppxPackage -AllUsers *zunevideo* | Remove-AppxPackage
Get-AppxPackage -AllUsers *bingnews* | Remove-AppxPackage
Get-AppxPackage -AllUsers *onenote* | Remove-AppxPackage
Get-AppxPackage -AllUsers *people* | Remove-AppxPackage
Get-AppxPackage -AllUsers *windowsphone* | Remove-AppxPackage
Get-AppxPackage -AllUsers *photos* | Remove-AppxPackage
Get-AppxPackage -AllUsers *windowsstore* | Remove-AppxPackage
Get-AppxPackage -AllUsers *bingsports* | Remove-AppxPackage
Get-AppxPackage -AllUsers *soundrecorder* | Remove-AppxPackage
Get-AppxPackage -AllUsers *bingweather* | Remove-AppxPackage
Get-AppxPackage -AllUsers *xboxapp* | Remove-AppxPackage
```

### Restore Apps

```powershell
Get-AppxPackage -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
```

## Block in Firewall

```powershell
New-NetFirewallRule -DisplayName "NetBlocker-BootstrapStudio" -Direction Outbound -Program "C:\Users\User\AppData\Local\Programs\bstudio\Bootstrap Studio.exe" -Action Block
New-NetFirewallRule -DisplayName "NetBlocker-Illustrator_CRWCS" -Direction Outbound -Program "C:\Program Files\Adobe\Adobe Illustrator 2020\Support Files\Contents\Windows\CRWindowsClientService.exe" -Action Block
New-NetFirewallRule -DisplayName "NetBlocker-Illustrator" -Direction Outbound -Program "C:\Program Files\Adobe\Adobe Illustrator 2020\Support Files\Contents\Windows\Illustrator.exe" -Action Block
New-NetFirewallRule -DisplayName "NetBlocker-InDesign_CRWCS" -Direction Outbound -Program "C:\Program Files\Adobe\Adobe InDesign 2020\CRWindowsClientService.exe" -Action Block
New-NetFirewallRule -DisplayName "NetBlocker-InDesign_CEPHE" -Direction Outbound -Program "C:\Program Files\Adobe\Adobe InDesign 2020\Resources\CEP\CEPHtmlEngine\CEPHtmlEngine.exe" -Action Block
New-NetFirewallRule -DisplayName "NetBlocker-InDesign" -Direction Outbound -Program "C:\Program Files\Adobe\Adobe InDesign 2020\InDesign.exe" -Action Block
New-NetFirewallRule -DisplayName "NetBlocker-Photoshop_CRWCS" -Direction Outbound -Program "C:\Program Files\Adobe\Adobe Photoshop 2020\CRWindowsClientService.exe" -Action Block
New-NetFirewallRule -DisplayName "NetBlocker-Photoshop" -Direction Outbound -Program "C:\Program Files\Adobe\Adobe Photoshop 2020\Photoshop.exe" -Action Block
New-NetFirewallRule -DisplayName "NetBlocker-AdobeCC_node64" -Direction Outbound -Program "C:\Program Files\Common Files\Adobe\Creative Cloud Libraries\libs\node.exe" -Action Block
New-NetFirewallRule -DisplayName "NetBlocker-AdobeCC_node" -Direction Outbound -Program "C:\Program Files (x86)\Adobe\Adobe Creative Cloud Experience\libs\node.exe" -Action Block
```

## Miscellaneous

**IDM File Extensions:** AI APK APPIMAGE BUNDLE DEB DOCX FIG MSIXBUNDLE PPTX PSD RUN SKETCH VSIX XD XLSX

**Windows God Mode:** Create a folder named `God Mode.{ED7BA470-8E54-465E-825C-99712043E01C}`

# Common

**Browser Extensions:** Decentraleyes, fireshot, focus to-do, font fingerprint defender, jsonview, kontrast, news feed eradicator, privacy badger, react developer tools, redux, responsive viewer, return youtube dislike, singlefile, site palette, ublock origin, visbug, web developer, whatfont

**Sublime Extensions:** AdvancedNewfile, A file icon, Babel, BracketHighlighter, ColorPicker, Color Highlight, Ejs2, Emmet, EsLint, JsPrettier, Material Theme, Monokai pro, Sass, SidebarEnhancements, SublimeCodeIntel

**VSCode Extensions:** Bracket Pair Colorizer, Color Highlight, Community Material Theme, Debugger for Firefox, DotEnv, ESLint, ES7/React Snippets, Image Preview, Material Icon Theme, PHP Extension Pack, Prettier, Pug Beautify, MySQL-cweijan(Optional), Python (Optional), Thunder client(Optional)

## Dual Booting Bootloader fixes

If Windows is installed after Ubuntu then use this method to fix bootloader by changing from Windows bootloader to Grub.

Run cmd as adminstrator in Windows,

```cmd
bcedit /set {bootmgr} path \EFI\ubuntu\grubx64.efi
```

In Ubuntu,

```bash
sudo update-grub
```
