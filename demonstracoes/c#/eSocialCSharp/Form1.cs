using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ESocialClientX;
using System.Xml;

namespace eSocialCSharp
{
    public partial class frmESocial : Form
    {
        public ESocialClientX.spdESocialClientX eSocial = new ESocialClientX.spdESocialClientX();
        public XmlDocument xmlRetorno = new XmlDocument();
        public frmESocial()
        {
            InitializeComponent();
            string[] vetor, vetor2;

            this.Text = "eSocial - TecnoSpeed - " + eSocial.Versao;
            vetor = eSocial.ListarCertificados("|").Split('|');
            cbCertificado.Items.Clear();
            for (int i = 0; i < vetor.Length - 1; i++)
            {
                cbCertificado.Items.Add(vetor[i]);
            }
            cbCertificado.SelectedIndex = 0;

            vetor2 = eSocial.ListarVersaoManual("|").Split('|');
            cbVersaoManual.Items.Clear();
            for (int i = 0; i < vetor2.Length - 1; i++)
            {
                cbVersaoManual.Items.Add(vetor2[i]);
            }
            cbVersaoManual.SelectedIndex = 0;
            cbAmbiente.SelectedIndex = 1;
            txtEsquemas.Text = @"C:\Program Files\TecnoSpeed\eSocial\Arquivos\Esquemas\";
            txtTemplates.Text = @"C:\Program Files\TecnoSpeed\eSocial\Arquivos\Templates\";
            rbIdLote.Checked = true;
        }

        private void btnCarregaTX2_Click(object sender, EventArgs e)
        {
            tbRetorno.Text = "INCLUIRS1000" + Environment.NewLine;
            if (cbAmbiente.Text == "1 - Produção")
            {
                tbRetorno.Text += "tpAmb_4=1" + Environment.NewLine;
            }
            if (cbAmbiente.Text == "2 - Homologação")
            {
                tbRetorno.Text += "tpAmb_4=2" + Environment.NewLine;
            }
            tbRetorno.Text += "procEmi_5=1" + Environment.NewLine;
            tbRetorno.Text += "verProc_6=1.0" + Environment.NewLine;
            tbRetorno.Text += "tpInsc_8=1" + Environment.NewLine;
            tbRetorno.Text += "nrInsc_9=08187168" + Environment.NewLine;
            tbRetorno.Text += "iniValid_13=2017-07" + Environment.NewLine;
            tbRetorno.Text += "fimValid_14=" + Environment.NewLine;
            tbRetorno.Text += "nmRazao_15=TECNOSPEED TECNOLOGIA DA INFORMACAO" + Environment.NewLine;
            tbRetorno.Text += "classTrib_16=99" + Environment.NewLine;
            tbRetorno.Text += "natJurid_17=2054" + Environment.NewLine;
            tbRetorno.Text += "indCoop_18=0" + Environment.NewLine;
            tbRetorno.Text += "indConstr_19=0" + Environment.NewLine;
            tbRetorno.Text += "indDesFolha_20=0" + Environment.NewLine;
            tbRetorno.Text += "indOptRegEletron_21=0" + Environment.NewLine;
            tbRetorno.Text += "indEntEd_23=N" + Environment.NewLine;
            tbRetorno.Text += "indEtt_24=N" + Environment.NewLine;
            tbRetorno.Text += "nrRegEtt_25=" + Environment.NewLine;
            tbRetorno.Text += "ideMinLei_27=" + Environment.NewLine;
            tbRetorno.Text += "nrCertif_28=" + Environment.NewLine;
            tbRetorno.Text += "dtEmisCertif_29=" + Environment.NewLine;
            tbRetorno.Text += "dtVencCertif_30=" + Environment.NewLine;
            tbRetorno.Text += "nrProtRenov_31=" + Environment.NewLine;
            tbRetorno.Text += "dtProtRenov_32=" + Environment.NewLine;
            tbRetorno.Text += "dtDou_33=" + Environment.NewLine;
            tbRetorno.Text += "pagDou_34=" + Environment.NewLine;
            tbRetorno.Text += "nmCtt_36=Vítor Beal" + Environment.NewLine;
            tbRetorno.Text += "cpfCtt_37=09336330926" + Environment.NewLine;
            tbRetorno.Text += "foneFixo_38=4430379500" + Environment.NewLine;
            tbRetorno.Text += "foneCel_39=7867834687" + Environment.NewLine;
            tbRetorno.Text += "email_40=" + Environment.NewLine;
            tbRetorno.Text += "nrSiafi_42=" + Environment.NewLine;
            tbRetorno.Text += "ideEFR_44=" + Environment.NewLine;
            tbRetorno.Text += "cnpjEFR_45=" + Environment.NewLine;
            tbRetorno.Text += "nmEnte_47=" + Environment.NewLine;
            tbRetorno.Text += "uf_48=" + Environment.NewLine;
            tbRetorno.Text += "codMunic_49=" + Environment.NewLine;
            tbRetorno.Text += "indRPPS_50=" + Environment.NewLine;
            tbRetorno.Text += "subteto_51=" + Environment.NewLine;
            tbRetorno.Text += "vrSubteto_52=" + Environment.NewLine;
            tbRetorno.Text += "indAcordoIsenMulta_54=" + Environment.NewLine;
            tbRetorno.Text += "INCLUIRSOFTWAREHOUSE_55" + Environment.NewLine;
            tbRetorno.Text += "cnpjSoftHouse_56=13930441000134" + Environment.NewLine;
            tbRetorno.Text += "nmRazao_57=Empresa de Teste" + Environment.NewLine;
            tbRetorno.Text += "nmCont_58=Nome do Contato" + Environment.NewLine;
            tbRetorno.Text += "telefone_59=4430303030" + Environment.NewLine;
            tbRetorno.Text += "email_60=" + Environment.NewLine;
            tbRetorno.Text += "SALVARSOFTWAREHOUSE_55" + Environment.NewLine;
            tbRetorno.Text += "indSitPJ_63=0" + Environment.NewLine;
            tbRetorno.Text += "indSitPF_65=" + Environment.NewLine;
            tbRetorno.Text += "SALVARS1000" + Environment.NewLine;
        }

        private void btnGerarXML_Click(object sender, EventArgs e)
        {
            tbRetorno.Text = eSocial.GerarXMLporTx2(tbRetorno.Text);
        }

