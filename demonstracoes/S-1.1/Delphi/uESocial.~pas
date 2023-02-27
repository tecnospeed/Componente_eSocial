unit uESocial;
interface
uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  ExtCtrls, ESocialS11ClientX_TLB, ComCtrls;
type
  TfrmeSocialS = class(TForm)
    edtCnpjSH: TLabeledEdit;
    edtTokenSH: TLabeledEdit;
    cbAmbiente: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    cbVersaoManual: TComboBox;
    edtCnpjTransmissor: TLabeledEdit;
    edtCnpjEmpregador: TLabeledEdit;
    Label3: TLabel;
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
    lbl1: TLabel;
    rgTpConsulta: TRadioGroup;
    pgc1: TPageControl;
    tsRetorno: TTabSheet;
    tsXmlEnvio: TTabSheet;
    tsXmlRetorno: TTabSheet;
    mmoRetorno: TMemo;
    mmoXmlEnvio: TMemo;
    mmoXmlRetorno: TMemo;
    txtPincode: TEdit;
    Button1: TButton;
    Label4: TLabel;
    btnBaixarXmlEventoLote: TButton;
    edtIdEvento: TLabeledEdit;
    chkTelemetria: TCheckBox;
    btnConsultarIdsEventoLote: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfigurarClick(Sender: TObject);
    procedure btnTx2Click(Sender: TObject);
    procedure btnXMLClick(Sender: TObject);
    procedure btnAssinarClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnBaixarXmlEventoLoteClick(Sender: TObject);
    procedure btnConsultarIdsEventoLoteClick(Sender: TObject);
    { Private declarations }
  public
    eSocial: TspdESocialS11ClientX;
    { Public declarations }
  end;
var
  frmeSocialS: TfrmeSocialS;
implementation

{$R *.dfm}
procedure TfrmeSocialS.FormCreate(Sender: TObject);
begin
  eSocial := TspdESocialS11ClientX.Create(nil);
  eSocial.DiagnosticMode := False;
end;
procedure TfrmeSocialS.FormDestroy(Sender: TObject);
begin
  eSocial.Free;
