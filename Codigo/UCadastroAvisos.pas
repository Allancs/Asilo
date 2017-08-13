unit UCadastroAvisos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dbcgrids, Buttons, StdCtrls, DBCtrls, Mask, FMTBcd, DB, SqlExpr,
  jpeg, ExtCtrls;

type
  TCadastroAvisos = class(TForm)
    sqlAux: TSQLQuery;
    Image1: TImage;
    Baixo: TPanel;
    Direita: TBitBtn;
    Esquerda: TBitBtn;
    btnInserir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    LadoEsquerdo: TPanel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure btnEditarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure DireitaClick(Sender: TObject);
    procedure EsquerdaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroAvisos: TCadastroAvisos;

implementation

uses UModulo;

{$R *.dfm}

procedure TCadastroAvisos.btnEditarClick(Sender: TObject);
begin
Modulo.cdsAviso.Edit;
          btnInserir.Enabled    := False;
          btnDeletar.Enabled    := False;

          btnEditar.Enabled     := False;
          Direita.Enabled       := False;
          Esquerda.Enabled      := False;

          DBEdit3.Enabled       := True;
          DBMemo1.Enabled       := True;

          btnGravar.Enabled      := True;
end;

procedure TCadastroAvisos.btnInserirClick(Sender: TObject);
Var NReg : integer;
begin

          btnInserir.Enabled    := False;
          btnDeletar.Enabled    := False;

          btnEditar.Enabled     := False;
          Direita.Enabled       := False;
          Esquerda.Enabled      := False;


          DBEdit3.Enabled       := True;
          DBMemo1.Enabled       := True;

          btnGravar.Enabled      := True;



          sqlAux.Close;


          sqlAux.SQL.Clear;
          sqlAux.SQL.Add('SELECT MAX(COD_AVISO) AS ULTIMO FROM AVISOS ');

          sqlAux.Open;
           If sqlAux.FieldByName('ULTIMO').Value = Null
           Then NReg :=1
           Else NReg := sqlAux.FieldByName('ULTIMO').Value + 1;

           Modulo.cdsAviso.Insert;


           Modulo.cdsAvisoCOD_AVISO.Value := NReg;


           DBEdit3.SetFocus;
end;

procedure TCadastroAvisos.btnDeletarClick(Sender: TObject);
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
          DBEdit3.Enabled       := False;
          DBMemo1.Enabled       := False;


 If
           MessageDlg ('Você tem certeza que deseja excluir?',
                       mtWarning,
                       [mbyes,mbno],
                       0)
          = mryes Then Begin
                         Modulo.cdsAviso.Delete;
                         Modulo.cdsAviso.ApplyUpdates(-1);
                         ShowMessage ('Registro Excluido com sucesso!');
                       End
                  Else Begin
                          ShowMessage ('Nenhum registro deletado!');
                       End;
                       end;

end;

procedure TCadastroAvisos.btnCancelarClick(Sender: TObject);
begin
Modulo.cdsAviso.Cancel;
          DBEdit3.Enabled       := False;
          DBMemo1.Enabled       := False;


          btnInserir.Enabled    := True;
          btnDeletar.Enabled    := True;

          btnEditar.Enabled     := True;
          Direita.Enabled       := True;
          Esquerda.Enabled      := True;

          // Ligar o Gravar
          btnGravar.Enabled      := False;
end;

procedure TCadastroAvisos.btnGravarClick(Sender: TObject);
begin
Modulo.cdsAviso.Post;

         Modulo.cdsAviso.ApplyUpdates(-1);

         btnCancelar.Click;
end;

procedure TCadastroAvisos.DireitaClick(Sender: TObject);
begin
Modulo.cdsAviso.Prior;
end;

procedure TCadastroAvisos.EsquerdaClick(Sender: TObject);
begin
Modulo.cdsAviso.Next;
end;

procedure TCadastroAvisos.FormCreate(Sender: TObject);
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
