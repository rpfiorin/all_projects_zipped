unit Uacess;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
   Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
   JvExDBGrids, JvDBGrid, JvDBUltimGrid, ZAbstractRODataset, ZAbstractDataset, ZDataset,
   Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls, Winapi.ShellAPI;

type
    TfrmAcess = class(TForm)

    qrySistemas: TZQuery;
    dbugSistemas: TJvDBUltimGrid;
    dsSistemas: TDataSource;
    pbAbrirExe: TProgressBar;
    tmrPbar: TTimer;
    btnSair: TBitBtn;
    qrySistemasnome: TWideMemoField;
    qrySistemasversao: TWideStringField;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dbugSistemasDblClick(Sender: TObject);
    procedure dbugSistemasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tmrPbarTimer(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
 frmAcess: TfrmAcess;

implementation

{$R *.dfm}

Uses
  Udata;

procedure TfrmAcess.dbugSistemasDblClick(Sender: TObject);
begin
  //Executa ao dar dois cliques.
  pbAbrirExe.Visible := True;
  tmrPbar.Enabled := True;
  btnSair.Visible := False;
end;

procedure TfrmAcess.dbugSistemasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //Se pressionar "Enter", executa evento de dois cliques.
  if (Key = VK_RETURN) then
   dbugSistemasDblClick(Sender);
end;

procedure TfrmAcess.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 //Desconecta do BD e desaloca memória ao fechar.
 dmDBconn.Zconn_pg.Disconnect;

  Action := caFree;
  frmAcess := nil;
end;

procedure TfrmAcess.FormShow(Sender: TObject);
begin
 //Conecta ao BD e exibe os sistemas disponíveis.
 dmDBconn.Zconn_pg.Connected;

  qrySistemas.Active := True;

  if qrySistemas.IsEmpty then
   dbugSistemas.Enabled := False;
end;

procedure TfrmAcess.tmrPbarTimer(Sender: TObject);
begin
 //Seta ritmo da progressBar,
 pbAbrirExe.Position := pbAbrirExe.Position + 99;

  //Executa ao concluir carregamento.
  if (pbAbrirExe.Position = 100) then begin
   tmrPbar.Enabled := False;
   self.Hide;

   if (qrySistemasNome.AsString = 'ScheduleUp') OR (qrySistemasNome.AsString = 'scheduleup') then begin
     WinExec('C:\Projetos\Delphi\Agenda\Bin\Win32\Release\Schedule_Up.exe', 0);
     Exit;
   end
   else
   if (qrySistemasNome.AsString = 'ProjUpdater') OR (qrySistemasNome.AsString = 'Projupdater')
   OR (qrySistemasNome.AsString = 'projupdater') OR (qrySistemasNome.AsString = 'projUpdater')
   then begin
     WinExec('C:\Projetos\Delphi\Baixa\Win32\Release\Proj_Updater.exe', 0);
     Exit;
   end
   else
   if (qrySistemasNome.AsString = 'DaysLeft') OR (qrySistemasNome.AsString = 'daysLeft')
   OR (qrySistemasNome.AsString = 'Daysleft') OR (qrySistemasNome.AsString = 'daysleft')
   then begin
     ShellExecute(Handle,'open',Pchar('C:\Projetos\Delphi\Espera\Win32\Release\Days_Left.exe'),nil,nil,sw_show);
     Exit;
   end
  end;
end;

end.
