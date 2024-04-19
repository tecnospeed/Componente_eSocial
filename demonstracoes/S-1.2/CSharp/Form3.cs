using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ESocialS12ClientX;
using System.Xml;

namespace eSocialCSharp
{
    public partial class Form3 : Form
    {
        public ESocialS12ClientX.spdESocialS12ClientX eSocial = new ESocialS12ClientX.spdESocialS12ClientX();
        public XmlDocument xmlRetorno = new XmlDocument();

        public Form3()
        {
            InitializeComponent();
            string[] vetor, vetor2;

            eSocial.ConfigurarSoftwareHouse(txtCpfCnpjSH.Text, txtTokenSH.Text);

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
            rbIdLote.Checked = true;

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
                eSocial.Ambiente = ESocialS12ClientX.AmbienteKind.akProducao;
            }
            if (cbAmbiente.Text == "2 - Homologação")
            {
                eSocial.Ambiente = ESocialS12ClientX.AmbienteKind.akPreProducaoReais;
            }
            eSocial.CpfCnpjEmpregador = txtEmpregador.Text;
            eSocial.CpfCnpjTransmissor = txtTransmissor.Text;
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
            tbRetorno.Text += "classTrib_16=99" + Environment.NewLine;
            tbRetorno.Text += "indCoop_18=0" + Environment.NewLine;
            tbRetorno.Text += "indConstr_19=0" + Environment.NewLine;
            tbRetorno.Text += "indDesFolha_20=0" + Environment.NewLine;
            tbRetorno.Text += "indOpcCP_68=" + Environment.NewLine;
            tbRetorno.Text += "indPorte_69=" + Environment.NewLine;
            tbRetorno.Text += "indOptRegEletron_21=0" + Environment.NewLine;
            tbRetorno.Text += "cnpjEFR_70=" + Environment.NewLine;
            tbRetorno.Text += "ideMinLei_27=" + Environment.NewLine;
            tbRetorno.Text += "nrCertif_28=" + Environment.NewLine;
            tbRetorno.Text += "dtEmisCertif_29=" + Environment.NewLine;
            tbRetorno.Text += "dtVencCertif_30=" + Environment.NewLine;
            tbRetorno.Text += "nrProtRenov_31=" + Environment.NewLine;
            tbRetorno.Text += "dtProtRenov_32=" + Environment.NewLine;
            tbRetorno.Text += "dtDou_33=" + Environment.NewLine;
            tbRetorno.Text += "pagDou_34=" + Environment.NewLine;
            tbRetorno.Text += "indAcordoIsenMulta_54=" + Environment.NewLine;
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
            IspdS12RetEnviarLoteEventos _RetEnvio;

            _RetEnvio = eSocial.EnviarLoteEventos(tbRetorno.Text, Convert.ToInt32(cbGrupo.Text));

            tbRetorno.Clear();
            tbRetorno.Text += "### ENVIAR LOTE EVENTOS ###" + Environment.NewLine;
            tbRetorno.Text += "Identificador Lote: " + _RetEnvio.IdLote + Environment.NewLine;
            tbRetorno.Text += "Mensagem" + _RetEnvio.Mensagem + Environment.NewLine;

            txtIdLote.Text = _RetEnvio.IdLote;
        }

