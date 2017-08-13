unit UIdoso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, FMTBcd, DB, SqlExpr, Buttons,
  jpeg, ExtCtrls;

type
  TIdoso = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    DBMemo1: TDBMemo;
    btnEditar: TBitBtn;
    btnInserir: TBitBtn;
    btnDeletar: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    Esquerda: TBitBtn;
    Direita: TBitBtn;
    sqlAux: TSQLQuery;
    Image1: TImage;
    procedure DireitaClick(Sender: TObject);
    procedure EsquerdaClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Idoso: TIdoso;

implementation

uses UModulo;

{$R *.dfm}

procedure TIdoso.DireitaClick(Sender: TObject);
begin
Modulo.cdsResidente.Next;
end;

procedure TIdoso.EsquerdaClick(Sender: TObject);
begin
Modulo.cdsResidente.Prior;
end;

procedure TIdoso.btnGravarClick(Sender: TObject);
begin
Modulo.cdsResidente.Post;

         Modulo.cdsResidente.ApplyUpdates(-1);

         btnCancelar.Click;

end;

procedure TIdoso.btnCancelarClick(Sender: TObject);
begin
Modulo.cdsEmail.Cancel;
          DBEdit2.Enabled        := False;
          DBEdit3.Enabled        := False;
          DBEdit4.Enabled        := False;
          DBEdit5.Enabled        := False;
          DBMemo1.Enabled        := False;
          DBEdit6.Enabled        := False;
          DBEdit7.Enabled        := False;
          DBEdit8.Enabled        := False;
          DBEdit9.Enabled        := False;
          DBEdit10.Enabled       := False;
          DBEdit11.Enabled       := False;
          DBEdit12.Enabled       := False;
          DBEdit13.Enabled       := False;
          //DBEdit14.Enabled       := False;
          DBEdit15.Enabled       := False;
          DBEdit16.Enabled       := False;
          DBEdit17.Enabled       := False;


          btnInserir.Enabled    := True;
          btnDeletar.Enabled    := True;
          btnEditar.Enabled     := True;
          Direita.Enabled       := True;
          Esquerda.Enabled      := True;

          // Ligar o Gravar
          btnGravar.Enabled      := False;



end;

procedure TIdoso.btnDeletarClick(Sender: TObject);

begin
IF (DBEdit1.Text = '')
then
begin
   MessageDlg ('Não a registros no banco',
                       mtWarning,
                       [mbyes,mbno],
                       0)
end
else
begin
          DBEdit2.Enabled        := False;
          DBEdit3.Enabled        := False;
          DBEdit4.Enabled        := False;
          DBEdit5.Enabled        := False;
          DBMemo1.Enabled        := False;
          DBEdit6.Enabled        := False;
          DBEdit7.Enabled        := False;
          DBEdit8.Enabled        := False;
          DBEdit9.Enabled        := False;
          DBEdit10.Enabled       := False;
          DBEdit11.Enabled       := False;
          DBEdit12.Enabled       := False;
          DBEdit13.Enabled       := False;
          //DBEdit14.Enabled       := False;
          DBEdit15.Enabled       := False;
          DBEdit16.Enabled       := False;
          DBEdit17.Enabled       := False;

 If
           MessageDlg ('Você tem certeza que deseja excluir?',
                       mtWarning,
                       [mbyes,mbno],
                       0)
          = mryes Then Begin
                         Modulo.cdsResidente.Delete;
                         Modulo.cdsResidente.ApplyUpdates(-1);
                         ShowMessage ('Registro Excluido com sucesso!');
                       End
                  Else Begin
                          ShowMessage ('Nenhum registro deletado!');
                       End;
                       end;


end;

procedure TIdoso.btnInserirClick(Sender: TObject);
Var NReg : integer;
begin

          btnInserir.Enabled    := False;
          btnDeletar.Enabled    := False;
          btnEditar.Enabled     := False;
          Direita.Enabled       := False;
          Esquerda.Enabled      := False;

          DBEdit2.Enabled        := True;
          DBEdit3.Enabled        := True;
          DBEdit4.Enabled        := True;
          DBEdit5.Enabled        := True;
          DBMemo1.Enabled        := True;
          DBEdit6.Enabled        := True;
          DBEdit7.Enabled        := True;
          DBEdit8.Enabled        := True;
          DBEdit9.Enabled        := True;
          DBEdit10.Enabled       := True;
          DBEdit11.Enabled       := True;
          DBEdit12.Enabled       := True;
          DBEdit13.Enabled       := True;
          //DBEdit14.Enabled       := False;
          DBEdit15.Enabled       := True;
          DBEdit16.Enabled       := True;
          DBEdit17.Enabled       := True;


          btnGravar.Enabled      := True;



          sqlAux.Close;


          sqlAux.SQL.Clear;
          sqlAux.SQL.Add('SELECT MAX(COD_IDOSO) AS ULTIMO FROM RESIDENTE');

          sqlAux.Open;
           If sqlAux.FieldByName('ULTIMO').Value = Null
           Then NReg :=1
           Else NReg := sqlAux.FieldByName('ULTIMO').Value + 1;

           Modulo.cdsResidente.Insert;


           Modulo.cdsResidenteCOD_IDOSO.Value := NReg;


           DBEdit2.SetFocus;
end;


procedure TIdoso.btnEditarClick(Sender: TObject);
begin
Modulo.cdsResidente.Edit;
          btnInserir.Enabled    := False;
          btnDeletar.Enabled    := False;

          btnEditar.Enabled     := False;
          Direita.Enabled       := False;
          Esquerda.Enabled      := False;

             DBEdit2.Enabled        := True;
          DBEdit3.Enabled        := True;
          DBEdit4.Enabled        := True;
          DBEdit5.Enabled        := True;
          DBMemo1.Enabled        := True;
          DBEdit6.Enabled        := True;
          DBEdit7.Enabled        := True;
          DBEdit8.Enabled        := True;
          DBEdit9.Enabled        := True;
          DBEdit10.Enabled       := True;
          DBEdit11.Enabled       := True;
          DBEdit12.Enabled       := True;
          DBEdit13.Enabled       := True;
          //DBEdit14.Enabled       := False;
          DBEdit15.Enabled       := True;
          DBEdit16.Enabled       := True;
          DBEdit17.Enabled       := True;
          
          btnGravar.Enabled      := True;

end;

procedure TIdoso.FormCreate(Sender: TObject);
begin
if DBEdit1.Text = ''
Then Begin
      btnEditar.Enabled := False;
      End
      Else Begin
      btnEditar.Enabled := True;;
      End;
end;

end.
