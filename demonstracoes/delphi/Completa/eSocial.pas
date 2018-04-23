unit eSocial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, StdCtrls, ESocialClientX_TLB;

type
  TExemplo = class(TForm)
    btnConfigurar: TButton;
    btnGerarXML: TButton;
    btnAssinar: TButton;
    btnEnviar: TButton;
    btnConsultar: TButton;
    cbbCertificados: TComboBox;
    edtIDLote: TEdit;
    mmXML: TMemo;
    spdESocialClientX1: TspdESocialClientX;
    btnIncluir: TButton;
    btnExcluir: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnConfigurarClick(Sender: TObject);
    procedure btnGerarXMLClick(Sender: TObject);
    procedure btnAssinarClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure PopulaTotalizadores(aObjeto: IspdRetConsultarLoteItem);
  private
    { Private declarations }
  public
    { Public declarations }
    eSocial: TspdESocialClientX;
  end;

var
  Exemplo: TExemplo;

implementation

{$R *.dfm}

procedure TExemplo.btnAssinarClick(Sender: TObject);
begin

mmXML.Text := eSocial.AssinarEvento(mmXML.Text);

end;

procedure TExemplo.btnConfigurarClick(Sender: TObject);
begin

eSocial.CpfCnpjEmpregador := '08187168000160';
eSocial.CpfCnpjTransmissor := '08187168000160';
eSocial.VersaoManual := vm24;
eSocial.DiretorioTemplates := 'C:\Program Files\TecnoSpeed\eSocial\Arquivos\Templates\';
eSocial.DiretorioEsquemas := 'C:\Program Files\TecnoSpeed\eSocial\Arquivos\Esquemas\';
eSocial.Ambiente := akPreProducaoReais;
eSocial.ConfigurarSoftwareHouse('12090234903','GRk7PBfmzx5QaeJFHpMUI3GlyFaZIGDUQAkezoPb');
eSocial.NomeCertificado := cbbCertificados.Text;

mmXML.Lines.Text := 'Propriedades configuradas.';

end;

procedure TExemplo.btnConsultarClick(Sender: TObject);
var
  _RetConsulta: IspdRetConsultarLote;
  _RetConsultaItem: IspdRetConsultarLoteItem;
  _RetConsultaOcorrencia: IspdRetConsultarLoteOcorrencia;
  _RetConsultaOcorrenciaEnvio: IspdRetConsultarLoteOcorrenciaEnvio;
  _i, _j, _k: integer;
begin
  _RetConsulta := eSocial.ConsultarLoteEventos(edtIDLote.Text);

  mmXML.Lines.Clear;
  mmXML.Lines.Add('### CONSULTA PROTOCOLO ###');
  mmXML.Lines.Add('Número do Protocolo: ' + _RetConsulta.NumeroProtocolo);
  mmXML.Lines.Add('Mensagem de Retorno: ' + _RetConsulta.Mensagem);
  mmXML.Lines.Add('Status do Lote: ' + _RetConsulta.Status);
  mmXML.Lines.Add('Tempo estimado de Conclus�o: ' + _RetConsulta.TempoEstimadoConclusao);


  for _k := 0 to _RetConsulta.CountOcorrencias - 1 do
  begin
    _RetConsultaOcorrenciaEnvio := _RetConsulta.Ocorrencias[_k];
    mmXML.Lines.Add('    Ocorrencia ' + IntToStr(_k + 1));
    mmXML.Lines.Add('    Codigo: ' + _RetConsultaOcorrenciaEnvio.Codigo);
    mmXML.Lines.Add('    Tipo: ' + _RetConsultaOcorrenciaEnvio.Tipo);
    mmXML.Lines.Add('    Localização: ' + _RetConsultaOcorrenciaEnvio.Localizacao);
    mmXML.Lines.Add('    Descrição: ' + _RetConsultaOcorrenciaEnvio.Descricao);
  end;

  for _i := 0 to _RetConsulta.Count - 1 do
  begin
    _RetConsultaItem := _RetConsulta.Eventos[_i];
    mmXML.Lines.Add('    Evento: ' + IntToStr(_i + 1));
    mmXML.Lines.Add('    Id Evento: ' + _RetConsultaItem.IdEvento);
    mmXML.Lines.Add('    Número Recibo: ' + _RetConsultaItem.NumeroRecibo);
    mmXML.Lines.Add('    Código de Status: ' + _RetConsultaItem.cStat);
    mmXML.Lines.Add('    Mensagem: ' + _RetConsultaItem.Mensagem);
    mmXML.Lines.Add('    Status do Evento: ' + _RetConsultaItem.Status);

    PopulaTotalizadores(_RetConsultaItem);

    for _j := 0 to _RetConsultaItem.Count - 1 do
    begin
      _RetConsultaOcorrencia := _RetConsultaItem.Ocorrencias[_j];
      mmXML.Lines.Add('            Ocorrencia: ' + IntToStr(_j + 1));
      mmXML.Lines.Add('            C�digo: ' + _RetConsultaOcorrencia.Codigo);
      mmXML.Lines.Add('            Descrição: ' + _RetConsultaOcorrencia.Descricao);
      mmXML.Lines.Add('            Tipo: ' + _RetConsultaOcorrencia.Tipo);
      mmXML.Lines.Add('            Localização: ' + _RetConsultaOcorrencia.Localizacao);
    end;
  end;
  mmXML.Lines.Add('XML de Retorno: ' + _RetConsulta.XmlRetorno);