        private void btnAssinarXML_Click(object sender, EventArgs e)
        {
            tbRetorno.Text = eSocial.AssinarEvento(tbRetorno.Text);
        }

        private void btnEnviar_Click(object sender, EventArgs e)
        {
            IspdRetEnviarLoteEventos _RetEnvio;

            _RetEnvio = eSocial.EnviarLoteEventos(tbRetorno.Text, Convert.ToInt32(cbGrupo.Text));

            tbRetorno.Clear();
            tbRetorno.Text += "### ENVIAR LOTE EVENTOS ###" + Environment.NewLine;
            tbRetorno.Text += "Identificador Lote: " + _RetEnvio.IdLote + Environment.NewLine;
            tbRetorno.Text += "Mensagem" + _RetEnvio.Mensagem + Environment.NewLine;

            txtIdentificadorLote.Text = _RetEnvio.IdLote;

        }

        private void btnConsultar_Click(object sender, EventArgs e)
        {
            IspdRetConsultarLote _RetConsulta;
            IspdRetConsultarLoteItem _RetConsultaItem;
            IspdRetConsultarLoteOcorrencia _RetConsultaOcorrencia;
            IspdRetConsultarLoteOcorrenciaEnvio _RetConsultaOcorrenciaEnvio;
            _RetConsulta = null;
            if (rbIdLote.Checked)
            {
                _RetConsulta = eSocial.ConsultarLoteEventos(txtIdentificadorLote.Text);
            }else if (rbIdEvento.Checked)
            {
                _RetConsulta = eSocial.ConsultarIdEvento(txtIdentificadorLote.Text);
            } else if (rbNrRecibo.Checked)
            {
                _RetConsulta = eSocial.ConsultarEventoPorRecibo(txtIdentificadorLote.Text);
            }

            tbRetorno.Clear();
            tbRetorno.Text += "### CONSULTAR LOTE EVENTOS ###" + Environment.NewLine;
            tbRetorno.Text += "Protocolo Sefaz: " + _RetConsulta.NumeroProtocolo + Environment.NewLine;
            tbRetorno.Text += "Mensagem: " + _RetConsulta.Mensagem + Environment.NewLine;
            tbRetorno.Text += "Status: " + _RetConsulta.Status + Environment.NewLine;
            tbRetorno.Text += "Id de lote: " + _RetConsulta.IdLote + Environment.NewLine;

            tbRetorno.Text += Environment.NewLine;

            for (var i = 0; i < _RetConsulta.Count(); i++)
            {
                _RetConsultaItem = _RetConsulta.Eventos[i];
                tbRetorno.Text += "    EVENTO: " + (i + 1).ToString() + Environment.NewLine;
                tbRetorno.Text += "    Id do Evento: " + _RetConsultaItem.IdEvento + Environment.NewLine;
                tbRetorno.Text += "    Número do Recibo: " + _RetConsultaItem.NumeroRecibo + Environment.NewLine;
                tbRetorno.Text += "    Código de Status: " + _RetConsultaItem.cStat + Environment.NewLine;
                tbRetorno.Text += "    Status do Evento: " + _RetConsultaItem.Status + Environment.NewLine;
                tbRetorno.Text += "    Mensagem do Evento: " + _RetConsultaItem.Mensagem + Environment.NewLine;

                tbRetorno.Text += Environment.NewLine;

                for (var j = 0; j < _RetConsultaItem.Count(); j++)
                {
                    _RetConsultaOcorrencia = _RetConsultaItem.Ocorrencias[j];
                    tbRetorno.Text += "        OCORRÊNCIA: " + (j + 1).ToString() + Environment.NewLine;
                    tbRetorno.Text += "        Código: " + _RetConsultaOcorrencia.Codigo + Environment.NewLine;
                    tbRetorno.Text += "        Descrição: " + _RetConsultaOcorrencia.Descricao + Environment.NewLine;
                }
                PopulaTotalizadores(_RetConsultaItem);
            }
            for (int i = 0; i < _RetConsulta.CountOcorrencias(); i++)
            {
                _RetConsultaOcorrenciaEnvio = _RetConsulta.Ocorrencias[i];
                tbRetorno.Text += "        Ocorrência Envio: " + (i + 1).ToString() + Environment.NewLine;
                tbRetorno.Text += "        Código: " + _RetConsultaOcorrenciaEnvio.Codigo + Environment.NewLine;
                tbRetorno.Text += "        Descrição: " + _RetConsultaOcorrenciaEnvio.Descricao + Environment.NewLine;
                tbRetorno.Text += "        Localização: " + _RetConsultaOcorrenciaEnvio.Localizacao + Environment.NewLine;
                tbRetorno.Text += "        Tipo: " + _RetConsultaOcorrenciaEnvio.Tipo + Environment.NewLine;
            }
            tbXmlEnvio.Text = _RetConsulta.XmlEnviado;
            tbXmlRetorno.Text = _RetConsulta.XmlRetorno;
        }

        private void btnConfigurarSH_Click(object sender, EventArgs e)
        {
            eSocial.ConfigurarSoftwareHouse(txtCpfCnpjSH.Text, txtTokenSH.Text);
            eSocial.NomeCertificado = cbCertificado.Text;
            eSocial.DiretorioEsquemas = txtEsquemas.Text;
            eSocial.DiretorioTemplates = txtTemplates.Text;
            eSocial.VersaoManual = cbVersaoManual.Text;

            if (!String.IsNullOrEmpty(txtPincode.Text))
            {
                eSocial.TipoCertificado = TipoCertificadoKind.ckSmartCard;
                eSocial.Pincode = txtPincode.Text;
            }
            else
            {
                eSocial.TipoCertificado = TipoCertificadoKind.ckLocalMachine;
                eSocial.Pincode = null;
            }


            if (cbAmbiente.Text == "1 - Produção")
            {
                eSocial.Ambiente = ESocialClientX.AmbienteKind.akProducao;
            }
            if (cbAmbiente.Text == "2 - Homologação")
            {
                eSocial.Ambiente = ESocialClientX.AmbienteKind.akPreProducaoReais;
            }
            eSocial.CpfCnpjEmpregador = txtEmpregador.Text;
            eSocial.CpfCnpjTransmissor = txtTransmissor.Text;

        }

