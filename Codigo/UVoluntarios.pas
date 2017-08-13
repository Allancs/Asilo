unit UVoluntarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, DB, StdCtrls, Mask, DBCtrls, FMTBcd, SqlExpr,
  jpeg, ExtCtrls;

type
  TVoluntarios = class(TForm)
    sqlAux: TSQLQuery;
    Image1: TImage;
    LadoEsquerdo: TPanel;
    Baixo: TPanel;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnInserir: TBitBtn;
    Esquerda: TBitBtn;
    Direita: TBitBtn;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Oquee: TButton;
    URL: TEdit;
    OQue: TMemo;
    Label7: TLabel;
    Label6: TLabel;
    procedure btnEditarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure DireitaClick(Sender: TObject);
    procedure EsquerdaClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OqueeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Voluntarios: TVoluntarios;

implementation

uses UModulo;

{$R *.dfm}

procedure TVoluntarios.btnEditarClick(Sender: TObject);
begin
Modulo.cdsVoluntario.Edit;
          btnInserir.Enabled    := False;
          btnDeletar.Enabled    := False;

          btnEditar.Enabled     := False;
          Direita.Enabled       := False;
          Esquerda.Enabled      := False;

          DBEdit2.Enabled       := True;
          DBEdit3.Enabled       := True;
          DBEdit4.Enabled       := True;
          DBEdit5.Enabled       := True;

          btnGravar.Enabled      := True;
          
end;

procedure TVoluntarios.btnInserirClick(Sender: TObject);
Var NReg : integer;
begin

          btnInserir.Enabled    := False;
          btnDeletar.Enabled    := False;

          btnEditar.Enabled     := False;
          Direita.Enabled       := False;
          Esquerda.Enabled      := False;

          DBEdit2.Enabled       := True;
          DBEdit3.Enabled       := True;
          DBEdit4.Enabled       := True;
          DBEdit5.Enabled       := True;


          btnGravar.Enabled      := True;



          sqlAux.Close;


          sqlAux.SQL.Clear;
          sqlAux.SQL.Add('SELECT MAX(COD_VOLUNTARIO) AS ULTIMO FROM VOLUNTARIO');

          sqlAux.Open;
           If sqlAux.FieldByName('ULTIMO').Value = Null
           Then NReg :=1
           Else NReg := sqlAux.FieldByName('ULTIMO').Value + 1;

           Modulo.cdsVoluntario.Insert;


           Modulo.cdsVoluntarioCOD_VOLUNTARIO.Value := NReg;


           DBEdit2.SetFocus;
end;

procedure TVoluntarios.btnDeletarClick(Sender: TObject);
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
          DBEdit4.Enabled       := False;
          DBEdit5.Enabled       := False;

 If
           MessageDlg ('Você tem certeza que deseja excluir?',
                       mtWarning,
                       [mbyes,mbno],
                       0)
          = mryes Then Begin
                         Modulo.cdsVoluntario.Delete;
                         Modulo.cdsVoluntario.ApplyUpdates(-1);
                         ShowMessage ('Registro Excluido com sucesso!');
                       End
                  Else Begin
                          ShowMessage ('Nenhum registro deletado!');
                       End;
                       end;
end;

procedure TVoluntarios.btnCancelarClick(Sender: TObject);
begin
Modulo.cdsVoluntario.Cancel;
          DBEdit2.Enabled       := False;
          DBEdit3.Enabled       := False;
          DBEdit4.Enabled       := False;
          DBEdit5.Enabled       := False;
          btnInserir.Enabled    := True;
          btnDeletar.Enabled    := True;
          btnEditar.Enabled     := True;
          Direita.Enabled       := True;
          Esquerda.Enabled      := True;

          // Ligar o Gravar
          btnGravar.Enabled      := False;

end;

procedure TVoluntarios.btnGravarClick(Sender: TObject);
begin
Modulo.cdsVoluntario.Post;

         Modulo.cdsVoluntario.ApplyUpdates(-1);

         btnCancelar.Click;
end;

procedure TVoluntarios.btnAtualizarClick(Sender: TObject);
begin
Modulo.cdsVoluntario.Refresh;
end;

procedure TVoluntarios.DireitaClick(Sender: TObject);
begin
Modulo.cdsVoluntario.Prior;
end;

procedure TVoluntarios.EsquerdaClick(Sender: TObject);
begin
Modulo.cdsVoluntario.Next;
end;

procedure TVoluntarios.SpeedButton3Click(Sender: TObject);
begin
Modulo.cdsVoluntario.Last;
end;

procedure TVoluntarios.SpeedButton4Click(Sender: TObject);
begin
Modulo.cdsVoluntario.First;
end;

procedure TVoluntarios.FormCreate(Sender: TObject);
begin
if DBEdit1.Text = ''
Then Begin
      btnEditar.Enabled := False;
      End
      Else Begin
      btnEditar.Enabled := True;;
      End;
end;

procedure TVoluntarios.OqueeClick(Sender: TObject);
begin
OQue.Visible := True;
URL.Text := 'http://www.voluntarios.com.br/oque_e_voluntariado.htm';
URL.Visible := True;
end;

end.
