unit uESocial;
interface
uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  ExtCtrls, ESocialS12ClientX_TLB, ComCtrls;
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
    eSocial: TspdESocialS12ClientX;
    { Public declarations }
  end;
var
  frmeSocialS: TfrmeSocialS;
implementation

{$R *.dfm}
procedure TfrmeSocialS.FormCreate(Sender: TObject);
begin
  eSocial := TspdESocialS12ClientX.Create(nil);
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
  RetBaixarXmlEventoLote: IspdS12RetBaixarXmlEventoLote;
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
  if cbAmbiente.Text = '1 - Produ��o' then
    eSocial.Ambiente := akProducao;
  if cbAmbiente.Text = '2 - Homologa��o' then
    eSocial.Ambiente := akPreProducaoReais;
end;
procedure TfrmeSocialS.btnConsultarClick(Sender: TObject);
  var
  _RetConsulta: IspdS12RetConsultarLote;
  _RetConsultaItem: IspdS12RetConsultarLoteItem;
  _RetConsultaOcorrencia: IspdS12RetConsultarLoteOcorrencia;
  _RetConsultaOcorrenciaEnvio: IspdS12RetConsultarLoteOcorrenciaEnvio;
//  _RetSConsulta: IspdSRetConsultarLote;
//  _RetSConsultaItem: IspdSRetConsultarLoteItem;
//  _RetSConsultaOcorrencia: IspdSRetConsultarLoteOcorrencia;
//  _RetSConsultaOcorrenciaEnvio: IspdSRetConsultarLoteOcorrenciaEnvio;
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
      //infoComplCont
      mmoRetorno.Lines.Add('infoComplCont');
      for _a := 0 to _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.CountInfoComplCont - 1 do
      begin
        mmoRetorno.Lines.Add('        codCBO: ' + _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.InfoComplCont[_a].CodCBO);
        mmoRetorno.Lines.Add('        natAtividade: ' + _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.InfoComplCont[_a].NatAtividade);
        mmoRetorno.Lines.Add('        qtdDiasTrab: ' + _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.InfoComplCont[_a].QtdDiasTrab);
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
      //infoCp VAZIO
      // IdeEstabLot
      mmoRetorno.Lines.Add('ideEstabLot');
      for _a := 0 to _RetConsultaItem.S5001.InfoCp.CountIdeEstabLot - 1 do
      begin
        mmoRetorno.Lines.Add('        tpInsc: ' + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].tpInsc);
        mmoRetorno.Lines.Add('        nrInsc: ' + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].nrInsc);
        mmoRetorno.Lines.Add('        codLotacao: ' + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].codLotacao);
        mmoRetorno.Lines.Add('');
        // InfoCategIncid
        mmoRetorno.Lines.Add('infoCategIncid');
        for _b := 0 to _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].CountInfoCategIncid - 1 do
        begin
          mmoRetorno.Lines.Add('        matricula: ' +
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

            mmoRetorno.Lines.Add('ideADC');
            for _d := 0 to _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].CountDetInfoPerRef - 1 do
            begin
               mmoRetorno.Lines.Add('        dtAcConv: ' +
                _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].IdeADC[_d].DtAcConv);
               mmoRetorno.Lines.Add('        tpAcConv: ' +
                _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].IdeADC[_d].TpAcConv);
               mmoRetorno.Lines.Add('        dsc: ' +
                _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].IdeADC[_d].Dsc);
               mmoRetorno.Lines.Add('        remunSuc: ' +
                _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].IdeADC[_d].RemunSuc);
               mmoRetorno.Lines.Add('');
            end;

            mmoRetorno.Lines.Add('DetInfoPerRef');
            for _d := 0 to _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].CountDetInfoPerRef - 1 do
            begin
               mmoRetorno.Lines.Add('          ind13: ' +
                 _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].DetInfoPerRef[_d].Ind13);
               mmoRetorno.Lines.Add('          tpVrPerRef: ' +
                 _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].DetInfoPerRef[_d].TpVrPerRef);
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
    _a, _b, _c, _d, _e: integer;
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
        mmoRetorno.Lines.Add(Format('        DmDev [%S]: ',[intToStr(_a + 1)]));
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
          mmoRetorno.Lines.Add(Format('        InfoIR [%S]: ',[intToStr(_b + 1)]));
          mmoRetorno.Lines.Add('          TpInfoIR: ' + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoIR[_b].TpInfoIR);
          mmoRetorno.Lines.Add('          Valor: ' + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoIR[_b].Valor);

          for _c := 0 to _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoIR[_b].CountInfoProcJudRub - 1 do
          begin
            mmoRetorno.Lines.Add('');
            mmoRetorno.Lines.Add(Format('        InfoProcJudRub [%S]: ',[intToStr(_c + 1)]));
            mmoRetorno.Lines.Add('          NrProc: ' +   _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoIR[_b].InfoProcJudRub[_c].NrProc);
            mmoRetorno.Lines.Add('          UfVara: ' +   _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoIR[_b].InfoProcJudRub[_c].UfVara);
            mmoRetorno.Lines.Add('          CodMunic: ' + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoIR[_b].InfoProcJudRub[_c].CodMunic);
            mmoRetorno.Lines.Add('          IdVara: ' +   _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoIR[_b].InfoProcJudRub[_c].IdVara);
          end;
        end;

        mmoRetorno.Lines.Add('');
        mmoRetorno.Lines.Add('         infoRRA: ');
        mmoRetorno.Lines.Add('         TpProcRRA: '   + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoRRA.TpProcRRA);
        mmoRetorno.Lines.Add('         NrProcRRA: '   + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoRRA.NrProcRRA);
        mmoRetorno.Lines.Add('         DescRRA: '     + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoRRA.DescRRA);
        mmoRetorno.Lines.Add('         QtdMesesRRA: ' + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoRRA.QtdMesesRRA);
        for _c := 0 to _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoRRA.CountIdeAdv - 1 do
        begin
          mmoRetorno.Lines.Add('');
          mmoRetorno.Lines.Add(Format('        IdeAdv [%S]: ',[intToStr(_c + 1)]));
          mmoRetorno.Lines.Add('          TpInsc: ' + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoRRA.IdeAdv[_c].TpInsc);
          mmoRetorno.Lines.Add('          NrInsc: ' + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoRRA.IdeAdv[_c].NrInsc);
          mmoRetorno.Lines.Add('          VlrAdv: ' + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoRRA.IdeAdv[_c].VlrAdv);
        end;
        //InfoPgtoExt [0-1]
        mmoRetorno.Lines.Add('');
        mmoRetorno.Lines.Add('         InfoPgtoExt: ');
        mmoRetorno.Lines.Add('         PaisResidExt: ' + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoPgtoExt.PaisResidExt);
        mmoRetorno.Lines.Add('         IndNIF: '       + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoPgtoExt.IndNIF);
        mmoRetorno.Lines.Add('         NifBenef: '     + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoPgtoExt.NifBenef);
        mmoRetorno.Lines.Add('         FrmTribut: '    + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoPgtoExt.FrmTribut);

        //EndExt [0-1]
        mmoRetorno.Lines.Add('');
        mmoRetorno.Lines.Add('         endExt: ');
        mmoRetorno.Lines.Add('         EndDscLograd: ' + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoPgtoExt.EndExt.EndDscLograd);
        mmoRetorno.Lines.Add('         EndNrLograd: '  + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoPgtoExt.EndExt.EndNrLograd);
        mmoRetorno.Lines.Add('         EndComplem: '   + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoPgtoExt.EndExt.EndComplem);
        mmoRetorno.Lines.Add('         EndBairro: '    + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoPgtoExt.EndExt.EndBairro);
        mmoRetorno.Lines.Add('         EndCidade: '    + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoPgtoExt.EndExt.EndCidade);
        mmoRetorno.Lines.Add('         EndEstado: '    + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoPgtoExt.EndExt.EndEstado);
        mmoRetorno.Lines.Add('         EndCodPostal: ' + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoPgtoExt.EndExt.EndCodPostal);
        mmoRetorno.Lines.Add('         Telef: '        + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoPgtoExt.EndExt.Telef);
      end;
      //InfoIRComplem [0-1]
      mmoRetorno.Lines.Add('');
      mmoRetorno.Lines.Add('         InfoIRComplem: ');
      mmoRetorno.Lines.Add('         DtLaudo: ' +_RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.DtLaudo);
      // IdeDep [0-999]
      for _a := 0 to _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.CountIdeDep -1 do
      begin
        mmoRetorno.Lines.Add('');
        mmoRetorno.Lines.Add(Format('        IdeDep [%S]: ',[intToStr(_a + 1)]));
        mmoRetorno.Lines.Add('         CpfDep: '   + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.IdeDep[_a].CpfDep);
        mmoRetorno.Lines.Add('         DepIRRF: '  + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.IdeDep[_a].DepIRRF);
        mmoRetorno.Lines.Add('         DtNascto: ' + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.IdeDep[_a].DtNascto);
        mmoRetorno.Lines.Add('         Nome: '     + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.IdeDep[_a].Nome);
        mmoRetorno.Lines.Add('         TpDep: '    + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.IdeDep[_a].TpDep);
        mmoRetorno.Lines.Add('         DescrDep: ' + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.IdeDep[_a].DescrDep);
      end;
      // infoIRCR [0-999]
      for _a := 0 to _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.CountInfoIRCR -1 do
      begin
        mmoRetorno.Lines.Add('');
        mmoRetorno.Lines.Add(Format('        infoIRCR [%S]: ',[intToStr(_a + 1)]));
        mmoRetorno.Lines.Add('         TpCR: '   + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].TpCR);

        // DedDepen [0-999]
        for _b := 0 to _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].CountDedDepen -1 do
        begin
          mmoRetorno.Lines.Add('');
          mmoRetorno.Lines.Add(Format('        DedDepen [%S]: ',[intToStr(_b + 1)]));
          mmoRetorno.Lines.Add('         TpRend: '    + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].DedDepen[_b].TpRend);
          mmoRetorno.Lines.Add('         CpfDep: '    + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].DedDepen[_b].CpfDep);
          mmoRetorno.Lines.Add('         VlrDedDep: ' + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].DedDepen[_b].VlrDedDep);
        end;

        // PenAlim [0-99]
        for _b := 0 to _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].CountPenAlim -1 do
        begin
          mmoRetorno.Lines.Add('');
          mmoRetorno.Lines.Add(Format('        PenAlim [%S]: ',[intToStr(_b + 1)]));
          mmoRetorno.Lines.Add('         TpRend: '        + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].PenAlim[_b].TpRend);
          mmoRetorno.Lines.Add('         CpfDep: '        + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].PenAlim[_b].CpfDep);
          mmoRetorno.Lines.Add('         VlrDedPenAlim: ' + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].PenAlim[_b].VlrDedPenAlim);
        end;

        // PrevidCompl [0-99]
        for _b := 0 to _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].CountPrevidCompl -1 do
        begin
          mmoRetorno.Lines.Add('');
          mmoRetorno.Lines.Add(Format('        PrevidCompl [%S]: ',[intToStr(_b + 1)]));
          mmoRetorno.Lines.Add('         TpPrev: '        + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].PrevidCompl[_b].TpPrev);
          mmoRetorno.Lines.Add('         CnpjEntidPC: '   + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].PrevidCompl[_b].CnpjEntidPC);
          mmoRetorno.Lines.Add('         VlrDedPC: '      + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].PrevidCompl[_b].VlrDedPC);
          mmoRetorno.Lines.Add('         VlrPatrocFunp: ' + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].PrevidCompl[_b].VlrPatrocFunp);
        end;

        // InfoProcRet [0-50]
        for _b := 0 to _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].CountInfoProcRet -1 do
        begin
          mmoRetorno.Lines.Add('');
          mmoRetorno.Lines.Add(Format('        InfoProcRet [%S]: ',[intToStr(_b + 1)]));
          mmoRetorno.Lines.Add('         TpProcRet: ' + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].TpProcRet);
          mmoRetorno.Lines.Add('         NrProcRet: ' + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].NrProcRet);
          mmoRetorno.Lines.Add('         CodSusp: '   + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].CodSusp);

          // InfoValores [0-2]
          for _c := 0 to _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].CountInfoValores -1 do
          begin
            mmoRetorno.Lines.Add('');
            mmoRetorno.Lines.Add(Format('        InfoValores [%S]: ',[intToStr(_c + 1)]));
            mmoRetorno.Lines.Add('         IndApuracao: '  + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].InfoValores[_c].IndApuracao);
            mmoRetorno.Lines.Add('         VlrNRetido: '   + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].InfoValores[_c].VlrNRetido);
            mmoRetorno.Lines.Add('         VlrDepJud: '    + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].InfoValores[_c].VlrDepJud);
            mmoRetorno.Lines.Add('         VlrCmpAnoCal: ' + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].InfoValores[_c].VlrCmpAnoCal);
            mmoRetorno.Lines.Add('         VlrCmpAnoAnt: ' + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].InfoValores[_c].VlrCmpAnoAnt);
            mmoRetorno.Lines.Add('         VlrRendSusp: '  + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].InfoValores[_c].VlrRendSusp);

            // DedSusp [0-25]
            for _d := 0 to _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].InfoValores[_c].CountDedSusp -1 do
            begin
              mmoRetorno.Lines.Add('');
              mmoRetorno.Lines.Add(Format('        dedSusp [%S]: ',[intToStr(_d + 1)]));
              mmoRetorno.Lines.Add('         IndTpDeducao: '   + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].InfoValores[_c].DedSusp[_d].IndTpDeducao);
              mmoRetorno.Lines.Add('         VlrDedSusp: '     + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].InfoValores[_c].DedSusp[_d].VlrDedSusp);
              mmoRetorno.Lines.Add('         CnpjEntidPC: '    + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].InfoValores[_c].DedSusp[_d].CnpjEntidPC);
              mmoRetorno.Lines.Add('         VlrPatrocFunp: '  + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].InfoValores[_c].DedSusp[_d].VlrPatrocFunp);

              // BenefPen [0-99]
              for _e := 0 to _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].InfoValores[_c].DedSusp[_d].CountBenefPen -1 do
              begin
                mmoRetorno.Lines.Add('');
                mmoRetorno.Lines.Add(Format('        BenefPen [%S]: ',[intToStr(_e + 1)]));
                mmoRetorno.Lines.Add('         CpfDep: '       + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].InfoValores[_c].DedSusp[_d].BenefPen[_e].CpfDep);
                mmoRetorno.Lines.Add('         VlrDepenSusp: ' + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].InfoValores[_c].DedSusp[_d].BenefPen[_e].VlrDepenSusp);
              end;
            end;
          end;
        end;
      end;
      // planSaude [0-99]
      for _a := 0 to _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.CountPlanSaude -1 do
      begin
        mmoRetorno.Lines.Add('');
        mmoRetorno.Lines.Add(Format('        PlanSaude [%S]: ',[intToStr(_a + 1)]));
        mmoRetorno.Lines.Add('         CnpjOper: '    + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.PlanSaude[_a].CnpjOper);
        mmoRetorno.Lines.Add('         RegANS: '      + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.PlanSaude[_a].RegANS);
        mmoRetorno.Lines.Add('         VlrSaudeTit: ' + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.PlanSaude[_a].VlrSaudeTit);

        // infoDepSau [0-99]
        for _b := 0 to _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.PlanSaude[_a].CountInfoDepSau -1 do
        begin
          mmoRetorno.Lines.Add('');
          mmoRetorno.Lines.Add(Format('        InfoDepSau [%S]: ',[intToStr(_b + 1)]));
          mmoRetorno.Lines.Add('         CpfDep: '      + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.PlanSaude[_a].InfoDepSau[_b].CpfDep);
          mmoRetorno.Lines.Add('         VlrSaudeDep: ' + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.PlanSaude[_a].InfoDepSau[_b].VlrSaudeDep);
        end;
      end;
      // infoReembMed [0-99]
      for _a := 0 to _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.CountInfoReembMed -1 do
      begin
        mmoRetorno.Lines.Add('');
        mmoRetorno.Lines.Add(Format('        infoReembMed [%S]: ',[intToStr(_a + 1)]));
        mmoRetorno.Lines.Add('         IndOrgReemb: ' + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].IndOrgReemb);
        mmoRetorno.Lines.Add('         CnpjOper: '    + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].CnpjOper);
        mmoRetorno.Lines.Add('         RegANS: '      + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].RegANS);
        // detReembTit [0-99]
        for _b := 0 to _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].CountDetReembTit -1 do
        begin
          mmoRetorno.Lines.Add('');
          mmoRetorno.Lines.Add(Format('        DetReembTit [%S]: ',[intToStr(_b + 1)]));
          mmoRetorno.Lines.Add('         TpInsc: '      + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].DetReembTit[_b].TpInsc);
          mmoRetorno.Lines.Add('         NrInsc: '      + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].DetReembTit[_b].NrInsc);
          mmoRetorno.Lines.Add('         VlrReemb: '    + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].DetReembTit[_b].VlrReemb);
          mmoRetorno.Lines.Add('         VlrReembAnt: ' + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].DetReembTit[_b].VlrReembAnt);
        end;
        // infoReembDep [0-99]
        for _b := 0 to _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].CountInfoReembDep -1 do
        begin
          mmoRetorno.Lines.Add('');
          mmoRetorno.Lines.Add(Format('        infoReembDep [%S]: ',[intToStr(_b + 1)]));
          mmoRetorno.Lines.Add('         CpfBenef: ' + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].InfoReembDep[_b].CpfBenef);

          // DetReembDep [0-99]
          for _c := 0 to _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].InfoReembDep[_b].CountDetReembDep -1 do
          begin
            mmoRetorno.Lines.Add('');
            mmoRetorno.Lines.Add(Format('        DetReembDep [%S]: ',[intToStr(_c + 1)]));
            mmoRetorno.Lines.Add('         TpInsc: '      + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].InfoReembDep[_b].DetReembDep[_c].TpInsc);
            mmoRetorno.Lines.Add('         NrInsc: '      + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].InfoReembDep[_b].DetReembDep[_c].NrInsc);
            mmoRetorno.Lines.Add('         VlrReemb: '    + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].InfoReembDep[_b].DetReembDep[_c].VlrReemb);
            mmoRetorno.Lines.Add('         VlrReembAnt: ' + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].InfoReembDep[_b].DetReembDep[_c].VlrReembAnt);
          end;
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
      mmoRetorno.Lines.Add('');
      mmoRetorno.Lines.Add('### S5003 ###');
      mmoRetorno.Lines.Add('        Id: ' + _RetConsultaItem.S5003.Id);
      // IdeEvento
      mmoRetorno.Lines.Add('        nrRecArqBase: ' + _RetConsultaItem.S5003.IdeEvento.NrRecArqBase);
      mmoRetorno.Lines.Add('        indApuracao: ' + _RetConsultaItem.S5003.IdeEvento.IndApuracao);
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