        public void PopulaTotalizadores(IspdRetConsultarLoteItem aObjeto)
        {
            int _a, _b, _c, _d, _e;

            //--------------------S5001--------------------//
            if (aObjeto.S5001.IsEmpty == false)
            {
                tbRetorno.AppendText("        ### S5001 ###" + Environment.NewLine);
                tbRetorno.AppendText("        Id: " + aObjeto.S5001.Id + Environment.NewLine);
                //IdeEvento
                tbRetorno.AppendText("        nrRecArqBase: " + aObjeto.S5001.IdeEvento.NrRecArqBase + Environment.NewLine);
                tbRetorno.AppendText("        indApuracao: " + aObjeto.S5001.IdeEvento.IndApuracao + Environment.NewLine);
                tbRetorno.AppendText("        perApur: " + aObjeto.S5001.IdeEvento.PerApur + Environment.NewLine);
                //IdeEmpregador
                tbRetorno.AppendText("        tpInsc: " + aObjeto.S5001.IdeEmpregador.TpInsc + Environment.NewLine);
                tbRetorno.AppendText("        nrInsc: " + aObjeto.S5001.IdeEmpregador.NrInsc + Environment.NewLine);
                //IdeTrabalhador
                tbRetorno.AppendText("        cpfTrab: " + aObjeto.S5001.IdeTrabalhador.CpfTrab + Environment.NewLine);
                //ProcJudTrab
                for (_a = 0; _a <= aObjeto.S5001.IdeTrabalhador.CountProcJudTrab(); _a++)
                {
                    tbRetorno.AppendText("        NrProcJud: " + aObjeto.S5001.IdeTrabalhador.ProcJudTrab[_a].NrProcJud + Environment.NewLine);
                    tbRetorno.AppendText("        codSusp: " + aObjeto.S5001.IdeTrabalhador.ProcJudTrab[_a].CodSusp + Environment.NewLine);
                }
                //InfoCpCalc
                for (_a = 0; _a < aObjeto.S5001.CountInfoCpCalc(); _a++)
                {
                    tbRetorno.AppendText("      tpCR: " + aObjeto.S5001.InfoCpCalc[_a].TpCR + Environment.NewLine);
                    tbRetorno.AppendText("      vrCpSeg: " + aObjeto.S5001.InfoCpCalc[_a].VrCpSeg + Environment.NewLine);
                    tbRetorno.AppendText("      vrDescSeg: " + aObjeto.S5001.InfoCpCalc[_a].VrDescSeg + Environment.NewLine);
                }

                //IdeEstabLot
                for (_a = 0; _a < aObjeto.S5001.InfoCp.IdeEstabLot[_a].CountInfoCategIncid(); _a++)
                {
                    tbRetorno.AppendText("        vrDescSeg: " + aObjeto.S5001.InfoCp.IdeEstabLot[_a].TpInsc + Environment.NewLine);
                    tbRetorno.AppendText("        nrInsc: " + aObjeto.S5001.InfoCp.IdeEstabLot[_a].NrInsc + Environment.NewLine);
                    tbRetorno.AppendText("        codLotacao: " + aObjeto.S5001.InfoCp.IdeEstabLot[_a].CodLotacao + Environment.NewLine);
                    //InfoCategIncid
                    for (_b = 0; _b < aObjeto.S5001.InfoCp.IdeEstabLot[_a].CountInfoCategIncid(); _b++)
                    {
                        tbRetorno.AppendText("        vrDescSeg: " + aObjeto.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].Matricula + Environment.NewLine);
                        tbRetorno.AppendText("        codCateg: " + aObjeto.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CodCateg + Environment.NewLine);
                        tbRetorno.AppendText("        indSimples: " + aObjeto.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].IndSimples + Environment.NewLine);
                        //InfoBaseCS
                        for (_c = 0; _c < aObjeto.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CountInfoBaseCS(); _c++)
                        {
                            tbRetorno.AppendText("        Ind13: " + aObjeto.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoBaseCS[_c].Ind13 + Environment.NewLine);
                            tbRetorno.AppendText("        tpValor: " + aObjeto.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoBaseCS[_c].TpValor + Environment.NewLine);
                            tbRetorno.AppendText("        valor: " + aObjeto.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoBaseCS[_c].Valor + Environment.NewLine);
                        }
                        //CalcTerc
                        for (_c = 0; _c < aObjeto.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CountCalcTerc(); _c++)
                        {
                            tbRetorno.AppendText("        tpCR: " + aObjeto.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CalcTerc[_c].TpCR + Environment.NewLine);
                            tbRetorno.AppendText("        vrCsSegTerc: " + aObjeto.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CalcTerc[_c].VrCsSegTerc + Environment.NewLine);
                            tbRetorno.AppendText("        vrDescTerc: " + aObjeto.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CalcTerc[_c].VrDescTerc + Environment.NewLine);
                        }
                    }
                }
            }

