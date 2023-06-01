unit UeSocial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, OleCtrls, ESocialS11ClientX_TLB;

type
  TfrmeSocial = class(TForm)
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
    btnConsultarIdsEventoLote: TButton;
    btnBaixarXmlEventoLote: TButton;
    edtIdEvento: TLabeledEdit;
    chkTelemetria: TCheckBox;
    btnBaixarXML: TButton;
    btn1: TButton;
    edtNumRecibo: TEdit;
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
    procedure btnBaixarXMLClick(Sender: TObject);


    { Private declarations }
  public
    eSocial: TspdESocialS11ClientX;
    { Public declarations }
  end;

var
  frmeSocial: TfrmeSocial;

implementation

{$R *.dfm}

procedure TfrmeSocial.FormCreate(Sender: TObject);
begin
  eSocial := TspdESocialS11ClientX.Create(nil);
  eSocial.DiagnosticMode := False;
end;

procedure TfrmeSocial.FormDestroy(Sender: TObject);
begin
  eSocial.Free;
end;

procedure TfrmeSocial.FormShow(Sender: TObject);
begin
  frmeSocial.Caption := 'eSocial Simplificado - TecnoSpeed - ' + eSocial.Versao;

  eSocial.ConfigurarSoftwareHouse(edtCnpjSH.Text, edtTokenSH.Text);

  cbVersaoManual.Items.Text := eSocial.ListarVersaoManual(#13#10);
  cbCertificado.Items.Text := eSocial.ListarCertificados(#13#10);
  cbVersaoManual.ItemIndex := 0;
  cbCertificado.ItemIndex := cbCertificado.Items.IndexOf('CN=TECNOSPEED S/A:08187168000160, OU=Certificado PJ A1, O=ICP-Brasil, C=BR, S=PR, L=Maringa, E=, SE=6D 8C 21 04 01 48 28 66');

  btnConfigurarClick(nil);
end;

procedure TfrmeSocial.btnAssinarClick(Sender: TObject);
begin
  mmoRetorno.Text := eSocial.AssinarEvento(mmoRetorno.Text);
end;

procedure TfrmeSocial.btnBaixarXmlEventoLoteClick(Sender: TObject);
var
  RetBaixarXmlEventoLote: IspdS11RetBaixarXmlEventoLote;
begin
  RetBaixarXmlEventoLote := eSocial.BaixarXmlEventoLote(edtIdLote.Text, edtIdEvento.Text);

  mmoRetorno.Lines.Clear;
  mmoRetorno.Lines.Add('### BAIXA XML EVENTO LOTE ###');
  mmoRetorno.Lines.Add('Mensagem de Retorno: ' + RetBaixarXmlEventoLote.Mensagem);
  mmoRetorno.Lines.Add('XML Evento: ' + RetBaixarXmlEventoLote.XmlEvento);
end;

procedure TfrmeSocial.btnConfigurarClick(Sender: TObject);
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

procedure TfrmeSocial.btnConsultarClick(Sender: TObject);
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
      mmoRetorno.Lines.Add('');
      mmoRetorno.Lines.Add('### S5001 ###');
      mmoRetorno.Lines.Add('        Id: ' + _RetConsultaItem.S5001.Id);
      mmoRetorno.Lines.Add('');

      // IdeEvento
      mmoRetorno.Lines.Add('IdeEvento');
      mmoRetorno.Lines.Add('        nrRecArqBase: ' + _RetConsultaItem.S5001.IdeEvento.NrRecArqBase);
      mmoRetorno.Lines.Add('        indApuracao: ' + _RetConsultaItem.S5001.IdeEvento.indApuracao);
      mmoRetorno.Lines.Add('        perApur: ' + _RetConsultaItem.S5001.IdeEvento.perApur);
      mmoRetorno.Lines.Add('');

      // IdeEmpregador
      mmoRetorno.Lines.Add('IdeEmpregador');
      mmoRetorno.Lines.Add('        tpInsc: ' + _RetConsultaItem.S5001.IdeEmpregador.tpInsc);
      mmoRetorno.Lines.Add('        nrInsc: ' + _RetConsultaItem.S5001.IdeEmpregador.nrInsc);
      mmoRetorno.Lines.Add('');

      // IdeTrabalhador
      mmoRetorno.Lines.Add('IdeTrabalhador');
      mmoRetorno.Lines.Add('        cpfTrab: ' + _RetConsultaItem.S5001.IdeTrabalhador.cpfTrab);
      mmoRetorno.Lines.Add('');

      //infoCompl VAZIO

      //sucessaoVinc
      mmoRetorno.Lines.Add('sucessaoVinc');
      mmoRetorno.Lines.Add('        tpInsc: ' + _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.SucessaoVinc.TpInsc);
      mmoRetorno.Lines.Add('        nrInsc: ' + _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.SucessaoVinc.nrInsc);
      mmoRetorno.Lines.Add('        matricAnt: ' + _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.SucessaoVinc.matricAnt);
      mmoRetorno.Lines.Add('        dtAdm: ' + _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.SucessaoVinc.dtAdm);
      mmoRetorno.Lines.Add('');

      //infoInterm
      mmoRetorno.Lines.Add('infoInterm');
      for _a := 0 to _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.CountInfoInterm - 1 do
      begin
        mmoRetorno.Lines.Add('        dia: ' + _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.InfoInterm[_a].dia);
        mmoRetorno.Lines.Add('');
      end;

      // ProcJudTrab
      mmoRetorno.Lines.Add('ProcJudTrab');
      for _a := 0 to _RetConsultaItem.S5001.IdeTrabalhador.CountProcJudTrab - 1 do
      begin
        mmoRetorno.Lines.Add('        NrProcJud: ' + _RetConsultaItem.S5001.IdeTrabalhador.ProcJudTrab[_a].NrProcJud);
        mmoRetorno.Lines.Add('        codSusp: ' + _RetConsultaItem.S5001.IdeTrabalhador.ProcJudTrab[_a].codSusp);
        mmoRetorno.Lines.Add('');
      end;

      // InfoCpCalc
      mmoRetorno.Lines.Add('InfoCpCalc');
      for _a := 0 to _RetConsultaItem.S5001.CountInfoCpCalc - 1 do
      begin
        mmoRetorno.Lines.Add('        tpCR: ' + _RetConsultaItem.S5001.InfoCpCalc[_a].tpCR);
        mmoRetorno.Lines.Add('        vrCpSeg: ' + _RetConsultaItem.S5001.InfoCpCalc[_a].vrCpSeg);
        mmoRetorno.Lines.Add('        vrDescSeg: ' + _RetConsultaItem.S5001.InfoCpCalc[_a].vrDescSeg);
        mmoRetorno.Lines.Add('');
      end;

      // IdeEstabLot
      mmoRetorno.Lines.Add('ideEstabLot');
      for _a := 0 to _RetConsultaItem.S5001.InfoCp.CountIdeEstabLot - 1 do
      begin
        mmoRetorno.Lines.Add('        vrDescSeg: ' + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].tpInsc);
        mmoRetorno.Lines.Add('        nrInsc: ' + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].nrInsc);
        mmoRetorno.Lines.Add('        codLotacao: ' + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].codLotacao);
        mmoRetorno.Lines.Add('');

        // InfoCategIncid
        mmoRetorno.Lines.Add('infoCategIncid');
        for _b := 0 to _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].CountInfoCategIncid - 1 do
        begin
          mmoRetorno.Lines.Add('        vrDescSeg: ' +
            _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].Matricula);
          mmoRetorno.Lines.Add('        codCateg: ' +
            _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].codCateg);
          mmoRetorno.Lines.Add('        indSimples: ' + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].indSimples);
          mmoRetorno.Lines.Add('');

          // InfoBaseCS
          mmoRetorno.Lines.Add('infoBaseCS');
          for _c := 0 to _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CountInfoBaseCS - 1 do
          begin
            mmoRetorno.Lines.Add('        Ind13: ' +
              _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoBaseCS[_c].Ind13);
            mmoRetorno.Lines.Add('        tpValor: ' +
              _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoBaseCS[_c].tpValor);
            mmoRetorno.Lines.Add('        valor: ' +
              _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoBaseCS[_c].valor);
            mmoRetorno.Lines.Add('');
          end;

          // CalcTerc
          mmoRetorno.Lines.Add('CalcTerc');
          for _c := 0 to _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CountCalcTerc - 1 do
          begin
            mmoRetorno.Lines.Add('        tpCR: ' +
              _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CalcTerc[_c].tpCR);
            mmoRetorno.Lines.Add('        vrCsSegTerc: ' +
              _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CalcTerc[_c].vrCsSegTerc);
            mmoRetorno.Lines.Add('        vrDescTerc: ' +
              _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CalcTerc[_c].vrDescTerc);
            mmoRetorno.Lines.Add('');
          end;

          // infoPerRef
          mmoRetorno.Lines.Add('infoPerRef');
          for _c := 0 to _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CountInfoPerRef - 1 do
          begin
            mmoRetorno.Lines.Add('        perRef: ' +
              _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].PerRef);
            mmoRetorno.Lines.Add('');

            mmoRetorno.Lines.Add('DetInfoPerRef');
            for _d := 0 to _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].CountDetInfoPerRef - 1 do
            begin
               mmoRetorno.Lines.Add('          ind13: ' +
                 _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].DetInfoPerRef[_d].Ind13);
               //mmoRetorno.Lines.Add('          tpValor: ' +
               //  _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b]
              //   .InfoPerRef[_c].DetInfoPerRef[_d].TpValor);
               mmoRetorno.Lines.Add('          vrPerRef: ' +
                 _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].DetInfoPerRef[_d].VrPerRef);
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
      mmoRetorno.Lines.Add('');
      mmoRetorno.Lines.Add('        ### S5002 ###');
      mmoRetorno.Lines.Add('        Id: ' + _RetConsultaItem.S5002.Id);
      // IdeEvento
      mmoRetorno.Lines.Add('        nrRecArqBase: ' + _RetConsultaItem.S5002.IdeEvento.NrRecArqBase);
      mmoRetorno.Lines.Add('        perApur: ' + _RetConsultaItem.S5002.IdeEvento.perApur);

      // IdeEmpregador
      mmoRetorno.Lines.Add('        tpInsc: ' + _RetConsultaItem.S5002.IdeEmpregador.tpInsc);
      mmoRetorno.Lines.Add('        nrInsc: ' + _RetConsultaItem.S5002.IdeEmpregador.nrInsc);

      // IdeTrabalhador
      mmoRetorno.Lines.Add('        CpfBenef: ' + _RetConsultaItem.S5002.IdeTrabalhador.CpfBenef);

      // InfoIrrf
      for _a := 0 to _RetConsultaItem.S5002.IdeTrabalhador.CountDmDev - 1 do
      begin
        mmoRetorno.Lines.Add('');
        mmoRetorno.Lines.Add('        DmDev: ');
        mmoRetorno.Lines.Add('         PerRef: ' +
          _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].PerRef);
        mmoRetorno.Lines.Add('         IdeDmDev: ' +
          _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].IdeDmDev);
        mmoRetorno.Lines.Add('         TpPgto: ' +
          _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].TpPgto);
        mmoRetorno.Lines.Add('         DtPgto: ' +
          _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].DtPgto);
        mmoRetorno.Lines.Add('         CodCateg: ' +
          _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].CodCateg);

        for _b := 0 to _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].CountInfoIR - 1 do
        begin
          mmoRetorno.Lines.Add('');
          mmoRetorno.Lines.Add('         InfoIR: ');
          mmoRetorno.Lines.Add('          TpInfoIR: ' + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoIR[_b].TpInfoIR);
          mmoRetorno.Lines.Add('          Valor: ' + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoIR[_b].Valor);
        end;

      end;
    end;
  end;

  procedure preencher_S5003;
  var
    _a, _b, _c, _d, _e, _f, _g: integer;
  begin
    if not _RetConsultaItem.S5003.IsEmpty then
    begin
      mmoRetorno.Lines.Add('');
      mmoRetorno.Lines.Add('### S5003 ###');
      mmoRetorno.Lines.Add('        Id: ' + _RetConsultaItem.S5003.Id);
      // IdeEvento
      mmoRetorno.Lines.Add('        NrRecArqBase: ' + _RetConsultaItem.S5003.IdeEvento.NrRecArqBase);
      mmoRetorno.Lines.Add('        perApur: ' + _RetConsultaItem.S5003.IdeEvento.perApur);

      // IdeEmpregador
      mmoRetorno.Lines.Add('        tpInsc: ' + _RetConsultaItem.S5003.IdeEmpregador.tpInsc);
      mmoRetorno.Lines.Add('        nrInsc: ' + _RetConsultaItem.S5003.IdeEmpregador.nrInsc);

      // ideTrabalhador

      mmoRetorno.Lines.Add('        CpfTrab: ' + _RetConsultaItem.S5003.IdeTrabalhador.cpfTrab);

      // InfoFGTS
      mmoRetorno.Lines.Add('InfoFGTS: ');
      mmoRetorno.Lines.Add('           DtVenc: ' + _RetConsultaItem.S5003.InfoFGTS.DtVenc);

      for _a := 0 to _RetConsultaItem.S5003.InfoFGTS.CountIdeEstab - 1 do
      begin
        mmoRetorno.Lines.Add('');
        mmoRetorno.Lines.Add('IdeEstab: ');
        mmoRetorno.Lines.Add('            TpInsc: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].tpInsc);
        mmoRetorno.Lines.Add('            NrInsc: ' + _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].nrInsc);
        for _b := 0 to _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].CountIdeLotacao - 1 do
        begin
          mmoRetorno.Lines.Add('');
          mmoRetorno.Lines.Add('IdeLotacao: ');

          mmoRetorno.Lines.Add('               CodLotacao: ' +
            _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].CodLotacao);

          mmoRetorno.Lines.Add('               TpLotacao: ' +
            _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].TpLotacao);

          mmoRetorno.Lines.Add('               TpInsc: ' +
            _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].TpInsc);

          mmoRetorno.Lines.Add('               NrInsc: ' +
            _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].NrInsc);

          for _c := 0 to _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].CountInfoTrabFGTS - 1 do
          begin
            mmoRetorno.Lines.Add('');
            mmoRetorno.Lines.Add('InfoTrabFGTS: ');

            mmoRetorno.Lines.Add('                 Matricula: ' +
              _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].Matricula);

            mmoRetorno.Lines.Add('                 CodCateg: ' +
              _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].CodCateg);

            mmoRetorno.Lines.Add('                 CategOrig: ' +
              _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].CategOrig);

            mmoRetorno.Lines.Add('                 TpRegTrab: ' +
              _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].TpRegTrab);

            mmoRetorno.Lines.Add('                 RemunSuc: ' +
              _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].RemunSuc);

            mmoRetorno.Lines.Add('                 DtDeslig: ' +
              _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].DtDeslig);

            mmoRetorno.Lines.Add('                 MtvDeslig: ' +
              _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].MtvDeslig);

            mmoRetorno.Lines.Add('                 DtTerm: ' +
              _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].DtTerm);

            mmoRetorno.Lines.Add('                 MtvDesligTSV: ' +
              _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].MtvDesligTSV);

            if _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].SucessaoVinc.TpInsc <> '' then
            begin
              mmoRetorno.Lines.Add('');
              mmoRetorno.Lines.Add('SucessaoVinc: ');

              mmoRetorno.Lines.Add('                  TpInsc: ' +
                _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].SucessaoVinc.TpInsc);

              mmoRetorno.Lines.Add('                  NrInsc: ' +
                _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].SucessaoVinc.NrInsc);

              mmoRetorno.Lines.Add('                  MatricAnt: ' +
                _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].SucessaoVinc.MatricAnt);

              mmoRetorno.Lines.Add('                  DtAdm: ' +
                _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].SucessaoVinc.DtAdm);
            end;

            for _d := 0 to _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].CountInfoBaseFGTS - 1 do
            begin
              mmoRetorno.Lines.Add('');
              mmoRetorno.Lines.Add('InfoBaseFGTS: ');

              for _e := 0 to _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].CountBasePerApur -1 do
              begin
                mmoRetorno.Lines.Add('BasePerApur: ');

                mmoRetorno.Lines.Add('                 TpValor: ' +
                  _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].TpValor );
                mmoRetorno.Lines.Add('                 IndIncid: ' +
                  _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].IndIncid );
                mmoRetorno.Lines.Add('                 RemFGTS: ' +
                  _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].RemFGTS );
                mmoRetorno.Lines.Add('                 DpsFGTS: ' +
                  _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].DpsFGTS );

                for _f := 0 to _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].CountDetRubrSusp - 1 do
                begin
                  mmoRetorno.Lines.Add('');
                  mmoRetorno.Lines.Add('DetRubrSusp: ');
                  mmoRetorno.Lines.Add('                   CodRubr: ' +
                   _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].DetRubrSusp[_f].CodRubr );
                  mmoRetorno.Lines.Add('                   IdeTabRubr: ' +
                   _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].DetRubrSusp[_f].IdeTabRubr );
                  mmoRetorno.Lines.Add('                   VrRubr: ' +
                   _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].DetRubrSusp[_f].VrRubr );

                  for _g := 0 to _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].DetRubrSusp[_f].CountIdeProcessoFGTS - 1 do
                  begin
                    mmoRetorno.Lines.Add('');
                    mmoRetorno.Lines.Add('IdeProcessoFGTS: ');
                    mmoRetorno.Lines.Add('                    NrProc: ' +
                     _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].BasePerApur[_e].DetRubrSusp[_f].IdeProcessoFGTS[_g].NrProc );
                  end;
                end;
              end;

              for _e := 0 to _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].CountInfoBasePerAntE -1 do
              begin
                mmoRetorno.Lines.Add('');
                mmoRetorno.Lines.Add('InfoBasePerAntE: ');

                mmoRetorno.Lines.Add('                 PerRef: ' +
                  _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].PerRef );
                mmoRetorno.Lines.Add('                 TpAcConv: ' +
                  _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].TpAcConv );

                for _f := 0 to _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].CountBasePerAntE - 1 do
                begin
                  mmoRetorno.Lines.Add('BasePerAntE: ');
                  mmoRetorno.Lines.Add('                 TpValorE: ' +
                    _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].BasePerAntE[_f].TpValorE );
                  mmoRetorno.Lines.Add('                 IndIncidE: ' +
                    _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].BasePerAntE[_f].IndIncidE );
                  mmoRetorno.Lines.Add('                 RemFGTSE: ' +
                    _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].BasePerAntE[_f].RemFGTSE );
                  mmoRetorno.Lines.Add('                 DpsFGTSE: ' +
                    _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].BasePerAntE[_f].DpsFGTSE );

                  for _g := 0 to _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].BasePerAntE[_f].CountDetRubrSuspPerAntE - 1 do
                  begin
                    mmoRetorno.Lines.Add('DetRubrSuspPerAntE: ');
                    mmoRetorno.Lines.Add('                  CodRubr: ' +
                      _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].BasePerAntE[_f].DetRubrSuspPerAntE[_g].CodRubr );
                    mmoRetorno.Lines.Add('                  IdeTabRubr: ' +
                      _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].BasePerAntE[_f].DetRubrSuspPerAntE[_g].IdeTabRubr );
                    mmoRetorno.Lines.Add('                  VrRubr: ' +
                      _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].BasePerAntE[_f].DetRubrSuspPerAntE[_g].VrRubr );
                  end;
                end;
              end;
            end;

            mmoRetorno.Lines.Add('ProcCS:');
            mmoRetorno.Lines.Add('                 NrProcJud: ' +
              _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].ProcCS.NrProcJud);
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
      mmoRetorno.Lines.Add('');
      mmoRetorno.Lines.Add('        ### S5011 ###');
      mmoRetorno.Lines.Add('        Id: ' + _RetConsultaItem.S5011.Id);
      // IdeEvento
      mmoRetorno.Lines.Add('        indApuracao: ' +
        _RetConsultaItem.S5011.IdeEvento.indApuracao);
      mmoRetorno.Lines.Add('        perApur: ' +
        _RetConsultaItem.S5011.IdeEvento.perApur);
      // IdeEmpregador
      mmoRetorno.Lines.Add('        tpInsc: ' +
        _RetConsultaItem.S5011.IdeEmpregador.tpInsc);
      mmoRetorno.Lines.Add('        nrInsc: ' +
        _RetConsultaItem.S5011.IdeEmpregador.nrInsc);
      // InfoCS
      mmoRetorno.Lines.Add('        nrRecArqBase: ' +
        _RetConsultaItem.S5011.InfoCS.NrRecArqBase);
      mmoRetorno.Lines.Add('        indExistInfo: ' +
        _RetConsultaItem.S5011.InfoCS.indExistInfo);
      // InfoCPSeg
      mmoRetorno.Lines.Add('        vrDescCP: ' +
        _RetConsultaItem.S5011.InfoCS.InfoCPSeg.vrDescCP);
      mmoRetorno.Lines.Add('        vrCpSeg: ' +
        _RetConsultaItem.S5011.InfoCS.InfoCPSeg.vrCpSeg);
      // InfoContrib
      mmoRetorno.Lines.Add('        classTrib: ' +
        _RetConsultaItem.S5011.InfoCS.InfoContrib.classTrib);
      // InfoPJ
      mmoRetorno.Lines.Add('        indCoop: ' +
        _RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.indCoop);
      mmoRetorno.Lines.Add('        indConstr: ' +
        _RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.indConstr);
      mmoRetorno.Lines.Add('        indSubstPatr: ' +
        _RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.indSubstPatr);
      mmoRetorno.Lines.Add('        percRedContrib: ' +
        _RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.percRedContrib);
      // InfoAtConc
      mmoRetorno.Lines.Add('        fatorMes: ' +
        _RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.InfoAtConc.fatorMes);
      mmoRetorno.Lines.Add('        fator13: ' +
        _RetConsultaItem.S5011.InfoCS.InfoContrib.InfoPJ.InfoAtConc.fator13);

      // IdeEstab
      for _a := 0 to _RetConsultaItem.S5011.InfoCS.CountIdeEstab - 1 do
      begin
        mmoRetorno.Lines.Add('');
        mmoRetorno.Lines.Add('        tpInsc: ' +
          _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].tpInsc);
        mmoRetorno.Lines.Add('        nrInsc: ' +
          _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].nrInsc);
        // InfoEstab
        mmoRetorno.Lines.Add('        cnaePrep: ' +
          _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoEstab.cnaePrep);
        mmoRetorno.Lines.Add('        aliqRat: ' +
          _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoEstab.aliqRat);
        mmoRetorno.Lines.Add('        fap: ' +
          _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoEstab.fap);
        mmoRetorno.Lines.Add('        aliqRatAjust: ' +
          _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoEstab.aliqRatAjust);
        // InfoComplObra
        mmoRetorno.Lines.Add('        indSubstPatrObra: ' +
          _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoEstab.InfoComplObra.indSubstPatrObra);
        // IdeLotacao
        for _b := 0 to _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].CountIdeLotacao - 1 do
        begin
          mmoRetorno.Lines.Add('');
          mmoRetorno.Lines.Add('        codLotacao: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].codLotacao);
          mmoRetorno.Lines.Add('        fpas: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].fpas);
          mmoRetorno.Lines.Add('        codTercs: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].codTercs);
          mmoRetorno.Lines.Add('        codTercsSusp: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].codTercsSusp);
          // InfoTercSusp
          for _c := 0 to _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].CountInfoTercSusp - 1 do
          begin
            mmoRetorno.Lines.Add('');
            mmoRetorno.Lines.Add('        codTerc: ' +
              _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoTercSusp[_c].codTerc);
          end;
          // InfoEmprParcial
          mmoRetorno.Lines.Add('        tpInscContrat: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoEmprParcial.tpInscContrat);
          mmoRetorno.Lines.Add('        nrInscContrat: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoEmprParcial.nrInscContrat);
          mmoRetorno.Lines.Add('        tpInscProp: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoEmprParcial.tpInscProp);
          mmoRetorno.Lines.Add('        nrInscProp: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoEmprParcial.nrInscProp);
          // DadosOpPort
          mmoRetorno.Lines.Add('        cnpjOpPortuario: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].DadosOpPort.cnpjOpPortuario);
          mmoRetorno.Lines.Add('        aliqRat: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].DadosOpPort.aliqRat);
          mmoRetorno.Lines.Add('        fap: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].DadosOpPort.fap);
          mmoRetorno.Lines.Add('        aliqRatAjust: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].DadosOpPort.aliqRatAjust);
          // BasesRemun
          for _c := 0 to _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].CountBasesRemun - 1 do
          begin
            mmoRetorno.Lines.Add('');
            mmoRetorno.Lines.Add('        indIncid: ' +
              _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].indIncid);
            mmoRetorno.Lines.Add('        codCateg: ' +
              _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].codCateg);
            // BasesCp
            mmoRetorno.Lines.Add('        vrBcCp00: ' +
              _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrBcCp00);
            mmoRetorno.Lines.Add('        vrBcCp15: ' +
              _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrBcCp15);
            mmoRetorno.Lines.Add('        vrBcCp20: ' +
              _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrBcCp20);
            mmoRetorno.Lines.Add('        vrBcCp25: ' +
              _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrBcCp25);
            mmoRetorno.Lines.Add('        vrSuspBcCp00: ' +
              _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSuspBcCp00);
            mmoRetorno.Lines.Add('        vrSuspBcCp15: ' +
              _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSuspBcCp15);
            mmoRetorno.Lines.Add('        vrSuspBcCp20: ' +
              _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSuspBcCp20);
            mmoRetorno.Lines.Add('        vrSuspBcCp25: ' +
              _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSuspBcCp25);
            mmoRetorno.Lines.Add('        vrDescSest: ' +
              _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrDescSest);
            mmoRetorno.Lines.Add('        vrCalcSest: ' +
              _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrCalcSest);
            mmoRetorno.Lines.Add('        vrDescSenat: ' +
              _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrDescSenat);
            mmoRetorno.Lines.Add('        vrCalcSenat: ' +
              _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrCalcSenat);
            mmoRetorno.Lines.Add('        vrSalFam: ' +
              _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSalFam);
            mmoRetorno.Lines.Add('        vrSalMat: ' +
              _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSalMat);
            mmoRetorno.Lines.Add('        vrBcCp00VA: ' +
              _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrBcCp00VA);
            mmoRetorno.Lines.Add('        vrBcCp15VA: ' +
              _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrBcCp15VA);
            mmoRetorno.Lines.Add('        vrBcCp20VA: ' +
              _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrBcCp20VA);
            mmoRetorno.Lines.Add('        vrBcCp25VA: ' +
              _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrBcCp25VA);
            mmoRetorno.Lines.Add('        vrSuspBcCp00VA: ' +
              _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSuspBcCp00VA);
            mmoRetorno.Lines.Add('        vrSuspBcCp15VA: ' +
              _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSuspBcCp15VA);
            mmoRetorno.Lines.Add('        vrSuspBcCp20VA: ' +
              _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSuspBcCp20VA);
            mmoRetorno.Lines.Add('        vrSuspBcCp25VA: ' +
              _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSuspBcCp25VA);
          end;
          // BasesAvNPort
          mmoRetorno.Lines.Add('        vrBcCp00: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.vrBcCp00);
          mmoRetorno.Lines.Add('        vrBcCp15: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.vrBcCp15);
          mmoRetorno.Lines.Add('        vrBcCp20: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.vrBcCp20);
          mmoRetorno.Lines.Add('        vrBcCp25: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.vrBcCp25);
          mmoRetorno.Lines.Add('        vrBcCp13: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.vrBcCp13);
          mmoRetorno.Lines.Add('        vrDescCP: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.vrDescCP);
          // InfoSubstPatrOpPort
          for _c := 0 to _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].CountInfoSubstPatrOpOrt - 1 do
          begin
            mmoRetorno.Lines.Add('');
            mmoRetorno.Lines.Add('        cnpjOpPortuario: ' +
              _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoSubstPatrOpPort[_c].cnpjOpPortuario);
          end;
        end;

        // BasesAquis
        for _b := 0 to _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].CountBasesAquis - 1 do
        begin
          mmoRetorno.Lines.Add('');
          mmoRetorno.Lines.Add('        indAquis: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].indAquis);
          mmoRetorno.Lines.Add('        vlrAquis: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vlrAquis);
          mmoRetorno.Lines.Add('        vrCPDescPR: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrCPDescPR);
          mmoRetorno.Lines.Add('        vrCPNRet: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrCPNRet);
          mmoRetorno.Lines.Add('        vrRatNRet: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrRatNRet);
          mmoRetorno.Lines.Add('        vrSenarNRet: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrSenarNRet);
          mmoRetorno.Lines.Add('        vrCPCalcPR: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrCPCalcPR);
          mmoRetorno.Lines.Add('        vrRatDescPR: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrRatDescPR);
          mmoRetorno.Lines.Add('        vrRatCalcPR: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrRatCalcPR);
          mmoRetorno.Lines.Add('        vrSenarDesc: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrSenarDesc);
          mmoRetorno.Lines.Add('        vrSenarCalc: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrSenarCalc);
        end;
        // BasesComerc
        for _b := 0 to _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].CountBasesComerc - 1 do
        begin
          mmoRetorno.Lines.Add('');
          mmoRetorno.Lines.Add('        indComerc: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b].indComerc);
          mmoRetorno.Lines.Add('        vrBcComPR: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b].vrBcComPR);
          mmoRetorno.Lines.Add('        vrCPSusp: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b].vrCPSusp);
          mmoRetorno.Lines.Add('        vrRatSusp: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b].vrRatSusp);
          mmoRetorno.Lines.Add('        vrSenarSusp: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b].vrSenarSusp);
        end;
        // InfoCREstab
        for _b := 0 to _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].CountInfoCREstab - 1 do
        begin
          mmoRetorno.Lines.Add('');
          mmoRetorno.Lines.Add('        tpCR: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoCREstab[_b].tpCR);
          mmoRetorno.Lines.Add('        vrCR: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoCREstab[_b].vrCR);
          mmoRetorno.Lines.Add('        vrSuspCR: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].InfoCREstab[_b].vrSuspCR);
        end;
      end;
      // infoCRContrib
      for _a := 0 to _RetConsultaItem.S5011.InfoCS.CountInfoCRContrib - 1 do
      begin
        mmoRetorno.Lines.Add('');
        mmoRetorno.Lines.Add('        tpCR: ' +
          _RetConsultaItem.S5011.InfoCS.infoCRContrib[_a].tpCR);
        mmoRetorno.Lines.Add('        vrCR: ' +
          _RetConsultaItem.S5011.InfoCS.infoCRContrib[_a].vrCR);
        mmoRetorno.Lines.Add('        vrCRSusp: ' +
          _RetConsultaItem.S5011.InfoCS.infoCRContrib[_a].vrCRSusp);
      end;
    end;
  end;

  procedure preencher_S5013;
  var
    _a, _b, _c, _d: integer;
  begin
    if not _RetConsultaItem.S5013.IsEmpty then
    begin
      mmoRetorno.Lines.Add('');
      mmoRetorno.Lines.Add('        ### S5013 ###');
      mmoRetorno.Lines.Add('        Id: ' + _RetConsultaItem.S5013.Id);
      // IdeEvento
      mmoRetorno.Lines.Add('        perApur: ' + _RetConsultaItem.S5013.IdeEvento.perApur);
      // IdeEmpregador
      mmoRetorno.Lines.Add('        tpInsc: ' + _RetConsultaItem.S5013.IdeEmpregador.tpInsc);
      mmoRetorno.Lines.Add('        nrInsc: ' + _RetConsultaItem.S5013.IdeEmpregador.nrInsc);
      // infoFGTS
      mmoRetorno.Lines.Add('        nrRecArqBase: ' + _RetConsultaItem.S5013.InfoFGTS.NrRecArqBase);
      mmoRetorno.Lines.Add('        indExistInfo: ' + _RetConsultaItem.S5013.InfoFGTS.indExistInfo);
      // infoBaseFGTS
      mmoRetorno.Lines.Add('        infoBaseFGTS: ');
      // basePerApur
      mmoRetorno.Lines.Add('          IdeEstab: <List>');
      for _a := 0 to _RetConsultaItem.S5013.InfoFGTS.CountIdeEstab - 1 do
      begin
        mmoRetorno.Lines.Add('');
        mmoRetorno.Lines.Add('            TpInsc: ' +
          _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].TpInsc);
        mmoRetorno.Lines.Add('            NrInsc: ' +
          _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].NrInsc);

       for _b := 0 to _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].CountIdeLotacao - 1 do
       begin
         mmoRetorno.Lines.Add('');
         mmoRetorno.Lines.Add('         IdeLotacao: ');
         mmoRetorno.Lines.Add('          CodLotacao: ' +
           _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].CodLotacao);
         mmoRetorno.Lines.Add('          TpLotacao: ' +
           _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].TpLotacao);
         mmoRetorno.Lines.Add('          TpInsc: ' +
           _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].TpInsc);
         mmoRetorno.Lines.Add('          NrInsc: ' +
           _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].NrInsc);

         for _c := 0 to _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.CountBasePerApur - 1 do
         begin
           mmoRetorno.Lines.Add('');
           mmoRetorno.Lines.Add('         BasePerApur: ');
           mmoRetorno.Lines.Add('          TpValor: ' +
             _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.BasePerApur[_c].TpValor);
           mmoRetorno.Lines.Add('          BaseFGTS: ' +
             _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.BasePerApur[_c].BaseFGTS);
           mmoRetorno.Lines.Add('          IndIncid: ' +
             _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.BasePerApur[_c].IndIncid);
           mmoRetorno.Lines.Add('          VrFGTS: ' +
             _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.BasePerApur[_c].VrFGTS);
         end;

         for _c := 0 to _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.CountInfoBasePerAntE - 1 do
         begin
           mmoRetorno.Lines.Add('');
           mmoRetorno.Lines.Add('         InfoBasePerAntE: ');
           mmoRetorno.Lines.Add('          PerRef: ' +
             _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.InfoBasePerAntE[_c].PerRef);
           mmoRetorno.Lines.Add('          TpAcConv: ' +
             _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.InfoBasePerAntE[_c].TpAcConv);

           for _d := 0 to _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.InfoBasePerAntE[_c].CountBasePerAntE - 1 do
           begin
             mmoRetorno.Lines.Add('');
             mmoRetorno.Lines.Add('         BasePerAntE: ');
             mmoRetorno.Lines.Add('          TpValorE: ' +
               _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.InfoBasePerAntE[_c].BasePerAntE[_d].TpValorE);
             mmoRetorno.Lines.Add('          BaseFGTSE: ' +
               _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.InfoBasePerAntE[_c].BasePerAntE[_d].BaseFGTSE);
             mmoRetorno.Lines.Add('          IndIncidE: ' +
               _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.InfoBasePerAntE[_c].BasePerAntE[_d].IndIncidE);
             mmoRetorno.Lines.Add('          VrFGTSE: ' +
               _RetConsultaItem.S5013.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoBaseFGTS.InfoBasePerAntE[_c].BasePerAntE[_d].VrFGTSE);
           end;
         end;
       end;
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
    preencher_S5013;

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

procedure TfrmeSocial.btnConsultarIdsEventoLoteClick(Sender: TObject);
var
  _RetConsultaIdsEventoLote: IspdS11RetConsultarIdsEventosLote;
  _RetConsultaIdsEventoLoteItem: IspdS11RetConsultarIdsEventosLoteItem;
  _i: integer;
begin
  _RetConsultaIdsEventoLote := eSocial.ConsultarIdsEventoLote(edtIdLote.Text);

  mmoRetorno.Lines.Clear;
  mmoRetorno.Lines.Add('### CONSULTA IDS EVENTOS LOTE ###');
  mmoRetorno.Lines.Add('Número do Protocolo: ' + _RetConsultaIdsEventoLote.NumeroProtocolo);
  mmoRetorno.Lines.Add('Mensagem de Retorno: ' + _RetConsultaIdsEventoLote.Mensagem);

  mmoRetorno.Lines.Add('Id do Lote: ' + _RetConsultaIdsEventoLote.IdLote);
  for _i := 0 to _RetConsultaIdsEventoLote.Count - 1 do
  begin
    _RetConsultaIdsEventoLoteItem := _RetConsultaIdsEventoLote.Eventos[_i];
    mmoRetorno.Lines.Add('    Evento: ' + IntToStr(_i + 1));
    mmoRetorno.Lines.Add('    Id Evento: ' + _RetConsultaIdsEventoLoteItem.IdEvento);
  end
end;

procedure TfrmeSocial.btnEnviarClick(Sender: TObject);
var
  _RetEnvio: IspdS11RetEnviarLoteEventos;
begin
  _RetEnvio := eSocial.EnviarLoteEventos(mmoRetorno.Text, StrToInt(cbGrupo.Text));
  mmoRetorno.Lines.Clear;
  mmoRetorno.Lines.Add('### INCLUIR EVENTO ###');
  mmoRetorno.Lines.Add('Identificador do Lote: ' + _RetEnvio.IdLote);
  mmoRetorno.Lines.Add('Mensagem de Retorno: ' + _RetEnvio.Mensagem);
  edtIdLote.Text := _RetEnvio.IdLote;
end;

procedure TfrmeSocial.btnTx2Click(Sender: TObject);
begin
  mmoRetorno.Clear;
  mmoRetorno.Lines.Add('INCLUIRS1000');
  if cbAmbiente.Text = '1 - Produção' then
    mmoRetorno.Lines.Add('tpAmb_4=1')
  else if cbAmbiente.Text = '2 - Homologação' then
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

procedure TfrmeSocial.btnXMLClick(Sender: TObject);
begin
  mmoRetorno.Text := eSocial.GerarXMLporTx2(mmoRetorno.Text);
end;

procedure TfrmeSocial.Button1Click(Sender: TObject);
var
  _retorno: IspdS11RetReconsultarLoteSefaz;
begin
  _retorno := eSocial.ReconsultarLoteSefaz(edtIdLote.Text);
  mmoRetorno.Text := _retorno.Mensagem;
end;


procedure TfrmeSocial.btnBaixarXMLClick(Sender: TObject);
var
  RetBaixarXmlEventoLote: IspdS11RetBaixarXmlEventoLote;
begin

  RetBaixarXmlEventoLote := eSocial.BaixarXmlEventoLote(edtIdLote.Text,edtNumRecibo.Text);

  mmoRetorno.Lines.Clear;
  mmoRetorno.Lines.Add('### BAIXA XML EVENTO LOTE ###');
  mmoRetorno.Lines.Add('Mensagem de Retorno: ' + RetBaixarXmlEventoLote.Mensagem);
  mmoRetorno.Lines.Add('XML Evento: ' + RetBaixarXmlEventoLote.XmlEvento);

end;

end.


