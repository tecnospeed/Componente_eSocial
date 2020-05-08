unit uESocial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ESocialClientX_TLB, ComCtrls;

type
  TfrmESocial = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbl1: TLabel;
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
    btnTx2: TButton;
    btnXML: TButton;
    btnAssinar: TButton;
    btnEnviar: TButton;
    btnConsultar: TButton;
    edtIdLote: TLabeledEdit;
    cbGrupo: TComboBox;
    pcPages: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    mmoXML: TMemo;
    mmoXmlEnvio: TMemo;
    rgTipoEnvio: TRadioGroup;
    TabSheet4: TTabSheet;
    mmTX2: TMemo;
    rgTipoTX2: TRadioGroup;
    openDlg: TOpenDialog;
    Button1: TButton;
    TabSheet5: TTabSheet;
    mmXMLAssinado: TMemo;
    TabSheet6: TTabSheet;
    Retornado: TTabSheet;
    mmEnviado: TMemo;
    mmRetornado: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnConfigurarClick(Sender: TObject);
    procedure btnTx2Click(Sender: TObject);
    procedure btnXMLClick(Sender: TObject);
    procedure btnAssinarClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
  eSocial: TspdESocialClientX;
    { Public declarations }
  end;

var
  frmESocial: TfrmESocial;

implementation

{$R *.dfm}

