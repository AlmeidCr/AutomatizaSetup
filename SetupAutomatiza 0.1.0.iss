; Define a versao do Inno Setup
#define MyAppName "Automatiza Sistemas"
#define MyAppVersion "0.1.0"
#define MyAppPublisher "Automatiza Sistemas"
#define MyAppURL "https://automatizasistemas.com.br/"

[Setup]
; Informacoes basicas sobre o instalador
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
OutputDir=.
OutputBaseFilename=AutomatizaSetup
Compression=lzma
SolidCompression=yes
PrivilegesRequired=admin

; Definir icone do instalador
SetupIconFile="C:\Users\crist\Downloads\autoamtiza ico.ico"

[Languages]
Name: "portuguese"; MessagesFile: "compiler:Languages\Portuguese.isl"

[Dirs]
; Cria a pasta AutomatizaApps no disco C:
Name: "C:\AutomatizaApps"

[Files]
; Lista de arquivos a serem instalados e seus destinos
Source: "C:\Users\crist\Desktop\InstallAtmz\Automatiza Retaguarda.rar"; DestDir: "C:\AutomatizaApps"; Flags: ignoreversion
Source: "C:\Users\crist\Desktop\InstallAtmz\CRRuntime_64bit_13_0_2.msi"; DestDir: "C:\AutomatizaApps"; Flags: ignoreversion
Source: "C:\Users\crist\Desktop\InstallAtmz\dotnetfx35.exe"; DestDir: "C:\AutomatizaApps"; Flags: ignoreversion
Source: "C:\Users\crist\Desktop\InstallAtmz\mysql-connector-net-6.2.2.msi"; DestDir: "C:\AutomatizaApps"; Flags: ignoreversion
Source: "C:\Users\crist\Desktop\InstallAtmz\mysql-gui-tools-5.0-r17-win32.msi"; DestDir: "C:\AutomatizaApps"; Flags: ignoreversion
Source: "C:\Users\crist\Desktop\InstallAtmz\mysql-query-browser-1.1.20-win.msi"; DestDir: "C:\AutomatizaApps"; Flags: ignoreversion
Source: "C:\Users\crist\Desktop\InstallAtmz\winrar-x64.exe"; DestDir: "C:\AutomatizaApps"; Flags: ignoreversion

[Run]
; Instala o WinRAR na pasta AutomatizaApps
Filename: "C:\AutomatizaApps\winrar-x64.exe"; Parameters: "/S"; Flags: waituntilterminated
; Aguarda um curto periodo para garantir que o WinRAR seja instalado corretamente
Filename: "{cmd}"; Parameters: "/C timeout /T 5"; Flags: runhidden waituntilterminated
; Extrai a pasta "Automatiza Retaguarda" para o disco C: usando o WinRAR da pasta AutomatizaApps
Filename: "C:\Program Files\WinRAR\WinRAR.exe"; Parameters: "x -y ""C:\AutomatizaApps\Automatiza Retaguarda.rar"" ""C:\"""; Flags: waituntilterminated
; Inicia a instalacao dos aplicativos contidos na pasta AutomatizaApps
Filename: "C:\AutomatizaApps\dotnetfx35.exe"; Parameters: "/q /norestart"; Flags: waituntilterminated
Filename: "msiexec.exe"; Parameters: "/i ""C:\AutomatizaApps\CRRuntime_64bit_13_0_2.msi"" /quiet /norestart"; Flags: waituntilterminated
Filename: "msiexec.exe"; Parameters: "/i ""C:\AutomatizaApps\mysql-connector-net-6.2.2.msi"" /quiet /norestart"; Flags: waituntilterminated
Filename: "msiexec.exe"; Parameters: "/i ""C:\AutomatizaApps\mysql-gui-tools-5.0-r17-win32.msi"" /quiet /norestart"; Flags: waituntilterminated
Filename: "msiexec.exe"; Parameters: "/i ""C:\AutomatizaApps\mysql-query-browser-1.1.20-win.msi"" /quiet /norestart"; Flags: waituntilterminated

Filename: "C:\Automatiza Retaguarda\Editar_Registro_Windows.exe"; Flags: postinstall runascurrentuser

[icons]
Name: "{userdesktop}\Automatiza Sistemas"; Filename: "C:\Automatiza Retaguarda\ConstruFarma.UI.WF.exe"; WorkingDir: "C:\Automatiza Retaguarda"