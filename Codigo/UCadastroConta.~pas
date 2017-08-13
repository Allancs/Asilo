unit UCadastroConta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Mask, DBCtrls, jpeg, ExtCtrls, FMTBcd, DB,
  SqlExpr;

type
  TCadastroContas = class(TForm)
    Image1: TImage;
    btnEditar: TBitBtn;
    btnInserir: TBitBtn;
    Direita: TSpeedButton;
    Esquerda: TSpeedButton;
    btnGravar: TBitBtn;
    btnDeletar: TBitBtn;
    btnCancelar: TBitBtn;
    sqlAux: TSQLQuery;
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
    Admin: TRadioButton;
    Padrao: TRadioButton;
    User: TRadioButton;
    Veryfi: TTimer;
    Tipo: TLabel;
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure DireitaClick(Sender: TObject);
    procedure EsquerdaClick(Sender: TObject);
    procedure VeryfiTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroContas: TCadastroContas;

implementation

uses UModulo;

{$R *.dfm}

procedure TCadastroContas.btnInserirClick(Sender: TObject);
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
          btnCancelar.Enabled    := True;

          sqlAux.Close;


          sqlAux.SQL.Clear;
          sqlAux.SQL.Add('SELECT MAX(ID) AS ULTIMO FROM USUARIOS ');

          sqlAux.Open;
           If sqlAux.FieldByName('ULTIMO').Value = Null
           Then NReg :=1
           Else NReg := sqlAux.FieldByName('ULTIMO').Value + 1;

           Modulo.cdsUser.Insert;
           Modulo.cdsUserID.Value := NReg;

           DBEdit2.SetFocus;
end;
procedure TCadastroContas.btnEditarClick(Sender: TObject);
begin
Modulo.cdsUser.Edit;
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

procedure TCadastroContas.btnCancelarClick(Sender: TObject);
begin
Modulo.cdsUser.Cancel;
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

procedure TCadastroContas.btnDeletarClick(Sender: TObject);
begin
          DBEdit2.Enabled       := False;
          DBEdit3.Enabled      := False;
          DBEdit4.Enabled       := False;
          DBEdit5.Enabled      := False;


 If
           MessageDlg ('Você tem certeza que deseja excluir?',
                       mtWarning,
                       [mbyes,mbno],
                       0)
          = mryes Then Begin
                         Modulo.cdsUser.Delete;
                         Modulo.cdsUser.ApplyUpdates(-1);
                         ShowMessage ('Registro Excluido com sucesso!');
                       End
                  Else Begin
                          ShowMessage ('Nenhum registro deletado!');
                       End;
end;

procedure TCadastroContas.btnGravarClick(Sender: TObject);
begin
  if (DBEdit2.Text = '')
     then
     begin
          Messagedlg('O campo nome não pode ser vazio', mtInformation, [mbOk], 0);
      end
      Else if (Admin.Checked = False) and (Padrao.Checked = False) and (User.Checked = False)
       then
       Begin
        Messagedlg('O campo tipo de conta não pode ser vazio', mtInformation, [mbOk], 0);
      End
      else if (DBEdit4.Text = '')
      then
      begin
      Messagedlg('O campo login não pode ser vazio', mtInformation, [mbOk], 0);
      end
      else if (DBEdit5.Text = '')
      then
      begin
  Messagedlg('O campo senha não pode ser vazio', mtInformation, [mbOk], 0);
      end;


Modulo.cdsUser.Post;

         Modulo.cdsUser.ApplyUpdates(-1);

         btnCancelar.Click;
        
end;

procedure TCadastroContas.DireitaClick(Sender: TObject);
begin
Modulo.cdsUser.Prior;
end;

procedure TCadastroContas.EsquerdaClick(Sender: TObject);
begin
Modulo.cdsUser.Next;
end;

procedure TCadastroContas.VeryfiTimer(Sender: TObject);

begin
    if Admin.Checked = True
     then
     begin
          DBEdit3.Text := 'admin';
      end
      Else if Padrao.Checked = True
       then
       Begin
        DBEdit3.Text := 'padrao';
      End
      else if User.Checked = True
      then
      begin
      DBEdit3.Text := 'user';
      end;
      Tipo.Caption := 'Tipo de Conta, '+DBEdit3.Text;
end;

end.