end;

procedure TExemplo.btnEnviarClick(Sender: TObject);
var
_Retorno: IspdRetEnviarLoteEventos;
begin

_Retorno := eSocial.EnviarLoteEventos(mmXML.Text, 1);
edtIDLote.Text := _Retorno.IdLote;

mmXML.Lines.Clear;
mmXML.Lines.Add('Retorno:');
mmXML.Lines.Add('    ID Lote: ' + _Retorno.IdLote);
mmXML.Lines.Add('    Mensagem: ' + _Retorno.Mensagem);

end;

procedure TExemplo.btnGerarXMLClick(Sender: TObject);
begin

mmXML.Text := eSocial.GerarXMLporTx2(mmXML.Text);

end;

procedure TExemplo.btnIncluirClick(Sender: TObject);
begin

mmXML.Lines.Clear;

mmXML.Lines.Add('INCLUIRS1000');

mmXML.Lines.Add('tpAmb_4=' + '2');
mmXML.Lines.Add('procEmi_5=' + '1');
mmXML.Lines.Add('verProc_6=' + '1.0');
mmXML.Lines.Add('tpInsc_8=' + '1');
mmXML.Lines.Add('nrInsc_9=' + '08187168');
mmXML.Lines.Add('iniValid_13=' + '2017-07');
mmXML.Lines.Add('nmRazao_15=' + 'TECNOSPEED TECNOLOGIA DA INFORMACAO');
mmXML.Lines.Add('classTrib_16=' + '99');
mmXML.Lines.Add('natJurid_17=' + '2054');
mmXML.Lines.Add('indCoop_18=' + '0');
mmXML.Lines.Add('indConstr_19=' + '0');
mmXML.Lines.Add('indDesFolha_20=' + '0');
mmXML.Lines.Add('indOptRegEletron_21=' + '0');
mmXML.Lines.Add('indEntEd_23=' + 'N');
mmXML.Lines.Add('indEtt_24=' + 'N');
mmXML.Lines.Add('nmCtt_36=' + 'João da Silva');
mmXML.Lines.Add('cpfCtt_37=' + '12090234903');
mmXML.Lines.Add('foneCel_39=' + '7867834687');
mmXML.Lines.Add('foneFixo_38=' + '4430379500');
mmXML.Lines.Add('indSitPJ_63=' + '0');
mmXML.Lines.Add('INCLUIRSOFTWAREHOUSE_55');
mmXML.Lines.Add('cnpjSoftHouse_56=' + '13930441000134');
mmXML.Lines.Add('nmRazao_57=' + 'Empresa de Teste');
mmXML.Lines.Add('nmCont_58=' + 'Nome do Contato');
mmXML.Lines.Add('telefone_59=' + '4430303030');
mmXML.Lines.Add('SALVARSOFTWAREHOUSE_55');