//                    for _h := 0 to _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].BasePerAntE[_f].DetRubrSuspPerAntE[_g].CountIdeProcessoFGTS - 1 do
//                    begin
//                      mmoRetorno.Lines.Add('ideProcessoFGTS: ');
//                      mmoRetorno.Lines.Add('                  nrProc: ' +
//                        _RetConsultaItem.S5003.InfoFGTS.IdeEstab[_a].IdeLotacao[_b].InfoTrabFGTS[_c].InfoBaseFGTS[_d].InfoBasePerAntE[_e].BasePerAntE[_f].DetRubrSuspPerAntE[_g].IdeProcessoFGTS[_h].NrProc );
//                    end;
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
          mmoRetorno.Lines.Add('        cnoObra: ' +
            _RetConsultaItem.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoEmprParcial.CnoObra);
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
      mmoRetorno.Lines.Add('        indApuracao: ' + _RetConsultaItem.S5013.IdeEvento.IndApuracao);
      mmoRetorno.Lines.Add('        perApur: ' + _RetConsultaItem.S5013.IdeEvento.perApur);
      // IdeEmpregador
      mmoRetorno.Lines.Add('        IdeEmpregador ');
      mmoRetorno.Lines.Add('        tpInsc: ' + _RetConsultaItem.S5013.IdeEmpregador.tpInsc);
      mmoRetorno.Lines.Add('        nrInsc: ' + _RetConsultaItem.S5013.IdeEmpregador.nrInsc);
      // infoFGTS
      mmoRetorno.Lines.Add('        infoFGTS ');
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
  procedure preencher_S5503;
  var
    _a, _b: integer;
  begin
    if not _RetConsultaItem.S5503.IsEmpty then
    begin
      mmoRetorno.Lines.Add('');
      mmoRetorno.Lines.Add('        ### S5503 ###');
      mmoRetorno.Lines.Add('        Id: ' + _RetConsultaItem.S5503.Id);
      // IdeEvento
      mmoRetorno.Lines.Add('        nrRecArqBase: ' + _RetConsultaItem.S5503.IdeEvento.NrRecArqBase);
      mmoRetorno.Lines.Add('        perApur: ' + _RetConsultaItem.S5503.IdeEvento.perApur);
      // IdeEmpregador
      mmoRetorno.Lines.Add('        tpInsc: ' + _RetConsultaItem.S5503.IdeEmpregador.tpInsc);
      mmoRetorno.Lines.Add('        nrInsc: ' + _RetConsultaItem.S5503.IdeEmpregador.nrInsc);
      // nrProcTrab
      mmoRetorno.Lines.Add('        nrProcTrab: ' + _RetConsultaItem.S5503.IdeProc.NrProcTrab);
      // origem
      mmoRetorno.Lines.Add('        origem: ' + _RetConsultaItem.S5503.IdeProc.Origem);
      // cpfTrab
      mmoRetorno.Lines.Add('        cpfTrab: ' + _RetConsultaItem.S5503.IdeTrabalhador.CpfTrab);
      // InfoTrabFGTS
      for _a := 0 to _RetConsultaItem.S5503.CountInfoTrabFGTS - 1 do
      begin
        mmoRetorno.Lines.Add('');
        mmoRetorno.Lines.Add('        InfoTrabFGTS: ');
        mmoRetorno.Lines.Add('         matricula: ' +
          _RetConsultaItem.S5503.InfoTrabFGTS[_a].matricula);
        mmoRetorno.Lines.Add('         codCateg: ' +
          _RetConsultaItem.S5503.InfoTrabFGTS[_a].codCateg);
        mmoRetorno.Lines.Add('         categOrig: ' +
          _RetConsultaItem.S5503.InfoTrabFGTS[_a].categOrig);
        mmoRetorno.Lines.Add('');
        mmoRetorno.Lines.Add('        InfoFGTSProcTrab: ');
        mmoRetorno.Lines.Add('         TotalFGTS: ' +
        _RetConsultaItem.S5503.InfoTrabFGTS[_a].InfoFGTSProcTrab.TotalFGTS);
        mmoRetorno.Lines.Add('');
        mmoRetorno.Lines.Add('        IdeEstab: ');
        mmoRetorno.Lines.Add('         TpInsc: ' +
        _RetConsultaItem.S5503.InfoTrabFGTS[_a].InfoFGTSProcTrab.IdeEstab.TpInsc);
        mmoRetorno.Lines.Add('         NrInsc: ' +
        _RetConsultaItem.S5503.InfoTrabFGTS[_a].InfoFGTSProcTrab.IdeEstab.NrInsc);
        for _b := 0 to _RetConsultaItem.S5503.InfoTrabFGTS[_a].InfoFGTSProcTrab.IdeEstab.CountBasePerRef - 1 do
        begin
          mmoRetorno.Lines.Add('');
          mmoRetorno.Lines.Add('         basePerRef: ');
          mmoRetorno.Lines.Add('          perRef: '          + _RetConsultaItem.S5503.InfoTrabFGTS[_a].InfoFGTSProcTrab.IdeEstab.BasePerRef[_b].PerRef);
          mmoRetorno.Lines.Add('          codCateg: '        + _RetConsultaItem.S5503.InfoTrabFGTS[_a].InfoFGTSProcTrab.IdeEstab.BasePerRef[_b].CodCateg);
          mmoRetorno.Lines.Add('          tpValorProcTrab: ' + _RetConsultaItem.S5503.InfoTrabFGTS[_a].InfoFGTSProcTrab.IdeEstab.BasePerRef[_b].TpValorProcTrab);
          mmoRetorno.Lines.Add('          remFGTSProcTrab: ' + _RetConsultaItem.S5503.InfoTrabFGTS[_a].InfoFGTSProcTrab.IdeEstab.BasePerRef[_b].RemFGTSProcTrab);
          mmoRetorno.Lines.Add('          dpsFGTSProcTrab: ' + _RetConsultaItem.S5503.InfoTrabFGTS[_a].InfoFGTSProcTrab.IdeEstab.BasePerRef[_b].DpsFGTSProcTrab);
          mmoRetorno.Lines.Add('          remFGTSSefip: '    + _RetConsultaItem.S5503.InfoTrabFGTS[_a].InfoFGTSProcTrab.IdeEstab.BasePerRef[_b].RemFGTSSefip);
          mmoRetorno.Lines.Add('          dpsFGTSSefip: '    + _RetConsultaItem.S5503.InfoTrabFGTS[_a].InfoFGTSProcTrab.IdeEstab.BasePerRef[_b].DpsFGTSSefip);
          mmoRetorno.Lines.Add('          remFGTSDecAnt: '   + _RetConsultaItem.S5503.InfoTrabFGTS[_a].InfoFGTSProcTrab.IdeEstab.BasePerRef[_b].RemFGTSDecAnt);
          mmoRetorno.Lines.Add('          dpsFGTSDecAnt: '   + _RetConsultaItem.S5503.InfoTrabFGTS[_a].InfoFGTSProcTrab.IdeEstab.BasePerRef[_b].DpsFGTSDecAnt);
        end;
      end;
    end;
  end;
  procedure preencher_S5012;
  var
    _a, _b: integer;
  begin
    if not _RetConsultaItem.S5012.IsEmpty then
    begin
      mmoRetorno.Lines.Add('');
      mmoRetorno.Lines.Add('        ### S5012 ###');
      mmoRetorno.Lines.Add('        Id: ' + _RetConsultaItem.S5012.Id);
      // IdeEvento
      mmoRetorno.Lines.Add('        perApur: ' + _RetConsultaItem.S5012.IdeEvento.perApur);
      // IdeEmpregador
      mmoRetorno.Lines.Add('        tpInsc: ' + _RetConsultaItem.S5012.IdeEmpregador.tpInsc);
      mmoRetorno.Lines.Add('        nrInsc: ' + _RetConsultaItem.S5012.IdeEmpregador.nrInsc);
      // InfoIRRF
      mmoRetorno.Lines.Add('        NrRecArqBase: ' + _RetConsultaItem.S5012.InfoIRRF.NrRecArqBase);
      mmoRetorno.Lines.Add('        IndExistInfo: ' + _RetConsultaItem.S5012.InfoIRRF.IndExistInfo);
      // infoCRMen
      for _a := 0 to _RetConsultaItem.S5012.InfoIRRF.CountInfoCRMen - 1 do
      begin
        mmoRetorno.Lines.Add('');
        mmoRetorno.Lines.Add(Format('        InfoCRMen [%S]: ',[intToStr(_a + 1)]));
        mmoRetorno.Lines.Add('         CRMen: ' + _RetConsultaItem.S5012.InfoIRRF.InfoCRMen[_a].CRMen);
        mmoRetorno.Lines.Add('         VrCRMen: ' + _RetConsultaItem.S5012.InfoIRRF.InfoCRMen[_a].VrCRMen);
      end;
      // InfoCRDia
      for _a := 0 to _RetConsultaItem.S5012.InfoIRRF.CountInfoCRDia - 1 do
      begin
        mmoRetorno.Lines.Add('');
        mmoRetorno.Lines.Add(Format('        InfoCRMen [%S]: ',[intToStr(_a + 1)]));
        mmoRetorno.Lines.Add('         PerApurDia: ' + _RetConsultaItem.S5012.InfoIRRF.InfoCRDia[_a].PerApurDia);
        mmoRetorno.Lines.Add('         CRDia: '      + _RetConsultaItem.S5012.InfoIRRF.InfoCRDia[_a].CRDia);
        mmoRetorno.Lines.Add('         VrCRDia: '    + _RetConsultaItem.S5012.InfoIRRF.InfoCRDia[_a].VrCRDia);
      end;
    end;
  end;