        private void btnConsultar_Click(object sender, EventArgs e)
        {
            IspdS12RetConsultarLote _RetConsulta;
            IspdS12RetConsultarLoteItem _RetConsultaItem;
            IspdS12RetConsultarLoteOcorrencia _RetConsultaOcorrencia;
            IspdS12RetConsultarLoteOcorrenciaEnvio _RetConsultaOcorrenciaEnvio;
            int _a, _b, _c, _d, _e;
            _RetConsulta = null;
            _RetConsultaItem = null;
            if (rbIdLote.Checked)
            {
                _RetConsulta = eSocial.ConsultarLoteEventos(txtIdLote.Text);
            }
            else if (rbIdEvento.Checked)
            {
                _RetConsulta = eSocial.ConsultarIdEvento(txtIdLote.Text);
            }
            else if (rbNrRecibo.Checked)
            {
                _RetConsulta = eSocial.ConsultarEventoPorRecibo(txtIdLote.Text);
            }



            tbRetorno.Clear();
            tbRetorno.Text += "### CONSULTAR LOTE EVENTOS ###" + Environment.NewLine;
            tbRetorno.Text += " NumeroProtocolo: " + _RetConsulta.NumeroProtocolo + Environment.NewLine;
            tbRetorno.Text += "        Mensagem: " + _RetConsulta.Mensagem + Environment.NewLine;
            tbRetorno.Text += "          Status: " + _RetConsulta.Status + Environment.NewLine;
            tbRetorno.Text += "          IdLote: " + _RetConsulta.IdLote + Environment.NewLine;
            tbRetorno.Text += Environment.NewLine;

            for (var i = 0; i < _RetConsulta.Count(); i++)
            {
                _RetConsultaItem = _RetConsulta.Eventos[i];
                tbRetorno.Text += "       EVENTO: " + (i + 1).ToString() + Environment.NewLine;
                tbRetorno.Text += "     IdEvento: " + _RetConsultaItem.IdEvento + Environment.NewLine;
                tbRetorno.Text += " NumeroRecibo: " + _RetConsultaItem.NumeroRecibo + Environment.NewLine;
                tbRetorno.Text += "        cStat: " + _RetConsultaItem.cStat + Environment.NewLine;
                tbRetorno.Text += "       Status: " + _RetConsultaItem.Status + Environment.NewLine;
                tbRetorno.Text += "     Mensagem: " + _RetConsultaItem.Mensagem + Environment.NewLine;
                tbRetorno.Text += Environment.NewLine;

                for (var j = 0; j < _RetConsultaItem.Count(); j++)
                {
                    _RetConsultaOcorrencia = _RetConsultaItem.Ocorrencias[j];
                    tbRetorno.Text += " OCORRÊNCIA: " + (j + 1).ToString() + Environment.NewLine;
                    tbRetorno.Text += "     Codigo: " + _RetConsultaOcorrencia.Codigo + Environment.NewLine;
                    tbRetorno.Text += "  Descricao: " + _RetConsultaOcorrencia.Descricao + Environment.NewLine;
                    tbRetorno.Text += Environment.NewLine;
                }
                //PopulaTotalizadores(_RetConsultaItem);
            }
            for (int i = 0; i < _RetConsulta.CountOcorrencias(); i++)
            {
                _RetConsultaOcorrenciaEnvio = _RetConsulta.Ocorrencias[i];
                tbRetorno.Text += " Ocorrência Envio: " + (i + 1).ToString() + Environment.NewLine;
                tbRetorno.Text += "           Codigo: " + _RetConsultaOcorrenciaEnvio.Codigo + Environment.NewLine;
                tbRetorno.Text += "        Descricao: " + _RetConsultaOcorrenciaEnvio.Descricao + Environment.NewLine;
                tbRetorno.Text += "      Localizacao: " + _RetConsultaOcorrenciaEnvio.Localizacao + Environment.NewLine;
                tbRetorno.Text += "             Tipo: " + _RetConsultaOcorrenciaEnvio.Tipo + Environment.NewLine;
                tbRetorno.Text += Environment.NewLine;
            }

            //--------------------S5001--------------------//
            if (_RetConsultaItem.S5001.IsEmpty == false)
            {
                //Evento Informações das Contribuições Sociais por Trabalhador.
                tbRetorno.AppendText("### S5001 ###" + Environment.NewLine);
                tbRetorno.AppendText(" Id: " + _RetConsultaItem.S5001.Id + Environment.NewLine);
                tbRetorno.Text += Environment.NewLine;

                //Identificação do evento de retorno.
                tbRetorno.AppendText("IdeEvento" + Environment.NewLine);
                tbRetorno.AppendText(" nrRecArqBase: " + _RetConsultaItem.S5001.IdeEvento.NrRecArqBase + Environment.NewLine);
                tbRetorno.AppendText("  indApuracao: " + _RetConsultaItem.S5001.IdeEvento.IndApuracao + Environment.NewLine);
                tbRetorno.AppendText("      perApur: " + _RetConsultaItem.S5001.IdeEvento.PerApur + Environment.NewLine);
                tbRetorno.Text += Environment.NewLine;

                //Informações de identificação do empregador.
                tbRetorno.AppendText("IdeEmpregador" + Environment.NewLine);
                tbRetorno.AppendText(" tpInsc: " + _RetConsultaItem.S5001.IdeEmpregador.TpInsc + Environment.NewLine);
                tbRetorno.AppendText(" nrInsc: " + _RetConsultaItem.S5001.IdeEmpregador.NrInsc + Environment.NewLine);
                tbRetorno.Text += Environment.NewLine;

                //Identificação do trabalhador.
                tbRetorno.AppendText("IdeTrabalhador" + Environment.NewLine);
                tbRetorno.AppendText(" cpfTrab: " + _RetConsultaItem.S5001.IdeTrabalhador.CpfTrab + Environment.NewLine);
                tbRetorno.Text += Environment.NewLine;

                //infoCompl VAZIO
                //Grupo de informações da sucessão de vínculo trabalhista.
                tbRetorno.AppendText("sucessaoVinc" + Environment.NewLine);
                tbRetorno.AppendText("    TpInsc: " + _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.SucessaoVinc.TpInsc + Environment.NewLine);
                tbRetorno.AppendText("    NrInsc: " + _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.SucessaoVinc.NrInsc + Environment.NewLine);
                tbRetorno.AppendText(" MatricAnt: " + _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.SucessaoVinc.MatricAnt + Environment.NewLine);
                tbRetorno.AppendText("     DtAdm: " + _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.SucessaoVinc.DtAdm + Environment.NewLine);
                tbRetorno.Text += Environment.NewLine;

                // Informações relativas ao trabalho intermitente.
                tbRetorno.AppendText("InfoInterm" + Environment.NewLine);
                for (_a = 0; _a < _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.CountInfoInterm(); _a++)
                {
                    tbRetorno.AppendText("infoInterm" + Environment.NewLine);
                    tbRetorno.AppendText(" Dia: " + _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.InfoInterm[_a].Dia + Environment.NewLine);
                    tbRetorno.Text += Environment.NewLine;
                }

                // Informações complementares contratuais do trabalhador.
                
                 tbRetorno.AppendText("infoComplCont" + Environment.NewLine);
                for (_a = 0; _a < _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.CountInfoComplCont(); _a++)
                {
                    tbRetorno.AppendText("infoComplCont" + Environment.NewLine);
                    tbRetorno.AppendText("       CodCBO: " + _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.InfoComplCont[_a].CodCBO + Environment.NewLine);
                    tbRetorno.AppendText(" NatAtividade: " + _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.InfoComplCont[_a].NatAtividade + Environment.NewLine);
                    tbRetorno.AppendText("  QtdDiasTrab: " + _RetConsultaItem.S5001.IdeTrabalhador.InfoCompl.InfoComplCont[_a].QtdDiasTrab + Environment.NewLine);
                    tbRetorno.Text += Environment.NewLine;
                }

                // Informações sobre processos judiciais do trabalhador com decisão favorável quanto à não incidência ou alterações na incidência de contribuição previdenciária.
                for (_a = 0; _a < _RetConsultaItem.S5001.IdeTrabalhador.CountProcJudTrab(); _a++)
                {
                    tbRetorno.AppendText("ProcJudTrab" + Environment.NewLine);
                    tbRetorno.AppendText(" NrProcJud: " + _RetConsultaItem.S5001.IdeTrabalhador.ProcJudTrab[_a].NrProcJud + Environment.NewLine);
                    tbRetorno.AppendText("   CodSusp: " + _RetConsultaItem.S5001.IdeTrabalhador.ProcJudTrab[_a].CodSusp + Environment.NewLine);
                    tbRetorno.Text += Environment.NewLine;
                }

                // Cálculo da contribuição previdenciária do segurado, incidente sobre a remuneração do período de apuração e de períodos anteriores informada nos eventos S-1200, S-2299 e S-2399.
                tbRetorno.AppendText("InfoCpCalc" + Environment.NewLine);
                for (_a = 0; _a < _RetConsultaItem.S5001.CountInfoCpCalc(); _a++)
                {                    
                    tbRetorno.AppendText(" NrProcJud: " + _RetConsultaItem.S5001.InfoCpCalc[_a].TpCR + Environment.NewLine);
                    tbRetorno.AppendText(" NrProcJud: " + _RetConsultaItem.S5001.InfoCpCalc[_a].VrCpSeg + Environment.NewLine);
                    tbRetorno.AppendText(" NrProcJud: " + _RetConsultaItem.S5001.InfoCpCalc[_a].VrDescSeg + Environment.NewLine);
                    tbRetorno.Text += Environment.NewLine;
                }

                // Informações sobre bases de cálculo, descontos e deduções de contribuições sociais devidas à Previdência Social e a Outras Entidades e Fundos, referentes à remuneração do período de apuração e de períodos anteriores informada nos eventos S-1200, S-2299 e S-2399.
                tbRetorno.AppendText("infoCp" + Environment.NewLine);
                tbRetorno.AppendText(" NrProcJud: " + _RetConsultaItem.S5001.InfoCp.ClassTrib + Environment.NewLine);
                tbRetorno.Text += Environment.NewLine;

                // Identificação do estabelecimento ou obra de construção civil e da lotação tributária.
                for (_a = 0; _a < _RetConsultaItem.S5001.InfoCp.CountIdeEstabLot(); _a++)
                {
                    tbRetorno.AppendText("ideEstabLot" + Environment.NewLine);
                    tbRetorno.AppendText("     TpInsc: " + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].TpInsc + Environment.NewLine);
                    tbRetorno.AppendText("     NrInsc: " + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].NrInsc + Environment.NewLine);
                    tbRetorno.AppendText(" CodLotacao: " + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].CodLotacao + Environment.NewLine);
                    tbRetorno.Text += Environment.NewLine;