mmXML.Lines.Add('SALVARS1000');

end;

procedure TExemplo.btnExcluirClick(Sender: TObject);
begin

mmXML.Lines.Clear;

mmXML.Lines.Add('EXCLUIRS1000');

mmXML.Lines.Add('tpAmb_4=' + '2');
mmXML.Lines.Add('procEmi_5=' + '1');
mmXML.Lines.Add('verProc_6=' + '1.0');
mmXML.Lines.Add('tpInsc_8=' + '1');
mmXML.Lines.Add('nrInsc_9=' + '08187168');
mmXML.Lines.Add('iniValid_13=' + '2017-07');

mmXML.Lines.Add('SALVARS1000');

end;

procedure TExemplo.FormCreate(Sender: TObject);
begin

eSocial := TspdESocialClientX.Create(nil);

cbbCertificados.Items.Text := eSocial.ListarCertificados(#13#10);

end;

procedure TExemplo.PopulaTotalizadores(aObjeto: IspdRetConsultarLoteItem);
var
  _a, _b, _c: integer;
begin
  if aObjeto.S5001.Id <> EmptyStr then
  begin
    {--------------------S5001--------------------}
    mmXML.Lines.Add('        ### S5001 ###');
    mmXML.Lines.Add('        Id: ' + aObjeto.S5001.Id);
    //IdeEvento
    mmXML.Lines.Add('        nrRecArqBase: ' + aObjeto.S5001.IdeEvento.NrRecArqBase);
    mmXML.Lines.Add('        indApuracao: ' + aObjeto.S5001.IdeEvento.indApuracao);
    mmXML.Lines.Add('        perApur: ' + aObjeto.S5001.IdeEvento.perApur);

    //IdeEmpregador
    mmXML.Lines.Add('        tpInsc: ' + aObjeto.S5001.IdeEmpregador.tpInsc);
    mmXML.Lines.Add('        nrInsc: ' + aObjeto.S5001.IdeEmpregador.nrInsc);

    //IdeTrabalhador
    mmXML.Lines.Add('        cpfTrab: ' + aObjeto.S5001.IdeTrabalhador.cpfTrab);

    //ProcJudTrab
    for _a := 0 to aObjeto.S5001.IdeTrabalhador.CountProcJudTrab - 1 do
    begin
      mmXML.Lines.Add('        NrProcJud: ' + aObjeto.S5001.IdeTrabalhador.ProcJudTrab[_a].NrProcJud);
      mmXML.Lines.Add('        codSusp: ' + aObjeto.S5001.IdeTrabalhador.ProcJudTrab[_a].codSusp);
    end;

    //InfoCpCalc
    for _a := 0 to aObjeto.S5001.CountInfoCpCalc - 1 do
    begin
      mmXML.Lines.Add('        tpCR: ' + aObjeto.S5001.InfoCpCalc[_a].tpCR);
      mmXML.Lines.Add('        vrCpSeg: ' + aObjeto.S5001.InfoCpCalc[_a].vrCpSeg);
      mmXML.Lines.Add('        vrDescSeg: ' + aObjeto.S5001.InfoCpCalc[_a].vrDescSeg);
    end;

    //IdeEstabLot
    for _a := 0 to aObjeto.S5001.InfoCp.CountIdeEstabLot - 1 do
    begin
      mmXML.Lines.Add('        vrDescSeg: ' + aObjeto.S5001.InfoCp.IdeEstabLot[_a].TpInsc);
      mmXML.Lines.Add('        nrInsc: ' + aObjeto.S5001.InfoCp.IdeEstabLot[_a].nrInsc);
      mmXML.Lines.Add('        codLotacao: ' + aObjeto.S5001.InfoCp.IdeEstabLot[_a].codLotacao);

      //InfoCategIncid
      for _b := 0 to aObjeto.S5001.InfoCp.IdeEstabLot[_a].CountInfoCategIncid - 1 do
      begin
        mmXML.Lines.Add('        vrDescSeg: ' + aObjeto.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].Matricula);
        mmXML.Lines.Add('        codCateg: ' + aObjeto.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].codCateg);
        mmXML.Lines.Add('        indSimples: ' + aObjeto.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].indSimples);

        //InfoBaseCS
        for _c := 0 to aObjeto.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CountInfoBaseCS - 1 do
        begin
          mmXML.Lines.Add('        Ind13: ' + aObjeto.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoBaseCS[_c].Ind13);
          mmXML.Lines.Add('        tpValor: ' + aObjeto.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoBaseCS[_c].tpValor);
          mmXML.Lines.Add('        valor: ' + aObjeto.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoBaseCS[_c].valor);
        end;

        //CalcTerc
        for _c := 0 to aObjeto.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CountCalcTerc - 1 do
        begin
          mmXML.Lines.Add('        tpCR: ' + aObjeto.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CalcTerc[_c].tpCR);
          mmXML.Lines.Add('        vrCsSegTerc: ' + aObjeto.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CalcTerc[_c].vrCsSegTerc);
          mmXML.Lines.Add('        vrDescTerc: ' + aObjeto.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CalcTerc[_c].vrDescTerc);
        end;
      end;
    end;
  end;
  if aObjeto.S5002.Id <> EmptyStr then
  begin
    {--------------------S5002--------------------}
    mmXML.Lines.Add('        ### S5002 ###');
    mmXML.Lines.Add('        Id: ' + aObjeto.S5002.Id);

    //IdeEvento
    mmXML.Lines.Add('        nrRecArqBase: ' + aObjeto.S5002.IdeEvento.nrRecArqBase);
    mmXML.Lines.Add('        perApur: ' + aObjeto.S5002.IdeEvento.perApur);

    //IdeEmpregador
    mmXML.Lines.Add('        tpInsc: ' + aObjeto.S5002.IdeEmpregador.tpInsc);
    mmXML.Lines.Add('        nrInsc: ' + aObjeto.S5002.IdeEmpregador.nrInsc);

    //IdeTrabalhador
    mmXML.Lines.Add('        cpfTrab: ' + aObjeto.S5002.IdeTrabalhador.cpfTrab);

    //InfoDep
    mmXML.Lines.Add('        vrDedDep: ' + aObjeto.S5002.InfoDep.vrDedDep);

    //InfoIrrf
    for _a := 0 to aObjeto.S5002.CountInfoIrrf - 1 do
    begin
      mmXML.Lines.Add('        codCateg: ' + aObjeto.S5002.InfoIrrf[_a].codCateg);
      mmXML.Lines.Add('        indResBr: ' + aObjeto.S5002.InfoIrrf[_a].indResBr);

      //BasesIrrf
      for _b := 0 to aObjeto.S5002.InfoIrrf[_a].CountBasesIrrf - 1 do
      begin
        mmXML.Lines.Add('        tpValor: ' + aObjeto.S5002.InfoIrrf[_a].BasesIrrf[_b].tpValor);
        mmXML.Lines.Add('        Valor: ' + aObjeto.S5002.InfoIrrf[_a].BasesIrrf[_b].Valor);
      end;

      //Irrf
      for _b := 0 to aObjeto.S5002.InfoIrrf[_a].CountIrrf - 1 do
      begin
        mmXML.Lines.Add('        tpCR: ' + aObjeto.S5002.InfoIrrf[_a].Irrf[_b].tpCR);
        mmXML.Lines.Add('        vrIrrfDesc: ' + aObjeto.S5002.InfoIrrf[_a].Irrf[_b].vrIrrfDesc);
      end;

      //IdePais
      mmXML.Lines.Add('        codPais: ' + aObjeto.S5002.InfoIrrf[_a].IdePgtoExt.IdePais.codPais);
      mmXML.Lines.Add('        indNIF: ' + aObjeto.S5002.InfoIrrf[_a].IdePgtoExt.IdePais.indNIF);
      mmXML.Lines.Add('        nifBenef: ' + aObjeto.S5002.InfoIrrf[_a].IdePgtoExt.IdePais.nifBenef);

      //EndExt
      mmXML.Lines.Add('        dscLograd: ' + aObjeto.S5002.InfoIrrf[_a].IdePgtoExt.EndExt.dscLograd);
      mmXML.Lines.Add('        nrLograd: ' + aObjeto.S5002.InfoIrrf[_a].IdePgtoExt.EndExt.nrLograd);
      mmXML.Lines.Add('        complem: ' + aObjeto.S5002.InfoIrrf[_a].IdePgtoExt.EndExt.complem);
      mmXML.Lines.Add('        bairro: ' + aObjeto.S5002.InfoIrrf[_a].IdePgtoExt.EndExt.bairro);
      mmXML.Lines.Add('        nmCid: ' + aObjeto.S5002.InfoIrrf[_a].IdePgtoExt.EndExt.nmCid);
      mmXML.Lines.Add('        codPostal: ' + aObjeto.S5002.InfoIrrf[_a].IdePgtoExt.EndExt.codPostal);
    end;
  end;
  if aObjeto.S5011.Id <> EmptyStr then
  begin
    {--------------------S5011--------------------}
    mmXML.Lines.Add('        ### S5011 ###');
    mmXML.Lines.Add('        Id: ' + aObjeto.S5011.Id);

    //IdeEvento
    mmXML.Lines.Add('        indApuracao: ' + aObjeto.S5011.IdeEvento.indApuracao);
    mmXML.Lines.Add('        perApur: ' + aObjeto.S5011.IdeEvento.perApur);

    //IdeEmpregador
    mmXML.Lines.Add('        tpInsc: ' + aObjeto.S5011.IdeEmpregador.tpInsc);
    mmXML.Lines.Add('        nrInsc: ' + aObjeto.S5011.IdeEmpregador.nrInsc);

    //InfoCS
    mmXML.Lines.Add('        nrRecArqBase: ' + aObjeto.S5011.InfoCS.nrRecArqBase);
    mmXML.Lines.Add('        indExistInfo: ' + aObjeto.S5011.InfoCS.indExistInfo);

    //InfoCPSeg
    mmXML.Lines.Add('        vrDescCP: ' + aObjeto.S5011.InfoCS.InfoCPSeg.vrDescCP);
    mmXML.Lines.Add('        vrCpSeg: ' + aObjeto.S5011.InfoCS.InfoCPSeg.vrCpSeg);

    //InfoContrib
    mmXML.Lines.Add('        classTrib: ' + aObjeto.S5011.InfoCS.InfoContrib.classTrib);

    //InfoPJ
    mmXML.Lines.Add('        indCoop: ' + aObjeto.S5011.InfoCS.InfoContrib.InfoPJ.indCoop);
    mmXML.Lines.Add('        indConstr: ' + aObjeto.S5011.InfoCS.InfoContrib.InfoPJ.indConstr);
    mmXML.Lines.Add('        indSubstPatr: ' + aObjeto.S5011.InfoCS.InfoContrib.InfoPJ.indSubstPatr);
    mmXML.Lines.Add('        percRedContrib: ' + aObjeto.S5011.InfoCS.InfoContrib.InfoPJ.percRedContrib);

    //InfoAtConc
    mmXML.Lines.Add('        fatorMes: ' + aObjeto.S5011.InfoCS.InfoContrib.InfoPJ.InfoAtConc.fatorMes);
    mmXML.Lines.Add('        fator13: ' + aObjeto.S5011.InfoCS.InfoContrib.InfoPJ.InfoAtConc.fator13);

    //IdeEstab
    for _a := 0 to aObjeto.S5011.InfoCS.CountIdeEstab - 1 do
    begin
      mmXML.Lines.Add('        tpInsc: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].tpInsc);
      mmXML.Lines.Add('        nrInsc: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].nrInsc);

      //InfoEstab
      mmXML.Lines.Add('        cnaePrep: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].InfoEstab.cnaePrep);
      mmXML.Lines.Add('        aliqRat: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].InfoEstab.aliqRat);
      mmXML.Lines.Add('        fap: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].InfoEstab.fap);
      mmXML.Lines.Add('        aliqRatAjust: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].InfoEstab.aliqRatAjust);

      //InfoComplObra
      mmXML.Lines.Add('        indSubstPatrObra: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].InfoEstab.InfoComplObra.indSubstPatrObra);

      //IdeLotacao
      for _b := 0 to aObjeto.S5011.InfoCS.IdeEstab[_a].CountIdeLotacao - 1 do
      begin
        mmXML.Lines.Add('        codLotacao: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].codLotacao);
        mmXML.Lines.Add('        fpas: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].fpas);
        mmXML.Lines.Add('        codTercs: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].codTercs);
        mmXML.Lines.Add('        codTercsSusp: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].codTercsSusp);

        //InfoTercSusp
        for _c := 0 to aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].CountInfoTercSusp - 1 do
        begin
          mmXML.Lines.Add('        codTerc: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoTercSusp[_c].codTerc);
        end;

        //InfoEmprParcial
        mmXML.Lines.Add('        tpInscContrat: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoEmprParcial.tpInscContrat);
        mmXML.Lines.Add('        nrInscContrat: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoEmprParcial.nrInscContrat);
        mmXML.Lines.Add('        tpInscProp: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoEmprParcial.tpInscProp);
        mmXML.Lines.Add('        nrInscProp: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoEmprParcial.nrInscProp);

        //DadosOpPort
        mmXML.Lines.Add('        cnpjOpPortuario: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].DadosOpPort.cnpjOpPortuario);
        mmXML.Lines.Add('        aliqRat: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].DadosOpPort.aliqRat);
        mmXML.Lines.Add('        fap: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].DadosOpPort.fap);
        mmXML.Lines.Add('        aliqRatAjust: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].DadosOpPort.aliqRatAjust);

        //BasesRemun
        for _c := 0 to aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].CountBasesRemun - 1 do
        begin
          mmXML.Lines.Add('        indIncid: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].indIncid);
          mmXML.Lines.Add('        codCateg: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].codCateg);

          //BasesCp
          mmXML.Lines.Add('        vrBcCp00: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrBcCp00);
          mmXML.Lines.Add('        vrBcCp15: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrBcCp15);
          mmXML.Lines.Add('        vrBcCp20: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrBcCp20);
          mmXML.Lines.Add('        vrBcCp25: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrBcCp25);
          mmXML.Lines.Add('        vrSuspBcCp00: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSuspBcCp00);
          mmXML.Lines.Add('        vrSuspBcCp15: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSuspBcCp15);
          mmXML.Lines.Add('        vrSuspBcCp20: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSuspBcCp20);
          mmXML.Lines.Add('        vrSuspBcCp25: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSuspBcCp25);
          mmXML.Lines.Add('        vrDescSest: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrDescSest);
          mmXML.Lines.Add('        vrCalcSest: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrCalcSest);
          mmXML.Lines.Add('        vrDescSenat: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrDescSenat);
          mmXML.Lines.Add('        vrCalcSenat: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrCalcSenat);
          mmXML.Lines.Add('        vrSalFam: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSalFam);
          mmXML.Lines.Add('        vrSalMat: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrSalMat);
        end;

        //BasesAvNPort
        mmXML.Lines.Add('        vrBcCp00: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.vrBcCp00);
        mmXML.Lines.Add('        vrBcCp15: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.vrBcCp15);
        mmXML.Lines.Add('        vrBcCp20: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.vrBcCp20);
        mmXML.Lines.Add('        vrBcCp25: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.vrBcCp25);
        mmXML.Lines.Add('        vrBcCp13: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.vrBcCp13);
        mmXML.Lines.Add('        vrBcFgts: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.vrBcFgts);
        mmXML.Lines.Add('        vrDescCP: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.vrDescCP);

        //InfoSubstPatrOpPort
        for _c := 0 to aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].CountInfoSubstPatrOpOrt - 1 do
        begin
          mmXML.Lines.Add('        cnpjOpPortuario: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoSubstPatrOpPort[_c].cnpjOpPortuario);
        end;
      end;

      //BasesAquis
      for _b := 0 to aObjeto.S5011.InfoCS.IdeEstab[_a].CountBasesAquis - 1 do
      begin
        mmXML.Lines.Add('        indAquis: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].indAquis);
        mmXML.Lines.Add('        vlrAquis: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vlrAquis);
        mmXML.Lines.Add('        vrCPDescPR: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrCPDescPR);
        mmXML.Lines.Add('        vrCPNRet: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrCPNRet);
        mmXML.Lines.Add('        vrRatNRet: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrRatNRet);
        mmXML.Lines.Add('        vrSenarNRet: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrSenarNRet);
        mmXML.Lines.Add('        vrCPCalcPR: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrCPCalcPR);
        mmXML.Lines.Add('        vrRatDescPR: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrRatDescPR);
        mmXML.Lines.Add('        vrRatCalcPR: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrRatCalcPR);
        mmXML.Lines.Add('        vrSenarDesc: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrSenarDesc);
        mmXML.Lines.Add('        vrSenarCalc: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].vrSenarCalc);
      end;

      //BasesComerc
      for _b := 0 to aObjeto.S5011.InfoCS.IdeEstab[_a].CountBasesComerc - 1 do
      begin
        mmXML.Lines.Add('        indComerc: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b].indComerc);
        mmXML.Lines.Add('        vrBcComPR: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b].vrBcComPR);
        mmXML.Lines.Add('        vrCPSusp: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b].vrCPSusp);
        mmXML.Lines.Add('        vrRatSusp: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b].vrRatSusp);
        mmXML.Lines.Add('        vrSenarSusp: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b].vrSenarSusp);
      end;

      //InfoCREstab
      for _b := 0 to aObjeto.S5011.InfoCS.IdeEstab[_a].CountInfoCREstab - 1 do
      begin
        mmXML.Lines.Add('        tpCR: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].InfoCREstab[_b].tpCR);
        mmXML.Lines.Add('        vrCR: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].InfoCREstab[_b].vrCR);
        mmXML.Lines.Add('        vrSuspCR: ' + aObjeto.S5011.InfoCS.IdeEstab[_a].InfoCREstab[_b].vrSuspCR);
      end;
    end;

    //infoCRContrib
    for _a := 0 to aObjeto.S5011.InfoCS.CountInfoCRContrib - 1 do
    begin
      mmXML.Lines.Add('        tpCR: ' + aObjeto.S5011.InfoCS.infoCRContrib[_a].tpCR);
      mmXML.Lines.Add('        vrCR: ' + aObjeto.S5011.InfoCS.infoCRContrib[_a].vrCR);
      mmXML.Lines.Add('        vrCRSusp: ' + aObjeto.S5011.InfoCS.infoCRContrib[_a].vrCRSusp);
    end;
  end;
  if aObjeto.S5012.Id <> EmptyStr then
  begin
    {--------------------S5012--------------------}
    mmXML.Lines.Add('        ### S5012 ###');
    mmXML.Lines.Add('        Id: ' + aObjeto.S5012.Id);

    //IdeEvento
    mmXML.Lines.Add('        perApur: ' + aObjeto.S5012.IdeEvento.perApur);

    //IdeEmpregador
    mmXML.Lines.Add('        tpInsc: ' + aObjeto.S5012.IdeEmpregador.tpInsc);
    mmXML.Lines.Add('        nrInsc: ' + aObjeto.S5012.IdeEmpregador.NrInsc);

    //InfoIrrf
    mmXML.Lines.Add('        nrRecArqBase: ' + aObjeto.S5012.InfoIrrf.nrRecArqBase);
    mmXML.Lines.Add('        indExistInfo: ' + aObjeto.S5012.InfoIrrf.indExistInfo);

    //InfoCRContrib
    for _a := 0 to aObjeto.S5012.InfoIrrf.CountInfoCRContrib - 1 do
    begin
      mmXML.Lines.Add('        tpCR: ' + aObjeto.S5012.InfoIrrf.InfoCRContrib[_a].tpCR);
      mmXML.Lines.Add('        vrCR: ' + aObjeto.S5012.InfoIrrf.InfoCRContrib[_a].vrCR);
    end;
  end;
end;

end.
