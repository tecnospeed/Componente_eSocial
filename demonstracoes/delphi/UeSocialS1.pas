unit UeSocialS1;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics, Controls, Forms, ShellAPI, Dialogs, StdCtrls,
  ExtCtrls, ESocialSClientX_TLB, ComCtrls;

type
  TfrmeSocialS1 = class(TForm)
    pgc1: TPageControl;
    tsRetorno: TTabSheet;
    tsXmlEnvio: TTabSheet;
    tsXmlRetorno: TTabSheet;
    mmoRetorno: TMemo;
    mmoXmlEnvio: TMemo;
    mmoXmlRetorno: TMemo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbl1: TLabel;
    Label4: TLabel;
    edtCnpjSH: TLabeledEdit;
    edtTokenSH: TLabeledEdit;
    cbAmbiente: TComboBox;
    cbVersaoManual: TComboBox;
    edtCnpjTransmissor: TLabeledEdit;
    edtCnpjEmpregador: TLabeledEdit;
    cbCertificado: TComboBox;
    edtTemplates: TLabeledEdit;
    edtEsquemas: TLabeledEdit;
    btnConfigurar: TButton;
    cbGrupo: TComboBox;
    txtPincode: TEdit;
    chkTelemetria: TCheckBox;
    btnTx2: TButton;
    btnXML: TButton;
    btnAssinar: TButton;
    btnEnviar: TButton;
    edtIdLote: TLabeledEdit;
    rg: TRadioGroup;
    Button1: TButton;
    btnBaixarXmlEventoLote: TButton;
    edtIdEvento: TLabeledEdit;
    edtIdRecibo: TLabeledEdit;
    btnConsultar: TButton;
    TabSheet3: TTabSheet;
    btnAbrirComponente: TButton;
    btnAbrirPropriedades: TButton;
    btnAbrirMetodos: TButton;
    btnAbrirDicionario: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure btnConfigurarClick(Sender: TObject);
    procedure btnTx2Click(Sender: TObject);
    procedure btnXMLClick(Sender: TObject);
    procedure btnAssinarClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnBaixarXmlEventoLoteClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnAbrirComponenteClick(Sender: TObject);
    procedure btnAbrirPropriedadesClick(Sender: TObject);
    procedure btnAbrirMetodosClick(Sender: TObject);
    procedure btnAbrirDicionarioClick(Sender: TObject);

    { Private declarations }
  public
    eSocial: TspdESocialSClientX;
    { Public declarations }
  end;

var
  frmeSocialS1: TfrmeSocialS1;

implementation

uses uESocial;

{$R *.dfm}

procedure TfrmeSocialS1.FormCreate(Sender: TObject);
begin
  eSocial := TspdESocialSClientX.Create(nil);
  eSocial.DiagnosticMode := False;
end;

procedure TfrmeSocialS1.FormDestroy(Sender: TObject);
begin
  eSocial.Free;
end;