procedure TfrmESocial.FormCreate(Sender: TObject);
begin
  eSocial := TspdESocialClientX.Create(nil);
  frmESocial.Caption := 'eSocial - TecnoSpeed - ' + eSocial.Versao;
  cbVersaoManual.Items.Text := eSocial.ListarVersaoManual(#13#10);
  cbCertificado.Items.Text := eSocial.ListarCertificados(#13#10);
  cbVersaoManual.ItemIndex := 0;
  cbCertificado.ItemIndex := 0;
  rgTipoEnvio.ItemIndex := 0;
end;

procedure TfrmESocial.btnConfigurarClick(Sender: TObject);
begin
  eSocial.VersaoManual := cbVersaoManual.Text;
  eSocial.NomeCertificado := cbCertificado.Text;
//  eSocial.CaminhoCertificado := 'Caminho do Certificado' Utilizado para passar o Caminho do .pfx do certificado.
//  eSocial.SenhaCertificado := 'Senha do certificado' Utilizado caso o Caminho Certificado seja preenchido.
//  eSocial.Pincode := 'Senha do certificado A3'; Senha do certificado A3 quando utilizado.
//  eSocial.ProxyServidor := 'Servidor com porta';  Utilizado quando existe proxy na rede a ser utilizada
//  eSocial.ProxyUsuario := 'Usuario do Proxy'; Utilizado quando existe proxy na rede a ser utilizada
//  eSocial.ProxySenha := 'Senha do Proxy';  Utilizado quando existe proxy na rede a ser utilizada
  eSocial.DiretorioTemplates := edtTemplates.Text;
  eSocial.DiretorioEsquemas := edtEsquemas.Text;
  eSocial.ConfigurarSoftwareHouse(edtCnpjSH.Text, edtTokenSH.Text);
  eSocial.CpfCnpjTransmissor := edtCnpjTransmissor.Text;
  eSocial.CpfCnpjEmpregador := edtCnpjEmpregador.Text;
  if cbAmbiente.Text = '1 - Produção' then
    eSocial.Ambiente := akProducao;
  if cbAmbiente.Text = '2 - Homologação' then
    eSocial.Ambiente := akPreProducaoReais;
  mmoXML.Text := eSocial.GetVencimentoCertificado;
end;

procedure TfrmESocial.btnTx2Click(Sender: TObject);
var
  vTX2Aux: string;

  procedure IncluirCamposPadroes;
  begin
    mmTX2.Lines.Add('tpAmb_4='+IntToStr(cbAmbiente.ItemIndex+1));
    mmTX2.Lines.Add('procEmi_5=1');
    mmTX2.Lines.Add('verProc_6=1.0');
    mmTX2.Lines.Add('tpInsc_8=1');
    mmTX2.Lines.Add('nrInsc_9=08187168');
  end;
begin
  case rgTipoTX2.ItemIndex of
     0://S1000
     begin
        mmTX2.Clear;
        mmTX2.Lines.Add('INCLUIRS1000');
        IncluirCamposPadroes;
        mmTX2.Lines.Add('iniValid_13=2017-07');
        mmTX2.Lines.Add('nmRazao_15=TECNOSPEED TECNOLOGIA DA INFORMACAO');
        mmTX2.Lines.Add('classTrib_16=99');
        mmTX2.Lines.Add('natJurid_17=2054');
        mmTX2.Lines.Add('indCoop_18=0');
        mmTX2.Lines.Add('indConstr_19=0');
        mmTX2.Lines.Add('indDesFolha_20=0');
        mmTX2.Lines.Add('indOptRegEletron_21=0');
        mmTX2.Lines.Add('indEntEd_23=N');
        mmTX2.Lines.Add('indEtt_24=N');
        mmTX2.Lines.Add('nmCtt_36=Vítor Beal');
        mmTX2.Lines.Add('cpfCtt_37=09336330926');
        mmTX2.Lines.Add('foneCel_39=7867834687');
        mmTX2.Lines.Add('foneFixo_38=4430379500');
        mmTX2.Lines.Add('indSitPJ_63=0');
        mmTX2.Lines.Add('SALVARS1000');
     end;
     1://S1005
     begin
        mmTX2.Clear;
        mmTX2.Lines.Add('INCLUIRS1005');
        IncluirCamposPadroes;
        mmTX2.Lines.Add('tpInsc_13=1');
        mmTX2.Lines.Add('nrInsc_14=48185812000185');
        mmTX2.Lines.Add('iniValid_13=2017-07');
        mmTX2.Lines.Add('fimValid_16=');
        mmTX2.Lines.Add('cnaePrep_18=6202300');
        mmTX2.Lines.Add('aliqRat_20=2');
        mmTX2.Lines.Add('fap_21=2');
        mmTX2.Lines.Add('aliqRatAjust_22=4');
        mmTX2.Lines.Add('tpProc_24=');
        mmTX2.Lines.Add('nrProc_25=');
        mmTX2.Lines.Add('codSusp_26=');
        mmTX2.Lines.Add('tpProc_28=');
        mmTX2.Lines.Add('nrProc_29=');
        mmTX2.Lines.Add('codSusp_30=');
        mmTX2.Lines.Add('tpCaepf_32=');
        mmTX2.Lines.Add('indSubstPatrObra_34=');
        mmTX2.Lines.Add('regPt_36=3');
        mmTX2.Lines.Add('contApr_38=0');
        mmTX2.Lines.Add('nrProcJud_39=');
        mmTX2.Lines.Add('contEntEd_40=');
        mmTX2.Lines.Add('INCLUIRINFOENTEDUC_41');
        mmTX2.Lines.Add('nrInsc_42=');
        mmTX2.Lines.Add('SALVARINFOENTEDUC_41');
        mmTX2.Lines.Add('contPCD_44=');
        mmTX2.Lines.Add('nrProcJud_45=');
        mmTX2.Lines.Add('SALVARS1005');
     end;
     2://S1010
     begin
        mmTX2.Clear;
        mmTX2.Lines.Add('INCLUIRS1010');
        IncluirCamposPadroes;
        mmTX2.Lines.Add('codRubr_13=1234');
        mmTX2.Lines.Add('ideTabRubr_14=12345');
        mmTX2.Lines.Add('iniValid_13=2017-07');
        mmTX2.Lines.Add('fimValid_16=');
        mmTX2.Lines.Add('dscRubr_18=RUBRICA DE TESTES');
        mmTX2.Lines.Add('natRubr_19=1000');
        mmTX2.Lines.Add('tpRubr_20=3');
        mmTX2.Lines.Add('codIncCP_21=00');
        mmTX2.Lines.Add('codIncIRRF_22=00');
        mmTX2.Lines.Add('codIncFGTS_23=00');
        mmTX2.Lines.Add('codIncSIND_24=00');
        mmTX2.Lines.Add('observacao_29=TESTE DE OBSERVAÇÃO');
        mmTX2.Lines.Add('INCLUIRIDEPROCESSOCP_30');
        mmTX2.Lines.Add('tpProc_31=');
        mmTX2.Lines.Add('nrProc_32=');
        mmTX2.Lines.Add('extDecisao_33=');
        mmTX2.Lines.Add('codSusp_34=');
        mmTX2.Lines.Add('SALVARIDEPROCESSOCP_30');
        mmTX2.Lines.Add('INCLUIRIDEPROCESSOIRRF_35');
        mmTX2.Lines.Add('nrProc_36=');
        mmTX2.Lines.Add('codSusp_37=');
        mmTX2.Lines.Add('SALVARIDEPROCESSOIRRF_35');
        mmTX2.Lines.Add('INCLUIRIDEPROCESSOFGTS_38');
        mmTX2.Lines.Add('nrProc_39=');
        mmTX2.Lines.Add('SALVARIDEPROCESSOFGTS_38');
        mmTX2.Lines.Add('INCLUIRIDEPROCESSOSIND_41');
        mmTX2.Lines.Add('nrProc_42=');
        mmTX2.Lines.Add('SALVARIDEPROCESSOSIND_41');
        mmTX2.Lines.Add('SALVARS1010');
     end;
     3://S1020
     begin
        mmTX2.Clear;
        mmTX2.Lines.Add('INCLUIRS1020');
        IncluirCamposPadroes;
        mmTX2.Lines.Add('codLotacao_13=1');
        mmTX2.Lines.Add('iniValid_14=2017-07');
        mmTX2.Lines.Add('fimValid_15=');
        mmTX2.Lines.Add('tpLotacao_17=01');
        mmTX2.Lines.Add('tpInsc_18=');
        mmTX2.Lines.Add('nrInsc_19=');
        mmTX2.Lines.Add('fpas_21=507');
        mmTX2.Lines.Add('codTercs_22=0001');
        mmTX2.Lines.Add('codTercsSusp_23=0067');
        mmTX2.Lines.Add('tpInscContrat_30=');
        mmTX2.Lines.Add('nrInscContrat_31=');
        mmTX2.Lines.Add('tpInscProp_32=');
        mmTX2.Lines.Add('nrInscProp_33=');
        mmTX2.Lines.Add('INCLUIRPROCJUDTERCEIRO_25');
        mmTX2.Lines.Add('codTerc_26=');
        mmTX2.Lines.Add('nrProcJud_27=');
        mmTX2.Lines.Add('codSusp_28=');
        mmTX2.Lines.Add('SALVARPROCJUDTERCEIRO_25');
        mmTX2.Lines.Add('SALVARS1020');
     end;
     4://S1030
     begin
        mmTX2.Clear;
        mmTX2.Lines.Add('INCLUIRS1030');
        IncluirCamposPadroes;
        mmTX2.Lines.Add('codCargo_13=1');
        mmTX2.Lines.Add('iniValid_14=2017-07');
        mmTX2.Lines.Add('fimValid_15=');
        mmTX2.Lines.Add('nmCargo_17=CARGO TESTE ANALISTA');
        mmTX2.Lines.Add('codCBO_18=212405');
        mmTX2.Lines.Add('acumCargo_20=1');
        mmTX2.Lines.Add('contagemEsp_21=1');
        mmTX2.Lines.Add('dedicExcl_22=N');
        mmTX2.Lines.Add('nrLei_24=123');
        mmTX2.Lines.Add('dtLei_25=1993-12-12');
        mmTX2.Lines.Add('sitCargo_26=1');
        mmTX2.Lines.Add('SALVARS1030');
     end;
     5://S1035
     begin
        mmTX2.Clear;
        mmTX2.Lines.Add('INCLUIRS1035');
        IncluirCamposPadroes;
        mmTX2.Lines.Add('codCarreira_13=1');
        mmTX2.Lines.Add('iniValid_14=2017-07');
        mmTX2.Lines.Add('fimValid_15=');
        mmTX2.Lines.Add('dscCarreira_17=CARREIRA DE DESENVOLVEDOR');
        mmTX2.Lines.Add('leiCarr_18=');
        mmTX2.Lines.Add('dtLeiCarr_19=2011-03-11');
        mmTX2.Lines.Add('sitCarr_20=3');
        mmTX2.Lines.Add('SALVARS1035');
     end;
     6://S1040
     begin
        mmTX2.Clear;
        mmTX2.Lines.Add('INCLUIRS1040');
        IncluirCamposPadroes;
        mmTX2.Lines.Add('codFuncao_13=1');
        mmTX2.Lines.Add('iniValid_14=2017-07');
        mmTX2.Lines.Add('fimValid_15=');
        mmTX2.Lines.Add('dscFuncao_17=FUNÇÃO TESTE');
        mmTX2.Lines.Add('codCBO_18=212405');
        mmTX2.Lines.Add('SALVARS1040');
     end;
     7://S1050
     begin
        mmTX2.Clear;
        mmTX2.Lines.Add('INCLUIRS1050');
        IncluirCamposPadroes;
        mmTX2.Lines.Add('codHorContrat_13=1');
        mmTX2.Lines.Add('iniValid_14=2017-07');
        mmTX2.Lines.Add('fimValid_15=');
        mmTX2.Lines.Add('hrEntr_17=0800');
        mmTX2.Lines.Add('hrSaida_18=1700');
        mmTX2.Lines.Add('durJornada_19=480');
        mmTX2.Lines.Add('perHorFlexivel_20=S');
        mmTX2.Lines.Add('INCLUIRHORARIOINTERVALO_21');
        mmTX2.Lines.Add('tpInterv_22=1');
        mmTX2.Lines.Add('durInterv_23=15');
        mmTX2.Lines.Add('iniInterv_24=1700');
        mmTX2.Lines.Add('termInterv_25=1715');
        mmTX2.Lines.Add('SALVARHORARIOINTERVALO_21');
        mmTX2.Lines.Add('SALVARS1050');
     end;
     8://S1060
     begin
        mmTX2.Clear;
        mmTX2.Lines.Add('INCLUIRS1060');
        IncluirCamposPadroes;
        mmTX2.Lines.Add('codAmb_13=1');
        mmTX2.Lines.Add('iniValid_14=2017-07');
        mmTX2.Lines.Add('fimValid_15=');
        mmTX2.Lines.Add('dscAmb_17=Trabalho');
        mmTX2.Lines.Add('localAmb_18=1');
        mmTX2.Lines.Add('tpInsc_19=1');
        mmTX2.Lines.Add('nrInsc_20=63741729000139');
        mmTX2.Lines.Add('INCLUIRFATORRISCO_21');
        mmTX2.Lines.Add('codFatRis_22=');
        mmTX2.Lines.Add('SALVARFATORRISCO_21');
        mmTX2.Lines.Add('SALVARS1060');
     end;
     9://S1070
     begin
        mmTX2.Clear;
        mmTX2.Lines.Add('INCLUIRS1070');
        IncluirCamposPadroes;
        mmTX2.Lines.Add('tpProc_13=1');
        mmTX2.Lines.Add('nrProc_14=1');
        mmTX2.Lines.Add('iniValid_15=2017-07');
        mmTX2.Lines.Add('fimValid_16=');
        mmTX2.Lines.Add('indAutoria_18=1');
        mmTX2.Lines.Add('indMatProc_19=1');
        mmTX2.Lines.Add('ufVara_21=');
        mmTX2.Lines.Add('codMunic_22=');
        mmTX2.Lines.Add('idVara_23=');
        mmTX2.Lines.Add('observacao_29=');
        mmTX2.Lines.Add('INCLUIRINFOSUSP_24');
        mmTX2.Lines.Add('codSusp_25=1234');
        mmTX2.Lines.Add('indSusp_26=03');
        mmTX2.Lines.Add('dtDecisao_27=2017-08-08');
        mmTX2.Lines.Add('indDeposito_28=S');
        mmTX2.Lines.Add('SALVARINFOSUSP_24');
        mmTX2.Lines.Add('SALVARS1070');
     end;
    10://S1080
     begin
        mmTX2.Clear;
        mmTX2.Lines.Add('INCLUIRS1080');
        IncluirCamposPadroes;
        mmTX2.Lines.Add('cnpjOpPortuario_13=76062488000739');
        mmTX2.Lines.Add('iniValid_14=2017-08');
        mmTX2.Lines.Add('fimValid_15=');
        mmTX2.Lines.Add('aliqRat_17=2');
        mmTX2.Lines.Add('fap_18=2');
        mmTX2.Lines.Add('aliqRatAjust_19=4');
        mmTX2.Lines.Add('SALVARS1080');
     end;
    11://Carregar Arquivo
    begin
      openDlg.InitialDir := ExtractFilePath(ParamStr(0));
      openDlg.Execute;

      if openDlg.FileName <> '' then
      begin
        vTX2Aux := openDlg.FileName;
        mmTX2.Lines.LoadFromFile(vTX2Aux);
      end;
    end;
  end;

  pcPages.ActivePageIndex := 0;
end;

procedure TfrmESocial.btnXMLClick(Sender: TObject);
begin
  mmoXMLEnvio.Text := eSocial.GerarXMLporTx2(mmTX2.Text);

  pcPages.ActivePageIndex := 1;
end;

procedure TfrmESocial.btnAssinarClick(Sender: TObject);
begin
  mmXMLAssinado.Text := eSocial.AssinarEvento(mmoXMLEnvio.Text);

  pcPages.ActivePageIndex := 2;
end;

procedure TfrmESocial.btnEnviarClick(Sender: TObject);
var
  RetEnvio: IspdRetEnviarLoteEventos;
begin
  RetEnvio := eSocial.EnviarLoteEventos(mmXMLAssinado.Text, StrToInt(cbGrupo.Text));
  mmoXML.Lines.Add('#######################################################');
  mmoXML.Lines.Add('#######################################################');
  mmoXML.Lines.Add('### INCLUIR EVENTO ###');
  mmoXML.Lines.Add('Identificador do Lote: ' + RetEnvio.IdLote);
  mmoXML.Lines.Add('Mensagem de Retorno: ' + RetEnvio.Mensagem);
  edtIdLote.Text := RetEnvio.IdLote;

  pcPages.ActivePageIndex := 3;
end;

procedure TfrmESocial.btnConsultarClick(Sender: TObject);
var
  RetConsulta: IspdRetConsultarLote;
  RetConsultaItem: IspdRetConsultarLoteItem;
  RetConsultaOcorrencia: IspdRetConsultarLoteOcorrencia;
  RetConsultaOcorrenciaEnvio: IspdRetConsultarLoteOcorrenciaEnvio;
  _i, _j, _k, _a, _b, _c, _d, _e: integer;
begin
  if rgTipoEnvio.ItemIndex = 0 then
  RetConsulta := eSocial.ConsultarLoteEventos(edtIdLote.Text)
  else if rgTipoEnvio.ItemIndex = 1 then
  RetConsulta := eSocial.ConsultarIdEvento(edtIdLote.Text)
  else if rgTipoEnvio.ItemIndex = 2 then
  RetConsulta := eSocial.ConsultarEventoPorRecibo(edtIdLote.Text);
  mmoXML.Lines.Add(' ');
  mmoXML.Lines.Add('##################################################');
  mmoXML.Lines.Add('##################################################');
  mmoXML.Lines.Add('### CONSULTA PROTOCOLO ###');
  mmoXML.Lines.Add('Número do Protocolo: ' + RetConsulta.NumeroProtocolo);
  mmoXML.Lines.Add('Mensagem de Retorno: ' + RetConsulta.Mensagem);
  mmoXML.Lines.Add('Status do Lote: ' + RetConsulta.Status);
  mmoXML.Lines.Add('Tempo estimado para conclusão do processamento: ' + RetConsulta.TempoEstimadoConclusao);
  mmoXML.Lines.Add('Id do Lote: ' + RetConsulta.IdLote);
  for _i := 0 to RetConsulta.Count - 1 do
  begin
    RetConsultaItem := RetConsulta.Eventos[_i];
    mmoXML.Lines.Add('    Evento: ' + IntToStr(_i + 1));
    mmoXML.Lines.Add('    Id Evento: ' + RetConsultaItem.IdEvento);
    mmoXML.Lines.Add('    Número Recibo: ' + RetConsultaItem.NumeroRecibo);
    mmoXML.Lines.Add('    Código de Status: ' + RetConsultaItem.cStat);
    mmoXML.Lines.Add('    Mensagem: ' + RetConsultaItem.Mensagem);
    mmoXML.Lines.Add('    Status do Evento: ' + RetConsultaItem.Status);
    if not RetConsultaItem.S5001.IsEmpty then
    begin
      mmoXML.Lines.Add('        ### S5001 ###');
      mmoXML.Lines.Add('        Id: ' + RetConsultaItem.S5001.Id);
      //IdeEvento
      mmoXML.Lines.Add('        nrRecArqBase: ' + RetConsultaItem.S5001.IdeEvento.NrRecArqBase);
      mmoXML.Lines.Add('        indApuracao: ' + RetConsultaItem.S5001.IdeEvento.indApuracao);
      mmoXML.Lines.Add('        perApur: ' + RetConsultaItem.S5001.IdeEvento.perApur);
      //IdeEmpregador
      mmoXML.Lines.Add('        tpInsc: ' + RetConsultaItem.S5001.IdeEmpregador.tpInsc);
      mmoXML.Lines.Add('        nrInsc: ' + RetConsultaItem.S5001.IdeEmpregador.nrInsc);
      //IdeTrabalhador
      mmoXML.Lines.Add('        cpfTrab: ' + RetConsultaItem.S5001.IdeTrabalhador.cpfTrab);
      //ProcJudTrab
      for _a := 0 to RetConsultaItem.S5001.IdeTrabalhador.CountProcJudTrab - 1 do
      begin
        mmoXML.Lines.Add('        NrProcJud: ' + RetConsultaItem.S5001.IdeTrabalhador.ProcJudTrab[_a].NrProcJud);
        mmoXML.Lines.Add('        codSusp: ' + RetConsultaItem.S5001.IdeTrabalhador.ProcJudTrab[_a].codSusp);
      end;
      //InfoCpCalc
      for _a := 0 to RetConsultaItem.S5001.CountInfoCpCalc - 1 do
      begin
        mmoXML.Lines.Add('        tpCR: ' + RetConsultaItem.S5001.InfoCpCalc[_a].tpCR);
        mmoXML.Lines.Add('        vrCpSeg: ' + RetConsultaItem.S5001.InfoCpCalc[_a].vrCpSeg);
        mmoXML.Lines.Add('        vrDescSeg: ' + RetConsultaItem.S5001.InfoCpCalc[_a].vrDescSeg);
      end;
      //IdeEstabLot
      for _a := 0 to RetConsultaItem.S5001.InfoCp.CountIdeEstabLot - 1 do
      begin
        mmoXML.Lines.Add('        vrDescSeg: ' + RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].TpInsc);
        mmoXML.Lines.Add('        nrInsc: ' + RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].nrInsc);
        mmoXML.Lines.Add('        codLotacao: ' + RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].codLotacao);
        //InfoCategIncid
        for _b := 0 to RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].CountInfoCategIncid - 1 do
        begin
          mmoXML.Lines.Add('        vrDescSeg: ' + RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].Matricula);
          mmoXML.Lines.Add('        codCateg: ' + RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].codCateg);
          mmoXML.Lines.Add('        indSimples: ' + RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].indSimples);
          //InfoBaseCS
          for _c := 0 to RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CountInfoBaseCS - 1 do
          begin
            mmoXML.Lines.Add('        Ind13: ' + RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoBaseCS[_c].Ind13);
            mmoXML.Lines.Add('        tpValor: ' + RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoBaseCS[_c].tpValor);
            mmoXML.Lines.Add('        valor: ' + RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoBaseCS[_c].valor);
          end;
          //CalcTerc
          for _c := 0 to RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CountCalcTerc - 1 do
          begin
            mmoXML.Lines.Add('        tpCR: ' + RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CalcTerc[_c].tpCR);
            mmoXML.Lines.Add('        vrCsSegTerc: ' + RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CalcTerc[_c].vrCsSegTerc);
            mmoXML.Lines.Add('        vrDescTerc: ' + RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CalcTerc[_c].vrDescTerc);
          end;
        end;
      end;
    end;
    if not RetConsultaItem.S5002.IsEmpty then
    begin
      mmoXML.Lines.Add('        ### S5002 ###');
      mmoXML.Lines.Add('        Id: ' + RetConsultaItem.S5002.Id);
      //IdeEvento
      mmoXML.Lines.Add('        nrRecArqBase: ' + RetConsultaItem.S5002.IdeEvento.nrRecArqBase);
      mmoXML.Lines.Add('        perApur: ' + RetConsultaItem.S5002.IdeEvento.perApur);

      //IdeEmpregador
      mmoXML.Lines.Add('        tpInsc: ' + RetConsultaItem.S5002.IdeEmpregador.tpInsc);
      mmoXML.Lines.Add('        nrInsc: ' + RetConsultaItem.S5002.IdeEmpregador.nrInsc);


      //IdeTrabalhador
      mmoXML.Lines.Add('        cpfTrab: ' + RetConsultaItem.S5002.IdeTrabalhador.cpfTrab);
      //InfoDep
      mmoXML.Lines.Add('        vrDedDep: ' + RetConsultaItem.S5002.InfoDep.vrDedDep);
      //InfoIrrf
      for _a := 0 to RetConsultaItem.S5002.CountInfoIrrf - 1 do
      begin
        mmoXML.Lines.Add('        codCateg: ' + RetConsultaItem.S5002.InfoIrrf[_a].codCateg);
        mmoXML.Lines.Add('        indResBr: ' + RetConsultaItem.S5002.InfoIrrf[_a].indResBr);
        //BasesIrrf
        for _b := 0 to RetConsultaItem.S5002.InfoIrrf[_a].CountBasesIrrf - 1 do
        begin
          mmoXML.Lines.Add('        tpValor: ' + RetConsultaItem.S5002.InfoIrrf[_a].BasesIrrf[_b].tpValor);
          mmoXML.Lines.Add('        Valor: ' + RetConsultaItem.S5002.InfoIrrf[_a].BasesIrrf[_b].Valor);
        end;
        //Irrf
        for _b := 0 to RetConsultaItem.S5002.InfoIrrf[_a].CountIrrf - 1 do
        begin
          mmoXML.Lines.Add('        tpCR: ' + RetConsultaItem.S5002.InfoIrrf[_a].Irrf[_b].tpCR);
          mmoXML.Lines.Add('        vrIrrfDesc: ' + RetConsultaItem.S5002.InfoIrrf[_a].Irrf[_b].vrIrrfDesc);
        end;
        //IdePais
        mmoXML.Lines.Add('        codPais: ' + RetConsultaItem.S5002.InfoIrrf[_a].IdePgtoExt.IdePais.codPais);
        mmoXML.Lines.Add('        indNIF: ' + RetConsultaItem.S5002.InfoIrrf[_a].IdePgtoExt.IdePais.indNIF);
        mmoXML.Lines.Add('        nifBenef: ' + RetConsultaItem.S5002.InfoIrrf[_a].IdePgtoExt.IdePais.nifBenef);
        //EndExt
        mmoXML.Lines.Add('        dscLograd: ' + RetConsultaItem.S5002.InfoIrrf[_a].IdePgtoExt.EndExt.dscLograd);
        mmoXML.Lines.Add('        nrLograd: ' + RetConsultaItem.S5002.InfoIrrf[_a].IdePgtoExt.EndExt.nrLograd);
        mmoXML.Lines.Add('        complem: ' + RetConsultaItem.S5002.InfoIrrf[_a].IdePgtoExt.EndExt.complem);
        mmoXML.Lines.Add('        bairro: ' + RetConsultaItem.S5002.InfoIrrf[_a].IdePgtoExt.EndExt.bairro);
        mmoXML.Lines.Add('        nmCid: ' + RetConsultaItem.S5002.InfoIrrf[_a].IdePgtoExt.EndExt.nmCid);
        mmoXML.Lines.Add('        codPostal: ' + RetConsultaItem.S5002.InfoIrrf[_a].IdePgtoExt.EndExt.codPostal);
      end;
    end;
    if not RetConsultaItem.S5003.IsEmpty then
    begin
      mmoXML.Lines.Add('        ### S5003 ###');
      mmoXML.Lines.Add('        Id: ' + RetConsultaItem.S5003.Id);
      // IdeEvento
      mmoXML.Lines.Add('        NrRecArqBase: ' +
        RetConsultaItem.S5003.IdeEvento.NrRecArqBase);
      mmoXML.Lines.Add('        perApur: ' +
        RetConsultaItem.S5003.IdeEvento.perApur);

      // IdeEmpregador
      mmoXML.Lines.Add('        tpInsc: ' +
        RetConsultaItem.S5003.IdeEmpregador.tpInsc);
      mmoXML.Lines.Add('        nrInsc: ' +
        RetConsultaItem.S5003.IdeEmpregador.nrInsc);

      // ideTrabalhador

      mmoXML.Lines.Add('        CpfTrab: ' +
        RetConsultaItem.S5003.IdeTrabalador.cpfTrab);
      mmoXML.Lines.Add('        NisTrab: ' +
        RetConsultaItem.S5003.IdeTrabalador.NisTrab);

      // InfoFGTS
      mmoXML.Lines.Add('        InfoFGTS: ' +
        RetConsultaItem.S5003.InfoFGTS.DtVenc);
      mmoXML.Lines.Add('           CpfTrab: ' +
        RetConsultaItem.S5003.InfoFGTS.DtVenc);

      for _a := 0 to RetConsultaItem.S5003.InfoFGTS.CountIdeEstabLot - 1 do
      begin
        mmoXML.Lines.Add('           IdeEstabLot: ');
        mmoXML.Lines.Add('            TpInsc: ' +
          RetConsultaItem.S5003.InfoFGTS.IdeEstabLot[_a].tpInsc);
        mmoXML.Lines.Add('            NrInsc: ' +
          RetConsultaItem.S5003.InfoFGTS.IdeEstabLot[_a].nrInsc);
        mmoXML.Lines.Add('            CodLotacao: ' +
          RetConsultaItem.S5003.InfoFGTS.IdeEstabLot[_a].codLotacao);
        for _b := 0 to RetConsultaItem.S5003.InfoFGTS.IdeEstabLot[_a]
          .CountInfoTrabFGTS - 1 do
        begin
          mmoXML.Lines.Add('            IdeEstabLot: ');
          mmoXML.Lines.Add('              Matricula: ' +
            RetConsultaItem.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS[_b]
            .Matricula);
          mmoXML.Lines.Add('              CodCateg: ' +
            RetConsultaItem.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS[_b]
            .codCateg);
          mmoXML.Lines.Add('              DtAdm: ' +
            RetConsultaItem.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS
            [_b].DtAdm);
          mmoXML.Lines.Add('              DtDeslig: ' +
            RetConsultaItem.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS[_b]
            .DtDeslig);
          mmoXML.Lines.Add('              DtInicio: ' +
            RetConsultaItem.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS[_b]
            .DtInicio);
          mmoXML.Lines.Add('              MtvDeslig: ' +
            RetConsultaItem.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS[_b]
            .MtvDeslig);
          mmoXML.Lines.Add('              DtTerm: ' +
            RetConsultaItem.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS
            [_b].DtTerm);
          mmoXML.Lines.Add('              MtvDesligTSV: ' +
            RetConsultaItem.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS[_b]
            .MtvDesligTSV);

          for _c := 0 to RetConsultaItem.S5003.InfoFGTS.IdeEstabLot[_a]
            .InfoTrabFGTS[_b].CountInfoBaseFGTS - 1 do
          begin
            mmoXML.Lines.Add('               InfoBaseFGTS: ');
            for _d := 0 to RetConsultaItem.S5003.InfoFGTS.IdeEstabLot[_a]
              .InfoTrabFGTS[_b].InfoBaseFGTS[_c].CountBasePerApur - 1 do
            begin
              mmoXML.Lines.Add('                BasePerApur: ');
              mmoXML.Lines.Add('                 tpValor: ' +
                RetConsultaItem.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS[_b]
                .InfoBaseFGTS[_c].BasePerApur[_d].tpValor);
              mmoXML.Lines.Add('                 RemFGTS: ' +
                RetConsultaItem.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS[_b]
                .InfoBaseFGTS[_c].BasePerApur[_d].RemFGTS);

            end;
            for _d := 0 to RetConsultaItem.S5003.InfoFGTS.IdeEstabLot[_a]
              .InfoTrabFGTS[_b].InfoBaseFGTS[_c].CountInfoBasePerAntE - 1 do
            begin
              mmoXML.Lines.Add('                InfoBasePerAntE: ');
              mmoXML.Lines.Add('                 PerRef: ' +
                RetConsultaItem.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS[_b]
                .InfoBaseFGTS[_c].InfoBasePerAntE[_d].PerRef);

              for _e := 0 to RetConsultaItem.S5003.InfoFGTS.IdeEstabLot[_a]
                .InfoTrabFGTS[_b].InfoBaseFGTS[_c].InfoBasePerAntE[_d]
                .CountBasePerAntE - 1 do
              begin
                mmoXML.Lines.Add('                 BasePerAntE: ');
                mmoXML.Lines.Add('                  TpValorE: ' +
                  RetConsultaItem.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS
                  [_b].InfoBaseFGTS[_c].InfoBasePerAntE[_d].BasePerAntE[_e]
                  .TpValorE);

                mmoXML.Lines.Add('                  RemFGTSE: ' +
                  RetConsultaItem.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS
                  [_b].InfoBaseFGTS[_c].InfoBasePerAntE[_d].BasePerAntE[_e]
                  .RemFGTSE);

              end;

            end;

          end;

        end;

      end;

      for _a := 0 to RetConsultaItem.S5003.InfoFGTS.CountInfoDpsFGTS - 1 do
      begin
        mmoXML.Lines.Add('           InfoDpsFGTS: ');
        for _b := 0 to RetConsultaItem.S5003.InfoFGTS.InfoDpsFGTS[_a]
          .CountInfoTrabDps - 1 do
        begin
          mmoXML.Lines.Add('            InfoTrabDps: ');
          mmoXML.Lines.Add('             Matricula: ' +
            RetConsultaItem.S5003.InfoFGTS.InfoDpsFGTS[_a].InfoTrabDps[_b]
            .Matricula);
          mmoXML.Lines.Add('             codCateg: ' +
            RetConsultaItem.S5003.InfoFGTS.InfoDpsFGTS[_a].InfoTrabDps[_b]
            .codCateg);
          for _c := 0 to RetConsultaItem.S5003.InfoFGTS.InfoDpsFGTS[_a]
            .InfoTrabDps[_b].CountDpsPerApur - 1 do
          begin
            mmoXML.Lines.Add('            DpsPerApur: ');
            mmoXML.Lines.Add('             TpDps: ' +
              RetConsultaItem.S5003.InfoFGTS.InfoDpsFGTS[_a].InfoTrabDps[_b]
              .DpsPerApur[_c].TpDps);
            mmoXML.Lines.Add('             DpsFGTS: ' +
              RetConsultaItem.S5003.InfoFGTS.InfoDpsFGTS[_a].InfoTrabDps[_b]
              .DpsPerApur[_c].DpsFGTS);
          end;
          for _c := 0 to RetConsultaItem.S5003.InfoFGTS.InfoDpsFGTS[_a]
            .InfoTrabDps[_b].CountInfoDpsPerAntE - 1 do
          begin
            mmoXML.Lines.Add('            InfoDpsPerAntE: ');
            mmoXML.Lines.Add('             PerRef: ' +
              RetConsultaItem.S5003.InfoFGTS.InfoDpsFGTS[_a].InfoTrabDps[_b]
              .InfoDpsPerAntE[_c].PerRef);

            for _d := 0 to RetConsultaItem.S5003.InfoFGTS.InfoDpsFGTS[_a]
              .InfoTrabDps[_b].InfoDpsPerAntE[_c].CountDpsPerAntE - 1 do
            begin
              mmoXML.Lines.Add('             DpsPerAntE: ');
              mmoXML.Lines.Add('              TpDpsE: ' +
                RetConsultaItem.S5003.InfoFGTS.InfoDpsFGTS[_a].InfoTrabDps[_b]
                .InfoDpsPerAntE[_c].DpsPerAntE[_d].TpDpsE);
              mmoXML.Lines.Add('              DpsFGTSE: ' +
                RetConsultaItem.S5003.InfoFGTS.InfoDpsFGTS[_a].InfoTrabDps[_b]
                .InfoDpsPerAntE[_c].DpsPerAntE[_d].DpsFGTSE);
            end;

          end;

        end;

      end;
    end;
    if not RetConsultaItem.S5011.IsEmpty then
    begin
      mmoXML.Lines.Add('        ### S5011 ###');
      mmoXML.Lines.Add('        Id: ' + RetConsultaItem.S5011.Id);
      //IdeEvento
      mmoXML.Lines.Add('        indApuracao: ' + RetConsultaItem.S5011.IdeEvento.indApuracao);
      mmoXML.Lines.Add('        perApur: ' + RetConsultaItem.S5011.IdeEvento.perApur);
      //IdeEmpregador
      mmoXML.Lines.Add('        tpInsc: ' + RetConsultaItem.S5011.IdeEmpregador.tpInsc);
      mmoXML.Lines.Add('        nrInsc: ' + RetConsultaItem.S5011.IdeEmpregador.nrInsc);
      //InfoCS
      mmoXML.Lines.Add('        nrRecArqBase: ' + RetConsultaItem.S5011.InfoCS.nrRecArqBase);
      mmoXML.Lines.Add('        indExistInfo: ' + RetConsultaItem.S5011.InfoCS.indExistInfo);
      //InfoCPSeg
      mmoXML.Lines.Add('        vrDescCP: ' + RetConsultaItem.S5011.InfoCS.InfoCPSeg.vrDescCP);
      mmoXML.Lines.Add('        vrCpSeg: ' + RetConsultaItem.S5011.InfoCS.InfoCPSeg.vrCpSeg);
      //InfoContrib
      mmoXML.Lines.Add('        classTrib: ' + RetConsultaItem.S5011.InfoCS.InfoContrib.classTrib);
      //InfoPJ
      mmoXML.Lines.Add('        indCoop: ' + RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.indCoop);
      mmoXML.Lines.Add('        indConstr: ' + RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.indConstr);
      mmoXML.Lines.Add('        indSubstPatr: ' + RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.indSubstPatr);
      mmoXML.Lines.Add('        percRedContrib: ' + RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.percRedContrib);
      //InfoAtConc
      mmoXML.Lines.Add('        fatorMes: ' + RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.InfoAtConc.fatorMes);
      mmoXML.Lines.Add('        fator13: ' + RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.InfoAtConc.fator13);
      //IdeEstab
      for _a := 0 to RetConsultaItem.S5011.InfoCS.CountIdeEstab - 1 do
      begin
        mmoXML.Lines.Add('        tpInsc: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].tpInsc);
        mmoXML.Lines.Add('        nrInsc: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].nrInsc);
        //InfoEstab
        mmoXML.Lines.Add('        cnaePrep: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoEstab.cnaePrep);
        mmoXML.Lines.Add('        aliqRat: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoEstab.aliqRat);
        mmoXML.Lines.Add('        fap: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoEstab.fap);
        mmoXML.Lines.Add('        aliqRatAjust: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoEstab.aliqRatAjust);
        //InfoComplObra
        mmoXML.Lines.Add('        indSubstPatrObra: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoEstab.InfoComplObra.indSubstPatrObra);
        //IdeLotacao
        for _b := 0 to RetConsultaItem.S5011.InfoCS.IdeEstab[_a].CountIdeLotacao - 1 do
        begin
          mmoXML.Lines.Add('        codLotacao: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].codLotacao);
          mmoXML.Lines.Add('        fpas: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].fpas);
          mmoXML.Lines.Add('        codTercs: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].codTercs);
          mmoXML.Lines.Add('        codTercsSusp: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].codTercsSusp);
          //InfoTercSusp
          for _c := 0 to RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].CountInfoTercSusp - 1 do
          begin
            mmoXML.Lines.Add('        codTerc: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoTercSusp[_c].codTerc);
          end;
          //InfoEmprParcial
          mmoXML.Lines.Add('        tpInscContrat: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoEmprParcial.tpInscContrat);
          mmoXML.Lines.Add('        nrInscContrat: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoEmprParcial.nrInscContrat);
          mmoXML.Lines.Add('        tpInscProp: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoEmprParcial.tpInscProp);
          mmoXML.Lines.Add('        nrInscProp: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoEmprParcial.nrInscProp);
          //DadosOpPort
          mmoXML.Lines.Add('        cnpjOpPortuario: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].DadosOpPort.cnpjOpPortuario);
          mmoXML.Lines.Add('        aliqRat: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].DadosOpPort.aliqRat);
          mmoXML.Lines.Add('        fap: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].DadosOpPort.fap);
          mmoXML.Lines.Add('        aliqRatAjust: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].DadosOpPort.aliqRatAjust);
          //BasesRemun
          for _c := 0 to RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].CountBasesRemun - 1 do
          begin
            mmoXML.Lines.Add('        indIncid: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].indIncid);
            mmoXML.Lines.Add('        codCateg: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].codCateg);
            //BasesCp
            mmoXML.Lines.Add('        vrBcCp00: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrBcCp00);
            mmoXML.Lines.Add('        vrBcCp15: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrBcCp15);
            mmoXML.Lines.Add('        vrBcCp20: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrBcCp20);
            mmoXML.Lines.Add('        vrBcCp25: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrBcCp25);
            mmoXML.Lines.Add('        vrSuspBcCp00: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSuspBcCp00);
            mmoXML.Lines.Add('        vrSuspBcCp15: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSuspBcCp15);
            mmoXML.Lines.Add('        vrSuspBcCp20: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSuspBcCp20);
            mmoXML.Lines.Add('        vrSuspBcCp25: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSuspBcCp25);
            mmoXML.Lines.Add('        vrDescSest: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrDescSest);
            mmoXML.Lines.Add('        vrCalcSest: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrCalcSest);
            mmoXML.Lines.Add('        vrDescSenat: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrDescSenat);
            mmoXML.Lines.Add('        vrCalcSenat: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrCalcSenat);
            mmoXML.Lines.Add('        vrSalFam: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSalFam);
            mmoXML.Lines.Add('        vrSalMat: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSalMat);
            mmoXML.Lines.Add('        vrBcCp00VA: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrBcCp00VA);
            mmoXML.Lines.Add('        vrBcCp15VA: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrBcCp15VA);
            mmoXML.Lines.Add('        vrBcCp20VA: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrBcCp20VA);
            mmoXML.Lines.Add('        vrBcCp25VA: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrBcCp25VA);
            mmoXML.Lines.Add('        vrSuspBcCp00VA: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSuspBcCp00VA);
            mmoXML.Lines.Add('        vrSuspBcCp15VA: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSuspBcCp15VA);
            mmoXML.Lines.Add('        vrSuspBcCp20VA: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSuspBcCp20VA);
            mmoXML.Lines.Add('        vrSuspBcCp25VA: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSuspBcCp25VA);
          end;
          //BasesAvNPort
          mmoXML.Lines.Add('        vrBcCp00: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.vrBcCp00);
          mmoXML.Lines.Add('        vrBcCp15: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.vrBcCp15);
          mmoXML.Lines.Add('        vrBcCp20: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.vrBcCp20);
          mmoXML.Lines.Add('        vrBcCp25: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.vrBcCp25);
          mmoXML.Lines.Add('        vrBcCp13: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.vrBcCp13);
          mmoXML.Lines.Add('        vrBcFgts: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.vrBcFgts);
          mmoXML.Lines.Add('        vrDescCP: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.vrDescCP);
          //InfoSubstPatrOpPort
          for _c := 0 to RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].CountInfoSubstPatrOpOrt - 1 do
          begin
            mmoXML.Lines.Add('        cnpjOpPortuario: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoSubstPatrOpPort[_c].cnpjOpPortuario);
          end;
        end;
        //BasesAquis
        for _b := 0 to RetConsultaItem.S5011.InfoCS.IdeEstab[_a].CountBasesAquis - 1 do
        begin
          mmoXML.Lines.Add('        indAquis: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].indAquis);
          mmoXML.Lines.Add('        vlrAquis: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vlrAquis);
          mmoXML.Lines.Add('        vrCPDescPR: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrCPDescPR);
          mmoXML.Lines.Add('        vrCPNRet: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrCPNRet);
          mmoXML.Lines.Add('        vrRatNRet: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrRatNRet);
          mmoXML.Lines.Add('        vrSenarNRet: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrSenarNRet);
          mmoXML.Lines.Add('        vrCPCalcPR: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrCPCalcPR);
          mmoXML.Lines.Add('        vrRatDescPR: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrRatDescPR);
          mmoXML.Lines.Add('        vrRatCalcPR: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrRatCalcPR);
          mmoXML.Lines.Add('        vrSenarDesc: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrSenarDesc);
          mmoXML.Lines.Add('        vrSenarCalc: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrSenarCalc);
        end;
        //BasesComerc
        for _b := 0 to RetConsultaItem.S5011.InfoCS.IdeEstab[_a].CountBasesComerc - 1 do
        begin
          mmoXML.Lines.Add('        indComerc: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b].indComerc);
          mmoXML.Lines.Add('        vrBcComPR: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b].vrBcComPR);
          mmoXML.Lines.Add('        vrCPSusp: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b].vrCPSusp);
          mmoXML.Lines.Add('        vrRatSusp: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b].vrRatSusp);
          mmoXML.Lines.Add('        vrSenarSusp: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b].vrSenarSusp);
        end;
        //InfoCREstab
        for _b := 0 to RetConsultaItem.S5011.InfoCS.IdeEstab[_a].CountInfoCREstab - 1 do
        begin
          mmoXML.Lines.Add('        tpCR: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoCREstab[_b].tpCR);
          mmoXML.Lines.Add('        vrCR: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoCREstab[_b].vrCR);
          mmoXML.Lines.Add('        vrSuspCR: ' + RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoCREstab[_b].vrSuspCR);
        end;
      end;
      //infoCRContrib
      for _a := 0 to RetConsultaItem.S5011.InfoCS.CountInfoCRContrib - 1 do
      begin
        mmoXML.Lines.Add('        tpCR: ' + RetConsultaItem.S5011.InfoCS.infoCRContrib[_a].tpCR);
        mmoXML.Lines.Add('        vrCR: ' + RetConsultaItem.S5011.InfoCS.infoCRContrib[_a].vrCR);
        mmoXML.Lines.Add('        vrCRSusp: ' + RetConsultaItem.S5011.InfoCS.infoCRContrib[_a].vrCRSusp);
      end;
    end;
    if not RetConsultaItem.S5012.IsEmpty then
    begin
      mmoXML.Lines.Add('        ### S5012 ###');
      mmoXML.Lines.Add('        Id: ' + RetConsultaItem.S5012.Id);
      //IdeEvento
      mmoXML.Lines.Add('        perApur: ' + RetConsultaItem.S5012.IdeEvento.perApur);
      //IdeEmpregador
      mmoXML.Lines.Add('        tpInsc: ' + RetConsultaItem.S5012.IdeEmpregador.tpInsc);
      mmoXML.Lines.Add('        nrInsc: ' + RetConsultaItem.S5012.IdeEmpregador.nrInsc);
      //InfoIrrf
      mmoXML.Lines.Add('        nrRecArqBase: ' + RetConsultaItem.S5012.InfoIrrf.nrRecArqBase);
      mmoXML.Lines.Add('        indExistInfo: ' + RetConsultaItem.S5012.InfoIrrf.indExistInfo);
      //InfoCRContrib
      for _a := 0 to RetConsultaItem.S5012.InfoIrrf.CountInfoCRContrib - 1 do
      begin
        mmoXML.Lines.Add('        tpCR: ' + RetConsultaItem.S5012.InfoIrrf.InfoCRContrib[_a].tpCR);
        mmoXML.Lines.Add('        vrCR: ' + RetConsultaItem.S5012.InfoIrrf.InfoCRContrib[_a].vrCR);
      end;
    end;
    if not RetConsultaItem.S5013.IsEmpty then
    begin
      mmoXML.Lines.Add('        ### S5013 ###');
      mmoXML.Lines.Add('        Id: ' + RetConsultaItem.S5013.Id);
      // IdeEvento
      mmoXML.Lines.Add('        perApur: ' +
        RetConsultaItem.S5013.IdeEvento.perApur);
      // IdeEmpregador
      mmoXML.Lines.Add('        tpInsc: ' +
        RetConsultaItem.S5013.IdeEmpregador.tpInsc);
      mmoXML.Lines.Add('        nrInsc: ' +
        RetConsultaItem.S5013.IdeEmpregador.nrInsc);
      // infoFGTS
      mmoXML.Lines.Add('        nrRecArqBase: ' +
        RetConsultaItem.S5013.InfoFGTS.NrRecArqBase);
      mmoXML.Lines.Add('        indExistInfo: ' +
        RetConsultaItem.S5013.InfoFGTS.indExistInfo);
      // infoBaseFGTS
      mmoXML.Lines.Add('        infoBaseFGTS: ');
      // basePerApur
      mmoXML.Lines.Add('          basePerApur: <List>');
      for _a := 0 to RetConsultaItem.S5013.InfoFGTS.InfoBaseFGTS.
        CountBasePerApur - 1 do
      begin
        mmoXML.Lines.Add('            tpValor: ' +
          RetConsultaItem.S5013.InfoFGTS.InfoBaseFGTS.BasePerApur[_a].tpValor);
        mmoXML.Lines.Add('            baseFGTS: ' +
          RetConsultaItem.S5013.InfoFGTS.InfoBaseFGTS.BasePerApur[_a].baseFGTS);
        mmoXML.Lines.Add('            --');
      end;
      // infoBaseFGTS
      mmoXML.Lines.Add('          infoBaseFGTS: <List>');
      for _a := 0 to RetConsultaItem.S5013.InfoFGTS.InfoBaseFGTS.
        CountInfoBasePerAntE - 1 do
      begin
        // InfoBasePerAntE
        mmoXML.Lines.Add('            perRef: ' +
          RetConsultaItem.S5013.InfoFGTS.InfoBaseFGTS.InfoBasePerAntE
          [_a].PerRef);
        mmoXML.Lines.Add('            basePerAntE: <List>');
        for _b := 0 to RetConsultaItem.S5013.InfoFGTS.InfoBaseFGTS.
          InfoBasePerAntE[_a].CountBasePerAntE - 1 do
        begin
          mmoXML.Lines.Add('              tpValorE: ' +
            RetConsultaItem.S5013.InfoFGTS.InfoBaseFGTS.InfoBasePerAntE[_a]
            .BasePerAntE[_b].TpValorE);
          mmoXML.Lines.Add('              baseFGTSE: ' +
            RetConsultaItem.S5013.InfoFGTS.InfoBaseFGTS.InfoBasePerAntE[_a]
            .BasePerAntE[_b].baseFGTSE);
          mmoXML.Lines.Add('              --');
        end;
      end;
      // infoDpsFGTS
      mmoXML.Lines.Add('          infoDpsFGTS:');
      // dpsPerApur
      for _a := 0 to RetConsultaItem.S5013.InfoFGTS.InfoDpsFGTS.
        CountDpsPerApur - 1 do
      begin
        mmoXML.Lines.Add('            TpDps: ' +
          RetConsultaItem.S5013.InfoFGTS.InfoDpsFGTS.DpsPerApur[_a].TpDps);
        mmoXML.Lines.Add('            VrFGTS: ' +
          RetConsultaItem.S5013.InfoFGTS.InfoDpsFGTS.DpsPerApur[_a].VrFGTS);
        mmoXML.Lines.Add('            --');
      end;
      // infoDpsPerAntE
      mmoXML.Lines.Add('          infoDpsPerAntE: <List>');
      for _a := 0 to RetConsultaItem.S5013.InfoFGTS.InfoDpsFGTS.
        CountInfoDpsPerAntE - 1 do
      begin
        mmoXML.Lines.Add('            perRef: ' +
          RetConsultaItem.S5013.InfoFGTS.InfoDpsFGTS.InfoDpsPerAntE[_a].PerRef);
        // basePerAntE
        mmoXML.Lines.Add('            basePerAntE: <List>');
        for _b := 0 to RetConsultaItem.S5013.InfoFGTS.InfoDpsFGTS.InfoDpsPerAntE
          [_a].CountDpsPerAntE - 1 do
        begin
          mmoXML.Lines.Add('              TpDpsE: ' +
            RetConsultaItem.S5013.InfoFGTS.InfoDpsFGTS.InfoDpsPerAntE[_a]
            .DpsPerAntE[_b].TpDpsE);
          mmoXML.Lines.Add('              vrFGTSE: ' +
            RetConsultaItem.S5013.InfoFGTS.InfoDpsFGTS.InfoDpsPerAntE[_a]
            .DpsPerAntE[_b].VrFGTSE);
          mmoXML.Lines.Add('              --');
        end;
      end;
    end;
    for _j := 0 to RetConsultaItem.Count - 1 do
    begin
      RetConsultaOcorrencia := RetConsultaItem.Ocorrencias[_j];
      mmoXML.Lines.Add('        Ocorrencia: ' + IntToStr(_j + 1));
      mmoXML.Lines.Add('        Código: ' + RetConsultaOcorrencia.Codigo);
      mmoXML.Lines.Add('        Descrição: ' + RetConsultaOcorrencia.Descricao);
      mmoXML.Lines.Add('        Tipo: ' + RetConsultaOcorrencia.Tipo);
      mmoXML.Lines.Add('        Localização: ' + RetConsultaOcorrencia.Localizacao);
    end;
  end;
  for _k := 0 to RetConsulta.CountOcorrencias - 1 do
  begin
    RetConsultaOcorrenciaEnvio := RetConsulta.Ocorrencias[_k];
    mmoXML.Lines.Add('    Codigo: ' + RetConsultaOcorrenciaEnvio.Codigo);
    mmoXML.Lines.Add('    Tipo: ' + RetConsultaOcorrenciaEnvio.Tipo);
    mmoXML.Lines.Add('    Localização: ' + RetConsultaOcorrenciaEnvio.Localizacao);
    mmoXML.Lines.Add('    Descrição: ' + RetConsultaOcorrenciaEnvio.Descricao);
  end;

  mmEnviado.Text := RetConsulta.XmlEnviado;
  mmRetornado.Text := RetConsulta.XmlRetorno;

  pcPages.ActivePageIndex := 3;
end;

procedure TfrmESocial.Button1Click(Sender: TObject);
begin
  if edtIdLote.Text <> '' then
    eSocial.ReconsultarLoteSefaz(edtIdLote.Text);

  btnConsultar.OnClick(owner);
end;

procedure TfrmESocial.FormShow(Sender: TObject);
begin
  edtCnpjSH.Text          := '00000000000000';
  edtTokenSH.Text         := '';
  edtCnpjTransmissor.Text := '00000000000000';
  edtCnpjEmpregador.Text  := '00000000000000';
end;

end.