                    // Informações relativas à matrícula e categoria do trabalhador e tipos de incidências.
                    for (_b = 0; _b < _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].CountInfoCategIncid(); _b++)
                    {
                        tbRetorno.AppendText("infoCategIncid" + Environment.NewLine);
                        tbRetorno.AppendText("  Matricula: " + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].Matricula + Environment.NewLine);
                        tbRetorno.AppendText("   CodCateg: " + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CodCateg + Environment.NewLine);
                        tbRetorno.AppendText(" IndSimples: " + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].IndSimples + Environment.NewLine);
                        tbRetorno.Text += Environment.NewLine;

                        // Informações sobre bases de cálculo, descontos e deduções de contribuições sociais devidas à Previdência Social e a Outras Entidades e Fundos.
                        tbRetorno.AppendText("infoBaseCS" + Environment.NewLine);
                        for (_c = 0; _c < _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CountInfoBaseCS(); _c++)
                        {                            
                            tbRetorno.AppendText("   Ind13: " + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoBaseCS[_c].Ind13 + Environment.NewLine);
                            tbRetorno.AppendText(" TpValor: " + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoBaseCS[_c].TpValor + Environment.NewLine);
                            tbRetorno.AppendText("   Valor: " + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoBaseCS[_c].Valor + Environment.NewLine);
                            tbRetorno.Text += Environment.NewLine;
                        }

                        // Cálculo das contribuições sociais devidas a Outras Entidades e Fundos.
                        tbRetorno.AppendText("CalcTerc" + Environment.NewLine);
                        for (_c = 0; _c < _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CountCalcTerc(); _c++)
                        {                            
                            tbRetorno.AppendText("        TpCR: " + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CalcTerc[_c].TpCR + Environment.NewLine);
                            tbRetorno.AppendText(" VrCsSegTerc: " + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CalcTerc[_c].VrCsSegTerc + Environment.NewLine);
                            tbRetorno.AppendText("  VrDescTerc: " + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CalcTerc[_c].VrDescTerc + Environment.NewLine);
                            tbRetorno.Text += Environment.NewLine;
                        }

                        // Informações de remuneração por período de referência.
                        tbRetorno.AppendText("infoPerRef" + Environment.NewLine);
                        for (_c = 0; _c < _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].CountInfoPerRef(); _c++)
                        {                            
                            tbRetorno.AppendText(" PerRef: " + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].PerRef + Environment.NewLine);
                            tbRetorno.Text += Environment.NewLine;


                            // Identificação do instrumento ou situação ensejadora da remuneração relativa a períodos de apuração anteriores.
                            tbRetorno.AppendText("ideADC" + Environment.NewLine);
                            for (_d = 0; _d < _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].CountIdeADC(); _d++)
                            {                                
                                tbRetorno.AppendText(" DtAcConv: " + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].IdeADC[_d].DtAcConv + Environment.NewLine);
                                tbRetorno.AppendText(" TpAcConv: " + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].IdeADC[_d].TpAcConv + Environment.NewLine);
                                tbRetorno.AppendText("      Dsc: " + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].IdeADC[_d].Dsc + Environment.NewLine);
                                tbRetorno.AppendText(" RemunSuc: " + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].IdeADC[_d].RemunSuc + Environment.NewLine);
                                tbRetorno.Text += Environment.NewLine;
                            }

                            tbRetorno.AppendText("DetInfoPerRef" + Environment.NewLine);
                            // Detalhamento das informações de remuneração por período de referência. Deve ser preenchido com informações de {infoPerApur} e {infoPerAnt} do S-1200 e S-2299, e de {dmDev} do S-2399, quando houver.

                            for (_d = 0; _d < _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].CountDetInfoPerRef(); _d++)
                            {
                                tbRetorno.AppendText(" Ind13: " + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].DetInfoPerRef[_d].Ind13 + Environment.NewLine);
                                tbRetorno.AppendText(" TpVrPerRef: " + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].DetInfoPerRef[_d].TpVrPerRef + Environment.NewLine);
                                tbRetorno.AppendText("      VrPerRef: " + _RetConsultaItem.S5001.InfoCp.IdeEstabLot[_a].InfoCategIncid[_b].InfoPerRef[_c].DetInfoPerRef[_d].VrPerRef + Environment.NewLine);
                                tbRetorno.Text += Environment.NewLine;
                            }
                        }
                    }
                }
            }

            //--------------------S5002--------------------//
            if (_RetConsultaItem.S5002.IsEmpty == false)
            {
                tbRetorno.AppendText("### S5002 ###" + Environment.NewLine);
                tbRetorno.AppendText(" Id: " + _RetConsultaItem.S5002.Id + Environment.NewLine);
                tbRetorno.Text += Environment.NewLine;

                // Identificação única do evento.
                tbRetorno.AppendText("IdeEvento" + Environment.NewLine);
                tbRetorno.AppendText(" nrRecArqBase: " + _RetConsultaItem.S5002.IdeEvento.NrRecArqBase + Environment.NewLine);
                tbRetorno.AppendText("      perApur: " + _RetConsultaItem.S5002.IdeEvento.PerApur + Environment.NewLine);
                tbRetorno.Text += Environment.NewLine;

                //Informações de identificação do empregador.
                tbRetorno.AppendText("IdeEmpregador" + Environment.NewLine);
                tbRetorno.AppendText(" tpInsc: " + _RetConsultaItem.S5002.IdeEmpregador.TpInsc + Environment.NewLine);
                tbRetorno.AppendText(" nrInsc: " + _RetConsultaItem.S5002.IdeEmpregador.NrInsc + Environment.NewLine);
                tbRetorno.Text += Environment.NewLine;

                // Identificação do beneficiário do pagamento.
                tbRetorno.AppendText("IdeTrabalhador" + Environment.NewLine);
                tbRetorno.AppendText(" CpfBenef: " + _RetConsultaItem.S5002.IdeTrabalhador.CpfBenef + Environment.NewLine);
                tbRetorno.Text += Environment.NewLine;

                for (_a = 0; _a < _RetConsultaItem.S5002.IdeTrabalhador.CountDmDev(); _a++)
                {
                    // Informações do demonstrativo de valores devidos.
                    tbRetorno.AppendText("DmDev" + Environment.NewLine);
                    tbRetorno.AppendText("   PerRef: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].PerRef + Environment.NewLine);
                    tbRetorno.AppendText(" IdeDmDev: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].IdeDmDev + Environment.NewLine);
                    tbRetorno.AppendText("   TpPgto: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].TpPgto + Environment.NewLine);
                    tbRetorno.AppendText("   DtPgto: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].DtPgto + Environment.NewLine);
                    tbRetorno.AppendText(" CodCateg: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].CodCateg + Environment.NewLine);
                    tbRetorno.Text += Environment.NewLine;

                    //Rendimentos tributáveis, deduções, isenções e retenções do IRRF.
                    for (_b = 0; _b < _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].CountInfoIR(); _b++)
                    {
                        tbRetorno.AppendText("InfoIR" + Environment.NewLine);
                        tbRetorno.AppendText(" TpInfoIR: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoIR[_b].TpInfoIR + Environment.NewLine);
                        tbRetorno.AppendText("    Valor: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoIR[_b].Valor + Environment.NewLine);
                        tbRetorno.Text += Environment.NewLine;

                        // Informações complementares - Demais rendimentos com exigibilidade suspensa decorrentes de decisão judicial aplicável à rubrica.
                        for (_c = 0; _c < _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoIR[_b].CountInfoProcJudRub(); _c++)
                        {
                            tbRetorno.AppendText("InfoProcJudRub" + Environment.NewLine);
                            tbRetorno.AppendText("   NrProc: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoIR[_b].InfoProcJudRub[_c].NrProc + Environment.NewLine);
                            tbRetorno.AppendText("   UfVara: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoIR[_b].InfoProcJudRub[_c].UfVara + Environment.NewLine);
                            tbRetorno.AppendText(" CodMunic: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoIR[_b].InfoProcJudRub[_c].CodMunic + Environment.NewLine);
                            tbRetorno.AppendText("   IdVara: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoIR[_b].InfoProcJudRub[_c].IdVara + Environment.NewLine);
                            tbRetorno.Text += Environment.NewLine;
                        }

                        //Totalizador de tributos com período de apuração mensal.
                        for (_b = 0; _b < _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].CountTotApurMen(); _b++)
                        {
                            tbRetorno.AppendText("totApurMen" + Environment.NewLine);
                            tbRetorno.AppendText("    CRMen: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].TotApurMen[_b].CRMen + Environment.NewLine);
                            tbRetorno.AppendText(" VlrCRMen: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].TotApurMen[_b].VlrCRMen + Environment.NewLine);
                            tbRetorno.Text += Environment.NewLine;
                        }

                        //Totalizador de tributos com período de apuração diário.
                        for (_b = 0; _b < _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].CountTotApurDia(); _b++)
                        {
                            tbRetorno.AppendText("totApurMen" + Environment.NewLine);
                            tbRetorno.AppendText(" PerApurDia: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].TotApurDia[_b].PerApurDia + Environment.NewLine);
                            tbRetorno.AppendText("      CRDia: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].TotApurDia[_b].CRDia + Environment.NewLine);
                            tbRetorno.AppendText("   VlrCRDia: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].TotApurDia[_b].VlrCRDia + Environment.NewLine);
                            tbRetorno.Text += Environment.NewLine;
                        }

                        //Informações complementares relativas a Rendimentos Recebidos Acumuladamente - RRA.
                        tbRetorno.AppendText("InfoRRA" + Environment.NewLine);
                        tbRetorno.AppendText("   TpProcRRA: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoRRA.TpProcRRA + Environment.NewLine);
                        tbRetorno.AppendText("   NrProcRRA: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoRRA.NrProcRRA + Environment.NewLine);
                        tbRetorno.AppendText("     DescRRA: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoRRA.DescRRA + Environment.NewLine);
                        tbRetorno.AppendText(" QtdMesesRRA: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoRRA.QtdMesesRRA + Environment.NewLine);
                        tbRetorno.Text += Environment.NewLine;

                        //Identificação dos advogados.
                        for (_b = 0; _b < _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoRRA.CountIdeAdv(); _b++)
                        {
                            tbRetorno.AppendText("IdeAdv" + Environment.NewLine);
                            tbRetorno.AppendText(" TpInsc: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoRRA.IdeAdv[_b].TpInsc + Environment.NewLine);
                            tbRetorno.AppendText(" NrInsc: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoRRA.IdeAdv[_b].NrInsc + Environment.NewLine);
                            tbRetorno.AppendText(" VlrAdv: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoRRA.IdeAdv[_b].VlrAdv + Environment.NewLine);
                            tbRetorno.Text += Environment.NewLine;
                        }

                        //Informações complementares relativas a pagamentos a residente fiscal no exterior.
                        tbRetorno.AppendText("InfoPgtoExt" + Environment.NewLine);
                        tbRetorno.AppendText(" PaisResidExt: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoPgtoExt.PaisResidExt + Environment.NewLine);
                        tbRetorno.AppendText("       IndNIF: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoPgtoExt.IndNIF + Environment.NewLine);
                        tbRetorno.AppendText("     NifBenef: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoPgtoExt.NifBenef + Environment.NewLine);
                        tbRetorno.AppendText("    FrmTribut: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoPgtoExt.FrmTribut + Environment.NewLine);
                        tbRetorno.Text += Environment.NewLine;

                        //Endereço do beneficiário residente ou domiciliado no exterior.
                        tbRetorno.AppendText("EndExt" + Environment.NewLine);
                        tbRetorno.AppendText(" EndDscLograd: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoPgtoExt.EndExt.EndDscLograd + Environment.NewLine);
                        tbRetorno.AppendText("  EndNrLograd: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoPgtoExt.EndExt.EndNrLograd + Environment.NewLine);
                        tbRetorno.AppendText("   EndComplem: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoPgtoExt.EndExt.EndComplem + Environment.NewLine);
                        tbRetorno.AppendText("    EndBairro: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoPgtoExt.EndExt.EndBairro + Environment.NewLine);
                        tbRetorno.AppendText("    EndCidade: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoPgtoExt.EndExt.EndCidade + Environment.NewLine);
                        tbRetorno.AppendText("    EndEstado: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoPgtoExt.EndExt.EndEstado + Environment.NewLine);
                        tbRetorno.AppendText(" EndCodPostal: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoPgtoExt.EndExt.EndCodPostal + Environment.NewLine);
                        tbRetorno.AppendText("        Telef: " + _RetConsultaItem.S5002.IdeTrabalhador.DmDev[_a].InfoPgtoExt.EndExt.Telef + Environment.NewLine);
                        tbRetorno.Text += Environment.NewLine;
                    }

                    //Informações complementares relativas a pagamentos a residente fiscal no exterior.
                    tbRetorno.AppendText("infoIRComplem" + Environment.NewLine);
                    tbRetorno.AppendText(" DtLaudo: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.DtLaudo + Environment.NewLine);
                    tbRetorno.Text += Environment.NewLine;

                    for (_a = 0; _a < _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.CountIdeDep(); _a++)
                    {
                        //Identificação dos dependentes.
                        tbRetorno.AppendText("IdeDep" + Environment.NewLine);
                        tbRetorno.AppendText("   CpfDep: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.IdeDep[_a].CpfDep + Environment.NewLine);
                        tbRetorno.AppendText("  DepIRRF: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.IdeDep[_a].DepIRRF + Environment.NewLine);
                        tbRetorno.AppendText(" DtNascto: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.IdeDep[_a].DtNascto + Environment.NewLine);
                        tbRetorno.AppendText("     Nome: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.IdeDep[_a].Nome + Environment.NewLine);
                        tbRetorno.AppendText("    TpDep: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.IdeDep[_a].TpDep + Environment.NewLine);
                        tbRetorno.AppendText(" DescrDep: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.IdeDep[_a].DescrDep + Environment.NewLine);
                        tbRetorno.Text += Environment.NewLine;
                    }

                    //Informações de Imposto de Renda, por Código de Receita - CR.
                    for (_a = 0; _a < _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.CountInfoIRCR(); _a++)
                    {
                        tbRetorno.AppendText("InfoIRCR" + Environment.NewLine);
                        tbRetorno.AppendText(" TpCR: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].TpCR + Environment.NewLine);
                        tbRetorno.Text += Environment.NewLine;

                        //Dedução do rendimento tributável relativa a dependentes.
                        for (_b = 0; _b < _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].CountDedDepen(); _b++)
                        {
                            tbRetorno.AppendText("InfoIRCR" + Environment.NewLine);
                            tbRetorno.AppendText("    TpRend: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].DedDepen[_b].TpRend + Environment.NewLine);
                            tbRetorno.AppendText("    CpfDep: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].DedDepen[_b].CpfDep + Environment.NewLine);
                            tbRetorno.AppendText(" VlrDedDep: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].DedDepen[_b].VlrDedDep + Environment.NewLine);
                            tbRetorno.Text += Environment.NewLine;
                        }

                        //Informação dos beneficiários da pensão alimentícia.
                        for (_b = 0; _b < _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].CountPenAlim(); _b++)
                        {
                            tbRetorno.AppendText("PenAlim" + Environment.NewLine);
                            tbRetorno.AppendText("        TpRend: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].PenAlim[_b].TpRend + Environment.NewLine);
                            tbRetorno.AppendText("        CpfDep: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].PenAlim[_b].CpfDep + Environment.NewLine);
                            tbRetorno.AppendText(" VlrDedPenAlim: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].PenAlim[_b].VlrDedPenAlim + Environment.NewLine);
                            tbRetorno.Text += Environment.NewLine;
                        }

                        //Informações relativas a planos de previdência complementar.
                        for (_b = 0; _b < _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].CountPrevidCompl(); _b++)
                        {
                            tbRetorno.AppendText("PrevidCompl" + Environment.NewLine);
                            tbRetorno.AppendText("        TpPrev: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].PrevidCompl[_b].TpPrev + Environment.NewLine);
                            tbRetorno.AppendText("   CnpjEntidPC: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].PrevidCompl[_b].CnpjEntidPC + Environment.NewLine);
                            tbRetorno.AppendText("      VlrDedPC: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].PrevidCompl[_b].VlrDedPC + Environment.NewLine);
                            tbRetorno.AppendText(" VlrPatrocFunp: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].PrevidCompl[_b].VlrPatrocFunp + Environment.NewLine);
                            tbRetorno.Text += Environment.NewLine;
                        }

                        //Informações de processos relacionados a não retenção de tributos ou a depósitos judiciais.
                        for (_b = 0; _b < _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].CountInfoProcRet(); _b++)
                        {
                            tbRetorno.AppendText("InfoProcRet" + Environment.NewLine);
                            tbRetorno.AppendText(" TpProcRet: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].TpProcRet + Environment.NewLine);
                            tbRetorno.AppendText(" NrProcRet: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].NrProcRet + Environment.NewLine);
                            tbRetorno.AppendText("   CodSusp: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].CodSusp + Environment.NewLine);
                            tbRetorno.Text += Environment.NewLine;

                            for (_c = 0; _c < _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].CountInfoValores(); _c++)
                            {
                                //Informações de valores relacionados a não retenção de tributos ou a depósitos judiciais.
                                tbRetorno.AppendText("InfoValores" + Environment.NewLine);
                                tbRetorno.AppendText("  IndApuracao: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].InfoValores[_c].IndApuracao + Environment.NewLine);
                                tbRetorno.AppendText("   VlrNRetido: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].InfoValores[_c].VlrNRetido + Environment.NewLine);
                                tbRetorno.AppendText("    VlrDepJud: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].InfoValores[_c].VlrDepJud + Environment.NewLine);
                                tbRetorno.AppendText(" VlrCmpAnoCal: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].InfoValores[_c].VlrCmpAnoCal + Environment.NewLine);
                                tbRetorno.AppendText(" VlrCmpAnoAnt: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].InfoValores[_c].VlrCmpAnoAnt + Environment.NewLine);
                                tbRetorno.AppendText("  VlrRendSusp: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].InfoValores[_c].VlrRendSusp + Environment.NewLine);
                                tbRetorno.Text += Environment.NewLine;

                                for (_d = 0; _d < _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].InfoValores[_c].CountDedSusp(); _d++)
                                {
                                    //Detalhamento das deduções com exigibilidade suspensa.
                                    tbRetorno.AppendText("dedSusp" + Environment.NewLine);
                                    tbRetorno.AppendText("  IndTpDeducao: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].InfoValores[_c].DedSusp[_d].IndTpDeducao + Environment.NewLine);
                                    tbRetorno.AppendText("    VlrDedSusp: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].InfoValores[_c].DedSusp[_d].VlrDedSusp + Environment.NewLine);
                                    tbRetorno.AppendText("   CnpjEntidPC: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].InfoValores[_c].DedSusp[_d].CnpjEntidPC + Environment.NewLine);
                                    tbRetorno.AppendText(" VlrPatrocFunp: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].InfoValores[_c].DedSusp[_d].VlrPatrocFunp + Environment.NewLine);
                                    tbRetorno.Text += Environment.NewLine;

                                    for (_e = 0; _e < _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].InfoValores[_c].DedSusp[_d].CountBenefPen(); _e++)
                                    {
                                        //Informação das deduções suspensas por dependentes e beneficiários da pensão alimentícia.
                                        tbRetorno.AppendText("BenefPen" + Environment.NewLine);
                                        tbRetorno.AppendText("       CpfDep: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].InfoValores[_c].DedSusp[_d].BenefPen[_e].CpfDep + Environment.NewLine);
                                        tbRetorno.AppendText(" VlrDepenSusp: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoIRCR[_a].InfoProcRet[_b].InfoValores[_c].DedSusp[_d].BenefPen[_e].VlrDepenSusp + Environment.NewLine);
                                        tbRetorno.Text += Environment.NewLine;

                                    }
                                }
                            }
                        }
                    }
                    for (_a = 0; _a < _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.CountPlanSaude(); _a++)
                    {
                        //Plano de saúde coletivo. Identificação da(s) operadora(s) de plano privado coletivo empresarial de assistência à saúde.
                        tbRetorno.AppendText("PlanSaude" + Environment.NewLine);
                        tbRetorno.AppendText("    CnpjOper: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.PlanSaude[_a].CnpjOper + Environment.NewLine);
                        tbRetorno.AppendText("      RegANS: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.PlanSaude[_a].RegANS + Environment.NewLine);
                        tbRetorno.AppendText(" VlrSaudeTit: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.PlanSaude[_a].VlrSaudeTit + Environment.NewLine);
                        tbRetorno.Text += Environment.NewLine;

                        for (_b = 0; _b < _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.PlanSaude[_a].CountInfoDepSau(); _b++)
                        {
                            //Informações de dependente de plano de saúde coletivo empresarial.
                            tbRetorno.AppendText("InfoDepSau" + Environment.NewLine);
                            tbRetorno.AppendText("      CpfDep: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.PlanSaude[_a].InfoDepSau[_b].CpfDep + Environment.NewLine);
                            tbRetorno.AppendText(" VlrSaudeDep: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.PlanSaude[_a].InfoDepSau[_b].VlrSaudeDep + Environment.NewLine);
                            tbRetorno.Text += Environment.NewLine;
                        }
                    }

                    for (_a = 0; _a < _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.CountInfoReembMed(); _a++)
                    {
                        //Informações relativas a reembolsos efetuados no período de apuração (perApur) pelo empregador ao trabalhador referente a despesas médicas ou odontológicas pagas pelo trabalhador a prestadores de serviços de saúde.
                        tbRetorno.AppendText("InfoReembMed" + Environment.NewLine);
                        tbRetorno.AppendText(" IndOrgReemb: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].IndOrgReemb + Environment.NewLine);
                        tbRetorno.AppendText("    CnpjOper: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].CnpjOper + Environment.NewLine);
                        tbRetorno.AppendText("      RegANS: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].RegANS + Environment.NewLine);
                        tbRetorno.Text += Environment.NewLine;

                        for (_b = 0; _b < _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].CountDetReembTit(); _b++)
                        {
                            //Informação de reembolso do titular do plano de saúde coletivo empresarial.
                            tbRetorno.AppendText("DetReembTit" + Environment.NewLine);
                            tbRetorno.AppendText("      TpInsc: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].DetReembTit[_b].TpInsc + Environment.NewLine);
                            tbRetorno.AppendText("      NrInsc: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].DetReembTit[_b].NrInsc + Environment.NewLine);
                            tbRetorno.AppendText("    VlrReemb: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].DetReembTit[_b].VlrReemb + Environment.NewLine);
                            tbRetorno.AppendText(" VlrReembAnt: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].DetReembTit[_b].VlrReembAnt + Environment.NewLine);
                            tbRetorno.Text += Environment.NewLine;
                        }

                        for (_b = 0; _b < _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].CountInfoReembDep(); _b++)
                        {
                            //Informação de reembolso do titular do plano de saúde coletivo empresarial.
                            tbRetorno.AppendText("DetReembTit" + Environment.NewLine);
                            tbRetorno.AppendText(" CpfBenef: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].InfoReembDep[_b].CpfBenef + Environment.NewLine);
                            tbRetorno.Text += Environment.NewLine;

                            for (_c = 0; _c < _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].InfoReembDep[_b].CountDetReembDep(); _c++)
                            {
                                //Detalhamento dos reembolsos efetuados em perApur pelo empregador ao trabalhador referente a despesas médicas ou odontológicas pagas pelo trabalhador a prestadores de serviços de saúde relativo a despesas de seus dependentes.
                                tbRetorno.AppendText("DetReembDep" + Environment.NewLine);
                                tbRetorno.AppendText("      TpInsc: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].InfoReembDep[_b].DetReembDep[_c].TpInsc + Environment.NewLine);
                                tbRetorno.AppendText("      NrInsc: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].InfoReembDep[_b].DetReembDep[_c].NrInsc + Environment.NewLine);
                                tbRetorno.AppendText("    VlrReemb: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].InfoReembDep[_b].DetReembDep[_c].VlrReemb + Environment.NewLine);
                                tbRetorno.AppendText(" VlrReembAnt: " + _RetConsultaItem.S5002.IdeTrabalhador.InfoIRComplem.InfoReembMed[_a].InfoReembDep[_b].DetReembDep[_c].VlrReembAnt + Environment.NewLine);
                                tbRetorno.Text += Environment.NewLine;
                            }
                        }
                    }
                }
            //--------------------S5003--------------------//
            if (_RetConsultaItem.S5003.IsEmpty == false)
            {
                tbRetorno.AppendText("### S5003 ###" + Environment.NewLine);
                tbRetorno.AppendText(" Id: " + _RetConsultaItem.S5003.Id + Environment.NewLine);
                tbRetorno.Text += Environment.NewLine;

                // Identificação do evento de retorno.
                tbRetorno.AppendText("IdeEvento" + Environment.NewLine);
                tbRetorno.AppendText(" nrRecArqBase: " + _RetConsultaItem.S5003.IdeEvento.NrRecArqBase + Environment.NewLine);
                tbRetorno.AppendText("  IndApuracao: " + _RetConsultaItem.S5003.IdeEvento.IndApuracao + Environment.NewLine);
                tbRetorno.AppendText("      perApur: " + _RetConsultaItem.S5003.IdeEvento.PerApur + Environment.NewLine);
                tbRetorno.Text += Environment.NewLine;

                //Informações de identificação do empregador.
                tbRetorno.AppendText("IdeEmpregador" + Environment.NewLine);
                tbRetorno.AppendText(" tpInsc: " + _RetConsultaItem.S5003.IdeEmpregador.TpInsc + Environment.NewLine);
                tbRetorno.AppendText(" nrInsc: " + _RetConsultaItem.S5003.IdeEmpregador.NrInsc + Environment.NewLine);
                tbRetorno.Text += Environment.NewLine;

                // Grupo que apresenta a identificação básica do trabalhador ao qual se refere o evento de retorno.
                tbRetorno.AppendText("IdeTrabalhador" + Environment.NewLine);
                tbRetorno.AppendText(" CpfTrab: " + _RetConsultaItem.S5003.IdeTrabalhador.CpfTrab + Environment.NewLine);
                tbRetorno.Text += Environment.NewLine;
                    
                 // Informações relativas ao Fundo de Garantia do Tempo de Serviço - FGTS.
                 tbRetorno.AppendText("InfoFGTS" + Environment.NewLine);
                 tbRetorno.AppendText("    DtVenc: " + _RetConsultaItem.S5003.InfoFGTS.DtVenc + Environment.NewLine);
                 tbRetorno.AppendText(" ClassTrib: " + _RetConsultaItem.S5003.InfoFGTS.ClassTrib + Environment.NewLine);
                 tbRetorno.Text += Environment.NewLine;
            }

            //--------------------S5503--------------------//
            if (_RetConsultaItem.S5503.IsEmpty == false)
            {
                tbRetorno.AppendText("### S5003 ###" + Environment.NewLine);
                tbRetorno.AppendText(" Id: " + _RetConsultaItem.S5503.Id + Environment.NewLine);
                tbRetorno.Text += Environment.NewLine;

                // Identificação do evento de retorno.
                tbRetorno.AppendText("IdeEvento" + Environment.NewLine);
                tbRetorno.AppendText(" nrRecArqBase: " + _RetConsultaItem.S5503.IdeEvento.NrRecArqBase + Environment.NewLine);
                tbRetorno.AppendText("      perApur: " + _RetConsultaItem.S5503.IdeEvento.PerApur + Environment.NewLine);
                tbRetorno.Text += Environment.NewLine;

                // Identificação do processo.
                tbRetorno.AppendText("IdeEmpregador" + Environment.NewLine);
                tbRetorno.AppendText(" tpInsc: " + _RetConsultaItem.S5503.IdeEmpregador.TpInsc + Environment.NewLine);
                tbRetorno.AppendText(" nrInsc: " + _RetConsultaItem.S5503.IdeEmpregador.NrInsc + Environment.NewLine);
                tbRetorno.Text += Environment.NewLine;

                // Identificação do processo.
                tbRetorno.AppendText("ideProc" + Environment.NewLine);
                tbRetorno.AppendText("     Origem: " + _RetConsultaItem.S5503.IdeProc.Origem + Environment.NewLine);
                tbRetorno.AppendText(" NrProcTrab: " + _RetConsultaItem.S5503.IdeProc.NrProcTrab + Environment.NewLine);
                tbRetorno.Text += Environment.NewLine;

                // Informações relativas ao Fundo de Garantia do Tempo de Serviço - FGTS.
                tbRetorno.AppendText("ideTrabalhador" + Environment.NewLine);
                tbRetorno.AppendText(" CpfTrab: " + _RetConsultaItem.S5503.IdeTrabalhador.CpfTrab + Environment.NewLine);
                tbRetorno.Text += Environment.NewLine;
                    
                for (_a = 0; _a < _RetConsultaItem.S5503.CountInfoTrabFGTS(); _a++)
                {
                    //Informações relativas à matrícula e categoria do trabalhador.
                    tbRetorno.AppendText("infoTrabFGTS" + Environment.NewLine);
                    tbRetorno.AppendText("   CpfTrab: " + _RetConsultaItem.S5503.InfoTrabFGTS[_a].Matricula + Environment.NewLine);
                    tbRetorno.AppendText("  CodCateg: " + _RetConsultaItem.S5503.InfoTrabFGTS[_a].CodCateg + Environment.NewLine);
                    tbRetorno.AppendText(" CategOrig: " + _RetConsultaItem.S5503.InfoTrabFGTS[_a].CategOrig + Environment.NewLine);
                    tbRetorno.Text += Environment.NewLine;

                    //Informações relativas ao FGTS do processo trabalhista.
                    tbRetorno.AppendText("infoTrabFGTS" + Environment.NewLine);
                    tbRetorno.AppendText(" TotalFGTS: " + _RetConsultaItem.S5503.InfoTrabFGTS[_a].InfoFGTSProcTrab.TotalFGTS + Environment.NewLine);
                    tbRetorno.Text += Environment.NewLine;
                        
                    // Identificação do estabelecimento responsável pelo pagamento ao trabalhador dos valores informados.
                    tbRetorno.AppendText("ideEstab" + Environment.NewLine);
                    tbRetorno.AppendText(" TpInsc: " + _RetConsultaItem.S5503.InfoTrabFGTS[_a].InfoFGTSProcTrab.IdeEstab.TpInsc + Environment.NewLine);
                    tbRetorno.AppendText(" NrInsc: " + _RetConsultaItem.S5503.InfoTrabFGTS[_a].InfoFGTSProcTrab.IdeEstab.NrInsc + Environment.NewLine);
                    tbRetorno.Text += Environment.NewLine;
                        
                    for (_b = 0; _b < _RetConsultaItem.S5503.InfoTrabFGTS[_a].InfoFGTSProcTrab.IdeEstab.CountBasePerRef(); _b++)
                    {
                        // Informações sobre bases de cálculo e valores do FGTS por período de referência.
                        tbRetorno.AppendText("basePerRef" + Environment.NewLine);
                        tbRetorno.AppendText(" PerRef: " + _RetConsultaItem.S5503.InfoTrabFGTS[_a].InfoFGTSProcTrab.IdeEstab.BasePerRef[_b].PerRef + Environment.NewLine);
                        tbRetorno.AppendText(" CodCateg: " + _RetConsultaItem.S5503.InfoTrabFGTS[_a].InfoFGTSProcTrab.IdeEstab.BasePerRef[_b].CodCateg + Environment.NewLine);
                        tbRetorno.AppendText(" TpValorProcTrab: " + _RetConsultaItem.S5503.InfoTrabFGTS[_a].InfoFGTSProcTrab.IdeEstab.BasePerRef[_b].TpValorProcTrab + Environment.NewLine);
                        tbRetorno.AppendText(" RemFGTSProcTrab: " + _RetConsultaItem.S5503.InfoTrabFGTS[_a].InfoFGTSProcTrab.IdeEstab.BasePerRef[_b].RemFGTSProcTrab + Environment.NewLine);
                        tbRetorno.AppendText(" DpsFGTSProcTrab: " + _RetConsultaItem.S5503.InfoTrabFGTS[_a].InfoFGTSProcTrab.IdeEstab.BasePerRef[_b].DpsFGTSProcTrab + Environment.NewLine);
                        tbRetorno.AppendText(" RemFGTSSefip: " + _RetConsultaItem.S5503.InfoTrabFGTS[_a].InfoFGTSProcTrab.IdeEstab.BasePerRef[_b].RemFGTSSefip + Environment.NewLine);
                        tbRetorno.AppendText(" DpsFGTSSefip: " + _RetConsultaItem.S5503.InfoTrabFGTS[_a].InfoFGTSProcTrab.IdeEstab.BasePerRef[_b].DpsFGTSSefip + Environment.NewLine);
                        tbRetorno.AppendText(" RemFGTSDecAnt: " + _RetConsultaItem.S5503.InfoTrabFGTS[_a].InfoFGTSProcTrab.IdeEstab.BasePerRef[_b].RemFGTSDecAnt + Environment.NewLine);
                        tbRetorno.AppendText(" DpsFGTSDecAnt: " + _RetConsultaItem.S5503.InfoTrabFGTS[_a].InfoFGTSProcTrab.IdeEstab.BasePerRef[_b].DpsFGTSDecAnt + Environment.NewLine);
                        tbRetorno.Text += Environment.NewLine;

                    }
                }
            }
        }  

    }
        
        private void tabPage4_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process pStart = new System.Diagnostics.Process();
            pStart.StartInfo = new System.Diagnostics.ProcessStartInfo("https://atendimento.tecnospeed.com.br/hc/pt-br/articles/4404184018839-Guia-Geral-Componente-eSocial");
            pStart.Start();
        }

        private void btnPropiedades_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process pStart = new System.Diagnostics.Process();
            pStart.StartInfo = new System.Diagnostics.ProcessStartInfo("https://atendimento.tecnospeed.com.br/hc/pt-br/articles/360005419193-Componente-eSocial-Propriedades");
            pStart.Start();
        }

        private void btnMetodos_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process pStart = new System.Diagnostics.Process();
            pStart.StartInfo = new System.Diagnostics.ProcessStartInfo("https://atendimento.tecnospeed.com.br/hc/pt-br/sections/360001152373-Componente-eSocial-M%C3%A9todos");
            pStart.Start();
        }

        private void btnDicionario_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process pStart = new System.Diagnostics.Process();
            pStart.StartInfo = new System.Diagnostics.ProcessStartInfo("https://atendimento.tecnospeed.com.br/hc/pt-br/sections/1500001504902-Dicion%C3%A1rio-de-dados-S-1-0");
            pStart.Start();
        }

    }
}