procedure TfrmeSocialS1.FormShow(Sender: TObject);
begin
  frmeSocialS1.Caption := 'eSocial - TecnoSpeed - ' + eSocial.Versao;

  eSocial.ConfigurarSoftwareHouse(edtCnpjSH.Text, edtTokenSH.Text);

  cbVersaoManual.Items.Text := eSocial.ListarVersaoManual(#13#10);
  cbCertificado.Items.Text := eSocial.ListarCertificados(#13#10);
  cbVersaoManual.ItemIndex := 0;
  cbCertificado.ItemIndex := 0;
end;

procedure TfrmeSocialS1.btnAssinarClick(Sender: TObject);
begin
  mmoRetorno.Text := eSocial.AssinarEvento(mmoRetorno.Text);
end;

procedure TfrmeSocialS1.btnBaixarXmlEventoLoteClick(Sender: TObject);
var
  RetBaixarXmlEventoLote: IspdSRetBaixarXmlEventoLote;
begin
  RetBaixarXmlEventoLote := eSocial.BaixarXmlEventoLote(edtIdLote.Text, edtIdEvento.Text);

  mmoRetorno.Lines.Clear;
  mmoRetorno.Lines.Add('### BAIXA XML EVENTO LOTE ###');
  mmoRetorno.Lines.Add('Mensagem de Retorno: ' + RetBaixarXmlEventoLote.Mensagem);
  mmoRetorno.Lines.Add('XML Evento: ' + RetBaixarXmlEventoLote.XmlEvento);
end;

procedure TfrmeSocialS1.btnConfigurarClick(Sender: TObject);
begin
  eSocial.DiagnosticMode := chkTelemetria.Checked;
  eSocial.VersaoManual := cbVersaoManual.Text;
  eSocial.NomeCertificado := cbCertificado.Text;
  if txtPincode.Text <> '' then
    begin
    eSocial.TipoCertificado := ckSmartCard;
    eSocial.Pincode := txtPinCode.Text;

    end
   else
    begin
    eSocial.Pincode := '';
    eSocial.TipoCertificado := ckLocalMachine;
    end;

    eSocial.DiretorioTemplates := edtTemplates.Text;
    eSocial.DiretorioEsquemas := edtEsquemas.Text;
    eSocial.ConfigurarSoftwareHouse(edtCnpjSH.Text, edtTokenSH.Text);
    eSocial.CpfCnpjTransmissor := edtCnpjTransmissor.Text;
    eSocial.CpfCnpjEmpregador := edtCnpjEmpregador.Text;
  if cbAmbiente.Text = '1 - Produção' then
    eSocial.Ambiente := akProducao;
  if cbAmbiente.Text = '2 - Homologação' then
    eSocial.Ambiente := akPreProducaoReais;

  // eSocial.CaminhoCertificado := 'Caminho do Certificado' Utilizado para passar o Caminho do .pfx do certificado.
  // eSocial.SenhaCertificado := 'Senha do certificado' Utilizado caso o Caminho Certificado seja preenchido.
  // eSocial.Pincode := 'Senha do certificado A3'; Senha do certificado A3 quando utilizado.
  // eSocial.ProxyServidor := 'Servidor com porta';  Utilizado quando existe proxy na rede a ser utilizada
  // eSocial.ProxyUsuario := 'Usuario do Proxy'; Utilizado quando existe proxy na rede a ser utilizada
  // eSocial.ProxySenha := 'Senha do Proxy';  Utilizado quando existe proxy na rede a ser utilizada
end;


{procedure TfrmeSocialS1.btnConsultarIdsEventoLoteClick(Sender: TObject);
var
  RetConsultaIdsEventoLote: IspdSRetConsultarIdsEventosLote;
  RetConsultaIdsEventoLoteItem: IspdSRetConsultarIdsEventosLoteItem;
  _i: integer;
begin
  RetConsultaIdsEventoLote := eSocial.ConsultarIdsEventoLote(edtIdLote.Text);

  mmoRetorno.Lines.Clear;
  mmoRetorno.Lines.Add('### CONSULTA IDS EVENTOS LOTE ###');
  mmoRetorno.Lines.Add('Número do Protocolo: ' + RetConsultaIdsEventoLote.NumeroProtocolo);
  mmoRetorno.Lines.Add('Mensagem de Retorno: ' + RetConsultaIdsEventoLote.Mensagem);

  mmoRetorno.Lines.Add('Id do Lote: ' + RetConsultaIdsEventoLote.IdLote);
  for _i := 0 to RetConsultaIdsEventoLote.Count - 1 do
  begin
    RetConsultaIdsEventoLoteItem := RetConsultaIdsEventoLote.Eventos[_i];
    mmoRetorno.Lines.Add('    Evento: ' + IntToStr(_i + 1));
    mmoRetorno.Lines.Add('    Id Evento: ' + RetConsultaIdsEventoLoteItem.IdEvento);
 end
end;    }

procedure TfrmeSocialS1.btnEnviarClick(Sender: TObject);
var
  RetEnvio: IspdSRetEnviarLoteEventos;
begin
  RetEnvio := eSocial.EnviarLoteEventos(mmoRetorno.Text,
    StrToInt(cbGrupo.Text));
  mmoRetorno.Lines.Clear;
  mmoRetorno.Lines.Add('### INCLUIR EVENTO ###');
  mmoRetorno.Lines.Add('Identificador do Lote: ' + RetEnvio.IdLote);
  mmoRetorno.Lines.Add('Mensagem de Retorno: ' + RetEnvio.Mensagem);
  edtIdLote.Text := RetEnvio.IdLote;
end;

procedure TfrmeSocialS1.btnTx2Click(Sender: TObject);
begin
  mmoRetorno.Clear;
  mmoRetorno.Lines.Add('INCLUIRS1000');
  if cbAmbiente.Text = '1 - Produção' then
    mmoRetorno.Lines.Add('tpAmb_4=1');
  if cbAmbiente.Text = '2 - Homologação' then
    mmoRetorno.Lines.Add('tpAmb_4=2');
  mmoRetorno.Lines.Add('procEmi_5=1');
  mmoRetorno.Lines.Add('verProc_6=1.0');
  mmoRetorno.Lines.Add('tpInsc_8=1');
  mmoRetorno.Lines.Add('nrInsc_9=08187168');
  mmoRetorno.Lines.Add('iniValid_13=2017-07');
  mmoRetorno.Lines.Add('classTrib_16=99');
  mmoRetorno.Lines.Add('indCoop_18=0');
  mmoRetorno.Lines.Add('indConstr_19=0');
  mmoRetorno.Lines.Add('indDesFolha_20=0');
  mmoRetorno.Lines.Add('indOptRegEletron_21=0');
  mmoRetorno.Lines.Add('SALVARS1000');
end;

procedure TfrmeSocialS1.btnXMLClick(Sender: TObject);
begin
  mmoRetorno.Text := eSocial.GerarXMLporTx2(mmoRetorno.Text);
end;
                                                                                      
procedure TfrmeSocialS1.Button1Click(Sender: TObject);
var
  _retorno: IspdSRetReconsultarLoteSefaz;
begin
  _retorno := eSocial.ReconsultarLoteSefaz(edtIdLote.Text);
  mmoRetorno.Text := _retorno.Mensagem;
end;


procedure TfrmeSocialS1.btnConsultarClick(Sender: TObject);
var
  RetConsulta: IspdSRetConsultarLote;
  RetConsultaItem: IspdSRetConsultarLoteItem;
  RetConsultaOcorrencia: IspdSRetConsultarLoteOcorrencia;
  RetConsultaOcorrenciaEnvio: IspdSRetConsultarLoteOcorrenciaEnvio;
  _i, _j, _k, _a, _b, _c, _d, _e, _f, _g: integer;
begin
  if rg.ItemIndex = 0 then
    RetConsulta := eSocial.ConsultarLoteEventos(edtIdLote.Text)
  else if rg.ItemIndex = 1 then
    RetConsulta := eSocial.ConsultarIdEvento(edtIdEvento.Text)
  else if rg.ItemIndex = 2 then
    RetConsulta := eSocial.ConsultarEventoPorRecibo(edtIdRecibo.Text);

  mmoRetorno.Lines.Clear;
  mmoRetorno.Lines.Add('### CONSULTA PROTOCOLO ###');
  mmoRetorno.Lines.Add('Número do Protocolo: ' + RetConsulta.NumeroProtocolo);
  mmoRetorno.Lines.Add('Mensagem de Retorno: ' + RetConsulta.Mensagem);
  mmoRetorno.Lines.Add('Status do Lote: ' + RetConsulta.Status);
  mmoRetorno.Lines.Add('Tempo estimado para conclusão do processamento: ' +
    RetConsulta.TempoEstimadoConclusao);
  mmoRetorno.Lines.Add('Id do Lote: ' + RetConsulta.IdLote);
  for _i := 0 to RetConsulta.Count - 1 do
  begin
    RetConsultaItem := RetConsulta.Eventos[_i];
    mmoRetorno.Lines.Add('    Evento: ' + IntToStr(_i + 1));
    mmoRetorno.Lines.Add('    Id Evento: ' + RetConsultaItem.IdEvento);
    mmoRetorno.Lines.Add('    Número Recibo: ' + RetConsultaItem.NumeroRecibo);
    mmoRetorno.Lines.Add('    Código de Status: ' + RetConsultaItem.cStat);
    mmoRetorno.Lines.Add('    Mensagem: ' + RetConsultaItem.Mensagem);
    mmoRetorno.Lines.Add('    Status do Evento: ' + RetConsultaItem.Status);
    if not RetConsultaItem.S5001.IsEmpty then
    begin
      mmoRetorno.Lines.Add('        ### S5001 ###');
      mmoRetorno.Lines.Add('        Id: ' + RetConsultaItem.S5001.Id);
      // IdeEvento
      mmoRetorno.Lines.Add('        nrRecArqBase: ' +
        RetConsultaItem.S5001.IdeEvento.NrRecArqBase);
      mmoRetorno.Lines.Add('        indApuracao: ' +
        RetConsultaItem.S5001.IdeEvento.indApuracao);
      mmoRetorno.Lines.Add('        perApur: ' +
        RetConsultaItem.S5001.IdeEvento.perApur);
      // IdeEmpregador
      mmoRetorno.Lines.Add('        tpInsc: ' +
        RetConsultaItem.S5001.IdeEmpregador.tpInsc);
      mmoRetorno.Lines.Add('        nrInsc: ' +
        RetConsultaItem.S5001.IdeEmpregador.nrInsc);
      // IdeTrabalhador
      mmoRetorno.Lines.Add('        cpfTrab: ' +
        RetConsultaItem.S5001.IdeTrabalhador.cpfTrab);
      // ProcJudTrab
      for _a := 0 to RetConsultaItem.S5001.IdeTrabalhador.
        CountProcJudTrab - 1 do
      begin
        mmoRetorno.Lines.Add('        NrProcJud: ' +
          RetConsultaItem.S5001.IdeTrabalhador.ProcJudTrab[_a].NrProcJud);
        mmoRetorno.Lines.Add('        codSusp: ' +
          RetConsultaItem.S5001.IdeTrabalhador.ProcJudTrab[_a].codSusp);
      end;
      // InfoCpCalc
      for _a := 0 to RetConsultaItem.S5001.CountInfoCpCalc - 1 do
      begin
        mmoRetorno.Lines.Add('        tpCR: ' + RetConsultaItem.S5001.InfoCpCalc
          [_a].tpCR);
        mmoRetorno.Lines.Add('        vrCpSeg: ' +
          RetConsultaItem.S5001.InfoCpCalc[_a].vrCpSeg);
        mmoRetorno.Lines.Add('        vrDescSeg: ' +
          RetConsultaItem.S5001.InfoCpCalc[_a].vrDescSeg);
      end;
      // IdeEstabLot
      for _a := 0 to RetConsultaItem.S5001.InfoCp.CountIdeEstabLot - 1 do
      begin
        mmoRetorno.Lines.Add('        vrDescSeg: ' +
          RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].tpInsc);
        mmoRetorno.Lines.Add('        nrInsc: ' +
          RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].nrInsc);
        mmoRetorno.Lines.Add('        codLotacao: ' +
          RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].codLotacao);
        // InfoCategIncid
        for _b := 0 to RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a]
          .CountInfoCategIncid - 1 do
        begin
          mmoRetorno.Lines.Add('        vrDescSeg: ' +
            RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b]
            .Matricula);
          mmoRetorno.Lines.Add('        codCateg: ' +
            RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b]
            .codCateg);
          mmoRetorno.Lines.Add('        indSimples: ' +
            RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b]
            .indSimples);
          // InfoBaseCS
          for _c := 0 to RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a]
            .InfoCategIncid[_b].CountInfoBaseCS - 1 do
          begin
            mmoRetorno.Lines.Add('        Ind13: ' +
              RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b]
              .InfoBaseCS[_c].Ind13);
            mmoRetorno.Lines.Add('        tpValor: ' +
              RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b]
              .InfoBaseCS[_c].tpValor);
            mmoRetorno.Lines.Add('        valor: ' +
              RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b]
              .InfoBaseCS[_c].valor);
          end;
          // CalcTerc
          for _c := 0 to RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a]
            .InfoCategIncid[_b].CountCalcTerc - 1 do
          begin
            mmoRetorno.Lines.Add('        tpCR: ' +
              RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b]
              .CalcTerc[_c].tpCR);
            mmoRetorno.Lines.Add('        vrCsSegTerc: ' +
              RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b]
              .CalcTerc[_c].vrCsSegTerc);
            mmoRetorno.Lines.Add('        vrDescTerc: ' +
              RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b]
              .CalcTerc[_c].vrDescTerc);
          end;
          // infoPerRef
          for _c := 0 to RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a]
            .InfoCategIncid[_b].CountInfoPerRef - 1 do
          begin
            mmoRetorno.Lines.Add('        perRef: ' +  RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].PerRef);
            for _d := 0 to RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a]
            .InfoCategIncid[_b].InfoPerRef[_c].CountDetInfoPerRef - 1 do
            begin
               mmoRetorno.Lines.Add('          ind13: ' +
                 RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b]
                 .InfoPerRef[_c].DetInfoPerRef[_d].Ind13);
               //mmoRetorno.Lines.Add('          tpValor: ' +
               //  RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b]
              //   .InfoPerRef[_c].DetInfoPerRef[_d].TpValor);
               mmoRetorno.Lines.Add('          vrPerRef: ' +
                 RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b]
                 .InfoPerRef[_c].DetInfoPerRef[_d].VrPerRef);
            end;
          end;
        end;
      end;
    end;
    if not RetConsultaItem.S5002.IsEmpty then
    begin
      mmoRetorno.Lines.Add('        ### S5002 ###');
      mmoRetorno.Lines.Add('        Id: ' + RetConsultaItem.S5002.Id);
      // IdeEvento
      mmoRetorno.Lines.Add('        nrRecArqBase: ' +
        RetConsultaItem.S5002.IdeEvento.NrRecArqBase);
      mmoRetorno.Lines.Add('        perApur: ' +
        RetConsultaItem.S5002.IdeEvento.perApur);

      // IdeEmpregador
      mmoRetorno.Lines.Add('        tpInsc: ' +
        RetConsultaItem.S5002.IdeEmpregador.tpInsc);
      mmoRetorno.Lines.Add('        nrInsc: ' +
        RetConsultaItem.S5002.IdeEmpregador.nrInsc);

      // IdeTrabalhador
      mmoRetorno.Lines.Add('        CpfBenef: ' +
        RetConsultaItem.S5002.IdeTrabalhador.CpfBenef);

      // InfoIrrf
      for _a := 0 to RetConsultaItem.S5002.IdeTrabalhador.CountDmDev - 1 do
      begin
        mmoRetorno.Lines.Add('        DmDev: ');
        mmoRetorno.Lines.Add('         PerRef: ' +
         RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].PerRef);
        mmoRetorno.Lines.Add('         IdeDmDev: ' +
         RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].IdeDmDev);
        mmoRetorno.Lines.Add('         TpPgto: ' +
         RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].TpPgto);
        mmoRetorno.Lines.Add('         DtPgto: ' +
         RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].DtPgto);
        mmoRetorno.Lines.Add('         CodCateg: ' +
         RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].CodCateg);

        for _b := 0 to RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].CountInfoIR - 1 do
        begin
          mmoRetorno.Lines.Add('         InfoIR: ');
          mmoRetorno.Lines.Add('          TpInfoIR: ' +
           RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoIR[_b].TpInfoIR);
          mmoRetorno.Lines.Add('          Valor: ' +
           RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoIR[_b].Valor);
        end;

      end;
    end;
  end;

  mmoXmlEnvio.Text := RetConsulta.XmlEnviado;
  mmoXmlRetorno.Text := RetConsulta.XmlRetorno;
