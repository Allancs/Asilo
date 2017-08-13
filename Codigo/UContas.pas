unit UContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DBCtrls, Mask, FMTBcd, DB, SqlExpr,
  jpeg, ExtCtrls;

type
  TContas = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBMemo1: TDBMemo;
    sqlAux: TSQLQuery;
    Direita: TSpeedButton;
    Esquerda: TSpeedButton;
    btnEditar: TBitBtn;
    btnInserir: TBitBtn;
    btnDeletar: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    Image1: TImage;
    procedure btnEditarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure DireitaClick(Sender: TObject);
    procedure EsquerdaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Contas: TContas;

implementation

uses UModulo;

{$R *.dfm}

procedure TContas.btnEditarClick(Sender: TObject);
begin
Modulo.cdsConta.Edit;
          btnInserir.Enabled    := False;
          btnDeletar.Enabled    := False;

          btnEditar.Enabled     := False;
          Direita.Enabled       := False;
          Esquerda.Enabled      := False;

          DBEdit2.Enabled       := True;
          DBMemo1.Enabled       := True;
          DBEdit4.Enabled       := True;
          DBEdit5.Enabled       := True;

          btnGravar.Enabled      := True;

end;

procedure TContas.btnInserirClick(Sender: TObject);
Var NReg : integer;
begin

          btnInserir.Enabled    := False;
          btnDeletar.Enabled    := False;

          btnEditar.Enabled     := False;
          Direita.Enabled       := False;
          Esquerda.Enabled      := False;


          DBEdit2.Enabled       := True;
          DBEdit4.Enabled       := True;
          DBEdit5.Enabled       := True;
          DBMemo1.Enabled       := True;

          btnGravar.Enabled      := True;



          sqlAux.Close;


          sqlAux.SQL.Clear;
          sqlAux.SQL.Add('SELECT MAX(COD_CONTA) AS ULTIMO FROM CONTAS ');

          sqlAux.Open;
           If sqlAux.FieldByName('ULTIMO').Value = Null
           Then NReg :=1
           Else NReg := sqlAux.FieldByName('ULTIMO').Value + 1;

           Modulo.cdsConta.Insert;


           Modulo.cdsAvisoCOD_AVISO.Value := NReg;


           DBEdit2.SetFocus;
end;

procedure TContas.btnCancelarClick(Sender: TObject);
begin
Modulo.cdsConta.Cancel;
          DBEdit2.Enabled       := False;
          DBEdit4.Enabled       := False;
          DBEdit5.Enabled       := False;

          DBMemo1.Enabled       := False;


          btnInserir.Enabled    := True;
          btnDeletar.Enabled    := True;

          btnEditar.Enabled     := True;
          Direita.Enabled       := True;
          Esquerda.Enabled      := True;

          // Ligar o Gravar
          btnGravar.Enabled      := False;

end;

procedure TContas.btnGravarClick(Sender: TObject);
begin
Modulo.cdsConta.Post;

         Modulo.cdsConta.ApplyUpdates(-1);

         btnCancelar.Click;

end;

procedure TContas.DireitaClick(Sender: TObject);
begin
Modulo.cdsConta.Prior;
end;

procedure TContas.EsquerdaClick(Sender: TObject);
begin
Modulo.cdsConta.Next;
end;

procedure TContas.FormCreate(Sender: TObject);
begin
if DBEdit1.Text = ''
Then Begin
      btnEditar.Enabled := False;
      End
      Else Begin
      btnEditar.Enabled := True;;
      End;
end;

procedure TContas.btnDeletarClick(Sender: TObject);
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




end;
end;

end.
