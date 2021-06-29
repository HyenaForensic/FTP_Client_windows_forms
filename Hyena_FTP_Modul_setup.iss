; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Hyena_FTP_Module"
#define MyAppVersion "1.5"
#define MyAppPublisher "HMCompany"
#define MyAppURL "http://hmcom.co.kr"
#define MyAppExeName "FTP.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{CD0E7F1B-0903-4AE0-AF78-FAADA0DED91C}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\Hyena_FTP_Module
DefaultGroupName=Hyena_FTP_Module
DisableProgramGroupPage=yes
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputDir=C:\Users\HM\Desktop
OutputBaseFilename=Hyena_FTP_Module
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Registry]
Root:HKCR;Subkey:"hyenaFTP";ValueType:string;ValueName:"URL Protocol";
Root:HKCR;Subkey:"hyenaFTP\shell\open\command";ValueType:string;ValueData:"C:\Program Files (x86)\Hyena_FTP_Module\FTP.exe";
[Files]
Source: "D:\FTP_Client_windows_forms\bin\Debug\netcoreapp3.1\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\FTP_Client_windows_forms\bin\Debug\netcoreapp3.1\FluentFTP.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\FTP_Client_windows_forms\bin\Debug\netcoreapp3.1\FTP.deps.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\FTP_Client_windows_forms\bin\Debug\netcoreapp3.1\FTP.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\FTP_Client_windows_forms\bin\Debug\netcoreapp3.1\FTP.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\FTP_Client_windows_forms\bin\Debug\netcoreapp3.1\FTP.pdb"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\FTP_Client_windows_forms\bin\Debug\netcoreapp3.1\FTP.runtimeconfig.json"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

