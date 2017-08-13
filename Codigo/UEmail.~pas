unit UEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, DB, StdCtrls, Menus, IdMessage, IdIOHandler,
  IdIOHandlerSocket, IdSSLOpenSSL, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP, Buttons, FMTBcd,
  DBClient, SimpleDS, SqlExpr, Grids, DBGrids,
  jpeg, ExtCtrls;

type
  TEmails = class(TForm)
    DataSource1: TDataSource;
    IdSMTP1: TIdSMTP;
    IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket;
    IdMessage1: TIdMessage;
    OpenDialog1: TOpenDialog;
    PopupMenu1: TPopupMenu;
    mnuDeletarAnexoSelecionado: TMenuItem;
    DeletarTodososAnexos1: TMenuItem;
    sqlAux: TSQLQuery;
    sdsAux: TSimpleDataSet;
    dsAux: TDataSource;
    Baixo: TPanel;
    SMTP: TDBEdit;
    Label11: TLabel;
    Porta: TDBEdit;
    Label12: TLabel;
    Usuario: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    Senha: TDBEdit;
    Ocutar: TBitBtn;
    Mostrar: TBitBtn;
    Image1: TImage;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    LadoEsquerdo: TPanel;
    Menssagem: TMemo;
    Para: TEdit;
    Nome: TEdit;
    Assunto: TEdit;
    De: TEdit;
    Label9: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    BitBtn2: TBitBtn;
    getEmail: TDBEdit;
    Label10: TLabel;
    edtPesquisa: TEdit;
    Label3: TLabel;
    Parceiros: TRadioButton;
    Voluntarios: TRadioButton;
    EmailReal: TLabel;
    Timer1: TTimer;
    BitBtn1: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn5: TBitBtn;
    Tempo: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure DBCellClick(Column: TColumn);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure OcutarClick(Sender: TObject);
    procedure MostrarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Emails: TEmails;

implementation

uses UModulo;

{$R *.dfm}

procedure TEmails.FormCreate(Sender: TObject);
begin
Menssagem.Clear;
De.Text:=Usuario.Text;
end;

procedure TEmails.edtPesquisaChange(Sender: TObject);
var Texto, TSQL, Parametro : String;
begin
 if Parceiros.Checked = true
     then
     begin
       sdsAux.Close;
      TSQL := 'select EMAIL from PARCEIRO ';
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
      exit;
      end
      else
          if Voluntarios.Checked = true
          then
          begin

          sdsAux.Close;

    TSQL := 'select EMAIL from VOLUNTARIO ';
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
    exit;
          end;

    end;
procedure TEmails.DBCellClick(Column: TColumn);
begin
Label3.Caption:=Column.Field.AsString;
Para.Text:=Column.Field.AsString;
end;

procedure TEmails.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);


begin
if (Sender as TForm).ActiveControl is TDBGrid then
if key in [vk_DOWN,vk_Up,vk_LEFT,vk_RIGHT] then begin
end;
end;
procedure TEmails.BitBtn1Click(Sender: TObject);
var
Texto : String;
begin
    If Para.Text = '' then
    Para.Text := getEmail.Text
    else
    begin
    Texto:= Para.Text;
    Para.Text:=Texto + ' , '+ getEmail.Text;
    exit;
    end;






//Texto:= Para.Text;
//Para.Text:=Texto +' , '+ getEmail.Text;
end;

procedure TEmails.BitBtn2Click(Sender: TObject);

var
   grava : string;
  // objetos necessários para o funcionamento
  IdSSLIOHandlerSocket: TIdSSLIOHandlerSocket;
  IdSMTP: TIdSMTP;
  IdMessage: TIdMessage;
  //CaminhoAnexo: string;