            //--------------------S5002--------------------//
            if (aObjeto.S5002.IsEmpty == false)
            {
                tbRetorno.AppendText("        ### S5002 ###" + Environment.NewLine);
                tbRetorno.AppendText("        Id: " + aObjeto.S5002.Id + Environment.NewLine);
                //IdeEvento
                tbRetorno.AppendText("        nrRecArqBase: " + aObjeto.S5002.IdeEvento.NrRecArqBase + Environment.NewLine);
                tbRetorno.AppendText("        perApur: " + aObjeto.S5002.IdeEvento.PerApur + Environment.NewLine);
                //IdeEmpregador
                tbRetorno.AppendText("        tpInsc: " + aObjeto.S5002.IdeEmpregador.TpInsc + Environment.NewLine);
                tbRetorno.AppendText("        nrInsc: " + aObjeto.S5002.IdeEmpregador.NrInsc + Environment.NewLine);
                //IdeTrabalhador
                tbRetorno.AppendText("        cpfTrab: " + aObjeto.S5002.IdeTrabalhador.CpfTrab + Environment.NewLine);
                //InfoDep
                tbRetorno.AppendText("        vrDedDep: " + aObjeto.S5002.InfoDep.VrDedDep + Environment.NewLine);
                //InfoIrrf
                for (_a = 0; _a < aObjeto.S5002.CountInfoIrrf(); _a++)
                {
                    tbRetorno.AppendText("        codCateg: " + aObjeto.S5002.InfoIrrf[_a].CodCateg + Environment.NewLine);
                    tbRetorno.AppendText("        indResBr: " + aObjeto.S5002.InfoIrrf[_a].IndResBr + Environment.NewLine);
                    //BasesIrrf
                    for (_b = 0; _b < aObjeto.S5002.InfoIrrf[_a].CountBasesIrrf(); _b++)
                    {
                        tbRetorno.AppendText("        tpValor: " + aObjeto.S5002.InfoIrrf[_a].BasesIrrf[_b].TpValor + Environment.NewLine);
                        tbRetorno.AppendText("        Valor: " + aObjeto.S5002.InfoIrrf[_a].BasesIrrf[_b].Valor + Environment.NewLine);
                    }
                    //Irrf
                    for (_b = 0; _b < aObjeto.S5002.InfoIrrf[_a].CountIrrf(); _b++)
                    {
                        tbRetorno.AppendText("        tpCR: " + aObjeto.S5002.InfoIrrf[_a].Irrf[_b].TpCR + Environment.NewLine);
                        tbRetorno.AppendText("        vrIrrfDesc: " + aObjeto.S5002.InfoIrrf[_a].Irrf[_b].VrIrrfDesc + Environment.NewLine);
                    }
                    //IdePais
                    tbRetorno.AppendText("        codPais: " + aObjeto.S5002.InfoIrrf[_a].IdePgtoExt.IdePais.CodPais + Environment.NewLine);
                    tbRetorno.AppendText("        indNIF: " + aObjeto.S5002.InfoIrrf[_a].IdePgtoExt.IdePais.IndNIF + Environment.NewLine);
                    tbRetorno.AppendText("        nifBenef: " + aObjeto.S5002.InfoIrrf[_a].IdePgtoExt.IdePais.NifBenef + Environment.NewLine);
                    //EndExt
                    tbRetorno.AppendText("        dscLograd: " + aObjeto.S5002.InfoIrrf[_a].IdePgtoExt.EndExt.DscLograd + Environment.NewLine);
                    tbRetorno.AppendText("        nrLograd: " + aObjeto.S5002.InfoIrrf[_a].IdePgtoExt.EndExt.NrLograd + Environment.NewLine);
                    tbRetorno.AppendText("        complem: " + aObjeto.S5002.InfoIrrf[_a].IdePgtoExt.EndExt.Complem + Environment.NewLine);
                    tbRetorno.AppendText("        bairro: " + aObjeto.S5002.InfoIrrf[_a].IdePgtoExt.EndExt.Bairro + Environment.NewLine);
                    tbRetorno.AppendText("        nmCid: " + aObjeto.S5002.InfoIrrf[_a].IdePgtoExt.EndExt.NmCid + Environment.NewLine);
                    tbRetorno.AppendText("        codPostal: " + aObjeto.S5002.InfoIrrf[_a].IdePgtoExt.EndExt.CodPostal + Environment.NewLine);
                }
            }
            //--------------------S5003--------------------//
            if (aObjeto.S5003.IsEmpty == false)
            {
                tbRetorno.AppendText("        ### S5003 ###" + Environment.NewLine);
                tbRetorno.AppendText("        Id: " + aObjeto.S5003.Id + Environment.NewLine);
                // IdeEvento
                tbRetorno.AppendText("        NrRecArqBase: " + aObjeto.S5003.IdeEvento.NrRecArqBase + Environment.NewLine);
                tbRetorno.AppendText("        perApur: " + aObjeto.S5003.IdeEvento.PerApur + Environment.NewLine);

                // IdeEmpregador
                tbRetorno.AppendText("        tpInsc: " + aObjeto.S5003.IdeEmpregador.TpInsc + Environment.NewLine);
                tbRetorno.AppendText("        nrInsc: " + aObjeto.S5003.IdeEmpregador.NrInsc + Environment.NewLine);

                // ideTrabalhador

                tbRetorno.AppendText("        CpfTrab: " + aObjeto.S5003.IdeTrabalador.CpfTrab + Environment.NewLine);
                tbRetorno.AppendText("        NisTrab: " + aObjeto.S5003.IdeTrabalador.NisTrab + Environment.NewLine);

                // InfoFGTS
                tbRetorno.AppendText("        InfoFGTS: " + aObjeto.S5003.InfoFGTS.DtVenc + Environment.NewLine);
                tbRetorno.AppendText("           CpfTrab: " + aObjeto.S5003.InfoFGTS.DtVenc + Environment.NewLine);

                for (_a = 0; _a < aObjeto.S5003.InfoFGTS.CountIdeEstabLot(); _a++)
                {
                    tbRetorno.AppendText("           IdeEstabLot: " + Environment.NewLine);
                    tbRetorno.AppendText("            TpInsc: " + aObjeto.S5003.InfoFGTS.IdeEstabLot[_a].TpInsc + Environment.NewLine);
                    tbRetorno.AppendText("            NrInsc: " + aObjeto.S5003.InfoFGTS.IdeEstabLot[_a].NrInsc + Environment.NewLine);
                    tbRetorno.AppendText("            CodLotacao: " + aObjeto.S5003.InfoFGTS.IdeEstabLot[_a].CodLotacao + Environment.NewLine);
                    for (_b = 0; _b < aObjeto.S5003.InfoFGTS.IdeEstabLot[_a].CountInfoTrabFGTS(); _b++)
                    {
                        tbRetorno.AppendText("            IdeEstabLot: " + Environment.NewLine);
                        tbRetorno.AppendText("              Matricula: " + aObjeto.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS[_b].Matricula + Environment.NewLine);
                        tbRetorno.AppendText("              CodCateg: " + aObjeto.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS[_b].CodCateg + Environment.NewLine);
                        tbRetorno.AppendText("              DtAdm: " + aObjeto.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS[_b].DtAdm + Environment.NewLine);
                        tbRetorno.AppendText("              DtDeslig: " + aObjeto.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS[_b].DtDeslig + Environment.NewLine);
                        tbRetorno.AppendText("              DtInicio: " + aObjeto.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS[_b].DtInicio + Environment.NewLine);
                        tbRetorno.AppendText("              MtvDeslig: " + aObjeto.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS[_b].MtvDeslig + Environment.NewLine);
                        tbRetorno.AppendText("              DtTerm: " + aObjeto.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS[_b].DtTerm + Environment.NewLine);
                        tbRetorno.AppendText("              MtvDesligTSV: " + aObjeto.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS[_b].MtvDesligTSV + Environment.NewLine);

                        for (_c = 0; _c < aObjeto.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS[_b].CountInfoBaseFGTS(); _c++)
                        {
                            tbRetorno.AppendText("               InfoBaseFGTS: " + Environment.NewLine);
                            for (_d = 0; _d < aObjeto.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS[_b].InfoBaseFGTS[_c].CountBasePerApur(); _d++)
                            {
                                tbRetorno.AppendText("                BasePerApur: " + Environment.NewLine);
                                tbRetorno.AppendText("                 tpValor: " + aObjeto.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS[_b].InfoBaseFGTS[_c].BasePerApur[_d].TpValor + Environment.NewLine);
                                tbRetorno.AppendText("                 RemFGTS: " + aObjeto.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS[_b].InfoBaseFGTS[_c].BasePerApur[_d].RemFGTS + Environment.NewLine);
                            }
                            for (_d = 0; _d < aObjeto.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS[_b].InfoBaseFGTS[_c].CountInfoBasePerAntE(); _d++)
                            {
                                tbRetorno.AppendText("                InfoBasePerAntE: " + Environment.NewLine);
                                tbRetorno.AppendText("                 PerRef: " + aObjeto.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS[_b].InfoBaseFGTS[_c].InfoBasePerAntE[_d].PerRef + Environment.NewLine);

                                for (_e = 0; _e < aObjeto.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS[_b].InfoBaseFGTS[_c].InfoBasePerAntE[_d].CountBasePerAntE(); _e++)
                                {
                                    tbRetorno.AppendText("                 BasePerAntE: " + Environment.NewLine);
                                    tbRetorno.AppendText("                  TpValorE: " + aObjeto.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS[_b].InfoBaseFGTS[_c].InfoBasePerAntE[_d].BasePerAntE[_e].TpValorE + Environment.NewLine);
                                    tbRetorno.AppendText("                  RemFGTSE: " + aObjeto.S5003.InfoFGTS.IdeEstabLot[_a].InfoTrabFGTS[_b].InfoBaseFGTS[_c].InfoBasePerAntE[_d].BasePerAntE[_e].RemFGTSE + Environment.NewLine);
                                }
                            }
                        }
                    }
                }

                for (_a = 0; _a < aObjeto.S5003.InfoFGTS.CountInfoDpsFGTS(); _a++)
                {
                    tbRetorno.AppendText("           InfoDpsFGTS: " + Environment.NewLine);
                    for (_b = 0; _b < aObjeto.S5003.InfoFGTS.InfoDpsFGTS[_a].CountInfoTrabDps(); _b++)
                    {
                        tbRetorno.AppendText("            InfoTrabDps: " + Environment.NewLine);
                        tbRetorno.AppendText("             Matricula: " + aObjeto.S5003.InfoFGTS.InfoDpsFGTS[_a].InfoTrabDps[_b].Matricula + Environment.NewLine);
                        tbRetorno.AppendText("             codCateg: " + aObjeto.S5003.InfoFGTS.InfoDpsFGTS[_a].InfoTrabDps[_b].CodCateg + Environment.NewLine);
                        for (_c = 0; _c < aObjeto.S5003.InfoFGTS.InfoDpsFGTS[_a].InfoTrabDps[_b].CountDpsPerApur(); _c++)
                        {
                            tbRetorno.AppendText("            DpsPerApur: " + Environment.NewLine);
                            tbRetorno.AppendText("             TpDps: " + aObjeto.S5003.InfoFGTS.InfoDpsFGTS[_a].InfoTrabDps[_b].DpsPerApur[_c].TpDps + Environment.NewLine);
                            tbRetorno.AppendText("             DpsFGTS: " + aObjeto.S5003.InfoFGTS.InfoDpsFGTS[_a].InfoTrabDps[_b].DpsPerApur[_c].DpsFGTS + Environment.NewLine);
                        }
                        for (_c = 0; _c < aObjeto.S5003.InfoFGTS.InfoDpsFGTS[_a].InfoTrabDps[_b].CountInfoDpsPerAntE(); _c++)
                        {
                            tbRetorno.AppendText("            InfoDpsPerAntE: " + Environment.NewLine);
                            tbRetorno.AppendText("             PerRef: " + aObjeto.S5003.InfoFGTS.InfoDpsFGTS[_a].InfoTrabDps[_b].InfoDpsPerAntE[_c].PerRef + Environment.NewLine);
                            for (_d = 0; _d < aObjeto.S5003.InfoFGTS.InfoDpsFGTS[_a].InfoTrabDps[_b].InfoDpsPerAntE[_c].CountDpsPerAntE(); _d++)
                            {
                                tbRetorno.AppendText("             DpsPerAntE: " + Environment.NewLine);
                                tbRetorno.AppendText("              TpDpsE: " + aObjeto.S5003.InfoFGTS.InfoDpsFGTS[_a].InfoTrabDps[_b].InfoDpsPerAntE[_c].DpsPerAntE[_d].TpDpsE + Environment.NewLine);
                                tbRetorno.AppendText("              DpsFGTSE: " + aObjeto.S5003.InfoFGTS.InfoDpsFGTS[_a].InfoTrabDps[_b].InfoDpsPerAntE[_c].DpsPerAntE[_d].DpsFGTSE + Environment.NewLine);
                            }
                        }
                    }
                }
            }

