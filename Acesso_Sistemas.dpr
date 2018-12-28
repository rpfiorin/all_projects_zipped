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
   //Cria um mutex usando um nome �nico,
   CreateMutex(nil, False, 'Acesso_Sistemas.exe');

   //Verifica se houve erro na cria��o,
   if GetLastError = ERROR_ALREADY_EXISTS then begin
     MessageDlg(' Algum sistema j� est� em execu��o.', mtError,[mbOK],0);
     //Cancela execu��o,
     Halt(0);
   end
   else
   begin
     Application.Initialize;
     //N�o exibe na barra de tarefas,
     Application.MainFormOnTaskbar := True;

     Application.CreateForm(TdmDBconn, dmDBconn);

     frmAcess := TfrmAcess.Create(Application);
     frmAcess.ShowModal;

     //Executa.
     Application.Run;
   end;
end.
