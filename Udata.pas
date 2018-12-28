unit Udata;

interface

uses
   System.SysUtils, System.Classes, ZAbstractConnection, ZConnection;

type
    TdmDBconn = class(TDataModule)

    Zconn_pg: TZConnection;

    procedure DataModuleDestroy(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
 dmDBconn: TdmDBconn;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmDBconn.DataModuleDestroy(Sender: TObject);
begin
   dmDBconn := nil;
end;

end.