//  i : Integer;
begin

  // instanciação dos objetos
  IdSSLIOHandlerSocket := TIdSSLIOHandlerSocket.Create(Self);
  IdSMTP := TIdSMTP.Create(Self);
  IdMessage := TIdMessage.Create(Self);

  try
    // Configuração do SSL
    IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
    IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;

    // Configuração do SMTP
    IdSMTP.IOHandler := IdSSLIOHandlerSocket;
    IdSMTP.AuthenticationType := atLogin;
    IdSMTP.Port := StrToInt(Porta.Text);

    IdSMTP.Host := SMTP.Text;
    IdSMTP.Username := Usuario.Text;
    IdSMTP.Password := Senha.Text;


    // Tentativa de conexão e autenticação
    try
      IdSMTP.Connect;
      IdSMTP.Authenticate;
    except
      on E:Exception do
      begin
        MessageDlg('Erro na conexão e/ou autenticação: ' +
                    E.Message, mtWarning, [mbOK], 0);
        Exit;
      end;
    end;

    // Configuração da mensagem
    IdMessage.From.Address := De.Text;
    IdMessage.From.Name := Nome.Text;
    IdMessage.ReplyTo.EMailAddresses := IdMessage.From.Address;
    IdMessage.Recipients.EMailAddresses := Para.Text;
    IdMessage.Subject := Assunto.Text;
    IdMessage.Body.Text := Menssagem.Text;

    //Anexo da mensagem (opcional)
{    CaminhoAnexo := OpenDialog1.Files[i];
    if FileExists(CaminhoAnexo) then
      TIdAttachment.Create(IdMessage.MessageParts, CaminhoAnexo);
    if ListBoxAnexos.Items.Count > 0 then
		begin
			for i:= 0 to ListBoxAnexos.Items.Count - 1 do
				TIdAttachment.Create(IdMessage1.MessageParts, ListBoxAnexos.Items[i]);
			end;   }

  // Envio da mensagem
    try
      IdSMTP.Send(IdMessage);
      grava := Emails.Caption;
      Emails.Caption := grava + ',  enviado com Sucesso !';
      MessageDlg('Mensagem enviada com Sucesso.', mtInformation, [mbOK], 0);
    except
      On E:Exception do

        MessageDlg('Erro ao enviar a mensagem: ' +
                    E.Message, mtWarning, [mbOK], 0);

    end;
  finally
    // liberação dos objetos da memória
    FreeAndNil(IdMessage);
    FreeAndNil(IdSSLIOHandlerSocket);
    FreeAndNil(IdSMTP);
    
  end;
end;


procedure TEmails.OcutarClick(Sender: TObject);
begin
Senha.PasswordChar := '*';
Mostrar.Visible := True;
Ocutar.Visible := False;
end;

procedure TEmails.MostrarClick(Sender: TObject);
begin
Senha.PasswordChar := #0;
Ocutar.Visible := True;
Mostrar.Visible:= False;
end;

procedure TEmails.SpeedButton2Click(Sender: TObject);
begin
dsAux.DataSet.Prior;
end;

procedure TEmails.SpeedButton1Click(Sender: TObject);
begin
Para.Text := '';
end;

procedure TEmails.BitBtn4Click(Sender: TObject);
begin
Modulo.cdsEmail.Prior;
De.Text:=Usuario.Text;
end;

procedure TEmails.BitBtn3Click(Sender: TObject);
begin
Modulo.cdsEmail.Next;
De.Text:=Usuario.Text;

end;

procedure TEmails.BitBtn6Click(Sender: TObject);
begin
dsAux.DataSet.Prior;
end;

procedure TEmails.BitBtn5Click(Sender: TObject);
begin
dsAux.DataSet.Next;
end;

procedure TEmails.Timer1Timer(Sender: TObject);
begin
If (edtPesquisa.Text = '')
then
begin
   EmailReal.Caption := 'Email : ';
end
else
begin
EmailReal.Caption := 'Email : '+getEmail.Text;
end;
end;

procedure TEmails.FormActivate(Sender: TObject);
begin
Emails.Caption := 'Envio de Email'
end;

end.
