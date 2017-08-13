unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellApi, StdCtrls, jpeg, ExtCtrls, Buttons, IniFiles;

type
  TLogin = class(TForm)
    Image3: TImage;
    Image2: TImage;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    BitBtn1: TBitBtn;
    procedure Image1Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure mrCancelClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  Tentativas : Smallint;
  public
    { Public declarations }

  end;

var
  Login: TLogin;
  User, Nome : string;

implementation

uses UModulo, UPrincipal;

{$R *.dfm}

procedure TLogin.Image1Click(Sender: TObject);
begin
ShellExecute(Handle, 'open', 'https://www.instagram.com/allan_colombo/', '', '', 1);
end;

procedure TLogin.Image6Click(Sender: TObject);
begin
ShellExecute(Handle, 'open', 'https://gmail.com', '', '', 1);
end;

procedure TLogin.Image7Click(Sender: TObject);
begin
ShellExecute(Handle, 'open', 'https://facebook.com/allancolombo.3', '', '', 1);
end;

procedure TLogin.Image2Click(Sender: TObject);
begin
          If (edtUsuario.Text = '')
             Then Begin
                    Messagedlg('"Usuário" Inválido!', mtInformation, [mbOk], 0);
                    edtUsuario.SetFocus;
                    Exit;
                  End;
          If (edtSenha.Text = '')
             Then Begin
                    Messagedlg('"Senha" Inválida!', mtInformation, [mbOk], 0);
                    edtSenha.SetFocus;
                    Exit;
                  End;
         Modulo.sqlDSLogin.Close;
         Modulo.sqlDSLogin.CommandText := 'SELECT * FROM USUARIOS'
         + ' WHERE USU_Login = ' + QuotedStr(Trim(edtUsuario.Text))
         + ' AND USU_Senha = ' + QuotedStr(Trim(edtSenha.Text));
         Modulo.sqlDSLogin.Open;
         If Modulo.sqlDSLogin.Fields[0].AsInteger > 0
            Then ModalResult := mrOk
            Else Begin
                   Inc(Tentativas);
                   If Tentativas < 3
                      Then Begin
                             MessageDlg(Format('Tentativa %d de 3', [Tentativas]),
                                                 mtError, [mbOk], 0);
                             if edtUsuario.CanFocus then edtUsuario.SetFocus;
                           End
                      Else Begin
                             MessageDlg(Format('%dª tentativa de acesso',[Tentativas]) + #13 +
                                                'A aplicação será fechada!', mtError, [mbOk], 0);
                             ModalResult := mrCancel;
                           End;
                 End;

           Modulo.sqlDSLogin.RecNo; // Estaciona no Registro corrente
           Principal.UNome.Caption  := 'Usuário , ' + Modulo.sqlDSLogin.Fields[1].AsString;
           Principal.Tipo.Caption := 'Permissão : '+Modulo.sqlDSLogin.Fields[2].AsString;
           User := Modulo.sqlDSLogin.Fields[2].AsString;
           Principal.Caption := 'ASILO RECANTO DAS FLORES - Usuário : '+Modulo.sqlDSLogin.Fields[1].AsString;

end;

procedure TLogin.mrCancelClick(Sender: TObject);
begin
Application.Terminate;
end;

procedure TLogin.btnCancelarClick(Sender: TObject);
begin
Application.Terminate;
end;

end.
