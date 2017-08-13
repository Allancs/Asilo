unit UIncidentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask,
  jpeg, ExtCtrls,
  FMTBcd, DB, DBClient, SimpleDS, SqlExpr, Buttons;

type
  TIncidentes = class(TForm)
    Image1: TImage;
    Baixo: TPanel;
    LadoEsquerdo: TPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit6: TDBEdit;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Idoso: TGroupBox;
    Label7: TLabel;
    edtPesquisa: TEdit;
    Name: TDBEdit;
    BitBtn1: TBitBtn;
    Cod: TDBEdit;
    Image2: TImage;
    sqlAux: TSQLQuery;
    sdsAux: TSimpleDataSet;
    dsAux: TDataSource;
    Direita: TBitBtn;
    Esquerda: TBitBtn;
    btnInserir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    procedure edtPesquisaChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
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
  Incidentes: TIncidentes;

implementation

uses UModulo;

{$R *.dfm}

procedure TIncidentes.edtPesquisaChange(Sender: TObject);
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

procedure TIncidentes.BitBtn1Click(Sender: TObject);
begin
DBEdit2.Text := Cod.Text;
DBEdit3.Text := Name.Text;

end;

procedure TIncidentes.btnEditarClick(Sender: TObject);
begin
Modulo.cdsInc.Edit;
          btnInserir.Enabled    := False;
          btnDeletar.Enabled    := False;

          btnEditar.Enabled     := False;
          Direita.Enabled       := False;
          Esquerda.Enabled      := False;

          DBEdit3.Enabled       := True;
          DBEdit6.Enabled       := True;
          DBMemo1.Enabled       := True;
          DBMemo2.Enabled       := True;
          Idoso.Enabled       := True;

          btnGravar.Enabled      := True;
end;

procedure TIncidentes.btnDeletarClick(Sender: TObject);
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
          DBEdit6.Enabled       := False;
          DBMemo1.Enabled       := False;
          DBMemo2.Enabled       := False;
          Idoso.Enabled       := False;


 If
           MessageDlg ('Você tem certeza que deseja excluir?',
                       mtWarning,
                       [mbyes,mbno],
                       0)
          = mryes Then Begin
                         Modulo.cdsInc.Delete;
                         Modulo.cdsInc.ApplyUpdates(-1);
                         ShowMessage ('Registro Excluido com sucesso!');
                       End
                  Else Begin
                          ShowMessage ('Nenhum registro deletado!');
                       End;
                       end;
end;

procedure TIncidentes.btnCancelarClick(Sender: TObject);
begin
Modulo.cdsInc.Cancel;
        DBEdit3.Enabled       := False;
          DBEdit6.Enabled       := False;
          DBMemo1.Enabled       := False;
          DBMemo2.Enabled       := False;
          Idoso.Enabled       := False;

          btnInserir.Enabled    := True;
          btnDeletar.Enabled    := True;
          btnEditar.Enabled     := True;
          Direita.Enabled       := True;
          Esquerda.Enabled      := True;

          // Ligar o Gravar
          btnGravar.Enabled      := False;
end;

procedure TIncidentes.btnGravarClick(Sender: TObject);
begin
Modulo.cdsInc.Post;

         Modulo.cdsInc.ApplyUpdates(-1);

         btnCancelar.Click;
end;

procedure TIncidentes.btnInserirClick(Sender: TObject);
Var NReg : integer;
begin

          btnInserir.Enabled    := False;
          btnDeletar.Enabled    := False;
          Idoso.Enabled := True;

          btnEditar.Enabled     := False;
          Direita.Enabled       := False;
          Esquerda.Enabled      := False;

     DBEdit3.Enabled       := True;
          DBEdit6.Enabled       := True;
          DBMemo1.Enabled       := True;
          DBMemo2.Enabled       := True;
          Idoso.Enabled       := True;
          sqlAux.Close;
          sqlAux.SQL.Clear;
          sqlAux.SQL.Add('SELECT MAX(COD_INCIDENTE) AS ULTIMO FROM INCIDENTES');

          sqlAux.Open;
           If sqlAux.FieldByName('ULTIMO').Value = Null
           Then NReg :=1
           Else NReg := sqlAux.FieldByName('ULTIMO').Value + 1;
           Modulo.cdsInc.Insert;
           Modulo.cdsIncCOD_INCIDENTE.Value := NReg;


           DBEdit3.SetFocus;

end;

procedure TIncidentes.EsquerdaClick(Sender: TObject);
begin
Modulo.cdsInc.Prior;
end;

procedure TIncidentes.DireitaClick(Sender: TObject);
begin
Modulo.cdsInc.Next;
end;

end.