end;

procedure TfrmeSocialS1.btnAbrirComponenteClick(Sender: TObject);
begin
 ShellExecute(Handle,'open','https://atendimento.tecnospeed.com.br/hc/pt-br/articles/4404184018839-Guia-Geral-Componente-eSocial',nil,nil,SW_SHOWMAXIMIZED);
end;

procedure TfrmeSocialS1.btnAbrirPropriedadesClick(Sender: TObject);
begin
 ShellExecute(Handle,'open','https://atendimento.tecnospeed.com.br/hc/pt-br/articles/360005419193-Propriedades-do-componente',nil,nil,SW_SHOWMAXIMIZED);
end;

procedure TfrmeSocialS1.btnAbrirMetodosClick(Sender: TObject);
begin
 ShellExecute(Handle,'open','https://atendimento.tecnospeed.com.br/hc/pt-br/sections/360001152373-M%C3%A9todos-do-componente',nil,nil,SW_SHOWMAXIMIZED);
end;

procedure TfrmeSocialS1.btnAbrirDicionarioClick(Sender: TObject);
begin
 ShellExecute(Handle,'open','https://atendimento.tecnospeed.com.br/hc/pt-br/sections/1500001504902-Dicion%C3%A1rio-de-dados-S-1-0',nil,nil,SW_SHOWMAXIMIZED);
end;

end.
