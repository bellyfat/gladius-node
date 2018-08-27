; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Gladius Node"
#define MyAppVersion "0.5.0"
#define MyAppPublisher "Gladius Network, LLC"
#define MyAppURL "https://gladius.io"
#define MyAppExeName "gladius-electron.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{AB54C628-10FE-4FD7-91C9-AEBFC4593702}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DisableProgramGroupPage=yes
LicenseFile=LICENSE.txt
InfoAfterFile=AfterText.rtf
OutputDir=C:\Users\gladius\Desktop
OutputBaseFilename=gladius setup
SetupIconFile=gladius-installer-icon.ico
Compression=lzma
SolidCompression=yes
UninstallDisplayIcon={app}\gladius-icon.ico
ChangesEnvironment=yes
WizardSmallImageFile=gladius-wizard-small-image.bmp
WizardImageFile=gladius-wizard-image.bmp

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}";

[Dirs]
Name: "{sd}\Users\{username}\.gladius\content"

[Files]
Source: "gladius.exe";                       DestDir: "{app}";                           Flags: ignoreversion
Source: "gladius-networkd.exe";              DestDir: "{app}";                           Flags: ignoreversion
Source: "gladius-controld.exe";              DestDir: "{app}";                           Flags: ignoreversion
Source: "gladius-icon.ico";                  DestDir: "{app}";                           Flags: ignoreversion
Source: "gladius-installer-icon.ico";        DestDir: "{app}";                           Flags: ignoreversion
Source: "gladius-wizard-image.bmp";          DestDir: "{app}";                           Flags: ignoreversion
Source: "gladius-wizard-small-image.bmp";    DestDir: "{app}";                           Flags: ignoreversion
Source: "LICENSE.txt";                       DestDir: "{app}";                           Flags: ignoreversion
Source: "AfterText.rtf";                     DestDir: "{app}";                           Flags: ignoreversion
Source: "README.md";                         DestDir: "{app}";                           Flags: ignoreversion
Source: "gladius-controld.toml";             DestDir: "{sd}\Users\{username}\.gladius";  Flags: ignoreversion
Source: "gladius-cli.toml";                  DestDir: "{sd}\Users\{username}\.gladius";  Flags: ignoreversion
Source: "gladius-networkd.toml";             DestDir: "{sd}\Users\{username}\.gladius";  Flags: ignoreversion
Source: "gladius-electron-win32-x64\*";      DestDir: "{app}\gladius-electron-win32-x64";         Flags: ignoreversion recursesubdirs createallsubdirs
; Source: "C:\Users\gladius\Developer\gladius-node-installer\BeforeInfo.txt"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\gladius-electron-win32-x64\{#MyAppExeName}"; IconFileName: "{app}\gladius-icon.ico"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\gladius-electron-win32-x64\{#MyAppExeName}"; IconFileName: "{app}\gladius-icon.ico"; Tasks: desktopicon

[Registry]
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; \
    ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};{app}"; \
    Check: NeedsAddPath(ExpandConstant('{app}'))
; This adds the App to the PATH

[Code]
function NeedsAddPath(Param: string): boolean;
var
  OrigPath: string;
begin
  if not RegQueryStringValue(
    HKEY_LOCAL_MACHINE,
    'SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
    'Path', OrigPath)
  then begin
    Result := True;
    exit;
  end;
  { look for the path with leading and trailing semicolon }
  { Pos() returns 0 if not found }
  Result :=
    (Pos(';' + UpperCase(Param) + ';', ';' + UpperCase(OrigPath) + ';') = 0) and
    (Pos(';' + UpperCase(Param) + '\;', ';' + UpperCase(OrigPath) + ';') = 0);
end;

{Delete the folder from the PATH on uninstall}
const
  EnvironmentKey = 'SYSTEM\CurrentControlSet\Control\Session Manager\Environment';

procedure RemovePath(Path: string);
var
  Paths: string;
  P: Integer;
begin
  if not RegQueryStringValue(HKEY_LOCAL_MACHINE, EnvironmentKey, 'Path', Paths) then
  begin
    Log('PATH not found');
  end
    else
  begin
    Log(Format('PATH is [%s]', [Paths]));

    P := Pos(';' + Uppercase(Path) + ';', ';' + Uppercase(Paths) + ';');
    if P = 0 then
    begin
      Log(Format('Path [%s] not found in PATH', [Path]));
    end
      else
    begin
      if P > 1 then P := P - 1;
      Delete(Paths, P, Length(Path) + 1);
      Log(Format('Path [%s] removed from PATH => [%s]', [Path, Paths]));

      if RegWriteStringValue(HKEY_LOCAL_MACHINE, EnvironmentKey, 'Path', Paths) then
      begin
        Log('PATH written');
      end
        else
      begin
        Log('Error writing PATH');
      end;
    end;
  end;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
  if CurUninstallStep = usUninstall then
  begin
    RemovePath(ExpandConstant('{app}'));
  end;
end;



[Run]
Filename: "{app}\gladius-networkd.exe"; Parameters:"install"; StatusMsg:"Installing GladiusNetworkDaemon as a service"; Flags: runascurrentuser runhidden
Filename: "{app}\gladius-controld.exe"; Parameters:"install"; StatusMsg:"Installing GladiusControlDaemon as a service"; Flags: runascurrentuser runhidden

Filename: "{sys}\sc.exe"; Parameters: "start ""GladiusControlDaemon""" ; Flags: runhidden
Filename: "{sys}\sc.exe"; Parameters: "start ""GladiusNetworkDaemon""" ; Flags: runhidden

Filename: "{app}\gladius-electron-win32-x64\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
; Install and start gladius-networkd and gladius-controld as services

[UninstallRun]
Filename: "{sys}\sc.exe"; Parameters: "stop ""GladiusControlDaemon""" ; Flags: runhidden
Filename: "{sys}\sc.exe"; Parameters: "delete ""GladiusControlDaemon""" ; Flags: runhidden
Filename: "{sys}\sc.exe"; Parameters: "stop ""GladiusNetworkDaemon""" ; Flags: runhidden
Filename: "{sys}\sc.exe"; Parameters: "delete ""GladiusNetworkDaemon""" ; Flags: runhidden
; Stop and uninstall gladius-networkd and gladius-controld as services
