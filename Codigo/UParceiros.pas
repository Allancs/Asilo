unit UParceiros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls,
  jpeg, ExtCtrls,
  Buttons,
  FMTBcd, DB, SqlExpr;

type
  TParceiros = class(TForm)
    Image1: TImage;
    LadoEsquerdo: TPanel;
    DBEdit5: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Baixo: TPanel;
    btnCancelar: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    btnGravar: TBitBtn;
    btnInserir: TBitBtn;
    Esquerda: TBitBtn;
    Direita: TBitBtn;
    sqlAux: TSQLQuery;
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure EsquerdaClick(Sender: TObject);
    procedure DireitaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Parceiros: TParceiros;

implementation

uses UModulo,
  UIdoso;

{$R *.dfm}

procedure TParceiros.btnEditarClick(Sender: TObject);
begin
Modulo.cdsParceiro.Edit;
          btnInserir.Enabled    := False;
          btnDeletar.Enabled    := False;

          btnEditar.Enabled     := False;
          Direita.Enabled       := False;
          Esquerda.Enabled      := False;

          DBEdit2.Enabled       := True;
          DBEdit3.Enabled       := True;
          DBEdit4.Enabled       := True;
          DBEdit5.Enabled       := True;
          DBEdit6.Enabled       := True;


          btnGravar.Enabled      := True;

          btnGravar.Enabled      := True;

end;

procedure TParceiros.btnCancelarClick(Sender: TObject);
begin
Modulo.cdsParceiro.Cancel;
          
          DBEdit2.Enabled       := false;
          DBEdit3.Enabled       := false;
          DBEdit4.Enabled       := false;
          DBEdit5.Enabled       := false;
          DBEdit6.Enabled       := false;

          btnGravar.Enabled      := False;
          btnInserir.Enabled    := True;
          btnDeletar.Enabled    := True;
          btnEditar.Enabled     := True;
          Direita.Enabled       := True;
          Esquerda.Enabled      := True;

          // Ligar o Gravar
          btnGravar.Enabled      := False;
end;

procedure TParceiros.btnDeletarClick(Sender: TObject);
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
  DBEdit2.Enabled       := false;
          DBEdit3.Enabled       := false;
          DBEdit4.Enabled       := false;
          DBEdit5.Enabled       := false;
          DBEdit6.Enabled       := false;

 If
           MessageDlg ('Você tem certeza que deseja excluir?',
                       mtWarning,
                       [mbyes,mbno],
                       0)
          = mryes Then Begin
                         Modulo.cdsParceiro.Delete;
                         Modulo.cdsParceiro.ApplyUpdates(-1);
                         ShowMessage ('Registro Excluido com sucesso!');
                       End
                  Else Begin
                          ShowMessage ('Nenhum registro deletado!');
                       End;
         end;
end;

procedure TParceiros.btnGravarClick(Sender: TObject);
begin
Modulo.cdsParceiro.Post;

         Modulo.cdsParceiro.ApplyUpdates(-1);

         btnCancelar.Click;
end;

procedure TParceiros.btnInserirClick(Sender: TObject);
Var NReg : integer;
begin

          btnInserir.Enabled    := False;
          btnDeletar.Enabled    := False;
          Idoso.Enabled := True;

          btnEditar.Enabled     := False;
          Direita.Enabled       := False;
          Esquerda.Enabled      := False;

          DBEdit2.Enabled       := True;
          DBEdit3.Enabled       := True;
          DBEdit4.Enabled       := True;
          DBEdit5.Enabled       := True;
          DBEdit6.Enabled       := True;

          btnGravar.Enabled      := True;
          sqlAux.Close;
          sqlAux.SQL.Clear;
          sqlAux.SQL.Add('SELECT MAX(COD_PARCEIRO) AS ULTIMO FROM PARCEIRO');

          sqlAux.Open;
           If sqlAux.FieldByName('ULTIMO').Value = Null
           Then NReg :=1
           Else NReg := sqlAux.FieldByName('ULTIMO').Value + 1;
           Modulo.cdsParceiro.Insert;
           Modulo.cdsParceiroCOD_PARCEIRO.Value := NReg;
           DBEdit2.SetFocus;

end;

procedure TParceiros.EsquerdaClick(Sender: TObject);
begin
Modulo.cdsParceiro.Prior;
end;

procedure TParceiros.DireitaClick(Sender: TObject);
begin
Modulo.cdsParceiro.Next;
end;

end.