begin
  if (edtIdLote.Text = EmptyStr) then
  begin
    _RetConsulta := eSocial.ConsultarLoteEventos(rgTpConsulta.Items[rgEventosRetorno.ItemIndex]);
  end
  else
  begin
    if rgTpConsulta.ItemIndex = 0 then
      _RetConsulta := eSocial.ConsultarLoteEventos(edtIdLote.Text)
    else if rgTpConsulta.ItemIndex = 1 then
      _RetConsulta := eSocial.ConsultarIdEvento(edtIdLote.Text)
    else if rgTpConsulta.ItemIndex = 2 then
      _RetConsulta := eSocial.ConsultarEventoPorRecibo(edtIdLote.Text);
  end;
  mmoXmlRetorno.Lines.Clear;
  mmoXmlRetorno.Lines.Add(_RetConsulta.XmlRetorno);
  mmoXmlEnvio.Lines.Clear;
  mmoXmlEnvio.Lines.Add(_RetConsulta.XmlEnviado);
  mmoRetorno.Lines.Clear;
  mmoRetorno.Lines.Add('### CONSULTA PROTOCOLO ###');
  mmoRetorno.Lines.Add('N�mero do Protocolo: ' + _RetConsulta.NumeroProtocolo);
  mmoRetorno.Lines.Add('Mensagem de Retorno: ' + _RetConsulta.Mensagem);
  mmoRetorno.Lines.Add('Status do Lote: ' + _RetConsulta.Status);
  mmoRetorno.Lines.Add('Tempo estimado para conclus�o do processamento: ' + _RetConsulta.TempoEstimadoConclusao);
  mmoRetorno.Lines.Add('Id do Lote: ' + _RetConsulta.IdLote);
  for _i := 0 to _RetConsulta.Count - 1 do
  begin
    _RetConsultaItem := _RetConsulta.Eventos[_i];
    mmoRetorno.Lines.Add('    Evento: ' + IntToStr(_i + 1));
    mmoRetorno.Lines.Add('    Id Evento: ' + _RetConsultaItem.IdEvento);
    mmoRetorno.Lines.Add('    N�mero Recibo: ' + _RetConsultaItem.NumeroRecibo);
    mmoRetorno.Lines.Add('    C�digo de Status: ' + _RetConsultaItem.cStat);
    mmoRetorno.Lines.Add('    Mensagem: ' + _RetConsultaItem.Mensagem);
    mmoRetorno.Lines.Add('    Status do Evento: ' + _RetConsultaItem.Status);
    preencher_S5001;
    preencher_S5002;
    preencher_S5003;
    preencher_S5011;
    preencher_S5013;
    preencher_S5503;
    preencher_S5012;
    for _j := 0 to _RetConsultaItem.Count - 1 do
    begin
      _RetConsultaOcorrencia := _RetConsultaItem.Ocorrencias[_j];
      mmoRetorno.Lines.Add('        Ocorrencia: ' + IntToStr(_j + 1));
      mmoRetorno.Lines.Add('        C�digo: ' + _RetConsultaOcorrencia.Codigo);
      mmoRetorno.Lines.Add('        Descri��o: ' + _RetConsultaOcorrencia.Descricao);
      mmoRetorno.Lines.Add('        Tipo: ' + _RetConsultaOcorrencia.Tipo);
      mmoRetorno.Lines.Add('        Localiza��o: ' + _RetConsultaOcorrencia.Localizacao);
    end;
    for _k := 0 to _RetConsulta.CountOcorrencias - 1 do
    begin
      _RetConsultaOcorrenciaEnvio := _RetConsulta.Ocorrencias[_k];
      mmoRetorno.Lines.Add('    Codigo: ' + _RetConsultaOcorrenciaEnvio.Codigo);
      mmoRetorno.Lines.Add('    Tipo: ' + _RetConsultaOcorrenciaEnvio.Tipo);
      mmoRetorno.Lines.Add('    Localiza��o: ' + _RetConsultaOcorrenciaEnvio.Localizacao);
      mmoRetorno.Lines.Add('    Descri��o: ' + _RetConsultaOcorrenciaEnvio.Descricao);
    end;
  end;
  mmoXmlEnvio.Text := _RetConsulta.XmlEnviado;
  mmoXmlRetorno.Text := _RetConsulta.XmlRetorno;
end;

procedure TfrmeSocialS.btnEnviarClick(Sender: TObject);
var
  RetEnvio: IspdS12RetEnviarLoteEventos;
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

end;

procedure TfrmeSocialS.btnXMLClick(Sender: TObject);
begin
  mmoRetorno.Text := eSocial.GerarXMLporTx2(mmoRetorno.Text);
end;

procedure TfrmeSocialS.Button1Click(Sender: TObject);
var
  _retorno: IspdS12RetReconsultarLoteSefaz;
begin
  _retorno := eSocial.ReconsultarLoteSefaz(edtIdLote.Text);
  mmoRetorno.Text := _retorno.Mensagem;
//  mmoRetorno.Text := 'Consulta enviada com sucesso! Realize a consulta normal para que possa verificar o retorno do eSocial.';
end;

procedure TfrmeSocialS.btnConsultarIdsEventoLoteClick(Sender: TObject);
var
  RetConsultaIdsEventoLote: IspdS12RetConsultarIdsEventosLote;
  RetConsultaIdsEventoLoteItem: IspdS12RetConsultarIdsEventosLoteItem;
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

End.
