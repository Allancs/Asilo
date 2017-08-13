unit USMTP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, Mask, DBCtrls, FMTBcd, SqlExpr,
  jpeg, ExtCtrls;

type
  TSMTPs = class(TForm)
    DataSource1: TDataSource;
    sqlAux: TSQLQuery;
    LadoEsquerdo: TPanel;
    Baixo: TPanel;
    Image1: TImage;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    DBEdit5: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    btnEditar: TBitBtn;
    btnInserir: TBitBtn;
    btnGravar: TBitBtn;
    btnDeletar: TBitBtn;
    btnCancelar: TBitBtn;
    Direita: TBitBtn;
    Esquerda: TBitBtn;
    Oque: TMemo;
    Oquee: TButton;
    Emails: TButton;
    OQue2: TMemo;
    URL: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    OBS: TButton;
    OQue3: TMemo;
    procedure btnEditarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure EsquerdaClick(Sender: TObject);
    procedure DireitaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OqueeClick(Sender: TObject);
    procedure EmailsClick(Sender: TObject);
    procedure OBSClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SMTPs: TSMTPs;

implementation

uses UModulo;

{$R *.dfm}

procedure TSMTPs.btnEditarClick(Sender: TObject);
begin
Modulo.cdsEmail.Edit;
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

procedure TSMTPs.btnInserirClick(Sender: TObject);
Var NReg : integer;
begin

          btnInserir.Enabled    := False;
          btnDeletar.Enabled    := False;
          btnEditar.Enabled     := False;
          Direita.Enabled       := False;
          Esquerda.Enabled      := False;

        //  DBEdit2.Enabled       := True;
        //  DBEdit3.Enabled       := True;
          DBEdit4.Enabled       := True;
          DBEdit5.Enabled       := True;


          btnGravar.Enabled      := True;

          sqlAux.Close;


          sqlAux.SQL.Clear;
          sqlAux.SQL.Add('SELECT MAX(ID) AS ULTIMO FROM EMAIL');

          sqlAux.Open;
           If sqlAux.FieldByName('ULTIMO').Value = Null
           Then NReg :=1
           Else NReg := sqlAux.FieldByName('ULTIMO').Value + 1;
           Modulo.cdsEmail.Insert;

           Modulo.cdsEmailSMTP.Text := 'smtp.gmail.com';
           Modulo.cdsEmailPORT.Text := IntToStr(465);
           Modulo.cdsEmailID.Value := NReg;


           DBEdit4.SetFocus;
end;

procedure TSMTPs.btnDeletarClick(Sender: TObject);
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
                         Modulo.cdsEmail.Delete;
                         Modulo.cdsEmail.ApplyUpdates(-1);
                         ShowMessage ('Registro Excluido com sucesso!');
                       End
                  Else Begin
                          ShowMessage ('Nenhum registro deletado!');
                       End;

end;

procedure TSMTPs.btnCancelarClick(Sender: TObject);
begin
Modulo.cdsEmail.Cancel;
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

procedure TSMTPs.btnGravarClick(Sender: TObject);
begin
IF (DBEdit4.Text = '')
then begin
 MessageDlg('Campo usuário não pode ser vasio'
                    , mtWarning, [mbOK], 0);
end
else if (DBEdit5.Text = '')
then begin
MessageDlg('Campo senha não pode ser vasio'
                    , mtWarning, [mbOK], 0);

end
else
begin
Modulo.cdsEmail.Post;

         Modulo.cdsEmail.ApplyUpdates(-1);
         SMTPs.Caption := 'Servidor Smtp cadastrado com Sucesso!';
         btnCancelar.Click;
         end;
end;

procedure TSMTPs.EsquerdaClick(Sender: TObject);
begin
Modulo.cdsEmail.Prior;
end;

procedure TSMTPs.DireitaClick(Sender: TObject);
begin
Modulo.cdsEmail.Next;
end;

procedure TSMTPs.FormCreate(Sender: TObject);
begin
SMTPs.Caption := 'Cadastro de servidor Smtp';
end;

procedure TSMTPs.OqueeClick(Sender: TObject);
begin
Oque.Visible := True;
Oque2.Visible := False;
Oque3.Visible := False;
Url.Text := 'https://pt.wikipedia.org/wiki/Simple_Mail_Transfer_Protocol';
Url.Visible := True;
end;

procedure TSMTPs.EmailsClick(Sender: TObject);
begin
Oque.Visible := False;
Oque2.Visible := True;
Oque3.Visible := False;
Url.Text := 'https://support.google.com/a/answer/176600?hl=pt-BR';
Url.Visible := True;
end;

procedure TSMTPs.OBSClick(Sender: TObject);
begin
Oque.Visible := False;
Oque2.Visible := False;
Oque3.Visible := True;
URL.Text := 'https://myaccount.google.com/lesssecureapps?rfn=27&rfnc=1&eid=2950840310119996301&et=0&asae=2&pli=1';
URL.Visible := true;
end;

end.
