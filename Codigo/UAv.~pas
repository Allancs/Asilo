unit UAv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdMessage, IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdSMTP, StdCtrls, ExtCtrls, jpeg;

type
  TAvaliacao = class(TForm)
    enviar: TButton;
    IdSMTP1: TIdSMTP;
    IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket;
    IdMessage1: TIdMessage;
    Label6: TLabel;
    Label9: TLabel;
    Nome: TEdit;
    GS: TCheckBox;
    Label1: TLabel;
    GN: TCheckBox;
    EN: TEdit;
    LE: TLabel;
    Label3: TLabel;
    CS: TCheckBox;
    CN: TCheckBox;
    CE: TEdit;
    CL: TLabel;
    Label5: TLabel;
    OQMS: TEdit;
    Label7: TLabel;
    N1: TRadioButton;
    N2: TRadioButton;
    N3: TRadioButton;
    N4: TRadioButton;
    N5: TRadioButton;
    Timer1: TTimer;
    Timer2: TTimer;
    Image1: TImage;
    procedure enviarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Menssagem : String;
  end;

var
  Avaliacao: TAvaliacao;

implementation

uses USMTP;

{$R *.dfm}

procedure TAvaliacao.enviarClick(Sender: TObject);

var
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
    IdSMTP.Port := 465;

    IdSMTP.Host := 'smtp.gmail.com';
    IdSMTP.Username := 'asiloautomatico2.0@gmail.com';
    IdSMTP.Password := 'senha123456789';


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

    IdMessage.From.Address := 'allancolombo@hotmail.com';
    IdMessage.From.Name := Nome.Text;
    IdMessage.ReplyTo.EMailAddresses := IdMessage.From.Address;
    IdMessage.Recipients.EMailAddresses := 'allancolombo@hotmail.com, allancolobo@gmail.com';
    IdMessage.Subject := 'Avaliação do Sistema';
    IdMessage.Body.Text := Menssagem;

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
      MessageDlg('Formulario emviado com sucesso', mtInformation, [mbOK], 0);
    except
      On E:Exception do
        MessageDlg('Erro ao enviar o formulario : ' +
                    E.Message, mtWarning, [mbOK], 0);
    end;
  finally
    // liberação dos objetos da memória
    FreeAndNil(IdMessage);
    FreeAndNil(IdSSLIOHandlerSocket);
    FreeAndNil(IdSMTP);
    Avaliacao.Caption := 'Obrigado pela sua Avaliação !';
    enviar.Enabled := false;
  end;
end;

procedure TAvaliacao.Timer1Timer(Sender: TObject);
begin
   if GN.Checked = True
     then
     begin
          EN.Visible := True;
          LE.Visible := True;
      end
      Else
       Begin
         EN.Visible := False;
          LE.Visible := False;
      End;

        if CN.Checked = True
     then
     begin
          CL.Visible := True;
          CE.Visible := True;
      end
      Else
       Begin
         CL.Visible := False;
          CE.Visible := False;
      End;

end;

procedure TAvaliacao.Timer2Timer(Sender: TObject);
Var GSS, GNN, PNN, CEE, CSS , CNN, PNC, Msggs, Msgcs,Msgcss, Msgm, OQM, N11, N22, N33, N44, N55 : String;

begin
          if GS.Checked = True
     then
     begin
          Msggs := 'Gostou do Sistema?';
          GSS := Nome.Text+', Sim!';

      end
      Else
       Begin
         Msggs := 'Gostou do Sistema?';
         GNN := Nome.Text +' , Não';
         PNN := 'Porque não gostou? '+ EN.Text+'.';

      End;
    if CS.Checked = True
     then
     begin
          Msgcss := 'Achou o Sistema completo e intuitivo?';
          CSS := Nome.Text+', Sim!';
      end
      Else
       Begin
         Msgcss := 'Achou o Sistema completo e intuitivo?';
         CNN := Nome.Text +' , Não';
         PNC := 'Porque não gostou? '+ CE.Text+'.';
      End;
      Msgm := 'O que melhoraria o Sistema?';
      OQM := OQMS.Text;

      if N1.Checked = True
     then
     begin
          Msgcs := 'Qual nota daria ao Sistema';
          N11 := '1, Poderia melhorar mais.';
          //Image1.Picture := 'C:\Asilo\Icones\Avaliacao1.jpg';
          Image1.Picture.LoadFromFile('C:\Asilo\Icones\Avaliacao1.jpg');
      end
      Else
       if N2.Checked = True
       then
       Begin
          Msgcs := 'Qual nota daria ao Sistema';
          N22 := '2, Esta quase bom.';
          Image1.Picture.LoadFromFile('C:\Asilo\Icones\Avaliacao2.jpg');
      End
      Else
      if N3.Checked = True
      then
       Begin
         Msgcs := 'Gostou do Sistema';
          N33 := '3, Ele esta no caminho certo';
          Image1.Picture.LoadFromFile('C:\Asilo\Icones\Avaliacao3.jpg');
      end
       Else
        if N4.Checked = True
        then
       Begin
         Msgcs := 'Qual nota daria ao Sistema';
          N44 := '4, O sistema esta rodando perfeitamente';
          Image1.Picture.LoadFromFile('C:\Asilo\Icones\Avaliacao4.jpg');
          end
           Else
            if N5.Checked = True
            then
       Begin
         Msgcs := 'Qual nota daria ao Sistema';
          N55 := '5, O Sistema esta 100%, Otimo!';
          Image1.Picture.LoadFromFile('C:\Asilo\Icones\Avaliacao5.jpg');
          END      ;
          Menssagem := Msggs +' '+GSS + ' '+GNN + ' '+PNN+#13+Msgcss +' '+CSS +' '+CNN +' '+PNC+#13+ 'O que melhoraria o sistema ?'+ ' '+OQMS.Text+#13+ Msgcs + ' ' +N11+N22+N33+N44+N55+#13+'Finalizado com Sucesso!';



end;

end.
