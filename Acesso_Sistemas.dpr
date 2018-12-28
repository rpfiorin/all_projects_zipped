{
 Sistema de acesso aos programas desenvolvidos,
 Author: Rafael P. Fiorin.
}

program Acesso_Sistemas;

uses
  Vcl.Forms,
  Windows,
  Dialogs,
  Uacess in 'Uacess.pas' {frmAcess},
  Udata in 'Udata.pas' {dmDBconn: TDataModule};

{$R *.res}

begin
   //Cria um mutex usando um nome único,
   CreateMutex(nil, False, 'Acesso_Sistemas.exe');

   //Verifica se houve erro na criação,
   if GetLastError = ERROR_ALREADY_EXISTS then begin
     MessageDlg(' Algum sistema já está em execução.', mtError,[mbOK],0);
     //Cancela execução,
     Halt(0);
   end
   else
   begin
     Application.Initialize;
     //Não exibe na barra de tarefas,
     Application.MainFormOnTaskbar := True;

     Application.CreateForm(TdmDBconn, dmDBconn);

     frmAcess := TfrmAcess.Create(Application);
     frmAcess.ShowModal;

     //Executa.
     Application.Run;
   end;
end.
