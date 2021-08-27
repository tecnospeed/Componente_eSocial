using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ESocialSClientX;
using System.Xml;

namespace eSocialCSharp
{
    public partial class Form3 : Form
    {
        public ESocialSClientX.spdESocialSClientX eSocial = new ESocialSClientX.spdESocialSClientX();
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
                eSocial.Ambiente = ESocialSClientX.AmbienteKind.akProducao;
            }
            if (cbAmbiente.Text == "2 - Homologação")
            {
                eSocial.Ambiente = ESocialSClientX.AmbienteKind.akPreProducaoReais;
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
            IspdSRetEnviarLoteEventos _RetEnvio;

            _RetEnvio = eSocial.EnviarLoteEventos(tbRetorno.Text, Convert.ToInt32(cbGrupo.Text));

            tbRetorno.Clear();
            tbRetorno.Text += "### ENVIAR LOTE EVENTOS ###" + Environment.NewLine;
            tbRetorno.Text += "Identificador Lote: " + _RetEnvio.IdLote + Environment.NewLine;
            tbRetorno.Text += "Mensagem" + _RetEnvio.Mensagem + Environment.NewLine;

            txtIdLote.Text = _RetEnvio.IdLote;
        }

        private void btnConsultar_Click(object sender, EventArgs e)
        {
            IspdSRetConsultarLote _RetConsulta;
            IspdSRetConsultarLoteItem _RetConsultaItem;
            IspdSRetConsultarLoteOcorrencia _RetConsultaOcorrencia;
            IspdSRetConsultarLoteOcorrenciaEnvio _RetConsultaOcorrenciaEnvio;
            _RetConsulta = null;
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
              //PopulaTotalizadores(_RetConsultaItem);
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
