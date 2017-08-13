unit USaude;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls,
  jpeg, ExtCtrls,
  FMTBcd, DB, DBClient, SimpleDS, SqlExpr, Buttons;

type
  TSaudes = class(TForm)
    Image1: TImage;
    Baixo: TPanel;
    LadoEsquerdo: TPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit8: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Idoso: TGroupBox;
    Label9: TLabel;
    edtPesquisa: TEdit;
    Name: TDBEdit;
    BitBtn1: TBitBtn;
    Cod: TDBEdit;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    sqlAux: TSQLQuery;
    sdsAux: TSimpleDataSet;
    dsAux: TDataSource;
    btnCancelar: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    btnGravar: TBitBtn;
    btnInserir: TBitBtn;
    Esquerda: TBitBtn;
    Direita: TBitBtn;
    procedure edtPesquisaChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure EsquerdaClick(Sender: TObject);
    procedure DireitaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Saudes: TSaudes;

implementation

uses UModulo;

{$R *.dfm}

procedure TSaudes.edtPesquisaChange(Sender: TObject);
var Texto, TSQL, Parametro : String;
 begin
      sdsAux.Close;

      TSQL := 'select COD_IDOSO ,NOME from RESIDENTE ';
      If edtPesquisa.Text = ''
      Then Begin
      Texto := TSQL;
      sdsAux.DataSet.CommandText := Texto;
      End
      Else Begin
      Texto := TSQL + ' WHERE NOME LIKE :PROCURE ' ;
      sdsAux.DataSet.CommandText := Texto;
      Parametro := edtPesquisa.Text + '%';
      sdsAux.DataSet.Params.ParamByName('PROCURE').AsString := Parametro;

      End;
      sdsAux.Open;
      //DBEdit2.Text := Cod.Text;
      //DBEdit3.Text := Name.Text;
      exit;

end;

procedure TSaudes.BitBtn1Click(Sender: TObject);
begin
DBEdit2.Text := Cod.Text;
DBEdit4.Text := Name.Text;
end;

procedure TSaudes.btnInserirClick(Sender: TObject);
Var NReg : integer;
begin

          btnInserir.Enabled    := False;
          btnDeletar.Enabled    := False;
          Idoso.Enabled := True;

          btnEditar.Enabled     := False;
          Direita.Enabled       := False;
          Esquerda.Enabled      := False;

          DBEdit4.Enabled       := True;
          Idoso.Enabled       := True;
          DBEdit3.Enabled       := True;
          DBMemo1.Enabled       := True;
          DBMemo2.Enabled       := True;
          btnGravar.Enabled      := True;
          DBEdit8.Enabled       := True;
          sqlAux.Close;
          sqlAux.SQL.Clear;
          sqlAux.SQL.Add('SELECT MAX(COD_SAUDE) AS ULTIMO FROM SAUDE');

          sqlAux.Open;
           If sqlAux.FieldByName('ULTIMO').Value = Null
           Then NReg :=1
           Else NReg := sqlAux.FieldByName('ULTIMO').Value + 1;
           Modulo.cdsSaude.Insert;
           Modulo.cdsSaudeCOD_SAUDE.Value := NReg;
           DBEdit4.SetFocus;

end;

procedure TSaudes.btnGravarClick(Sender: TObject);
begin
Modulo.cdsSaude.Post;

         Modulo.cdsSaude.ApplyUpdates(-1);

         btnCancelar.Click;
end;

procedure TSaudes.btnCancelarClick(Sender: TObject);
begin
Modulo.cdsSaude.Cancel;
          DBEdit4.Enabled       := False;
          Idoso.Enabled       := False;
          DBEdit3.Enabled       := False;
          DBMemo1.Enabled       := False;
          DBMemo2.Enabled       := False;
          btnGravar.Enabled      := False;
          DBEdit8.Enabled       := False;
          btnInserir.Enabled    := True;
          btnDeletar.Enabled    := True;
          btnEditar.Enabled     := True;
          Direita.Enabled       := True;
          Esquerda.Enabled      := True;

          // Ligar o Gravar
          btnGravar.Enabled      := False;
end;

procedure TSaudes.btnEditarClick(Sender: TObject);
begin
Modulo.cdsSaude.Edit;
          btnInserir.Enabled    := False;
          btnDeletar.Enabled    := False;

          btnEditar.Enabled     := False;
          Direita.Enabled       := False;
          Esquerda.Enabled      := False;

          DBEdit4.Enabled       := True;
          Idoso.Enabled       := True;
          DBEdit3.Enabled       := True;
          DBMemo1.Enabled       := True;
          DBMemo2.Enabled       := True;
          btnGravar.Enabled      := True;
          DBEdit8.Enabled       := True;
          btnGravar.Enabled      := True;
end;

procedure TSaudes.btnDeletarClick(Sender: TObject);
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



          DBEdit4.Enabled       := False;
          Idoso.Enabled       := False;
          DBEdit3.Enabled       := False;
          DBMemo1.Enabled       := False;
          DBMemo2.Enabled       := False;
          btnGravar.Enabled      := False;
          DBEdit8.Enabled       := False;


 If
           MessageDlg ('Você tem certeza que deseja excluir?',
                       mtWarning,
                       [mbyes,mbno],
                       0)
          = mryes Then Begin
                         Modulo.cdsSaude.Delete;
                         Modulo.cdsSaude.ApplyUpdates(-1);
                         ShowMessage ('Registro Excluido com sucesso!');
                       End
                  Else Begin
                          ShowMessage ('Nenhum registro deletado!');
                       End;
         end;
end;

procedure TSaudes.EsquerdaClick(Sender: TObject);
begin
Modulo.cdsSaude.Prior;
end;

procedure TSaudes.DireitaClick(Sender: TObject);
begin
Modulo.cdsSaude.Next;
end;

end.
