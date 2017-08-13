unit UTarefa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls,
  Buttons,
  jpeg, ExtCtrls,
  FMTBcd, DB, SqlExpr;

type
  TTarefa = class(TForm)
    Image1: TImage;
    sqlAux: TSQLQuery;
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
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBMemo;
    procedure btnInserirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure EsquerdaClick(Sender: TObject);
    procedure DireitaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Tarefa: TTarefa;

implementation

uses UModulo;

{$R *.dfm}

procedure TTarefa.btnInserirClick(Sender: TObject);
Var NReg : integer;
begin
          btnInserir.Enabled    := False;
          btnDeletar.Enabled    := False;
          btnEditar.Enabled     := False;
          Direita.Enabled       := False;
          Esquerda.Enabled      := False;
          DBEdit2.Enabled       := True;
          DBEdit3.Enabled       := True;
          btnGravar.Enabled      := True;
          sqlAux.Close;
          sqlAux.SQL.Clear;
          sqlAux.SQL.Add('SELECT MAX(COD_TAREFA) AS ULTIMO FROM TAREFA ');

          sqlAux.Open;
           If sqlAux.FieldByName('ULTIMO').Value = Null
           Then NReg :=1
           Else NReg := sqlAux.FieldByName('ULTIMO').Value + 1;
           Modulo.cdsTarefa.Insert;
           Modulo.cdsTarefaCOD_TAREFA.Value := NReg;
           DBEdit2.SetFocus;

end;

procedure TTarefa.btnGravarClick(Sender: TObject);
begin
Modulo.cdsTarefa.Post;

         Modulo.cdsTarefa.ApplyUpdates(-1);

         btnCancelar.Click;
end;

procedure TTarefa.btnCancelarClick(Sender: TObject);
begin
Modulo.cdsTarefa.Cancel;
          DBEdit2.Enabled       := False;
          DBEdit3.Enabled       := False;
          btnInserir.Enabled    := True;
          btnDeletar.Enabled    := True;
          btnEditar.Enabled     := True;
          Direita.Enabled       := True;
          Esquerda.Enabled      := True;
          btnGravar.Enabled      := False;
end;

procedure TTarefa.btnDeletarClick(Sender: TObject);
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
          DBEdit2.Enabled       := False;
          DBEdit3.Enabled       := False;


 If
           MessageDlg ('Você tem certeza que deseja excluir?',
                       mtWarning,
                       [mbyes,mbno],
                       0)
          = mryes Then Begin
                         Modulo.cdsTarefa.Delete;
                         Modulo.cdsTarefa.ApplyUpdates(-1);
                         ShowMessage ('Registro Excluido com sucesso!');
                       End
                  Else Begin
                          ShowMessage ('Nenhum registro deletado!');
                       End;
                       end;
end;

procedure TTarefa.btnEditarClick(Sender: TObject);
begin
Modulo.cdsTarefa.Edit;
          btnInserir.Enabled    := False;
          btnDeletar.Enabled    := False;

          btnEditar.Enabled     := False;
          Direita.Enabled       := False;
          Esquerda.Enabled      := False;

          DBEdit2.Enabled       := True;
          DBEdit3.Enabled       := True;


          btnGravar.Enabled      := True;
end;

procedure TTarefa.EsquerdaClick(Sender: TObject);
begin
Modulo.cdsTarefa.Prior;
end;

procedure TTarefa.DireitaClick(Sender: TObject);
begin
Modulo.cdsTarefa.Next;
end;

end.
