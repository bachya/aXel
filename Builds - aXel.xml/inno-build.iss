; Sample script for creating an installer for a Real Studio application
; To use this script, replace "RealStudioApp" with the name of your Real Studio application.

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.) 
AppId={{D16B9557-4161-4EE6-8AD4-3FB8BD3D6EF4}
AppName=aXel
AppVerName=aXel 0.2
AppPublisher=Bachya Productions
AppPublisherURL=
AppSupportURL=
AppUpdatesURL=
DefaultDirName={pf}\aXel
DefaultGroupName=aXel
OutputDir=D:\bachya\Git\axel\Builds - aXel.xml
OutputBaseFilename=Setup
; If you have an End User License Agreement (EULA) that you want the user to agree to before letting the install continue,
; put the path to it here.
LicenseFile=
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

; These directories will be created by the installer inside the DefaultDirName (defined above).
[Dirs]
Name: "{app}\aXel Libs"
Name: "{userappdata}\aXel\Resources"; Flags: deleteafterinstall

; These are the files to include.  By default you want to include the EXE and the Libs folder
; but you can include any other files you like as well.
; Be sure to change the path to point to your built application.

[Files]
Source: "D:\bachya\Git\axel\Builds - aXel.xml\Windows\aXel\aXel.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\bachya\Git\axel\Builds - aXel.xml\Windows\aXel\aXel Libs\*"; DestDir: "{app}\aXel Libs"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "D:\bachya\Git\axel\Resources\*"; DestDir: "{userappdata}\aXel\Resources"; Flags: ignoreversion recursesubdirs createallsubdirs

; NOTE: Don't use "Flags: ignoreversion" on any shared system files

; Creates icons/links in the Start Menu and/or the desktop if the user chooses during installation.
[Icons]
Name: "{group}\aXel"; Filename: "{app}\aXel.exe"
Name: "{commondesktop}\aXel"; Filename: "{app}\aXel.exe"; Tasks: desktopicon

; Give the user the option to run the app after the installation is finished.
[Run]
Filename: "{app}\aXel.exe"; Description: "{cm:LaunchProgram,aXel}"; Flags: nowait postinstall skipifsilent