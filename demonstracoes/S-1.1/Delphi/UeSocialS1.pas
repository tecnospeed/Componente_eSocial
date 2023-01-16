unit UeSocialS1;
interface
uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  ExtCtrls, ESocialS11ClientX_TLB, ComCtrls;
type
  TfrmeSocialS1 = class(TForm)
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
    rg: TRadioGroup;
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
    btnConsultarIdsEventoLote: TButton;
    btnBaixarXmlEventoLote: TButton;
    edtIdEvento: TLabeledEdit;
    chkTelemetria: TCheckBox;
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
    procedure btnConsultarIdsEventoLoteClick(Sender: TObject);
    procedure btnBaixarXmlEventoLoteClick(Sender: TObject);
    { Private declarations }
  public
    eSocial: TspdESocialS11ClientX;
    { Public declarations }
  end;
var
  frmeSocialS1: TfrmeSocialS1;
implementation

uses uESocial;
{$R *.dfm}
procedure TfrmeSocialS1.FormCreate(Sender: TObject);
begin
  eSocial := TspdESocialS11ClientX.Create(nil);
  eSocial.DiagnosticMode := False;
end;
procedure TfrmeSocialS1.FormDestroy(Sender: TObject);
begin
  eSocial.Free;
end;
procedure TfrmeSocialS1.FormShow(Sender: TObject);
begin
  frmeSocial.Caption := 'eSocial - TecnoSpeed - ' + eSocial.Versao;

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
  RetBaixarXmlEventoLote: IspdS11RetBaixarXmlEventoLote;
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
  if cbAmbiente.Text = '1 - Produ��o' then
    eSocial.Ambiente := akProducao;
  if cbAmbiente.Text = '2 - Homologa��o' then
    eSocial.Ambiente := akPreProducaoReais;
end;
procedure TfrmeSocialS1.btnConsultarClick(Sender: TObject);
var
  RetConsulta: IspdS11RetConsultarLote;
  RetConsultaItem: IspdS11RetConsultarLoteItem;
  RetConsultaOcorrencia: IspdS11RetConsultarLoteOcorrencia;
  RetConsultaOcorrenciaEnvio: IspdS11RetConsultarLoteOcorrenciaEnvio;
  _i, _j, _k, _a, _b, _c, _d, _e, _f, _g: integer;