            // --------------------S5011--------------------//
            if (aObjeto.S5011.IsEmpty == false)
            {
                tbRetorno.AppendText("        ### S5011 ###" + Environment.NewLine);
                tbRetorno.AppendText("        Id: " + aObjeto.S5011.Id + Environment.NewLine);
                //IdeEvento
                tbRetorno.AppendText("        indApuracao: " + aObjeto.S5011.IdeEvento.IndApuracao + Environment.NewLine);
                tbRetorno.AppendText("        perApur: " + aObjeto.S5011.IdeEvento.PerApur + Environment.NewLine);
                //IdeEmpregador
                tbRetorno.AppendText("        tpInsc: " + aObjeto.S5011.IdeEmpregador.TpInsc + Environment.NewLine);
                tbRetorno.AppendText("        nrInsc: " + aObjeto.S5011.IdeEmpregador.NrInsc + Environment.NewLine);
                //InfoCS
                tbRetorno.AppendText("        nrRecArqBase: " + aObjeto.S5011.InfoCS.NrRecArqBase + Environment.NewLine);
                tbRetorno.AppendText("        indExistInfo: " + aObjeto.S5011.InfoCS.IndExistInfo + Environment.NewLine);
                //InfoCPSeg
                tbRetorno.AppendText("        vrDescCP: " + aObjeto.S5011.InfoCS.InfoCPSeg.VrDescCP + Environment.NewLine);
                tbRetorno.AppendText("        vrCpSeg: " + aObjeto.S5011.InfoCS.InfoCPSeg.VrCpSeg + Environment.NewLine);
                //InfoContrib
                tbRetorno.AppendText("        classTrib: " + aObjeto.S5011.InfoCS.InfoContrib.ClassTrib + Environment.NewLine);
                //InfoPJ
                tbRetorno.AppendText("        indCoop: " + aObjeto.S5011.InfoCS.InfoContrib.InfoPJ.IndCoop + Environment.NewLine);
                tbRetorno.AppendText("        indConstr: " + aObjeto.S5011.InfoCS.InfoContrib.InfoPJ.IndConstr + Environment.NewLine);
                tbRetorno.AppendText("        indSubstPatr: " + aObjeto.S5011.InfoCS.InfoContrib.InfoPJ.IndSubstPatr + Environment.NewLine);
                tbRetorno.AppendText("        percRedContrib: " + aObjeto.S5011.InfoCS.InfoContrib.InfoPJ.PercRedContrib + Environment.NewLine);
                //InfoAtConc
                tbRetorno.AppendText("        fatorMes: " + aObjeto.S5011.InfoCS.InfoContrib.InfoPJ.InfoAtConc.FatorMes + Environment.NewLine);
                tbRetorno.AppendText("        fator13: " + aObjeto.S5011.InfoCS.InfoContrib.InfoPJ.InfoAtConc.Fator13 + Environment.NewLine);
                //IdeEstab
                for (_a = 0; _a < aObjeto.S5011.InfoCS.CountIdeEstab(); _a++)
                {
                    tbRetorno.AppendText("        tpInsc: " + aObjeto.S5011.InfoCS.IdeEstab[_a].TpInsc + Environment.NewLine);
                    tbRetorno.AppendText("        nrInsc: " + aObjeto.S5011.InfoCS.IdeEstab[_a].NrInsc + Environment.NewLine);
                    //InfoEstab
                    tbRetorno.AppendText("        cnaePrep: " + aObjeto.S5011.InfoCS.IdeEstab[_a].InfoEstab.CnaePrep + Environment.NewLine);
                    tbRetorno.AppendText("        aliqRat: " + aObjeto.S5011.InfoCS.IdeEstab[_a].InfoEstab.AliqRat + Environment.NewLine);
                    tbRetorno.AppendText("        fap: " + aObjeto.S5011.InfoCS.IdeEstab[_a].InfoEstab.Fap + Environment.NewLine);
                    tbRetorno.AppendText("        aliqRatAjust: " + aObjeto.S5011.InfoCS.IdeEstab[_a].InfoEstab.AliqRatAjust + Environment.NewLine);
                    //InfoComplObra
                    tbRetorno.AppendText("        indSubstPatrObra: " + aObjeto.S5011.InfoCS.IdeEstab[_a].InfoEstab.InfoComplObra.IndSubstPatrObra + Environment.NewLine);
                    //IdeLotacao
                    for (_b = 0; _b < aObjeto.S5011.InfoCS.IdeEstab[_a].CountIdeLotacao(); _b++)
                    {
                        tbRetorno.AppendText("        codLotacao: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].CodLotacao + Environment.NewLine);
                        tbRetorno.AppendText("        fpas: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].Fpas + Environment.NewLine);
                        tbRetorno.AppendText("        codTercs: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].CodTercs + Environment.NewLine);
                        tbRetorno.AppendText("        codTercsSusp: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].CodTercsSusp + Environment.NewLine);
                        //InfoTercSusp
                        for (_c = 0; _c < aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].CountInfoTercSusp(); _c++)
                        {
                            tbRetorno.AppendText("        codTerc: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoTercSusp[_c].CodTerc + Environment.NewLine);
                        }
                        //InfoEmprParcial
                        tbRetorno.AppendText("        tpInscContrat: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoEmprParcial.TpInscContrat + Environment.NewLine);
                        tbRetorno.AppendText("        nrInscContrat: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoEmprParcial.NrInscContrat + Environment.NewLine);
                        tbRetorno.AppendText("        tpInscProp: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoEmprParcial.TpInscProp + Environment.NewLine);
                        tbRetorno.AppendText("        nrInscProp: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoEmprParcial.NrInscProp + Environment.NewLine);
                        //DadosOpPort
                        tbRetorno.AppendText("        cnpjOpPortuario: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].DadosOpPort.CnpjOpPortuario + Environment.NewLine);
                        tbRetorno.AppendText("        aliqRat: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].DadosOpPort.AliqRat + Environment.NewLine);
                        tbRetorno.AppendText("        fap: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].DadosOpPort.Fap + Environment.NewLine);
                        tbRetorno.AppendText("        aliqRatAjust: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].DadosOpPort.AliqRatAjust + Environment.NewLine);
                        //BasesRemun
                        for (_c = 0; _c < aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].CountBasesRemun(); _c++)
                        {
                            tbRetorno.AppendText("        indIncid: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].IndIncid + Environment.NewLine);
                            tbRetorno.AppendText("        codCateg: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].CodCateg + Environment.NewLine);
                            //BasesCp
                            tbRetorno.AppendText("        vrBcCp00: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.VrBcCp00 + Environment.NewLine);
                            tbRetorno.AppendText("        vrBcCp15: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.VrBcCp15 + Environment.NewLine);
                            tbRetorno.AppendText("        vrBcCp20: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.VrBcCp20 + Environment.NewLine);
                            tbRetorno.AppendText("        vrBcCp25: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.VrBcCp25 + Environment.NewLine);
                            tbRetorno.AppendText("        vrSuspBcCp00: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.VrSuspBcCp00 + Environment.NewLine);
                            tbRetorno.AppendText("        vrSuspBcCp15: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.VrSuspBcCp15 + Environment.NewLine);
                            tbRetorno.AppendText("        vrSuspBcCp20: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.VrSuspBcCp20 + Environment.NewLine);
                            tbRetorno.AppendText("        vrSuspBcCp25: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.VrSuspBcCp25 + Environment.NewLine);
                            tbRetorno.AppendText("        vrDescSest: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.VrDescSest + Environment.NewLine);
                            tbRetorno.AppendText("        vrCalcSest: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.VrCalcSest + Environment.NewLine);
                            tbRetorno.AppendText("        vrDescSenat: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.VrDescSenat + Environment.NewLine);
                            tbRetorno.AppendText("        vrCalcSenat: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.vrCalcSenat + Environment.NewLine);
                            tbRetorno.AppendText("        vrSalFam: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.VrSalFam + Environment.NewLine);
                            tbRetorno.AppendText("        vrSalMat: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesRemun[_c].BasesCp.VrSalMat + Environment.NewLine);
                        }
                        //BasesAvNPort
                        tbRetorno.AppendText("        vrBcCp00: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.VrBcCp00 + Environment.NewLine);
                        tbRetorno.AppendText("        vrBcCp15: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.VrBcCp15 + Environment.NewLine);
                        tbRetorno.AppendText("        vrBcCp20: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.VrBcCp20 + Environment.NewLine);
                        tbRetorno.AppendText("        vrBcCp25: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.VrBcCp25 + Environment.NewLine);
                        tbRetorno.AppendText("        vrBcCp13: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.VrBcCp13 + Environment.NewLine);
                        tbRetorno.AppendText("        vrBcFgts: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.VrBcFgts + Environment.NewLine);
                        tbRetorno.AppendText("        vrDescCP: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].BasesAvNPort.VrDescCP + Environment.NewLine);
                        //InfoSubstPatrOpPort
                        for (_c = 0; _c < aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].CountInfoSubstPatrOpOrt(); _c++)
                        {
                            tbRetorno.AppendText("        cnpjOpPortuario: " + aObjeto.S5011.InfoCS.IdeEstab[_a].IdeLotacao[_b].InfoSubstPatrOpPort[_c].CnpjOpPortuario + Environment.NewLine);
                        }
                    }

                    //BasesAquis
                    for (_b = 0; _b++ < aObjeto.S5011.InfoCS.IdeEstab[_a].CountBasesAquis(); _b++)
                    {
                        tbRetorno.AppendText("        indAquis: " + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].IndAquis + Environment.NewLine);
                        tbRetorno.AppendText("        vlrAquis: " + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].VlrAquis + Environment.NewLine);
                        tbRetorno.AppendText("        vrCPDescPR: " + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].VrCPDescPR + Environment.NewLine);
                        tbRetorno.AppendText("        vrCPNRet: " + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].VrCPNRet + Environment.NewLine);
                        tbRetorno.AppendText("        vrRatNRet: " + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].VrRatNRet + Environment.NewLine);
                        tbRetorno.AppendText("        vrSenarNRet: " + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].VrSenarNRet + Environment.NewLine);
                        tbRetorno.AppendText("        vrCPCalcPR: " + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].VrCPCalcPR + Environment.NewLine);
                        tbRetorno.AppendText("        vrRatDescPR: " + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].VrRatDescPR + Environment.NewLine);
                        tbRetorno.AppendText("        vrRatCalcPR: " + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].VrRatCalcPR + Environment.NewLine);
                        tbRetorno.AppendText("        vrSenarDesc: " + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].VrSenarDesc + Environment.NewLine);
                        tbRetorno.AppendText("        vrSenarCalc: " + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesAquis[_b].VrSenarCalc + Environment.NewLine);
                    }
                    //BasesComerc
                    for (_b = 0; _b < aObjeto.S5011.InfoCS.IdeEstab[_a].CountBasesComerc(); _b++)
                    {
                        tbRetorno.AppendText("        indComerc: " + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b].IndComerc + Environment.NewLine);
                        tbRetorno.AppendText("        vrBcComPR: " + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b].VrBcComPR + Environment.NewLine);
                        tbRetorno.AppendText("        vrCPSusp: " + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b].VrCPSusp + Environment.NewLine);
                        tbRetorno.AppendText("        vrRatSusp: " + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b].VrRatSusp + Environment.NewLine);
                        tbRetorno.AppendText("        vrSenarSusp: " + aObjeto.S5011.InfoCS.IdeEstab[_a].BasesComerc[_b].VrSenarSusp + Environment.NewLine);
                    }
                    //InfoCREstab
                    for (_b = 0; _b < aObjeto.S5011.InfoCS.IdeEstab[_a].CountInfoCREstab(); _b++)
                    {
                        tbRetorno.AppendText("        tpCR: " + aObjeto.S5011.InfoCS.IdeEstab[_a].InfoCREstab[_b].TpCR + Environment.NewLine);
                        tbRetorno.AppendText("        vrCR: " + aObjeto.S5011.InfoCS.IdeEstab[_a].InfoCREstab[_b].VrCR + Environment.NewLine);
                        tbRetorno.AppendText("        vrSuspCR: " + aObjeto.S5011.InfoCS.IdeEstab[_a].InfoCREstab[_b].VrSuspCR + Environment.NewLine);
                    }
                }
            }

            //--------------------S5012--------------------//
            if (aObjeto.S5012.IsEmpty == false)
            {
                tbRetorno.AppendText("        ### S5012 ###" + Environment.NewLine);
                tbRetorno.AppendText("        Id: " + aObjeto.S5012.Id + Environment.NewLine);
                //IdeEvento
                tbRetorno.AppendText("        perApur: " + aObjeto.S5012.IdeEvento.PerApur + Environment.NewLine);
                //IdeEmpregador
                tbRetorno.AppendText("        tpInsc: " + aObjeto.S5012.IdeEmpregador.TpInsc + Environment.NewLine);
                tbRetorno.AppendText("        nrInsc: " + aObjeto.S5012.IdeEmpregador.NrInsc + Environment.NewLine);
                //InfoIrrf
                tbRetorno.AppendText("        nrRecArqBase: " + aObjeto.S5012.InfoIrrf.NrRecArqBase + Environment.NewLine);
                tbRetorno.AppendText("        indExistInfo: " + aObjeto.S5012.InfoIrrf.IndExistInfo + Environment.NewLine);
                for (_a = 0; _a < aObjeto.S5012.InfoIrrf.CountInfoCRContrib(); _a++)
                {
                    tbRetorno.AppendText("        tpCR: " + aObjeto.S5012.InfoIrrf.InfoCRContrib[_a].TpCR + Environment.NewLine);
                    tbRetorno.AppendText("        vrCR: " + aObjeto.S5012.InfoIrrf.InfoCRContrib[_a].VrCR + Environment.NewLine);
                }
            }

            //--------------------S5013--------------------//
            if (aObjeto.S5013.IsEmpty == false)
            {
                tbRetorno.AppendText("        ### S5013 ###" + Environment.NewLine);
                tbRetorno.AppendText("        Id: " + aObjeto.S5013.Id + Environment.NewLine);
                // IdeEvento
                tbRetorno.AppendText("        perApur: " + aObjeto.S5013.IdeEvento.PerApur + Environment.NewLine);
                // IdeEmpregador
                tbRetorno.AppendText("        tpInsc: " + aObjeto.S5013.IdeEmpregador.TpInsc + Environment.NewLine);
                tbRetorno.AppendText("        nrInsc: " + aObjeto.S5013.IdeEmpregador.NrInsc + Environment.NewLine);
                // infoFGTS
                tbRetorno.AppendText("        nrRecArqBase: " + aObjeto.S5013.InfoFGTS.NrRecArqBase + Environment.NewLine);
                tbRetorno.AppendText("        indExistInfo: " + aObjeto.S5013.InfoFGTS.IndExistInfo + Environment.NewLine);
                // infoBaseFGTS
                tbRetorno.AppendText("        infoBaseFGTS: " + Environment.NewLine);
                // basePerApur
                tbRetorno.AppendText("          basePerApur: <List>" + Environment.NewLine);
                for (_a = 0; _a < aObjeto.S5013.InfoFGTS.InfoBaseFGTS.CountBasePerApur(); _a++)
                {
                    tbRetorno.AppendText("            tpValor: " + aObjeto.S5013.InfoFGTS.InfoBaseFGTS.BasePerApur[_a].TpValor + Environment.NewLine);
                    tbRetorno.AppendText("            baseFGTS: " + aObjeto.S5013.InfoFGTS.InfoBaseFGTS.BasePerApur[_a].BaseFGTS + Environment.NewLine);
                    tbRetorno.AppendText("            --" + Environment.NewLine);
                }
                // infoBaseFGTS
                tbRetorno.AppendText("          infoBaseFGTS: <List>" + Environment.NewLine);
                for (_a = 0; _a < aObjeto.S5013.InfoFGTS.InfoBaseFGTS.CountInfoBasePerAntE(); _a++)
                {
                    // InfoBasePerAntE
                    tbRetorno.AppendText("            perRef: " + aObjeto.S5013.InfoFGTS.InfoBaseFGTS.InfoBasePerAntE[_a].PerRef + Environment.NewLine);
                    tbRetorno.AppendText("            basePerAntE: <List>" + Environment.NewLine);
                    for (_b = 0; _b < aObjeto.S5013.InfoFGTS.InfoBaseFGTS.InfoBasePerAntE[_a].CountBasePerAntE(); _b++)
                    {
                        tbRetorno.AppendText("              tpValorE: " + aObjeto.S5013.InfoFGTS.InfoBaseFGTS.InfoBasePerAntE[_a].BasePerAntE[_b].TpValorE + Environment.NewLine);
                        tbRetorno.AppendText("              baseFGTSE: " + aObjeto.S5013.InfoFGTS.InfoBaseFGTS.InfoBasePerAntE[_a].BasePerAntE[_b].BaseFGTSE + Environment.NewLine);
                        tbRetorno.AppendText("              --" + Environment.NewLine);
                    }
                }
                // infoDpsFGTS
                tbRetorno.AppendText("          infoDpsFGTS:" + Environment.NewLine);
                // dpsPerApur
                for (_a = 0; _a < aObjeto.S5013.InfoFGTS.InfoDpsFGTS.CountDpsPerApur(); _a++)
                {
                    tbRetorno.AppendText("            TpDps: " + aObjeto.S5013.InfoFGTS.InfoDpsFGTS.DpsPerApur[_a].TpDps + Environment.NewLine);
                    tbRetorno.AppendText("            VrFGTS: " + aObjeto.S5013.InfoFGTS.InfoDpsFGTS.DpsPerApur[_a].VrFGTS + Environment.NewLine);
                    tbRetorno.AppendText("            --" + Environment.NewLine);
                }
                // infoDpsPerAntE
                tbRetorno.AppendText("          infoDpsPerAntE: <List>" + Environment.NewLine);
                for (_a = 0; _a < aObjeto.S5013.InfoFGTS.InfoDpsFGTS.CountInfoDpsPerAntE(); _a++)
                {
                    tbRetorno.AppendText("            perRef: " + aObjeto.S5013.InfoFGTS.InfoDpsFGTS.InfoDpsPerAntE[_a].PerRef + Environment.NewLine);
                    // basePerAntE
                    tbRetorno.AppendText("            basePerAntE: <List>" + Environment.NewLine);
                    for (_b = 0; _b < aObjeto.S5013.InfoFGTS.InfoDpsFGTS.InfoDpsPerAntE[_a].CountDpsPerAntE(); _b++)
                    {
                        tbRetorno.AppendText("              TpDpsE: " + aObjeto.S5013.InfoFGTS.InfoDpsFGTS.InfoDpsPerAntE[_a].DpsPerAntE[_b].TpDpsE + Environment.NewLine);
                        tbRetorno.AppendText("              vrFGTSE: " + aObjeto.S5013.InfoFGTS.InfoDpsFGTS.InfoDpsPerAntE[_a].DpsPerAntE[_b].VrFGTSE + Environment.NewLine);
                        tbRetorno.AppendText("              --" + Environment.NewLine);
                    }
                }
            }
        }

        private void BtnReconsultar_Click(object sender, EventArgs e)
        {
            eSocial.ReconsultarLoteSefaz(txtIdentificadorLote.Text);
            tbRetorno.Text = "Enviado a consulta ao eSocial, faça novamente a consulta normal !!!";

        }
    }
}
