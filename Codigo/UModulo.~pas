unit UModulo;

interface

uses
  SysUtils, Classes, DBXpress, FMTBcd, DB, Provider, DBClient, SqlExpr,
  SimpleDS;

type
  TModulo = class(TDataModule)
    Conexao: TSQLConnection;
    sdsAviso: TSQLDataSet;
    cdsAviso: TClientDataSet;
    dsAviso: TDataSource;
    dspAviso: TDataSetProvider;
    cdsAvisoCOD_AVISO: TIntegerField;
    cdsAvisoOBS: TStringField;
    cdsAvisoDATA: TDateField;
    dsConta: TDataSource;
    dsFun: TDataSource;
    dsInc: TDataSource;
    dsLigacoes: TDataSource;
    dsParceiro: TDataSource;
    dspConta: TDataSetProvider;
    cdsFun: TClientDataSet;
    cdsConta: TClientDataSet;
    cdsInc: TClientDataSet;
    dspFun: TDataSetProvider;
    dspInc: TDataSetProvider;
    cdsLigacoes: TClientDataSet;
    cdsParceiro: TClientDataSet;
    dspLigacoes: TDataSetProvider;
    dspParceiro: TDataSetProvider;
    sdsConta: TSQLDataSet;
    sqsFun: TSQLDataSet;
    sdsInc: TSQLDataSet;
    sdsLigacoes: TSQLDataSet;
    sdsParceiro: TSQLDataSet;
    sdsProfisional: TSQLDataSet;
    cdsProfisional: TClientDataSet;
    dsProfisional: TDataSource;
    dspProfisional: TDataSetProvider;
    dsResidente: TDataSource;
    dsSaude: TDataSource;
    dsTarefa: TDataSource;
    dsVoluntario: TDataSource;
    dspResidente: TDataSetProvider;
    cdsSaude: TClientDataSet;
    cdsResidente: TClientDataSet;
    cdsTarefa: TClientDataSet;
    dspSaude: TDataSetProvider;
    dspTarefa: TDataSetProvider;
    cdsVoluntario: TClientDataSet;
    dspVoluntario: TDataSetProvider;
    sdsResidente: TSQLDataSet;
    sdsSaude: TSQLDataSet;
    sdsTarefa: TSQLDataSet;
    sdsVoluntario: TSQLDataSet;
    cdsProfisionalCOD_PRO: TIntegerField;
    cdsProfisionalNOME: TStringField;
    cdsProfisionalTELEFONE: TStringField;
    cdsProfisionalCELULAR: TStringField;
    cdsProfisionalEEMPRESA: TStringField;
    cdsVoluntarioCOD_VOLUNTARIO: TIntegerField;
    cdsVoluntarioNOME: TStringField;
    cdsVoluntarioTELEFONE: TStringField;
    cdsVoluntarioCELULAR: TStringField;
    cdsVoluntarioEMAIL: TStringField;
    cdsTarefaCOD_TAREFA: TIntegerField;
    cdsTarefaTAREFA: TStringField;
    cdsTarefaDATA: TDateField;
    cdsSaudeCOD_SAUDE: TIntegerField;
    cdsSaudeCOD_IDOSO: TIntegerField;
    cdsSaudeNOMEM: TStringField;
    cdsSaudeNOMEI: TStringField;
    cdsSaudeRECEITA: TStringField;
    cdsSaudeOBS: TStringField;
    cdsSaudeDATA: TDateField;
    cdsResidenteCOD_IDOSO: TIntegerField;
    cdsResidenteNOME: TStringField;
    cdsResidenteDATANASCIMENTO: TStringField;
    cdsResidenteIDADE: TStringField;
    cdsResidenteNASCIONALIDADE: TStringField;
    cdsResidenteNATURALIDADE: TStringField;
    cdsResidenteESTADOCIVIL: TStringField;
    cdsResidenteRELIGIAO: TStringField;
    cdsResidentePROFISSAO: TStringField;
    cdsResidenteRG: TStringField;
    cdsResidenteCPF: TStringField;
    cdsResidentePAI: TStringField;
    cdsResidenteMAE: TStringField;
    cdsResidenteOBS: TStringField;
    cdsResidenteDATAENTRADA: TDateField;
    cdsResidenteINFORMACOES: TStringField;
    cdsResidenteDATASAIDA: TDateField;
    dsDespesa: TDataSource;
    cdsDespesas: TClientDataSet;
    dspDespesas: TDataSetProvider;
    sdsDespesas: TSQLDataSet;
    cdsDespesasCOD_DESPESA: TIntegerField;
    cdsDespesasNOME: TStringField;
    cdsDespesasDESCRICAO: TStringField;
    cdsDespesasVALOR: TStringField;
    cdsDespesasDATA: TDateField;
    cdsContaCOD_CONTA: TIntegerField;
    cdsContaNOME: TStringField;
    cdsContaDESCRICAO: TStringField;
    cdsContaVALOR: TFMTBCDField;
    cdsContaDATAVENCIMENTO: TDateField;
    cdsFunCOD_FUN: TIntegerField;
    cdsFunNOME: TStringField;
    cdsFunSEXO: TStringField;
    cdsFunDATANASCIMENTO: TStringField;
    cdsFunIDADE: TStringField;
    cdsFunFUNCAO: TStringField;
    cdsFunSALARIO: TFMTBCDField;
    cdsFunCPF: TStringField;
    cdsFunRG: TStringField;
    cdsFunCARTEIRATRABALHO: TStringField;
    cdsFunCELULAR: TStringField;
    cdsFunTELEFONE: TStringField;
    cdsIncCOD_INCIDENTE: TIntegerField;
    cdsIncCOD_IDOSO: TIntegerField;
    cdsIncNOME: TStringField;
    cdsIncDESCRICAO: TStringField;
    cdsIncOBCERVACAO: TStringField;
    cdsIncDATA: TDateField;
    cdsLigacoesCOD_LIGACOES: TIntegerField;
    cdsLigacoesCOD_IDOSO: TIntegerField;
    cdsLigacoesNOME: TStringField;
    cdsLigacoesNOMER: TStringField;
    cdsLigacoesFONE: TStringField;
    cdsLigacoesCELULAR: TStringField;
    dsEmail: TDataSource;
    cdsEmail: TClientDataSet;
    dspEmail: TDataSetProvider;
    sdsEmail: TSQLDataSet;
    cdsEmailID: TIntegerField;
    cdsEmailSMTP: TStringField;
    cdsEmailPORT: TStringField;
    cdsEmailEMAIL: TStringField;
    cdsEmailSENHA: TStringField;
    cdsParceiroCOD_PARCEIRO: TIntegerField;
    cdsParceiroNOME: TStringField;
    cdsParceiroTELEFONE: TStringField;
    cdsParceiroCELULAR: TStringField;
    cdsParceiroEMAIL: TStringField;
    cdsParceiroEMPRESA: TStringField;
    sdsAvisoCOD_AVISO: TIntegerField;
    sdsAvisoOBS: TStringField;
    sdsAvisoDATA: TDateField;
    cdsAvisos: TClientDataSet;
    cdsAvisosCOD_AVISO: TIntegerField;
    cdsAvisosOBS: TStringField;
    cdsAvisosDATA: TDateField;
    dsAvisos: TDataSource;
    dspAvisos: TDataSetProvider;
    Conexao2: TSQLConnection;
    sdsUser: TSimpleDataSet;
    dsUser: TDataSource;
    sqlDSLogin: TSQLDataSet;
    cdsUser: TClientDataSet;
    dspUser: TDataSetProvider;
    sdsUserID: TIntegerField;
    sdsUserUSU_NOME: TStringField;
    sdsUserUSU_EMAIL: TStringField;
    sdsUserUSU_LOGIN: TStringField;
    sdsUserUSU_SENHA: TStringField;
    sqlDSLoginID: TIntegerField;
    sqlDSLoginUSU_NOME: TStringField;
    sqlDSLoginUSU_EMAIL: TStringField;
    sqlDSLoginUSU_LOGIN: TStringField;
    sqlDSLoginUSU_SENHA: TStringField;
    cdsUserID: TIntegerField;
    cdsUserUSU_NOME: TStringField;
    cdsUserUSU_EMAIL: TStringField;
    cdsUserUSU_LOGIN: TStringField;
    cdsUserUSU_SENHA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Modulo: TModulo;

implementation

{$R *.dfm}

end.