begin
  if rg.ItemIndex = 0 then
    RetConsulta := eSocial.ConsultarLoteEventos(edtIdLote.Text)
  else if rg.ItemIndex = 1 then
    RetConsulta := eSocial.ConsultarIdEvento(edtIdLote.Text)
  else if rg.ItemIndex = 2 then
    RetConsulta := eSocial.ConsultarEventoPorRecibo(edtIdLote.Text);
  mmoRetorno.Lines.Clear;
  mmoRetorno.Lines.Add('### CONSULTA PROTOCOLO ###');
  mmoRetorno.Lines.Add('N�mero do Protocolo: ' + RetConsulta.NumeroProtocolo);
  mmoRetorno.Lines.Add('Mensagem de Retorno: ' + RetConsulta.Mensagem);
  mmoRetorno.Lines.Add('Status do Lote: ' + RetConsulta.Status);
  mmoRetorno.Lines.Add('Tempo estimado para conclus�o do processamento: ' +
    RetConsulta.TempoEstimadoConclusao);
  mmoRetorno.Lines.Add('Id do Lote: ' + RetConsulta.IdLote);
  for _i := 0 to RetConsulta.Count - 1 do
  begin
    RetConsultaItem := RetConsulta.Eventos[_i];
    mmoRetorno.Lines.Add('    Evento: ' + IntToStr(_i + 1));
    mmoRetorno.Lines.Add('    Id Evento: ' + RetConsultaItem.IdEvento);
    mmoRetorno.Lines.Add('    N�mero Recibo: ' + RetConsultaItem.NumeroRecibo);
    mmoRetorno.Lines.Add('    C�digo de Status: ' + RetConsultaItem.cStat);
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
    if not RetConsultaItem.S5003.IsEmpty then
    begin
      mmoRetorno.Lines.Add('        ### S5003 ###');
      mmoRetorno.Lines.Add('        Id: ' + RetConsultaItem.S5003.Id);
      // IdeEvento
      mmoRetorno.Lines.Add('        NrRecArqBase: ' +
        RetConsultaItem.S5003.IdeEvento.NrRecArqBase);
      mmoRetorno.Lines.Add('        perApur: ' +
        RetConsultaItem.S5003.IdeEvento.perApur);
      // IdeEmpregador
      mmoRetorno.Lines.Add('        tpInsc: ' +
        RetConsultaItem.S5003.IdeEmpregador.tpInsc);
      mmoRetorno.Lines.Add('        nrInsc: ' +
        RetConsultaItem.S5003.IdeEmpregador.nrInsc);
      // ideTrabalhador
      mmoRetorno.Lines.Add('        CpfTrab: ' +
        RetConsultaItem.S5003.IdeTrabalhador.cpfTrab);
      // InfoFGTS
      mmoRetorno.Lines.Add('        InfoFGTS: ');
      mmoRetorno.Lines.Add('           DtVenc: ' + RetConsultaItem.S5003.InfoFGTS.DtVenc);
      for _a := 0 to RetConsultaItem.S5003.InfoFGTS.CountIdeEstab - 1 do
      begin
        mmoRetorno.Lines.Add('           IdeEstab: ');
        mmoRetorno.Lines.Add('            TpInsc: ' +
          RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].tpInsc);
        mmoRetorno.Lines.Add('            NrInsc: ' +
          RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].nrInsc);
        for _b := 0 to RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].CountIdeLotacao - 1 do
        begin
          mmoRetorno.Lines.Add('            IdeLotacao: ');
          mmoRetorno.Lines.Add('               CodLotacao: ' +
           RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].CodLotacao);
          mmoRetorno.Lines.Add('               TpLotacao: ' +
           RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].TpLotacao);
          mmoRetorno.Lines.Add('               TpInsc: ' +
           RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].TpInsc);
          mmoRetorno.Lines.Add('               NrInsc: ' +
           RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].NrInsc);
          for _c := 0 to RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].CountInfoTrabFGTS - 1 do
          begin
            mmoRetorno.Lines.Add('                InfoTrabFGTS: ');
            mmoRetorno.Lines.Add('                 Matricula: ' +
             RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].Matricula);
            mmoRetorno.Lines.Add('                 CodCateg: ' +
             RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].CodCateg);
            mmoRetorno.Lines.Add('                 CategOrig: ' +
             RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].CategOrig);
            mmoRetorno.Lines.Add('                 TpRegTrab: ' +
             RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].TpRegTrab);
            mmoRetorno.Lines.Add('                 RemunSuc: ' +
             RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].RemunSuc);
            mmoRetorno.Lines.Add('                 DtDeslig: ' +
             RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].DtDeslig);
            mmoRetorno.Lines.Add('                 MtvDeslig: ' +
             RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].MtvDeslig);
            mmoRetorno.Lines.Add('                 DtTerm: ' +
             RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].DtTerm);
            mmoRetorno.Lines.Add('                 MtvDesligTSV: ' +
             RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].MtvDesligTSV);
            if RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].SucessaoVinc.TpInsc <> '' then
            begin
              mmoRetorno.Lines.Add('                 SucessaoVinc: ');
              mmoRetorno.Lines.Add('                  TpInsc: ' +
                RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].SucessaoVinc.TpInsc);
              mmoRetorno.Lines.Add('                  NrInsc: ' +
                RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].SucessaoVinc.NrInsc);
              mmoRetorno.Lines.Add('                  MatricAnt: ' +
                RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].SucessaoVinc.MatricAnt);
              mmoRetorno.Lines.Add('                  DtAdm: ' +
                RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].SucessaoVinc.DtAdm);
            end;
            for _d := 0 to RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].CountInfoBaseFGTS - 1 do
            begin
              mmoRetorno.Lines.Add('                InfoBaseFGTS: ');
              for _e := 0 to RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].CountBasePerApur -1 do
              begin
                mmoRetorno.Lines.Add('                BasePerApur: ');
                mmoRetorno.Lines.Add('                 TpValor: ' +
                 RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].TpValor );
                mmoRetorno.Lines.Add('                 IndIncid: ' +
                 RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].IndIncid );
                mmoRetorno.Lines.Add('                 RemFGTS: ' +
                 RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].RemFGTS );
                mmoRetorno.Lines.Add('                 DpsFGTS: ' +
                 RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].DpsFGTS );
                for _f := 0 to RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].CountDetRubrSusp - 1 do
                begin
                  mmoRetorno.Lines.Add('                  DetRubrSusp: ');
                  mmoRetorno.Lines.Add('                   CodRubr: ' +
                   RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].DetRubrSusp[_f].CodRubr );
                  mmoRetorno.Lines.Add('                   IdeTabRubr: ' +
                   RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].DetRubrSusp[_f].IdeTabRubr );
                  mmoRetorno.Lines.Add('                   VrRubr: ' +
                   RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].DetRubrSusp[_f].VrRubr );
                  for _g := 0 to RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].DetRubrSusp[_f].CountIdeProcessoFGTS - 1 do
                  begin
                    mmoRetorno.Lines.Add('                   IdeProcessoFGTS: ');
                    mmoRetorno.Lines.Add('                    NrProc: ' +
                     RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].DetRubrSusp[_f].IdeProcessoFGTS[_g].NrProc );
                  end;
                end;
              end;
              for _e := 0 to RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].CountInfoBasePerAntE -1 do
              begin
                mmoRetorno.Lines.Add('                InfoBasePerAntE: ');
                mmoRetorno.Lines.Add('                 PerRef: ' +
                 RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].PerRef );
                mmoRetorno.Lines.Add('                 TpAcConv: ' +
                 RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].TpAcConv );
                for _f := 0 to RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].CountBasePerAntE - 1 do
                begin
                  mmoRetorno.Lines.Add('                BasePerAntE: ');
                  mmoRetorno.Lines.Add('                 TpValorE: ' +
                   RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].BasePerAntE[_f].TpValorE );
                  mmoRetorno.Lines.Add('                 IndIncidE: ' +
                   RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].BasePerAntE[_f].IndIncidE );
                  mmoRetorno.Lines.Add('                 RemFGTSE: ' +
                   RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].BasePerAntE[_f].RemFGTSE );
                  mmoRetorno.Lines.Add('                 DpsFGTSE: ' +
                   RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].BasePerAntE[_f].DpsFGTSE );
                  for _g := 0 to RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].BasePerAntE[_f].CountDetRubrSuspPerAntE - 1 do
                  begin
                    mmoRetorno.Lines.Add('                 DetRubrSuspPerAntE: ');
                    mmoRetorno.Lines.Add('                  CodRubr: ' +
                     RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].BasePerAntE[_f].DetRubrSuspPerAntE[_g].CodRubr );
                    mmoRetorno.Lines.Add('                  IdeTabRubr: ' +
                     RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].BasePerAntE[_f].DetRubrSuspPerAntE[_g].IdeTabRubr );
                    mmoRetorno.Lines.Add('                  VrRubr: ' +
                     RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].BasePerAntE[_f].DetRubrSuspPerAntE[_g].VrRubr );
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
    if not RetConsultaItem.S5011.IsEmpty then
    begin
      mmoRetorno.Lines.Add('        ### S5011 ###');
      mmoRetorno.Lines.Add('        Id: ' + RetConsultaItem.S5011.Id);
      // IdeEvento
      mmoRetorno.Lines.Add('        indApuracao: ' +
        RetConsultaItem.S5011.IdeEvento.indApuracao);
      mmoRetorno.Lines.Add('        perApur: ' +
        RetConsultaItem.S5011.IdeEvento.perApur);
      // IdeEmpregador
      mmoRetorno.Lines.Add('        tpInsc: ' +
        RetConsultaItem.S5011.IdeEmpregador.tpInsc);
      mmoRetorno.Lines.Add('        nrInsc: ' +
        RetConsultaItem.S5011.IdeEmpregador.nrInsc);
      // InfoCS
      mmoRetorno.Lines.Add('        nrRecArqBase: ' +
        RetConsultaItem.S5011.InfoCS.NrRecArqBase);
      mmoRetorno.Lines.Add('        indExistInfo: ' +
        RetConsultaItem.S5011.InfoCS.indExistInfo);
      // InfoCPSeg
      mmoRetorno.Lines.Add('        vrDescCP: ' +
        RetConsultaItem.S5011.InfoCS.InfoCPSeg.vrDescCP);
      mmoRetorno.Lines.Add('        vrCpSeg: ' +
        RetConsultaItem.S5011.InfoCS.InfoCPSeg.vrCpSeg);
      // InfoContrib
      mmoRetorno.Lines.Add('        classTrib: ' +
        RetConsultaItem.S5011.InfoCS.InfoContrib.classTrib);
      // InfoPJ
      mmoRetorno.Lines.Add('        indCoop: ' +
        RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.indCoop);
      mmoRetorno.Lines.Add('        indConstr: ' +
        RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.indConstr);
      mmoRetorno.Lines.Add('        indSubstPatr: ' +
        RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.indSubstPatr);
      mmoRetorno.Lines.Add('        percRedContrib: ' +
        RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.percRedContrib);
      // InfoAtConc
      mmoRetorno.Lines.Add('        fatorMes: ' +
        RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.InfoAtConc.fatorMes);
      mmoRetorno.Lines.Add('        fator13: ' +
        RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.InfoAtConc.fator13);
      // IdeEstab
      for _a := 0 to RetConsultaItem.S5011.InfoCS.CountIdeEstab - 1 do
      begin
        mmoRetorno.Lines.Add('        tpInsc: ' +
          RetConsultaItem.S5011.InfoCS.IdeEstab[_a].tpInsc);
        mmoRetorno.Lines.Add('        nrInsc: ' +
          RetConsultaItem.S5011.InfoCS.IdeEstab[_a].nrInsc);
        // InfoEstab
        mmoRetorno.Lines.Add('        cnaePrep: ' +
          RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoEstab.cnaePrep);
        mmoRetorno.Lines.Add('        aliqRat: ' +
          RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoEstab.aliqRat);
        mmoRetorno.Lines.Add('        fap: ' +
          RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoEstab.fap);
        mmoRetorno.Lines.Add('        aliqRatAjust: ' +
          RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoEstab.aliqRatAjust);
        // InfoComplObra
        mmoRetorno.Lines.Add('        indSubstPatrObra: ' +
          RetConsultaItem.S5011.InfoCS.IdeEstab[_a]
          .InfoEstab.InfoComplObra.indSubstPatrObra);
        // IdeLotacao
        for _b := 0 to RetConsultaItem.S5011.InfoCS.IdeEstab[_a]
          .CountIdeLotacao - 1 do
        begin
          mmoRetorno.Lines.Add('        codLotacao: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
            .codLotacao);
          mmoRetorno.Lines.Add('        fpas: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].fpas);
          mmoRetorno.Lines.Add('        codTercs: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].codTercs);
          mmoRetorno.Lines.Add('        codTercsSusp: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
            .codTercsSusp);
          // InfoTercSusp
          for _c := 0 to RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao
            [_b].CountInfoTercSusp - 1 do
          begin
            mmoRetorno.Lines.Add('        codTerc: ' +
              RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
              .InfoTercSusp[_c].codTerc);
          end;
          // InfoEmprParcial
          mmoRetorno.Lines.Add('        tpInscContrat: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
            .InfoEmprParcial.tpInscContrat);
          mmoRetorno.Lines.Add('        nrInscContrat: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
            .InfoEmprParcial.nrInscContrat);
          mmoRetorno.Lines.Add('        tpInscProp: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
            .InfoEmprParcial.tpInscProp);
          mmoRetorno.Lines.Add('        nrInscProp: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
            .InfoEmprParcial.nrInscProp);
          // DadosOpPort
          mmoRetorno.Lines.Add('        cnpjOpPortuario: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
            .DadosOpPort.cnpjOpPortuario);
          mmoRetorno.Lines.Add('        aliqRat: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
            .DadosOpPort.aliqRat);
          mmoRetorno.Lines.Add('        fap: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
            .DadosOpPort.fap);
          mmoRetorno.Lines.Add('        aliqRatAjust: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
            .DadosOpPort.aliqRatAjust);
          // BasesRemun
          for _c := 0 to RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao
            [_b].CountBasesRemun - 1 do
          begin
            mmoRetorno.Lines.Add('        indIncid: ' +
              RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
              .BasesRemun[_c].indIncid);
            mmoRetorno.Lines.Add('        codCateg: ' +
              RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
              .BasesRemun[_c].codCateg);
            // BasesCp
            mmoRetorno.Lines.Add('        vrBcCp00: ' +
              RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
              .BasesRemun[_c].BasesCp.vrBcCp00);
            mmoRetorno.Lines.Add('        vrBcCp15: ' +
              RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
              .BasesRemun[_c].BasesCp.vrBcCp15);
            mmoRetorno.Lines.Add('        vrBcCp20: ' +
              RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
              .BasesRemun[_c].BasesCp.vrBcCp20);
            mmoRetorno.Lines.Add('        vrBcCp25: ' +
              RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
              .BasesRemun[_c].BasesCp.vrBcCp25);
            mmoRetorno.Lines.Add('        vrSuspBcCp00: ' +
              RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
              .BasesRemun[_c].BasesCp.vrSuspBcCp00);
            mmoRetorno.Lines.Add('        vrSuspBcCp15: ' +
              RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
              .BasesRemun[_c].BasesCp.vrSuspBcCp15);
            mmoRetorno.Lines.Add('        vrSuspBcCp20: ' +
              RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
              .BasesRemun[_c].BasesCp.vrSuspBcCp20);
            mmoRetorno.Lines.Add('        vrSuspBcCp25: ' +
              RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
              .BasesRemun[_c].BasesCp.vrSuspBcCp25);
            mmoRetorno.Lines.Add('        vrDescSest: ' +
              RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
              .BasesRemun[_c].BasesCp.vrDescSest);
            mmoRetorno.Lines.Add('        vrCalcSest: ' +
              RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
              .BasesRemun[_c].BasesCp.vrCalcSest);
            mmoRetorno.Lines.Add('        vrDescSenat: ' +
              RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
              .BasesRemun[_c].BasesCp.vrDescSenat);
            mmoRetorno.Lines.Add('        vrCalcSenat: ' +
              RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
              .BasesRemun[_c].BasesCp.vrCalcSenat);
            mmoRetorno.Lines.Add('        vrSalFam: ' +
              RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
              .BasesRemun[_c].BasesCp.vrSalFam);
            mmoRetorno.Lines.Add('        vrSalMat: ' +
              RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
              .BasesRemun[_c].BasesCp.vrSalMat);
            mmoRetorno.Lines.Add('        vrBcCp00VA: ' +
              RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
              .BasesRemun[_c].BasesCp.vrBcCp00VA);
            mmoRetorno.Lines.Add('        vrBcCp15VA: ' +
                          RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
                          .BasesRemun[_c].BasesCp.vrBcCp15VA);
            mmoRetorno.Lines.Add('        vrBcCp20VA: ' +
                          RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
                          .BasesRemun[_c].BasesCp.vrBcCp20VA);
            mmoRetorno.Lines.Add('        vrBcCp25VA: ' +
                          RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
                          .BasesRemun[_c].BasesCp.vrBcCp25VA);
            mmoRetorno.Lines.Add('        vrSuspBcCp00VA: ' +
                          RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
                          .BasesRemun[_c].BasesCp.vrSuspBcCp00VA);
            mmoRetorno.Lines.Add('        vrSuspBcCp15VA: ' +
                          RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
                          .BasesRemun[_c].BasesCp.vrSuspBcCp15VA);
            mmoRetorno.Lines.Add('        vrSuspBcCp20VA: ' +
                          RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
                          .BasesRemun[_c].BasesCp.vrSuspBcCp20VA);
            mmoRetorno.Lines.Add('        vrSuspBcCp25VA: ' +
                          RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
                          .BasesRemun[_c].BasesCp.vrSuspBcCp25VA);
          end;
          // BasesAvNPort
          mmoRetorno.Lines.Add('        vrBcCp00: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
            .BasesAvNPort.vrBcCp00);
          mmoRetorno.Lines.Add('        vrBcCp15: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
            .BasesAvNPort.vrBcCp15);
          mmoRetorno.Lines.Add('        vrBcCp20: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
            .BasesAvNPort.vrBcCp20);
          mmoRetorno.Lines.Add('        vrBcCp25: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
            .BasesAvNPort.vrBcCp25);
          mmoRetorno.Lines.Add('        vrBcCp13: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
            .BasesAvNPort.vrBcCp13);
          mmoRetorno.Lines.Add('        vrDescCP: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
            .BasesAvNPort.vrDescCP);
          // InfoSubstPatrOpPort
          for _c := 0 to RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao
            [_b].CountInfoSubstPatrOpOrt - 1 do
          begin
            mmoRetorno.Lines.Add('        cnpjOpPortuario: ' +
              RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b]
              .InfoSubstPatrOpPort[_c].cnpjOpPortuario);
          end;
        end;
        // BasesAquis
        for _b := 0 to RetConsultaItem.S5011.InfoCS.IdeEstab[_a]
          .CountBasesAquis - 1 do
        begin
          mmoRetorno.Lines.Add('        indAquis: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].indAquis);
          mmoRetorno.Lines.Add('        vlrAquis: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vlrAquis);
          mmoRetorno.Lines.Add('        vrCPDescPR: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b]
            .vrCPDescPR);
          mmoRetorno.Lines.Add('        vrCPNRet: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrCPNRet);
          mmoRetorno.Lines.Add('        vrRatNRet: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrRatNRet);
          mmoRetorno.Lines.Add('        vrSenarNRet: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b]
            .vrSenarNRet);
          mmoRetorno.Lines.Add('        vrCPCalcPR: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b]
            .vrCPCalcPR);
          mmoRetorno.Lines.Add('        vrRatDescPR: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b]
            .vrRatDescPR);
          mmoRetorno.Lines.Add('        vrRatCalcPR: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b]
            .vrRatCalcPR);
          mmoRetorno.Lines.Add('        vrSenarDesc: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b]
            .vrSenarDesc);
          mmoRetorno.Lines.Add('        vrSenarCalc: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b]
            .vrSenarCalc);
        end;
        // BasesComerc
        for _b := 0 to RetConsultaItem.S5011.InfoCS.IdeEstab[_a]
          .CountBasesComerc - 1 do
        begin
          mmoRetorno.Lines.Add('        indComerc: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b]
            .indComerc);
          mmoRetorno.Lines.Add('        vrBcComPR: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b]
            .vrBcComPR);
          mmoRetorno.Lines.Add('        vrCPSusp: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b].vrCPSusp);
          mmoRetorno.Lines.Add('        vrRatSusp: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b]
            .vrRatSusp);
          mmoRetorno.Lines.Add('        vrSenarSusp: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b]
            .vrSenarSusp);
        end;
        // InfoCREstab
        for _b := 0 to RetConsultaItem.S5011.InfoCS.IdeEstab[_a]
          .CountInfoCREstab - 1 do
        begin
          mmoRetorno.Lines.Add('        tpCR: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoCREstab[_b].tpCR);
          mmoRetorno.Lines.Add('        vrCR: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoCREstab[_b].vrCR);
          mmoRetorno.Lines.Add('        vrSuspCR: ' +
            RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoCREstab[_b].vrSuspCR);
        end;
      end;
      // infoCRContrib
      for _a := 0 to RetConsultaItem.S5011.InfoCS.CountInfoCRContrib - 1 do
      begin
        mmoRetorno.Lines.Add('        tpCR: ' +
          RetConsultaItem.S5011.InfoCS.infoCRContrib[_a].tpCR);
        mmoRetorno.Lines.Add('        vrCR: ' +
          RetConsultaItem.S5011.InfoCS.infoCRContrib[_a].vrCR);
        mmoRetorno.Lines.Add('        vrCRSusp: ' +
          RetConsultaItem.S5011.InfoCS.infoCRContrib[_a].vrCRSusp);
      end;
    end;
    if not RetConsultaItem.S5013.IsEmpty then
    begin
      mmoRetorno.Lines.Add('        ### S5013 ###');
      mmoRetorno.Lines.Add('        Id: ' + RetConsultaItem.S5013.Id);
      // IdeEvento
      mmoRetorno.Lines.Add('        perApur: ' +
        RetConsultaItem.S5013.IdeEvento.perApur);
      // IdeEmpregador
      mmoRetorno.Lines.Add('        tpInsc: ' +
        RetConsultaItem.S5013.IdeEmpregador.tpInsc);
      mmoRetorno.Lines.Add('        nrInsc: ' +
        RetConsultaItem.S5013.IdeEmpregador.nrInsc);
      // infoFGTS
      mmoRetorno.Lines.Add('        nrRecArqBase: ' +
        RetConsultaItem.S5013.InfoFGTS.NrRecArqBase);
      mmoRetorno.Lines.Add('        indExistInfo: ' +
        RetConsultaItem.S5013.InfoFGTS.indExistInfo);
      // infoBaseFGTS
      mmoRetorno.Lines.Add('        infoBaseFGTS: ');
      // basePerApur
      mmoRetorno.Lines.Add('          IdeEstab: <List>');
      for _a := 0 to RetConsultaItem.S5013.InfoFGTS.CountIdeEstab - 1 do
      begin
        mmoRetorno.Lines.Add('            TpInsc: ' +
          RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].TpInsc);
        mmoRetorno.Lines.Add('            NrInsc: ' +
          RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].NrInsc);
       for _b := 0 to RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].CountIdeLotacao - 1 do
       begin
         mmoRetorno.Lines.Add('         IdeLotacao: ');
         mmoRetorno.Lines.Add('          CodLotacao: ' +
          RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].CodLotacao);
         mmoRetorno.Lines.Add('          TpLotacao: ' +
          RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].TpLotacao);
         mmoRetorno.Lines.Add('          TpInsc: ' +
          RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].TpInsc);
         mmoRetorno.Lines.Add('          NrInsc: ' +
          RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].NrInsc);


         for _c := 0 to RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.CountBasePerApur - 1 do
         begin
            mmoRetorno.Lines.Add('         BasePerApur: ');
            mmoRetorno.Lines.Add('          TpValor: ' +
              RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.BasePerApur[_c].TpValor);
            mmoRetorno.Lines.Add('          BaseFGTS: ' +
              RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.BasePerApur[_c].BaseFGTS);
            mmoRetorno.Lines.Add('          IndIncid: ' +
              RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.BasePerApur[_c].IndIncid);
            mmoRetorno.Lines.Add('          VrFGTS: ' +
              RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.BasePerApur[_c].VrFGTS);
         end;

         for _c := 0 to RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.CountInfoBasePerAntE - 1 do
         begin
           mmoRetorno.Lines.Add('         InfoBasePerAntE: ');
           mmoRetorno.Lines.Add('          PerRef: ' +
              RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.InfoBasePerAntE[_c].PerRef);
           mmoRetorno.Lines.Add('          TpAcConv: ' +
              RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.InfoBasePerAntE[_c].TpAcConv);

           for _d := 0 to RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.InfoBasePerAntE[_c].CountBasePerAntE - 1 do
           begin
             mmoRetorno.Lines.Add('         BasePerAntE: ');
             mmoRetorno.Lines.Add('          TpValorE: ' +
              RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.InfoBasePerAntE[_c].BasePerAntE[_d].TpValorE);
             mmoRetorno.Lines.Add('          BaseFGTSE: ' +
              RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.InfoBasePerAntE[_c].BasePerAntE[_d].BaseFGTSE);
             mmoRetorno.Lines.Add('          IndIncidE: ' +
              RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.InfoBasePerAntE[_c].BasePerAntE[_d].IndIncidE);
             mmoRetorno.Lines.Add('          VrFGTSE: ' +
              RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.InfoBasePerAntE[_c].BasePerAntE[_d].VrFGTSE);
           end;

         end;

       end;
      end;
    end;
    for _j := 0 to RetConsultaItem.Count - 1 do
    begin
      RetConsultaOcorrencia := RetConsultaItem.Ocorrencias[_j];
      mmoRetorno.Lines.Add('        Ocorrencia: ' + IntToStr(_j + 1));
      mmoRetorno.Lines.Add('        C�digo: ' + RetConsultaOcorrencia.Codigo);
      mmoRetorno.Lines.Add('        Descri��o: ' +
        RetConsultaOcorrencia.Descricao);
      mmoRetorno.Lines.Add('        Tipo: ' + RetConsultaOcorrencia.Tipo);
      mmoRetorno.Lines.Add('        Localiza��o: ' +
        RetConsultaOcorrencia.Localizacao);
    end;
    for _k := 0 to RetConsulta.CountOcorrencias - 1 do
    begin
      RetConsultaOcorrenciaEnvio := RetConsulta.Ocorrencias[_k];
      mmoRetorno.Lines.Add('    Codigo: ' + RetConsultaOcorrenciaEnvio.Codigo);
      mmoRetorno.Lines.Add('    Tipo: ' + RetConsultaOcorrenciaEnvio.Tipo);
      mmoRetorno.Lines.Add('    Localiza��o: ' +
        RetConsultaOcorrenciaEnvio.Localizacao);
      mmoRetorno.Lines.Add('    Descri��o: ' +
        RetConsultaOcorrenciaEnvio.Descricao);
    end;
  mmoXmlEnvio.Text := RetConsulta.XmlEnviado;
  mmoXmlRetorno.Text := RetConsulta.XmlRetorno;
end;
procedure TfrmeSocialS1.btnConsultarIdsEventoLoteClick(Sender: TObject);
var
  RetConsultaIdsEventoLote: IspdS11RetConsultarIdsEventosLote;
  RetConsultaIdsEventoLoteItem: IspdS11RetConsultarIdsEventosLoteItem;
  _i: integer;
begin
  RetConsultaIdsEventoLote := eSocial.ConsultarIdsEventoLote(edtIdLote.Text);
  mmoRetorno.Lines.Clear;
  mmoRetorno.Lines.Add('### CONSULTA IDS EVENTOS LOTE ###');
  mmoRetorno.Lines.Add('N�mero do Protocolo: ' + RetConsultaIdsEventoLote.NumeroProtocolo);
  mmoRetorno.Lines.Add('Mensagem de Retorno: ' + RetConsultaIdsEventoLote.Mensagem);
  mmoRetorno.Lines.Add('Id do Lote: ' + RetConsultaIdsEventoLote.IdLote);
  for _i := 0 to RetConsultaIdsEventoLote.Count - 1 do
  begin
    RetConsultaIdsEventoLoteItem := RetConsultaIdsEventoLote.Eventos[_i];
    mmoRetorno.Lines.Add('    Evento: ' + IntToStr(_i + 1));
    mmoRetorno.Lines.Add('    Id Evento: ' + RetConsultaIdsEventoLoteItem.IdEvento);
 end
end;

procedure TfrmeSocialS1.btnEnviarClick(Sender: TObject);
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
procedure TfrmeSocialS1.btnTx2Click(Sender: TObject);
begin
  mmoRetorno.Clear;
  mmoRetorno.Lines.Add('INCLUIRS1000');
  if cbAmbiente.Text = '1 - Produ��o' then
    mmoRetorno.Lines.Add('tpAmb_4=1');
  if cbAmbiente.Text = '2 - Homologa��o' then
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
//indOpcCP_68=68
//indPorte_69=69
//indOptRegEletron_21=21
//cnpjEFR_70=70
//ideMinLei_27=27
//nrCertif_28=28
//dtEmisCertif_29=29
//dtVencCertif_30=30
//nrProtRenov_31=31
//dtProtRenov_32=32
//dtDou_33=33
//pagDou_34=34
//indAcordoIsenMulta_54=54
end;
procedure TfrmeSocialS1.btnXMLClick(Sender: TObject);
begin
  mmoRetorno.Text := eSocial.GerarXMLporTx2(mmoRetorno.Text);
end;
procedure TfrmeSocialS1.Button1Click(Sender: TObject);
var
  _retorno: IspdS11RetReconsultarLoteSefaz;
begin
  _retorno := eSocial.ReconsultarLoteSefaz(edtIdLote.Text);
  mmoRetorno.Text := _retorno.Mensagem;
//  mmoRetorno.Text := 'Consulta enviada com sucesso! Realize a consulta normal para que possa verificar o retorno do eSocial.';
end;
End.