end;
procedure TfrmeSocialS.FormShow(Sender: TObject);
begin
  frmeSocialS.Caption := 'eSocial - TecnoSpeed - ' + eSocial.Versao;

  eSocial.ConfigurarSoftwareHouse(edtCnpjSH.Text, edtTokenSH.Text);

  cbVersaoManual.Items.Text := eSocial.ListarVersaoManual(#13#10);
  cbCertificado.Items.Text := eSocial.ListarCertificados(#13#10);
  cbVersaoManual.ItemIndex := 0;
  cbCertificado.ItemIndex := 0;
end;
procedure TfrmeSocialS.btnAssinarClick(Sender: TObject);
begin
  mmoRetorno.Text := eSocial.AssinarEvento(mmoRetorno.Text);
end;
procedure TfrmeSocialS.btnBaixarXmlEventoLoteClick(Sender: TObject);
var
  RetBaixarXmlEventoLote: IspdS11RetBaixarXmlEventoLote;
begin
  RetBaixarXmlEventoLote := eSocial.BaixarXmlEventoLote(edtIdLote.Text, edtIdEvento.Text);
  mmoRetorno.Lines.Clear;
  mmoRetorno.Lines.Add('### BAIXA XML EVENTO LOTE ###');
  mmoRetorno.Lines.Add('Mensagem de Retorno: ' + RetBaixarXmlEventoLote.Mensagem);
  mmoRetorno.Lines.Add('XML Evento: ' + RetBaixarXmlEventoLote.XmlEvento);
end;

procedure TfrmeSocialS.btnConfigurarClick(Sender: TObject);
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
  // eSocial.CaminhoCertificado := 'Caminho do Certificado' Utilizado para passar o Caminho do .pfx do certificado.
  // eSocial.SenhaCertificado := 'Senha do certificado' Utilizado caso o Caminho Certificado seja preenchido.
  // eSocial.Pincode := 'Senha do certificado A3'; Senha do certificado A3 quando utilizado.
  // eSocial.ProxyServidor := 'Servidor com porta';  Utilizado quando existe proxy na rede a ser utilizada
  // eSocial.ProxyUsuario := 'Usuario do Proxy'; Utilizado quando existe proxy na rede a ser utilizada
  // eSocial.ProxySenha := 'Senha do Proxy';  Utilizado quando existe proxy na rede a ser utilizada
  eSocial.DiretorioTemplates := edtTemplates.Text;
  eSocial.DiretorioEsquemas := edtEsquemas.Text;
  eSocial.ConfigurarSoftwareHouse(edtCnpjSH.Text, edtTokenSH.Text);
  eSocial.CpfCnpjTransmissor := edtCnpjTransmissor.Text;
  eSocial.CpfCnpjEmpregador := edtCnpjEmpregador.Text;
  if cbAmbiente.Text = '1 - Produção' then
    eSocial.Ambiente := akProducao;
  if cbAmbiente.Text = '2 - Homologação' then
    eSocial.Ambiente := akPreProducaoReais;
end;
procedure TfrmeSocialS.btnConsultarClick(Sender: TObject);
var
  _RetConsulta: IspdS11RetConsultarLote;
  _RetConsultaItem: IspdS11RetConsultarLoteItem;
  _RetConsultaOcorrencia: IspdS11RetConsultarLoteOcorrencia;
  _RetConsultaOcorrenciaEnvio: IspdS11RetConsultarLoteOcorrenciaEnvio;
  _i, _j, _k : integer;

  procedure preencher_S5001;
  var
    _a, _b, _c, _d: integer;
  begin
    if not _RetConsultaItem.S5001.IsEmpty then
    begin
      mmoRetorno.Lines.Add('### S5001 ###');
      mmoRetorno.Lines.Add(' Id: ' + _RetConsultaItem.S5001.Id);
      mmoRetorno.Lines.Add('');

      // Identificação do evento de retorno.
      mmoRetorno.Lines.Add('IdeEvento');
      mmoRetorno.Lines.Add(' nrRecArqBase: ' + _RetConsultaItem.S5001.IdeEvento.NrRecArqBase);
      mmoRetorno.Lines.Add('  indApuracao: ' + _RetConsultaItem.S5001.IdeEvento.indApuracao);
      mmoRetorno.Lines.Add('      perApur: ' + _RetConsultaItem.S5001.IdeEvento.perApur);
      mmoRetorno.Lines.Add('');

      // Informações de identificação do empregador.
      mmoRetorno.Lines.Add('IdeEmpregador');
      mmoRetorno.Lines.Add(' tpInsc: ' + _RetConsultaItem.S5001.IdeEmpregador.tpInsc);
      mmoRetorno.Lines.Add(' nrInsc: ' + _RetConsultaItem.S5001.IdeEmpregador.nrInsc);
      mmoRetorno.Lines.Add('');

      // Identificação do trabalhador.
      mmoRetorno.Lines.Add('IdeTrabalhador');
      mmoRetorno.Lines.Add(' cpfTrab: ' + _RetConsultaItem.S5001.IdeTrabalhador.cpfTrab);
      mmoRetorno.Lines.Add('');

      //infoCompl VAZIO

      //Grupo de informações da sucessão de vínculo trabalhista.
      mmoRetorno.Lines.Add('sucessaoVinc');
      mmoRetorno.Lines.Add('    tpInsc: ' + _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.SucessaoVinc.TpInsc);
      mmoRetorno.Lines.Add('    nrInsc: ' + _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.SucessaoVinc.nrInsc);
      mmoRetorno.Lines.Add(' matricAnt: ' + _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.SucessaoVinc.matricAnt);
      mmoRetorno.Lines.Add('     dtAdm: ' + _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.SucessaoVinc.dtAdm);
      mmoRetorno.Lines.Add('');

      // Informações relativas ao trabalho intermitente.
      for _a := 0 to _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.CountInfoInterm - 1 do
      begin
        mmoRetorno.Lines.Add('infoInterm');
        mmoRetorno.Lines.Add(' dia: ' + _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.InfoInterm[_a].dia);
        mmoRetorno.Lines.Add('');
      end;

      // Informações complementares contratuais do trabalhador.
      for _a := 0 to _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.CountInfoComplCont - 1 do
      begin
        mmoRetorno.Lines.Add('infoComplCont');
        mmoRetorno.Lines.Add('       codCBO: ' + _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.InfoComplCont[_a].CodCBO);
        mmoRetorno.Lines.Add(' natAtividade: ' + _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.InfoComplCont[_a].NatAtividade);
        mmoRetorno.Lines.Add('  qtdDiasTrab: ' + _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.InfoComplCont[_a].QtdDiasTrab);
        mmoRetorno.Lines.Add('');
      end;

      // Informações sobre processos judiciais do trabalhador com decisão favorável quanto à não incidência ou alterações na incidência de contribuição previdenciária.
      for _a := 0 to _RetConsultaItem.S5001.IdeTrabalhador.CountProcJudTrab - 1 do
      begin
        mmoRetorno.Lines.Add('ProcJudTrab');
        mmoRetorno.Lines.Add(' NrProcJud: ' + _RetConsultaItem.S5001.IdeTrabalhador.ProcJudTrab[_a].NrProcJud);
        mmoRetorno.Lines.Add('   codSusp: ' + _RetConsultaItem.S5001.IdeTrabalhador.ProcJudTrab[_a].codSusp);
        mmoRetorno.Lines.Add('');
      end;

      // Cálculo da contribuição previdenciária do segurado, incidente sobre a remuneração do período de apuração e de períodos anteriores informada nos eventos S-1200, S-2299 e S-2399.
      for _a := 0 to _RetConsultaItem.S5001.CountInfoCpCalc - 1 do
      begin
        mmoRetorno.Lines.Add('InfoCpCalc');
        mmoRetorno.Lines.Add('      tpCR: ' + _RetConsultaItem.S5001.InfoCpCalc[_a].tpCR);
        mmoRetorno.Lines.Add('   vrCpSeg: ' + _RetConsultaItem.S5001.InfoCpCalc[_a].vrCpSeg);
        mmoRetorno.Lines.Add(' vrDescSeg: ' + _RetConsultaItem.S5001.InfoCpCalc[_a].vrDescSeg);
        mmoRetorno.Lines.Add('');
      end;

      // Informações sobre bases de cálculo, descontos e deduções de contribuições sociais devidas à Previdência Social e a Outras Entidades e Fundos, referentes à remuneração do período de apuração e de períodos anteriores informada nos eventos S-1200, S-2299 e S-2399.
      mmoRetorno.Lines.Add('infoCp');
      mmoRetorno.Lines.Add(' ClassTrib: ' + _RetConsultaItem.S5001.InfoCp.ClassTrib);
      mmoRetorno.Lines.Add('');

      // Identificação do estabelecimento ou obra de construção civil e da lotação tributária.
      for _a := 0 to _RetConsultaItem.S5001.InfoCp.CountIdeEstabLot - 1 do
      begin
        mmoRetorno.Lines.Add('ideEstabLot');
        mmoRetorno.Lines.Add('     tpInsc: ' + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].tpInsc);
        mmoRetorno.Lines.Add('     nrInsc: ' + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].nrInsc);
        mmoRetorno.Lines.Add(' codLotacao: ' + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].codLotacao);
        mmoRetorno.Lines.Add('');

        // Informações relativas à matrícula e categoria do trabalhador e tipos de incidências.
        for _b := 0 to _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].CountInfoCategIncid - 1 do
        begin
          mmoRetorno.Lines.Add('infoCategIncid');
          mmoRetorno.Lines.Add('  Matricula: ' + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].Matricula);
          mmoRetorno.Lines.Add('   codCateg: ' + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].codCateg);
          mmoRetorno.Lines.Add(' indSimples: ' + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].indSimples);
          mmoRetorno.Lines.Add('');

          // Informações sobre bases de cálculo, descontos e deduções de contribuições sociais devidas à Previdência Social e a Outras Entidades e Fundos.
          for _c := 0 to _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CountInfoBaseCS - 1 do
          begin
            mmoRetorno.Lines.Add('infoBaseCS');
            mmoRetorno.Lines.Add('   Ind13: ' + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoBaseCS[_c].Ind13);
            mmoRetorno.Lines.Add(' tpValor: ' + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoBaseCS[_c].tpValor);
            mmoRetorno.Lines.Add('   valor: ' + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoBaseCS[_c].valor);
            mmoRetorno.Lines.Add('');
          end;

          // Cálculo das contribuições sociais devidas a Outras Entidades e Fundos.
          for _c := 0 to _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CountCalcTerc - 1 do
          begin
            mmoRetorno.Lines.Add('CalcTerc');
            mmoRetorno.Lines.Add('        tpCR: ' + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CalcTerc[_c].tpCR);
            mmoRetorno.Lines.Add(' vrCsSegTerc: ' + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CalcTerc[_c].vrCsSegTerc);
            mmoRetorno.Lines.Add('  vrDescTerc: ' + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CalcTerc[_c].vrDescTerc);
            mmoRetorno.Lines.Add('');
          end;

          // Informações de remuneração por período de referência.
          for _c := 0 to _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CountInfoPerRef - 1 do
          begin
            mmoRetorno.Lines.Add('infoPerRef');
            mmoRetorno.Lines.Add(' perRef: ' + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].PerRef);
            mmoRetorno.Lines.Add('');

            // Identificação do instrumento ou situação ensejadora da remuneração relativa a períodos de apuração anteriores.
            for _d := 0 to _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].CountIdeADC - 1 do
            begin
              mmoRetorno.Lines.Add('ideADC');
              mmoRetorno.Lines.Add(' DtAcConv: ' + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].IdeADC[_d].DtAcConv);
              mmoRetorno.Lines.Add(' tpAcConv: ' + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].IdeADC[_d].tpAcConv);
              mmoRetorno.Lines.Add('      dsc: ' + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].IdeADC[_d].dsc);
              mmoRetorno.Lines.Add(' remunSuc: ' + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].IdeADC[_d].remunSuc);
              mmoRetorno.Lines.Add('');
            end;

            // Detalhamento das informações de remuneração por período de referência. Deve ser preenchido com informações de {infoPerApur} e {infoPerAnt} do S-1200 e S-2299, e de {dmDev} do S-2399, quando houver.
            for _d := 0 to _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].CountDetInfoPerRef - 1 do
            begin
              mmoRetorno.Lines.Add('DetInfoPerRef');
              mmoRetorno.Lines.Add('    ind13: ' + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].DetInfoPerRef[_d].Ind13);
              mmoRetorno.Lines.Add(' tpValor: ' + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].DetInfoPerRef[_d].tpVrPerRef);
              mmoRetorno.Lines.Add(' vrPerRef: ' + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].DetInfoPerRef[_d].VrPerRef);
              mmoRetorno.Lines.Add('');
            end;
          end;
        end;
      end;
    end;
  end;


  procedure preencher_S5002;
  var
  _a, _b: integer;
  begin
    if not _RetConsultaItem.S5002.IsEmpty then
    begin
      mmoRetorno.Lines.Add('### S5002 ###');
      mmoRetorno.Lines.Add(' Id: ' + _RetConsultaItem.S5002.Id);
      mmoRetorno.Lines.Add('');

      // Identificação única do evento.
      mmoRetorno.Lines.Add('IdeEvento');
      mmoRetorno.Lines.Add(' nrRecArqBase: ' + _RetConsultaItem.S5002.IdeEvento.NrRecArqBase);
      mmoRetorno.Lines.Add('      perApur: ' + _RetConsultaItem.S5002.IdeEvento.perApur);
      mmoRetorno.Lines.Add('');

      // Informações de identificação do empregador.
      mmoRetorno.Lines.Add('ideEmpregador');
      mmoRetorno.Lines.Add(' tpInsc: ' + _RetConsultaItem.S5002.IdeEmpregador.tpInsc);
      mmoRetorno.Lines.Add(' nrInsc: ' + _RetConsultaItem.S5002.IdeEmpregador.nrInsc);
      mmoRetorno.Lines.Add('');

      // Identificação do beneficiário do pagamento.
      mmoRetorno.Lines.Add('IdeTrabalhador');
      mmoRetorno.Lines.Add(' CpfBenef: ' + _RetConsultaItem.S5002.IdeTrabalhador.CpfBenef);
      mmoRetorno.Lines.Add('');

      // Informações do demonstrativo de valores devidos.
      for _a := 0 to _RetConsultaItem.S5002.IdeTrabalhador.CountDmDev - 1 do
      begin
        mmoRetorno.Lines.Add('DmDev');
        mmoRetorno.Lines.Add('   PerRef: ' + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].PerRef);
        mmoRetorno.Lines.Add(' IdeDmDev: ' + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].IdeDmDev);
        mmoRetorno.Lines.Add('   TpPgto: ' + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].TpPgto);
        mmoRetorno.Lines.Add('   DtPgto: ' + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].DtPgto);
        mmoRetorno.Lines.Add(' CodCateg: ' + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].CodCateg);
        mmoRetorno.Lines.Add('');

        //Rendimentos tributáveis, deduções, isenções e retenções do IRRF.
        for _b := 0 to _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].CountInfoIR - 1 do
        begin
          mmoRetorno.Lines.Add('InfoIR');
          mmoRetorno.Lines.Add(' TpInfoIR: ' + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoIR[_b].TpInfoIR);
          mmoRetorno.Lines.Add('    Valor: ' + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoIR[_b].Valor);
          mmoRetorno.Lines.Add('');
        end;

        //Totalizador de tributos com período de apuração mensal.
        for _b := 0 to _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].CountTotApurMen -1 do
        begin
          mmoRetorno.Lines.Add('totApurMen');
          mmoRetorno.Lines.Add('        CRMen: ' + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].TotApurMen[_b].CRMen);
          mmoRetorno.Lines.Add('     VlrCRMen: ' + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].TotApurMen[_b].VlrCRMen);
          mmoRetorno.Lines.Add(' VlrCRMenSusp: ' + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].TotApurMen[_b].VlrCRMenSusp);
          mmoRetorno.Lines.Add('');
        end;

        //Totalizador de tributos com período de apuração diário.
        for _b := 0 to _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].CountTotApurDia -1 do
        begin
          mmoRetorno.Lines.Add('totApurDia');
          mmoRetorno.Lines.Add('   PerApurDia: ' + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].TotApurDia[_b].PerApurDia);
          mmoRetorno.Lines.Add('        CRDia: ' + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].TotApurDia[_b].CRDia);
          mmoRetorno.Lines.Add('     VlrCRDia: ' + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].TotApurDia[_b].VlrCRDia);
          mmoRetorno.Lines.Add(' VlrCRDiaSusp: ' + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].TotApurDia[_b].VlrCRDiaSusp);
          mmoRetorno.Lines.Add('');
        end;
      end;
    end;
  end;


  procedure preencher_S5003;
  var
    _a, _b, _c, _d, _e, _f, _g, _h: integer;
  begin

    if not _RetConsultaItem.S5003.IsEmpty then
    begin
      mmoRetorno.Lines.Add('### S5003 ###');
      mmoRetorno.Lines.Add(' Id: ' + _RetConsultaItem.S5003.Id);
      mmoRetorno.Lines.Add('');

      // Identificação do evento de retorno.
      mmoRetorno.Lines.Add('IdeEvento');
      mmoRetorno.Lines.Add(' NrRecArqBase: ' + _RetConsultaItem.S5003.IdeEvento.NrRecArqBase);
      mmoRetorno.Lines.Add('  IndApuracao: ' + _RetConsultaItem.S5003.IdeEvento.IndApuracao);
      mmoRetorno.Lines.Add('      perApur: ' + _RetConsultaItem.S5003.IdeEvento.perApur);
      mmoRetorno.Lines.Add('');

      // Informações de identificação do empregador.
      mmoRetorno.Lines.Add('ideEmpregador');
      mmoRetorno.Lines.Add(' tpInsc: ' + _RetConsultaItem.S5003.IdeEmpregador.tpInsc);
      mmoRetorno.Lines.Add(' nrInsc: ' + _RetConsultaItem.S5003.IdeEmpregador.nrInsc);
      mmoRetorno.Lines.Add('');

      // Grupo que apresenta a identificação básica do trabalhador ao qual se refere o evento de retorno.
      mmoRetorno.Lines.Add('ideTrabalhador');
      mmoRetorno.Lines.Add(' CpfTrab: ' + _RetConsultaItem.S5003.IdeTrabalhador.cpfTrab);
      mmoRetorno.Lines.Add('');

      // Informações relativas ao Fundo de Garantia do Tempo de Serviço - FGTS.
      mmoRetorno.Lines.Add('InfoFGTS');
      mmoRetorno.Lines.Add(' DtVenc: ' + _RetConsultaItem.S5003.InfoFGTS.DtVenc);
      mmoRetorno.Lines.Add(' DtVenc: ' + _RetConsultaItem.S5003.InfoFGTS.ClassTrib);
      mmoRetorno.Lines.Add('');

      //Identificação do estabelecimento ou obra de construção civil.
      for _a := 0 to _RetConsultaItem.S5003.InfoFGTS.CountIdeEstab - 1 do
      begin
        mmoRetorno.Lines.Add('IdeEstab');
        mmoRetorno.Lines.Add('            TpInsc: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].tpInsc);
        mmoRetorno.Lines.Add('            NrInsc: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].nrInsc);
        mmoRetorno.Lines.Add('');

        //Identificação da lotação tributária.
        for _b := 0 to _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].CountIdeLotacao - 1 do
        begin
          mmoRetorno.Lines.Add('IdeLotacao');
          mmoRetorno.Lines.Add(' CodLotacao: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].CodLotacao);
          mmoRetorno.Lines.Add('  TpLotacao: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].TpLotacao);
          mmoRetorno.Lines.Add('     TpInsc: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].TpInsc);
          mmoRetorno.Lines.Add('     NrInsc: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].NrInsc);
          mmoRetorno.Lines.Add('');

          //Informações relativas à matrícula e categoria do trabalhador.
          for _c := 0 to _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].CountInfoTrabFGTS - 1 do
          begin
            mmoRetorno.Lines.Add('InfoTrabFGTS');
            mmoRetorno.Lines.Add('    Matricula: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].Matricula);
            mmoRetorno.Lines.Add('     CodCateg: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].CodCateg);
            mmoRetorno.Lines.Add('    CategOrig: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].CategOrig);
            mmoRetorno.Lines.Add('    TpRegTrab: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].TpRegTrab);
            mmoRetorno.Lines.Add('     RemunSuc: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].RemunSuc);
            mmoRetorno.Lines.Add('     DtDeslig: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].DtDeslig);
            mmoRetorno.Lines.Add('    MtvDeslig: ' +  _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].MtvDeslig);
            mmoRetorno.Lines.Add('       DtTerm: ' +  _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].DtTerm);
            mmoRetorno.Lines.Add(' MtvDesligTSV: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].MtvDesligTSV);
            mmoRetorno.Lines.Add('');

            // Grupo de informações da sucessão de vínculo trabalhista.
            mmoRetorno.Lines.Add('SucessaoVinc');
            mmoRetorno.Lines.Add('    TpInsc: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].SucessaoVinc.TpInsc);
            mmoRetorno.Lines.Add('    NrInsc: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].SucessaoVinc.NrInsc);
            mmoRetorno.Lines.Add(' MatricAnt: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].SucessaoVinc.MatricAnt);
            mmoRetorno.Lines.Add('     DtAdm: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].SucessaoVinc.DtAdm);
            mmoRetorno.Lines.Add('');


            // Informações referentes a bases de cálculo e valores do FGTS.
            for _d := 0 to _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].CountInfoBaseFGTS - 1 do
            begin

              // Informações sobre bases de cálculo e valores do FGTS referentes à remuneração do período de apuração e de períodos anteriores, exceto se {tpAcConv} = [E, H].
              for _e := 0 to _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].CountBasePerApur -1 do
              begin
                mmoRetorno.Lines.Add('InfoBaseFGTS.BasePerApur: ');
                mmoRetorno.Lines.Add('  TpValor: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].TpValor );
                mmoRetorno.Lines.Add(' IndIncid: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].IndIncid );
                mmoRetorno.Lines.Add('  RemFGTS: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].RemFGTS );
                mmoRetorno.Lines.Add('  DpsFGTS: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].DpsFGTS );
                mmoRetorno.Lines.Add('');

                // Detalhamento da(s) rubrica(s) com incidência de FGTS suspensa em decorrência de decisão judicial.
                for _f := 0 to _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].CountDetRubrSusp - 1 do
                begin
                  mmoRetorno.Lines.Add('DetRubrSusp');
                  mmoRetorno.Lines.Add('    CodRubr: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].DetRubrSusp[_f].CodRubr );
                  mmoRetorno.Lines.Add(' IdeTabRubr: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].DetRubrSusp[_f].IdeTabRubr );
                  mmoRetorno.Lines.Add('     VrRubr: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].DetRubrSusp[_f].VrRubr );
                  mmoRetorno.Lines.Add('');

                  // Processo(s) judicial(is) com decisão/sentença favorável, determinando a não incidência de FGTS.
                  for _g := 0 to _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].DetRubrSusp[_f].CountIdeProcessoFGTS - 1 do
                  begin
                    mmoRetorno.Lines.Add('IdeProcessoFGTS');
                    mmoRetorno.Lines.Add(' NrProc: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].DetRubrSusp[_f].IdeProcessoFGTS[_g].NrProc );
                    mmoRetorno.Lines.Add('');
                  end;
                end;
              end;

              //Informações referentes a bases de cálculo e valores do FGTS de períodos anteriores quando tpAcConv = [E, H].
              for _e := 0 to _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].CountInfoBasePerAntE -1 do
              begin
                mmoRetorno.Lines.Add('InfoBasePerAntE');
                mmoRetorno.Lines.Add('   perRef: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].PerRef );
                mmoRetorno.Lines.Add(' tpAcConv: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].TpAcConv );
                mmoRetorno.Lines.Add('');

                //Informações sobre bases de cálculo e valores do FGTS referentes à remuneração de períodos anteriores quando tpAcConv = [E, H].
                for _f := 0 to _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].CountBasePerAntE - 1 do
                begin
                  mmoRetorno.Lines.Add('BasePerAntE');
                  mmoRetorno.Lines.Add('  tpValorE: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].BasePerAntE[_f].TpValorE );
                  mmoRetorno.Lines.Add(' indIncidE: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].BasePerAntE[_f].IndIncidE );
                  mmoRetorno.Lines.Add('  remFGTSE: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].BasePerAntE[_f].RemFGTSE );
                  mmoRetorno.Lines.Add('  dpsFGTSE: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].BasePerAntE[_f].DpsFGTSE );
                  mmoRetorno.Lines.Add('');

                  //Detalhamento da(s) rubrica(s) com incidência de FGTS suspensa em decorrência de decisão judicial.
                  for _g := 0 to _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].BasePerAntE[_f].CountDetRubrSuspPerAntE - 1 do
                  begin
                    mmoRetorno.Lines.Add('detRubrSusp');
                    mmoRetorno.Lines.Add('    CodRubr: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].BasePerAntE[_f].DetRubrSuspPerAntE[_g].CodRubr );
                    mmoRetorno.Lines.Add(' IdeTabRubr: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].BasePerAntE[_f].DetRubrSuspPerAntE[_g].IdeTabRubr );
                    mmoRetorno.Lines.Add('     VrRubr: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].BasePerAntE[_f].DetRubrSuspPerAntE[_g].VrRubr );
                    mmoRetorno.Lines.Add('');

                    //Processo(s) judicial(is) com decisão/sentença favorável, determinando a não incidência de FGTS.
                    for _h := 0 to _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].BasePerAntE[_f].DetRubrSuspPerAntE[_g].CountIdeProcessoFGTS -1 do
                    begin
                      mmoRetorno.Lines.Add('ideProcessoFGTS');
                      mmoRetorno.Lines.Add(' NrProc: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].BasePerAntE[_f].DetRubrSuspPerAntE[_g].IdeProcessoFGTS[_h].NrProc );
                      mmoRetorno.Lines.Add('');
                    end;
                  end;
                end;
              end;
            end;

            //Informação sobre processo judicial que suspende a exigibilidade da Contribuição Social Rescisória.
            mmoRetorno.Lines.Add('ProcCS:');
            mmoRetorno.Lines.Add(' NrProcJud: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].ProcCS.NrProcJud);
            mmoRetorno.Lines.Add('');
          end;
        end;
      end;
    end;
  end;


  procedure preencher_S5011;
  var
    _a, _b, _c: integer;
  begin

    if not _RetConsultaItem.S5011.IsEmpty then
    begin
      mmoRetorno.Lines.Add(' ### S5011 ###');
      mmoRetorno.Lines.Add(' Id: ' + _RetConsultaItem.S5011.Id);
      mmoRetorno.Lines.Add('');

      // Identificação do evento de retorno.
      mmoRetorno.Lines.Add('ideEvento');
      mmoRetorno.Lines.Add(' indApuracao: ' + _RetConsultaItem.S5011.IdeEvento.indApuracao);
      mmoRetorno.Lines.Add('     perApur: ' + _RetConsultaItem.S5011.IdeEvento.perApur);
      mmoRetorno.Lines.Add('');

      // Informações de identificação do empregador.
      mmoRetorno.Lines.Add('ideEmpregador');
      mmoRetorno.Lines.Add(' tpInsc: ' + _RetConsultaItem.S5011.IdeEmpregador.tpInsc);
      mmoRetorno.Lines.Add(' nrInsc: ' + _RetConsultaItem.S5011.IdeEmpregador.nrInsc);
      mmoRetorno.Lines.Add('');

      // Informações relativas às contribuições sociais devidas à Previdência Social e a Outras Entidades e Fundos.
      mmoRetorno.Lines.Add('InfoCS');
      mmoRetorno.Lines.Add(' nrRecArqBase: ' + _RetConsultaItem.S5011.InfoCS.NrRecArqBase);
      mmoRetorno.Lines.Add(' indExistInfo: ' + _RetConsultaItem.S5011.InfoCS.indExistInfo);
      mmoRetorno.Lines.Add('');

      // Informações de contribuição previdenciária do segurado.
      mmoRetorno.Lines.Add('InfoCPSeg');
      mmoRetorno.Lines.Add(' vrDescCP: ' + _RetConsultaItem.S5011.InfoCS.InfoCPSeg.vrDescCP);
      mmoRetorno.Lines.Add('  vrCpSeg: ' + _RetConsultaItem.S5011.InfoCS.InfoCPSeg.vrCpSeg);
      mmoRetorno.Lines.Add('');

      // Informações gerais do contribuinte necessárias à apuração das contribuições sociais.
      mmoRetorno.Lines.Add('infoContrib');
      mmoRetorno.Lines.Add(' classTrib: ' + _RetConsultaItem.S5011.InfoCS.InfoContrib.classTrib);
      mmoRetorno.Lines.Add('');

      // Informações complementares, exclusivas da Pessoa Jurídica.
      mmoRetorno.Lines.Add('infoPJ');
      mmoRetorno.Lines.Add('               indCoop: ' + _RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.indCoop);
      mmoRetorno.Lines.Add('             indConstr: ' + _RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.indConstr);
      mmoRetorno.Lines.Add('          indSubstPatr: ' + _RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.indSubstPatr);
      mmoRetorno.Lines.Add('        percRedContrib: ' + _RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.percRedContrib);
      mmoRetorno.Lines.Add('            PercTransf: ' + _RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.PercTransf);
      mmoRetorno.Lines.Add(' IndTribFolhaPisCofins: ' + _RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.IndTribFolhaPisCofins);
      mmoRetorno.Lines.Add('');

      // Informações prestadas por empresa enquadrada no regime de tributação Simples Nacional com tributação previdenciária substituída e não substituída.
      mmoRetorno.Lines.Add('InfoAtConc');
      mmoRetorno.Lines.Add(' fatorMes: ' + _RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.InfoAtConc.fatorMes);
      mmoRetorno.Lines.Add('  fator13: ' + _RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.InfoAtConc.fator13);
      mmoRetorno.Lines.Add('');

      // Informações de identificação do estabelecimento ou obra de construção civil.
      for _a := 0 to _RetConsultaItem.S5011.InfoCS.CountIdeEstab - 1 do
      begin
        mmoRetorno.Lines.Add('IdeEstab');
        mmoRetorno.Lines.Add(' tpInsc: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].tpInsc);
        mmoRetorno.Lines.Add(' nrInsc: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].nrInsc);
        mmoRetorno.Lines.Add('');

        // Informações relativas a cada estabelecimento, necessárias à apuração das contribuições sociais.
        mmoRetorno.Lines.Add('InfoEstab');
        mmoRetorno.Lines.Add('     cnaePrep: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoEstab.cnaePrep);
        mmoRetorno.Lines.Add('     cnaePrep: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoEstab.CnpjResp);
        mmoRetorno.Lines.Add('      aliqRat: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoEstab.aliqRat);
        mmoRetorno.Lines.Add('          fap: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoEstab.fap);
        mmoRetorno.Lines.Add(' aliqRatAjust: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoEstab.aliqRatAjust);
        mmoRetorno.Lines.Add('');

        // Informações de RAT e FAP de referência, nos casos de processo administrativo ou judicial que altere a(s) alíquota(s).
        mmoRetorno.Lines.Add('infoEstabRef');
        mmoRetorno.Lines.Add('      AliqRat: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoEstab.InfoEstabRef.AliqRat);
        mmoRetorno.Lines.Add('          Fap: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoEstab.InfoEstabRef.Fap);
        mmoRetorno.Lines.Add(' AliqRatAjust: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoEstab.InfoEstabRef.AliqRatAjust);
        mmoRetorno.Lines.Add('');


        // Informações complementares relativas a obras de construção civil.
        mmoRetorno.Lines.Add('InfoComplObra');
        mmoRetorno.Lines.Add(' indSubstPatrObra: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoEstab.InfoComplObra.indSubstPatrObra);
        mmoRetorno.Lines.Add('');

        // Identificação da lotação tributária.
        for _b := 0 to _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].CountIdeLotacao - 1 do
        begin
          mmoRetorno.Lines.Add('ideLotacao');
          mmoRetorno.Lines.Add('   codLotacao: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].codLotacao);
          mmoRetorno.Lines.Add('         fpas: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].fpas);
          mmoRetorno.Lines.Add('     codTercs: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].codTercs);
          mmoRetorno.Lines.Add(' codTercsSusp: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].codTercsSusp);
          mmoRetorno.Lines.Add('');

          // Informações de suspensão de contribuições destinadas a Outras Entidades e Fundos (Terceiros).
          for _c := 0 to _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].CountInfoTercSusp - 1 do
          begin
            mmoRetorno.Lines.Add('InfoTercSusp');
            mmoRetorno.Lines.Add(' codTerc: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoTercSusp[_c].codTerc);
            mmoRetorno.Lines.Add('');
          end;

          // Informação complementar que apresenta identificação do contratante e do proprietário de obra de construção civil contratada sob regime de empreitada parcial ou subempreitada.
          mmoRetorno.Lines.Add('InfoEmprParcial');
          mmoRetorno.Lines.Add(' tpInscContrat: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoEmprParcial.tpInscContrat);
          mmoRetorno.Lines.Add(' nrInscContrat: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoEmprParcial.nrInscContrat);
          mmoRetorno.Lines.Add('    tpInscProp: ' +  _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoEmprParcial.tpInscProp);
          mmoRetorno.Lines.Add('    nrInscProp: ' +  _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoEmprParcial.nrInscProp);
          mmoRetorno.Lines.Add('       CnoObra: ' +  _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoEmprParcial.CnoObra);
          mmoRetorno.Lines.Add('');

          // Informações relativas ao operador portuário.
          mmoRetorno.Lines.Add('DadosOpPort');
          mmoRetorno.Lines.Add(' cnpjOpPortuario: ' +  _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].DadosOpPort.cnpjOpPortuario);
          mmoRetorno.Lines.Add('         aliqRat: ' +  _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].DadosOpPort.aliqRat);
          mmoRetorno.Lines.Add('             fap: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].DadosOpPort.fap);
          mmoRetorno.Lines.Add('    aliqRatAjust: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].DadosOpPort.aliqRatAjust);
          mmoRetorno.Lines.Add('');

          // Bases de cálculo da contribuição previdenciária incidente sobre remunerações, por categoria.
          for _c := 0 to _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].CountBasesRemun - 1 do
          begin
            mmoRetorno.Lines.Add('BasesRemun');
            mmoRetorno.Lines.Add('        indIncid: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].indIncid);
            mmoRetorno.Lines.Add('        codCateg: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].codCateg);
            mmoRetorno.Lines.Add('');


            // Valores correspondentes às bases, contribuições do segurado e deduções da contribuição previdenciária.
            mmoRetorno.Lines.Add('BasesCp');
            mmoRetorno.Lines.Add('       vrBcCp00: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrBcCp00);
            mmoRetorno.Lines.Add('       vrBcCp15: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrBcCp15);
            mmoRetorno.Lines.Add('       vrBcCp20: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrBcCp20);
            mmoRetorno.Lines.Add('       vrBcCp25: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrBcCp25);
            mmoRetorno.Lines.Add('   vrSuspBcCp00: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSuspBcCp00);
            mmoRetorno.Lines.Add('   vrSuspBcCp15: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSuspBcCp15);
            mmoRetorno.Lines.Add('   vrSuspBcCp20: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSuspBcCp20);
            mmoRetorno.Lines.Add('   vrSuspBcCp25: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSuspBcCp25);
            mmoRetorno.Lines.Add('     vrBcCp00VA: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrBcCp00VA);
            mmoRetorno.Lines.Add('     vrBcCp15VA: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrBcCp15VA);
            mmoRetorno.Lines.Add('     vrBcCp20VA: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrBcCp20VA);
            mmoRetorno.Lines.Add('     vrBcCp25VA: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrBcCp25VA);
            mmoRetorno.Lines.Add(' vrSuspBcCp00VA: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSuspBcCp00VA);
            mmoRetorno.Lines.Add(' vrSuspBcCp15VA: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSuspBcCp15VA);
            mmoRetorno.Lines.Add(' vrSuspBcCp20VA: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSuspBcCp20VA);
            mmoRetorno.Lines.Add(' vrSuspBcCp25VA: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSuspBcCp25VA);
            mmoRetorno.Lines.Add('     vrDescSest: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrDescSest);
            mmoRetorno.Lines.Add('     vrCalcSest: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrCalcSest);
            mmoRetorno.Lines.Add('    vrDescSenat: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrDescSenat);
            mmoRetorno.Lines.Add('    vrCalcSenat: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrCalcSenat);
            mmoRetorno.Lines.Add('       vrSalFam: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSalFam);
            mmoRetorno.Lines.Add('       vrSalMat: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSalMat);
            mmoRetorno.Lines.Add('');
          end;

          // Informações de bases de cálculo relativas à contratação de trabalhadores avulsos não portuários.
          mmoRetorno.Lines.Add('BasesAvNPort');
          mmoRetorno.Lines.Add(' vrBcCp00: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.vrBcCp00);
          mmoRetorno.Lines.Add(' vrBcCp15: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.vrBcCp15);
          mmoRetorno.Lines.Add(' vrBcCp20: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.vrBcCp20);
          mmoRetorno.Lines.Add(' vrBcCp25: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.vrBcCp25);
          mmoRetorno.Lines.Add(' vrBcCp13: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.vrBcCp13);
          mmoRetorno.Lines.Add(' vrDescCP: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.vrDescCP);
          mmoRetorno.Lines.Add('');

          // Grupo preenchido exclusivamente pelo Órgão Gestor de Mão de Obra - OGMO (classTrib = [09]), relativamente a operador portuário enquadrado nos arts. 7º a 9º da Lei 12.546/2011.
          for _c := 0 to _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].CountInfoSubstPatrOpOrt - 1 do
          begin
            mmoRetorno.Lines.Add('infoSubstPatrOpPort');
            mmoRetorno.Lines.Add(' cnpjOpPortuario: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoSubstPatrOpPort[_c].cnpjOpPortuario);
            mmoRetorno.Lines.Add('');
          end;
        end;

        // Informações de bases de cálculo relativas à aquisição de produção rural.
        for _b := 0 to _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].CountBasesAquis - 1 do
        begin
          mmoRetorno.Lines.Add('basesAquis');
          mmoRetorno.Lines.Add('    indAquis: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].indAquis);
          mmoRetorno.Lines.Add('    vlrAquis: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vlrAquis);
          mmoRetorno.Lines.Add('  vrCPDescPR: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrCPDescPR);
          mmoRetorno.Lines.Add('    vrCPNRet: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrCPNRet);
          mmoRetorno.Lines.Add('   vrRatNRet: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrRatNRet);
          mmoRetorno.Lines.Add(' vrSenarNRet: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrSenarNRet);
          mmoRetorno.Lines.Add('  vrCPCalcPR: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrCPCalcPR);
          mmoRetorno.Lines.Add(' vrRatDescPR: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrRatDescPR);
          mmoRetorno.Lines.Add(' vrRatCalcPR: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrRatCalcPR);
          mmoRetorno.Lines.Add(' vrSenarDesc: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrSenarDesc);
          mmoRetorno.Lines.Add(' vrSenarCalc: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrSenarCalc);
        end;

        // Informações de bases de cálculo relativas à comercialização da produção rural da Pessoa Física.
        for _b := 0 to _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].CountBasesComerc - 1 do
        begin
          mmoRetorno.Lines.Add('basesComerc');
          mmoRetorno.Lines.Add('   indComerc: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b].indComerc);
          mmoRetorno.Lines.Add('   vrBcComPR: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b].vrBcComPR);
          mmoRetorno.Lines.Add('    vrCPSusp: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b].vrCPSusp);
          mmoRetorno.Lines.Add('   vrRatSusp: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b].vrRatSusp);
          mmoRetorno.Lines.Add(' vrSenarSusp: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b].vrSenarSusp);
          mmoRetorno.Lines.Add('');
        end;

        // Informações das contribuições sociais devidas à Previdência Social e Outras Entidades e Fundos, consolidadas por estabelecimento e por Código de Receita - CR.
        for _b := 0 to _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].CountInfoCREstab - 1 do
        begin
          mmoRetorno.Lines.Add('infoCREstab');
          mmoRetorno.Lines.Add('     tpCR: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoCREstab[_b].tpCR);
          mmoRetorno.Lines.Add('     vrCR: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoCREstab[_b].vrCR);
          mmoRetorno.Lines.Add(' vrSuspCR: ' + _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoCREstab[_b].vrSuspCR);
          mmoRetorno.Lines.Add('');
        end;
      end;

      // Informações consolidadas das contribuições sociais devidas à Previdência Social e Outras Entidades e Fundos, por Código de Receita - CR.
      for _a := 0 to _RetConsultaItem.S5011.InfoCS.CountInfoCRContrib - 1 do
      begin
        mmoRetorno.Lines.Add('infoCRContrib');
        mmoRetorno.Lines.Add('     tpCR: ' + _RetConsultaItem.S5011.InfoCS.infoCRContrib[_a].tpCR);
        mmoRetorno.Lines.Add('     vrCR: ' + _RetConsultaItem.S5011.InfoCS.infoCRContrib[_a].vrCR);
        mmoRetorno.Lines.Add(' vrCRSusp: ' + _RetConsultaItem.S5011.InfoCS.infoCRContrib[_a].vrCRSusp);
      end;
    end;
  end;


  procedure preencher_S5012;
  var _a: integer;
  begin
    if not _RetConsultaItem.S5012.IsEmpty then
    begin
      mmoRetorno.Lines.Add('### S5012 ###');
      mmoRetorno.Lines.Add(' id: ' + _RetConsultaItem.S5012.Id);
      mmoRetorno.Lines.Add('');

      // Identificação do evento de retorno.
      mmoRetorno.Lines.Add('ideEvento');
      mmoRetorno.Lines.Add(' perApur: ' + _RetConsultaItem.S5012.IdeEvento.PerApur);
      mmoRetorno.Lines.Add('');

      // Informações de identificação do empregador.
      mmoRetorno.Lines.Add('ideEmpregador');
      mmoRetorno.Lines.Add(' TpInsc: ' + _RetConsultaItem.S5012.IdeEmpregador.TpInsc);
      mmoRetorno.Lines.Add(' NrInsc: ' + _RetConsultaItem.S5012.IdeEmpregador.NrInsc);
      mmoRetorno.Lines.Add('');

      // Informações relativas ao Imposto de Renda.
      mmoRetorno.Lines.Add('infoIRRF');
      mmoRetorno.Lines.Add(' TpInsc: ' + _RetConsultaItem.S5012.InfoIRRF.NrRecArqBase);
      mmoRetorno.Lines.Add(' TpInsc: ' + _RetConsultaItem.S5012.InfoIRRF.IndExistInfo);
      mmoRetorno.Lines.Add('');

      // Informações consolidadas do IRRF, por Código de Receita - CR mensal.
      for _a := 0 to _RetConsultaItem.S5012.InfoIRRF.CountInfoCRMen -1 do
      begin
        mmoRetorno.Lines.Add('infoCRMen');
        mmoRetorno.Lines.Add('       CRMen: ' + _RetConsultaItem.S5012.InfoIRRF.InfoCRMen[_a].CRMen);
        mmoRetorno.Lines.Add('     VrCRMen: ' + _RetConsultaItem.S5012.InfoIRRF.InfoCRMen[_a].VrCRMen);
        mmoRetorno.Lines.Add(' VrCRMenSusp: ' + _RetConsultaItem.S5012.InfoIRRF.InfoCRMen[_a].VrCRMenSusp);
        mmoRetorno.Lines.Add('');
      end;

      // Informações consolidadas do IRRF, por Código de Receita - CR diário.
      for _a := 0 to _RetConsultaItem.S5012.InfoIRRF.CountInfoCRDia -1 do
      begin
        mmoRetorno.Lines.Add('infoCRDia');
        mmoRetorno.Lines.Add('  PerApurDia: ' + _RetConsultaItem.S5012.InfoIRRF.InfoCRDia[_a].PerApurDia);
        mmoRetorno.Lines.Add('       CRDia: ' + _RetConsultaItem.S5012.InfoIRRF.InfoCRDia[_a].CRDia);
        mmoRetorno.Lines.Add('     VrCRDia: ' + _RetConsultaItem.S5012.InfoIRRF.InfoCRDia[_a].VrCRDia);
        mmoRetorno.Lines.Add(' VrCRDiaSusp: ' + _RetConsultaItem.S5012.InfoIRRF.InfoCRDia[_a].VrCRDiaSusp);
        mmoRetorno.Lines.Add('');
      end;
    end;
  end;


  procedure preencher_S5013;
  var
    _a, _b, _c, _d: integer;
  begin
    if not _RetConsultaItem.S5013.IsEmpty then
    begin
      mmoRetorno.Lines.Add('### S5013 ###');
      mmoRetorno.Lines.Add('        Id: ' + _RetConsultaItem.S5013.Id);
      mmoRetorno.Lines.Add('');

      // Identificação do evento de retorno.
      mmoRetorno.Lines.Add('IdeEvento');
      mmoRetorno.Lines.Add(' perApur: ' + _RetConsultaItem.S5013.IdeEvento.IndApuracao);
      mmoRetorno.Lines.Add(' perApur: ' + _RetConsultaItem.S5013.IdeEvento.perApur);
      mmoRetorno.Lines.Add('');

      // Informações de identificação do empregador.
      mmoRetorno.Lines.Add('IdeEmpregador');
      mmoRetorno.Lines.Add(' tpInsc: ' + _RetConsultaItem.S5013.IdeEmpregador.tpInsc);
      mmoRetorno.Lines.Add(' nrInsc: ' + _RetConsultaItem.S5013.IdeEmpregador.nrInsc);
      mmoRetorno.Lines.Add('');

      // Informações relativas ao Fundo de Garantia do Tempo de Serviço - FGTS.
      mmoRetorno.Lines.Add('infoFGTS');
      mmoRetorno.Lines.Add(' nrRecArqBase: ' + _RetConsultaItem.S5013.InfoFGTS.NrRecArqBase);
      mmoRetorno.Lines.Add(' indExistInfo: ' + _RetConsultaItem.S5013.InfoFGTS.indExistInfo);
      mmoRetorno.Lines.Add('');

      // Identificação do estabelecimento ou obra de construção civil.
      for _a := 0 to _RetConsultaItem.S5013.InfoFGTS.CountIdeEstab - 1 do
      begin
        mmoRetorno.Lines.Add('ideEstab');
        mmoRetorno.Lines.Add(' TpInsc: ' + _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].TpInsc);
        mmoRetorno.Lines.Add(' NrInsc: ' + _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].NrInsc);
        mmoRetorno.Lines.Add('');

        //	Identificação da lotação tributária.
        for _b := 0 to _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].CountIdeLotacao - 1 do
        begin
          mmoRetorno.Lines.Add('IdeLotacao');
          mmoRetorno.Lines.Add(' CodLotacao: ' + _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].CodLotacao);
          mmoRetorno.Lines.Add('  TpLotacao: ' + _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].TpLotacao);
          mmoRetorno.Lines.Add('     TpInsc: ' + _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].TpInsc);
          mmoRetorno.Lines.Add('     NrInsc: ' + _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].NrInsc);
          mmoRetorno.Lines.Add('');

          // Informações consolidadas das bases de cálculo e valores do FGTS do período de apuração e de períodos anteriores, exceto se {tpAcConv} = [E, H].
          for _c := 0 to _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.CountBasePerApur - 1 do
          begin
            mmoRetorno.Lines.Add('basePerApur');
            mmoRetorno.Lines.Add('  TpValor: ' + _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.BasePerApur[_c].TpValor);
            mmoRetorno.Lines.Add(' IndIncid: ' + _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.BasePerApur[_c].IndIncid);
            mmoRetorno.Lines.Add(' BaseFGTS: ' + _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.BasePerApur[_c].BaseFGTS);
            mmoRetorno.Lines.Add('   VrFGTS: ' + _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.BasePerApur[_c].VrFGTS);
            mmoRetorno.Lines.Add('');
          end;

          // Informações referentes a bases de cálculo e valores do FGTS de períodos anteriores quando tpAcConv = [E, H].
          for _c := 0 to _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.CountInfoBasePerAntE - 1 do
          begin
             mmoRetorno.Lines.Add('InfoBasePerAntE');
             mmoRetorno.Lines.Add('   PerRef: ' + _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.InfoBasePerAntE[_c].PerRef);
             mmoRetorno.Lines.Add(' TpAcConv: ' + _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.InfoBasePerAntE[_c].TpAcConv);
             mmoRetorno.Lines.Add('');

            // Informações consolidadas das bases de cálculo e valores do FGTS de períodos anteriores quando tpAcConv = [E, H].
            for _d := 0 to _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.InfoBasePerAntE[_c].CountBasePerAntE - 1 do
            begin
              mmoRetorno.Lines.Add('BasePerAntE');
              mmoRetorno.Lines.Add('  TpValorE: ' + _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.InfoBasePerAntE[_c].BasePerAntE[_d].TpValorE);
              mmoRetorno.Lines.Add(' IndIncidE: ' + _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.InfoBasePerAntE[_c].BasePerAntE[_d].IndIncidE);
              mmoRetorno.Lines.Add(' BaseFGTSE: ' + _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.InfoBasePerAntE[_c].BasePerAntE[_d].BaseFGTSE);
              mmoRetorno.Lines.Add('   VrFGTSE: ' + _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.InfoBasePerAntE[_c].BasePerAntE[_d].VrFGTSE);
              mmoRetorno.Lines.Add('');
            end;
          end;
        end;
      end;
    end;
  end;


  procedure preencher_S5501;
  var
  _a, _b: integer;
  begin
    if not _RetConsultaItem.S5501.IsEmpty then
    begin
      mmoRetorno.Lines.Add('### S5501 ###');
      mmoRetorno.Lines.Add(' Id: ' + _RetConsultaItem.S5501.Id);
      mmoRetorno.Lines.Add('');

      // Informações de identificação do evento.
      mmoRetorno.Lines.Add('ideEvento');
      mmoRetorno.Lines.Add(' NrRecArqBase: ' + _RetConsultaItem.S5501.IdeEvento.NrRecArqBase);
      mmoRetorno.Lines.Add('');

      // Informações de identificação do empregador ou do contribuinte que prestou a informação.
      mmoRetorno.Lines.Add('ideEmpregador');
      mmoRetorno.Lines.Add(' TpInsc: ' + _RetConsultaItem.S5501.IdeEmpregador.TpInsc);
      mmoRetorno.Lines.Add(' NrInsc: ' + _RetConsultaItem.S5501.IdeEmpregador.NrInsc);
      mmoRetorno.Lines.Add('');

      // Identificação do processo.
      mmoRetorno.Lines.Add('ideProc');
      mmoRetorno.Lines.Add(' NrProcTrab: ' + _RetConsultaItem.S5501.IdeProc.NrProcTrab);
      mmoRetorno.Lines.Add('    PerApur: ' + _RetConsultaItem.S5501.IdeProc.PerApur);
      mmoRetorno.Lines.Add('');

      // Identificação do período e da base de cálculo dos tributos referentes ao processo trabalhista.
      for _a := 0 to _RetConsultaItem.S5501.IdeProc.CountInfoTributos -1 do
      begin
        mmoRetorno.Lines.Add('infoTributos');
        mmoRetorno.Lines.Add('        PerRef: ' + _RetConsultaItem.S5501.IdeProc.InfoTributos[_a].PerRef);
        mmoRetorno.Lines.Add('');

        // Informações das contribuições sociais devidas à Previdência Social e Outras Entidades e Fundos, consolidadas por perRef e por Código de Receita - CR.
        for _b := 0 to _RetConsultaItem.S5501.IdeProc.InfoTributos[_a].CountInfoCRContrib -1 do
        begin
          mmoRetorno.Lines.Add('infoCRContrib');
          mmoRetorno.Lines.Add(' TpCR: ' + _RetConsultaItem.S5501.IdeProc.InfoTributos[_a].InfoCRContrib[_b].TpCR);
          mmoRetorno.Lines.Add(' VrCR: ' + _RetConsultaItem.S5501.IdeProc.InfoTributos[_a].InfoCRContrib[_b].VrCR);
          mmoRetorno.Lines.Add('');
        end;
      end;

      // Informações de Imposto de Renda Retido na Fonte, consolidadas por Código de Receita - CR.
      for _a := 0 to _RetConsultaItem.S5501.IdeProc.CountInfoCRIRRF -1 do
      begin
        mmoRetorno.Lines.Add('infoCRIRRF');
        mmoRetorno.Lines.Add(' TpCR: ' + _RetConsultaItem.S5501.IdeProc.InfoCRIRRF[_a].TpCR);
        mmoRetorno.Lines.Add(' VrCR: ' + _RetConsultaItem.S5501.IdeProc.InfoCRIRRF[_a].VrCR);
        mmoRetorno.Lines.Add('');
      end;
    end;
  end;


begin
  if rgTpConsulta.ItemIndex = 0 then
    _RetConsulta := eSocial.ConsultarLoteEventos(edtIdLote.Text)
  else if rgTpConsulta.ItemIndex = 1 then
    _RetConsulta := eSocial.ConsultarIdEvento(edtIdLote.Text)
  else if rgTpConsulta.ItemIndex = 2 then
    _RetConsulta := eSocial.ConsultarEventoPorRecibo(edtIdLote.Text);

  mmoRetorno.Lines.Clear;
  mmoRetorno.Lines.Add('### CONSULTA PROTOCOLO ###');
  mmoRetorno.Lines.Add('Número do Protocolo: ' + _RetConsulta.NumeroProtocolo);
  mmoRetorno.Lines.Add('Mensagem de Retorno: ' + _RetConsulta.Mensagem);
  mmoRetorno.Lines.Add('Status do Lote: ' + _RetConsulta.Status);
  mmoRetorno.Lines.Add('Tempo estimado para conclusão do processamento: ' + _RetConsulta.TempoEstimadoConclusao);
  mmoRetorno.Lines.Add('Id do Lote: ' + _RetConsulta.IdLote);

  for _i := 0 to _RetConsulta.Count - 1 do
  begin
    _RetConsultaItem := _RetConsulta.Eventos[_i];
    mmoRetorno.Lines.Add('    Evento: ' + IntToStr(_i + 1));
    mmoRetorno.Lines.Add('    Id Evento: ' + _RetConsultaItem.IdEvento);
    mmoRetorno.Lines.Add('    Número Recibo: ' + _RetConsultaItem.NumeroRecibo);
    mmoRetorno.Lines.Add('    Código de Status: ' + _RetConsultaItem.cStat);
    mmoRetorno.Lines.Add('    Mensagem: ' + _RetConsultaItem.Mensagem);
    mmoRetorno.Lines.Add('    Status do Evento: ' + _RetConsultaItem.Status);

    preencher_S5001;
    preencher_S5002;
    preencher_S5003;
    preencher_S5011;
    preencher_S5012;
    preencher_S5013;
    preencher_S5501;

    for _j := 0 to _RetConsultaItem.Count - 1 do
    begin
      _RetConsultaOcorrencia := _RetConsultaItem.Ocorrencias[_j];
      mmoRetorno.Lines.Add('        Ocorrencia: ' + IntToStr(_j + 1));
      mmoRetorno.Lines.Add('        Código: ' + _RetConsultaOcorrencia.Codigo);
      mmoRetorno.Lines.Add('        Descrição: ' + _RetConsultaOcorrencia.Descricao);
      mmoRetorno.Lines.Add('        Tipo: ' + _RetConsultaOcorrencia.Tipo);
      mmoRetorno.Lines.Add('        Localização: ' + _RetConsultaOcorrencia.Localizacao);
    end;

    for _k := 0 to _RetConsulta.CountOcorrencias - 1 do
    begin
      _RetConsultaOcorrenciaEnvio := _RetConsulta.Ocorrencias[_k];
      mmoRetorno.Lines.Add('    Codigo: ' + _RetConsultaOcorrenciaEnvio.Codigo);
      mmoRetorno.Lines.Add('    Tipo: ' + _RetConsultaOcorrenciaEnvio.Tipo);
      mmoRetorno.Lines.Add('    Localização: ' + _RetConsultaOcorrenciaEnvio.Localizacao);
      mmoRetorno.Lines.Add('    Descrição: ' + _RetConsultaOcorrenciaEnvio.Descricao);
    end;
  end;

  mmoXmlEnvio.Text := _RetConsulta.XmlEnviado;
  mmoXmlRetorno.Text := _RetConsulta.XmlRetorno;
end;

procedure TfrmeSocialS.btnEnviarClick(Sender: TObject);
var
  RetEnvio: IspdS11RetEnviarLoteEventos;
begin
  RetEnvio := eSocial.EnviarLoteEventos(mmoRetorno.Text,
    StrToInt(cbGrupo.Text));
  mmoRetorno.Lines.Clear;
  mmoRetorno.Lines.Add('### INCLUIR EVENTO ###');
  mmoRetorno.Lines.Add('Identificador do Lote: ' + RetEnvio.IdLote);
  mmoRetorno.Lines.Add('Mensagem de Retorno: ' + RetEnvio.Mensagem);
  edtIdLote.Text := RetEnvio.IdLote;
end;

procedure TfrmeSocialS.btnTx2Click(Sender: TObject);
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

procedure TfrmeSocialS.btnXMLClick(Sender: TObject);
begin
  mmoRetorno.Text := eSocial.GerarXMLporTx2(mmoRetorno.Text);
end;

procedure TfrmeSocialS.Button1Click(Sender: TObject);
var
  _retorno: IspdS11RetReconsultarLoteSefaz;
begin
  _retorno := eSocial.ReconsultarLoteSefaz(edtIdLote.Text);
  mmoRetorno.Text := _retorno.Mensagem;
//  mmoRetorno.Text := 'Consulta enviada com sucesso! Realize a consulta normal para que possa verificar o retorno do eSocial.';
end;

procedure TfrmeSocialS.btnConsultarIdsEventoLoteClick(Sender: TObject);
var
  RetConsultaIdsEventoLote: IspdS11RetConsultarIdsEventosLote;
  RetConsultaIdsEventoLoteItem: IspdS11RetConsultarIdsEventosLoteItem;
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
end;

End.
