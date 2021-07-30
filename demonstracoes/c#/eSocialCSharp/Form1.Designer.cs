namespace eSocialCSharp
{
    partial class frmESocial
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.cbCertificado = new System.Windows.Forms.ComboBox();
            this.btnCarregaTX2 = new System.Windows.Forms.Button();
            this.btnGerarXML = new System.Windows.Forms.Button();
            this.btnAssinarXML = new System.Windows.Forms.Button();
            this.btnEnviar = new System.Windows.Forms.Button();
            this.btnConsultar = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.txtIdentificadorLote = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.txtCpfCnpjSH = new System.Windows.Forms.TextBox();
            this.txtTokenSH = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.btnConfigurarSH = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.txtTransmissor = new System.Windows.Forms.TextBox();
            this.txtEmpregador = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.cbAmbiente = new System.Windows.Forms.ComboBox();
            this.cbVersaoManual = new System.Windows.Forms.ComboBox();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.txtEsquemas = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.txtTemplates = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.tbRetorno = new System.Windows.Forms.TextBox();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.tbXmlEnvio = new System.Windows.Forms.TextBox();
            this.tabPage3 = new System.Windows.Forms.TabPage();
            this.tbXmlRetorno = new System.Windows.Forms.TextBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.rbNrRecibo = new System.Windows.Forms.RadioButton();
            this.rbIdEvento = new System.Windows.Forms.RadioButton();
            this.rbIdLote = new System.Windows.Forms.RadioButton();
            this.btnReconsultar = new System.Windows.Forms.Button();
            this.txtPincode = new System.Windows.Forms.TextBox();
            this.label12 = new System.Windows.Forms.Label();
            this.tabControl2 = new System.Windows.Forms.TabControl();
            this.tabPage4 = new System.Windows.Forms.TabPage();
            this.cbGrupo = new System.Windows.Forms.ComboBox();
            this.label16 = new System.Windows.Forms.Label();
            this.checkBox1 = new System.Windows.Forms.CheckBox();
            this.tabPage5 = new System.Windows.Forms.TabPage();
            this.txtIdLote = new System.Windows.Forms.TextBox();
            this.label13 = new System.Windows.Forms.Label();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.tabPage3.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.tabControl2.SuspendLayout();
            this.tabPage4.SuspendLayout();
            this.tabPage5.SuspendLayout();
            this.SuspendLayout();
            // 
            // cbCertificado
            // 
            this.cbCertificado.FormattingEnabled = true;
            this.cbCertificado.Location = new System.Drawing.Point(6, 125);
            this.cbCertificado.Margin = new System.Windows.Forms.Padding(4);
            this.cbCertificado.Name = "cbCertificado";
            this.cbCertificado.Size = new System.Drawing.Size(437, 24);
            this.cbCertificado.TabIndex = 0;
            // 
            // btnCarregaTX2
            // 
            this.btnCarregaTX2.Location = new System.Drawing.Point(9, 18);
            this.btnCarregaTX2.Margin = new System.Windows.Forms.Padding(4);
            this.btnCarregaTX2.Name = "btnCarregaTX2";
            this.btnCarregaTX2.Size = new System.Drawing.Size(144, 28);
            this.btnCarregaTX2.TabIndex = 1;
            this.btnCarregaTX2.Text = "Carregar TX2";
            this.btnCarregaTX2.UseVisualStyleBackColor = true;
            this.btnCarregaTX2.Click += new System.EventHandler(this.btnCarregaTX2_Click);
            // 
            // btnGerarXML
            // 
            this.btnGerarXML.Location = new System.Drawing.Point(161, 18);
            this.btnGerarXML.Margin = new System.Windows.Forms.Padding(4);
            this.btnGerarXML.Name = "btnGerarXML";
            this.btnGerarXML.Size = new System.Drawing.Size(148, 28);
            this.btnGerarXML.TabIndex = 3;
            this.btnGerarXML.Text = "Gerar XML";
            this.btnGerarXML.UseVisualStyleBackColor = true;
            this.btnGerarXML.Click += new System.EventHandler(this.btnGerarXML_Click);
            // 
            // btnAssinarXML
            // 
            this.btnAssinarXML.Location = new System.Drawing.Point(329, 18);
            this.btnAssinarXML.Margin = new System.Windows.Forms.Padding(4);
            this.btnAssinarXML.Name = "btnAssinarXML";
            this.btnAssinarXML.Size = new System.Drawing.Size(136, 28);
            this.btnAssinarXML.TabIndex = 4;
            this.btnAssinarXML.Text = "Assinar XML";
            this.btnAssinarXML.UseVisualStyleBackColor = true;
            this.btnAssinarXML.Click += new System.EventHandler(this.btnAssinarXML_Click);
            // 
            // btnEnviar
            // 
            this.btnEnviar.Location = new System.Drawing.Point(476, 18);
            this.btnEnviar.Margin = new System.Windows.Forms.Padding(4);
            this.btnEnviar.Name = "btnEnviar";
            this.btnEnviar.Size = new System.Drawing.Size(151, 28);
            this.btnEnviar.TabIndex = 5;
            this.btnEnviar.Text = "Enviar";
            this.btnEnviar.UseVisualStyleBackColor = true;
            this.btnEnviar.Click += new System.EventHandler(this.btnEnviar_Click);
            // 
            // btnConsultar
            // 
            this.btnConsultar.Location = new System.Drawing.Point(6, 121);
            this.btnConsultar.Margin = new System.Windows.Forms.Padding(4);
            this.btnConsultar.Name = "btnConsultar";
            this.btnConsultar.Size = new System.Drawing.Size(307, 28);
            this.btnConsultar.TabIndex = 6;
            this.btnConsultar.Text = "Consultar";
            this.btnConsultar.UseVisualStyleBackColor = true;
            this.btnConsultar.Click += new System.EventHandler(this.btnConsultar_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(6, 493);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(137, 17);
            this.label1.TabIndex = 7;
            this.label1.Text = "Identificador do Lote";
            // 
            // txtIdentificadorLote
            // 
            this.txtIdentificadorLote.Location = new System.Drawing.Point(6, 512);
            this.txtIdentificadorLote.Margin = new System.Windows.Forms.Padding(4);
            this.txtIdentificadorLote.Name = "txtIdentificadorLote";
            this.txtIdentificadorLote.Size = new System.Drawing.Size(505, 22);
            this.txtIdentificadorLote.TabIndex = 8;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(516, 493);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(48, 17);
            this.label2.TabIndex = 9;
            this.label2.Text = "Grupo";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(4, 7);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(181, 17);
            this.label3.TabIndex = 11;
            this.label3.Text = "CPF/CNPJ Software House:";
            // 
            // txtCpfCnpjSH
            // 
            this.txtCpfCnpjSH.Location = new System.Drawing.Point(6, 28);
            this.txtCpfCnpjSH.Margin = new System.Windows.Forms.Padding(4);
            this.txtCpfCnpjSH.Name = "txtCpfCnpjSH";
            this.txtCpfCnpjSH.Size = new System.Drawing.Size(205, 22);
            this.txtCpfCnpjSH.TabIndex = 12;
            this.txtCpfCnpjSH.Text = "00000000000000";
            // 
            // txtTokenSH
            // 
            this.txtTokenSH.Location = new System.Drawing.Point(219, 28);
            this.txtTokenSH.Margin = new System.Windows.Forms.Padding(4);
            this.txtTokenSH.Name = "txtTokenSH";
            this.txtTokenSH.Size = new System.Drawing.Size(224, 22);
            this.txtTokenSH.TabIndex = 13;
            this.txtTokenSH.Text = "0000000000000";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(216, 8);
            this.label4.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(156, 17);
            this.label4.TabIndex = 14;
            this.label4.Text = "Token Software House:";
            // 
            // btnConfigurarSH
            // 
            this.btnConfigurarSH.Location = new System.Drawing.Point(345, 303);
            this.btnConfigurarSH.Margin = new System.Windows.Forms.Padding(4);
            this.btnConfigurarSH.Name = "btnConfigurarSH";
            this.btnConfigurarSH.Size = new System.Drawing.Size(283, 28);
            this.btnConfigurarSH.TabIndex = 15;
            this.btnConfigurarSH.Text = "Configurar";
            this.btnConfigurarSH.UseVisualStyleBackColor = true;
            this.btnConfigurarSH.Click += new System.EventHandler(this.btnConfigurarSH_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(4, 104);
            this.label5.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(79, 17);
            this.label5.TabIndex = 16;
            this.label5.Text = "Certificado:";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(216, 59);
            this.label6.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(159, 17);
            this.label6.TabIndex = 20;
            this.label6.Text = "CPF/CNPJ Transmissor:";
            // 
            // txtTransmissor
            // 
            this.txtTransmissor.Location = new System.Drawing.Point(219, 78);
            this.txtTransmissor.Margin = new System.Windows.Forms.Padding(4);
            this.txtTransmissor.Name = "txtTransmissor";
            this.txtTransmissor.Size = new System.Drawing.Size(224, 22);
            this.txtTransmissor.TabIndex = 19;
            // 
            // txtEmpregador
            // 
            this.txtEmpregador.Location = new System.Drawing.Point(6, 78);
            this.txtEmpregador.Margin = new System.Windows.Forms.Padding(4);
            this.txtEmpregador.Name = "txtEmpregador";
            this.txtEmpregador.Size = new System.Drawing.Size(205, 22);
            this.txtEmpregador.TabIndex = 18;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(4, 57);
            this.label7.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(159, 17);
            this.label7.TabIndex = 17;
            this.label7.Text = "CPF/CNPJ Empregador:";
            // 
            // cbAmbiente
            // 
            this.cbAmbiente.FormattingEnabled = true;
            this.cbAmbiente.Items.AddRange(new object[] {
            "1 - Produção",
            "2 - Homologação"});
            this.cbAmbiente.Location = new System.Drawing.Point(451, 28);
            this.cbAmbiente.Margin = new System.Windows.Forms.Padding(4);
            this.cbAmbiente.Name = "cbAmbiente";
            this.cbAmbiente.Size = new System.Drawing.Size(171, 24);
            this.cbAmbiente.TabIndex = 21;
            // 
            // cbVersaoManual
            // 
            this.cbVersaoManual.FormattingEnabled = true;
            this.cbVersaoManual.Location = new System.Drawing.Point(451, 76);
            this.cbVersaoManual.Margin = new System.Windows.Forms.Padding(4);
            this.cbVersaoManual.Name = "cbVersaoManual";
            this.cbVersaoManual.Size = new System.Drawing.Size(171, 24);
            this.cbVersaoManual.TabIndex = 22;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(451, 8);
            this.label8.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(71, 17);
            this.label8.TabIndex = 23;
            this.label8.Text = "Ambiente:";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(448, 59);
            this.label9.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(107, 17);
            this.label9.TabIndex = 24;
            this.label9.Text = "Versão Manual:";
            // 
            // txtEsquemas
            // 
            this.txtEsquemas.Location = new System.Drawing.Point(7, 176);
            this.txtEsquemas.Margin = new System.Windows.Forms.Padding(4);
            this.txtEsquemas.Name = "txtEsquemas";
            this.txtEsquemas.Size = new System.Drawing.Size(618, 22);
            this.txtEsquemas.TabIndex = 26;
            this.txtEsquemas.Text = "C:\\Program Files\\TecnoSpeed\\eSocial\\Arquivos\\Esquemas";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(5, 155);
            this.label10.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(136, 17);
            this.label10.TabIndex = 25;
            this.label10.Text = "Diretório Esquemas:";
            // 
            // txtTemplates
            // 
            this.txtTemplates.Location = new System.Drawing.Point(7, 222);
            this.txtTemplates.Margin = new System.Windows.Forms.Padding(4);
            this.txtTemplates.Name = "txtTemplates";
            this.txtTemplates.Size = new System.Drawing.Size(618, 22);
            this.txtTemplates.TabIndex = 28;
            this.txtTemplates.Text = "C:\\Program Files\\TecnoSpeed\\eSocial\\Arquivos\\Templates";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(5, 201);
            this.label11.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(136, 17);
            this.label11.TabIndex = 27;
            this.label11.Text = "Diretório Templates:";
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Controls.Add(this.tabPage3);
            this.tabControl1.Location = new System.Drawing.Point(6, 378);
            this.tabControl1.Margin = new System.Windows.Forms.Padding(4);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(644, 434);
            this.tabControl1.TabIndex = 29;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.tbRetorno);
            this.tabPage1.Location = new System.Drawing.Point(4, 25);
            this.tabPage1.Margin = new System.Windows.Forms.Padding(4);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(4);
            this.tabPage1.Size = new System.Drawing.Size(636, 405);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Retorno";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // tbRetorno
            // 
            this.tbRetorno.Location = new System.Drawing.Point(3, 4);
            this.tbRetorno.Margin = new System.Windows.Forms.Padding(4);
            this.tbRetorno.Multiline = true;
            this.tbRetorno.Name = "tbRetorno";
            this.tbRetorno.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.tbRetorno.Size = new System.Drawing.Size(629, 402);
            this.tbRetorno.TabIndex = 3;
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.tbXmlEnvio);
            this.tabPage2.Location = new System.Drawing.Point(4, 25);
            this.tabPage2.Margin = new System.Windows.Forms.Padding(4);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(4);
            this.tabPage2.Size = new System.Drawing.Size(636, 405);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Xml de Envio";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // tbXmlEnvio
            // 
            this.tbXmlEnvio.Location = new System.Drawing.Point(8, 7);
            this.tbXmlEnvio.Margin = new System.Windows.Forms.Padding(4);
            this.tbXmlEnvio.Multiline = true;
            this.tbXmlEnvio.Name = "tbXmlEnvio";
            this.tbXmlEnvio.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.tbXmlEnvio.Size = new System.Drawing.Size(660, 421);
            this.tbXmlEnvio.TabIndex = 4;
            // 
            // tabPage3
            // 
            this.tabPage3.Controls.Add(this.tbXmlRetorno);
            this.tabPage3.Location = new System.Drawing.Point(4, 25);
            this.tabPage3.Margin = new System.Windows.Forms.Padding(4);
            this.tabPage3.Name = "tabPage3";
            this.tabPage3.Padding = new System.Windows.Forms.Padding(4);
            this.tabPage3.Size = new System.Drawing.Size(636, 405);
            this.tabPage3.TabIndex = 2;
            this.tabPage3.Text = "Xml de Retorno";
            this.tabPage3.UseVisualStyleBackColor = true;
            // 
            // tbXmlRetorno
            // 
            this.tbXmlRetorno.Location = new System.Drawing.Point(8, 7);
            this.tbXmlRetorno.Margin = new System.Windows.Forms.Padding(4);
            this.tbXmlRetorno.Multiline = true;
            this.tbXmlRetorno.Name = "tbXmlRetorno";
            this.tbXmlRetorno.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.tbXmlRetorno.Size = new System.Drawing.Size(660, 421);
            this.tbXmlRetorno.TabIndex = 4;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.rbNrRecibo);
            this.groupBox1.Controls.Add(this.rbIdEvento);
            this.groupBox1.Controls.Add(this.rbIdLote);
            this.groupBox1.Location = new System.Drawing.Point(7, 54);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(4);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Padding = new System.Windows.Forms.Padding(4);
            this.groupBox1.Size = new System.Drawing.Size(622, 59);
            this.groupBox1.TabIndex = 30;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Tipo de Envio:";
            // 
            // rbNrRecibo
            // 
            this.rbNrRecibo.AutoSize = true;
            this.rbNrRecibo.Location = new System.Drawing.Point(491, 23);
            this.rbNrRecibo.Margin = new System.Windows.Forms.Padding(4);
            this.rbNrRecibo.Name = "rbNrRecibo";
            this.rbNrRecibo.Size = new System.Drawing.Size(96, 21);
            this.rbNrRecibo.TabIndex = 2;
            this.rbNrRecibo.TabStop = true;
            this.rbNrRecibo.Text = "Nr. Recibo";
            this.rbNrRecibo.UseVisualStyleBackColor = true;
            this.rbNrRecibo.CheckedChanged += new System.EventHandler(this.rbNrRecibo_CheckedChanged);
            // 
            // rbIdEvento
            // 
            this.rbIdEvento.AutoSize = true;
            this.rbIdEvento.Location = new System.Drawing.Point(249, 23);
            this.rbIdEvento.Margin = new System.Windows.Forms.Padding(4);
            this.rbIdEvento.Name = "rbIdEvento";
            this.rbIdEvento.Size = new System.Drawing.Size(108, 21);
            this.rbIdEvento.TabIndex = 1;
            this.rbIdEvento.TabStop = true;
            this.rbIdEvento.Text = "Id do Evento";
            this.rbIdEvento.UseVisualStyleBackColor = true;
            // 
            // rbIdLote
            // 
            this.rbIdLote.AutoSize = true;
            this.rbIdLote.Location = new System.Drawing.Point(21, 23);
            this.rbIdLote.Margin = new System.Windows.Forms.Padding(4);
            this.rbIdLote.Name = "rbIdLote";
            this.rbIdLote.Size = new System.Drawing.Size(92, 21);
            this.rbIdLote.TabIndex = 0;
            this.rbIdLote.TabStop = true;
            this.rbIdLote.Text = "Id de Lote";
            this.rbIdLote.UseVisualStyleBackColor = true;
            // 
            // btnReconsultar
            // 
            this.btnReconsultar.Location = new System.Drawing.Point(321, 121);
            this.btnReconsultar.Margin = new System.Windows.Forms.Padding(4);
            this.btnReconsultar.Name = "btnReconsultar";
            this.btnReconsultar.Size = new System.Drawing.Size(303, 28);
            this.btnReconsultar.TabIndex = 31;
            this.btnReconsultar.Text = "Forçar consulta no eSocial";
            this.btnReconsultar.UseVisualStyleBackColor = true;
            this.btnReconsultar.Click += new System.EventHandler(this.btnReconsultar_Click);
            // 
            // txtPincode
            // 
            this.txtPincode.Location = new System.Drawing.Point(7, 273);
            this.txtPincode.Margin = new System.Windows.Forms.Padding(4);
            this.txtPincode.Name = "txtPincode";
            this.txtPincode.PasswordChar = '*';
            this.txtPincode.Size = new System.Drawing.Size(621, 22);
            this.txtPincode.TabIndex = 32;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(4, 252);
            this.label12.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(203, 17);
            this.label12.TabIndex = 33;
            this.label12.Text = "Pin Code (Para certificado A3):";
            // 
            // tabControl2
            // 
            this.tabControl2.Controls.Add(this.tabPage4);
            this.tabControl2.Controls.Add(this.tabPage5);
            this.tabControl2.Location = new System.Drawing.Point(6, 3);
            this.tabControl2.Name = "tabControl2";
            this.tabControl2.SelectedIndex = 0;
            this.tabControl2.Size = new System.Drawing.Size(644, 368);
            this.tabControl2.TabIndex = 34;
            // 
            // tabPage4
            // 
            this.tabPage4.Controls.Add(this.cbGrupo);
            this.tabPage4.Controls.Add(this.label16);
            this.tabPage4.Controls.Add(this.checkBox1);
            this.tabPage4.Controls.Add(this.label3);
            this.tabPage4.Controls.Add(this.cbAmbiente);
            this.tabPage4.Controls.Add(this.txtEsquemas);
            this.tabPage4.Controls.Add(this.label10);
            this.tabPage4.Controls.Add(this.label12);
            this.tabPage4.Controls.Add(this.txtTemplates);
            this.tabPage4.Controls.Add(this.label9);
            this.tabPage4.Controls.Add(this.label11);
            this.tabPage4.Controls.Add(this.cbCertificado);
            this.tabPage4.Controls.Add(this.label5);
            this.tabPage4.Controls.Add(this.label8);
            this.tabPage4.Controls.Add(this.txtPincode);
            this.tabPage4.Controls.Add(this.txtCpfCnpjSH);
            this.tabPage4.Controls.Add(this.label7);
            this.tabPage4.Controls.Add(this.cbVersaoManual);
            this.tabPage4.Controls.Add(this.txtEmpregador);
            this.tabPage4.Controls.Add(this.txtTokenSH);
            this.tabPage4.Controls.Add(this.label4);
            this.tabPage4.Controls.Add(this.txtTransmissor);
            this.tabPage4.Controls.Add(this.label6);
            this.tabPage4.Controls.Add(this.btnConfigurarSH);
            this.tabPage4.Location = new System.Drawing.Point(4, 25);
            this.tabPage4.Name = "tabPage4";
            this.tabPage4.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage4.Size = new System.Drawing.Size(636, 339);
            this.tabPage4.TabIndex = 0;
            this.tabPage4.Text = "1 - Dados";
            this.tabPage4.UseVisualStyleBackColor = true;
            // 
            // cbGrupo
            // 
            this.cbGrupo.FormattingEnabled = true;
            this.cbGrupo.Items.AddRange(new object[] {
            "1",
            "2",
            "3"});
            this.cbGrupo.Location = new System.Drawing.Point(451, 125);
            this.cbGrupo.Margin = new System.Windows.Forms.Padding(4);
            this.cbGrupo.Name = "cbGrupo";
            this.cbGrupo.Size = new System.Drawing.Size(171, 24);
            this.cbGrupo.TabIndex = 38;
            this.cbGrupo.Text = "1";
            this.cbGrupo.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.Location = new System.Drawing.Point(449, 104);
            this.label16.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(52, 17);
            this.label16.TabIndex = 37;
            this.label16.Text = "Grupo:";
            // 
            // checkBox1
            // 
            this.checkBox1.AutoSize = true;
            this.checkBox1.Location = new System.Drawing.Point(8, 308);
            this.checkBox1.Name = "checkBox1";
            this.checkBox1.Size = new System.Drawing.Size(141, 21);
            this.checkBox1.TabIndex = 36;
            this.checkBox1.Text = "Enviar Telemetria";
            this.checkBox1.UseVisualStyleBackColor = true;
            // 
            // tabPage5
            // 
            this.tabPage5.Controls.Add(this.txtIdLote);
            this.tabPage5.Controls.Add(this.label13);
            this.tabPage5.Controls.Add(this.label1);
            this.tabPage5.Controls.Add(this.txtIdentificadorLote);
            this.tabPage5.Controls.Add(this.btnEnviar);
            this.tabPage5.Controls.Add(this.label2);
            this.tabPage5.Controls.Add(this.btnAssinarXML);
            this.tabPage5.Controls.Add(this.groupBox1);
            this.tabPage5.Controls.Add(this.btnReconsultar);
            this.tabPage5.Controls.Add(this.btnGerarXML);
            this.tabPage5.Controls.Add(this.btnCarregaTX2);
            this.tabPage5.Controls.Add(this.btnConsultar);
            this.tabPage5.Location = new System.Drawing.Point(4, 25);
            this.tabPage5.Name = "tabPage5";
            this.tabPage5.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage5.Size = new System.Drawing.Size(636, 339);
            this.tabPage5.TabIndex = 1;
            this.tabPage5.Text = "2 - Envio";
            this.tabPage5.UseVisualStyleBackColor = true;
            // 
            // txtIdLote
            // 
            this.txtIdLote.Location = new System.Drawing.Point(9, 191);
            this.txtIdLote.Name = "txtIdLote";
            this.txtIdLote.Size = new System.Drawing.Size(620, 22);
            this.txtIdLote.TabIndex = 33;
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Location = new System.Drawing.Point(6, 168);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(141, 17);
            this.label13.TabIndex = 32;
            this.label13.Text = "Identificador de Lote:";
            this.label13.Click += new System.EventHandler(this.label13_Click);
            // 
            // frmESocial
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(656, 819);
            this.Controls.Add(this.tabControl2);
            this.Controls.Add(this.tabControl1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "frmESocial";
            this.Text = "Demo eSocial";
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
            this.tabPage3.ResumeLayout(false);
            this.tabPage3.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.tabControl2.ResumeLayout(false);
            this.tabPage4.ResumeLayout(false);
            this.tabPage4.PerformLayout();
            this.tabPage5.ResumeLayout(false);
            this.tabPage5.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ComboBox cbCertificado;
        private System.Windows.Forms.Button btnCarregaTX2;
        private System.Windows.Forms.Button btnGerarXML;
        private System.Windows.Forms.Button btnAssinarXML;
        private System.Windows.Forms.Button btnEnviar;
        private System.Windows.Forms.Button btnConsultar;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtIdentificadorLote;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtCpfCnpjSH;
        private System.Windows.Forms.TextBox txtTokenSH;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button btnConfigurarSH;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox txtTransmissor;
        private System.Windows.Forms.TextBox txtEmpregador;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.ComboBox cbAmbiente;
        private System.Windows.Forms.ComboBox cbVersaoManual;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox txtEsquemas;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TextBox txtTemplates;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.TextBox tbRetorno;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.TextBox tbXmlEnvio;
        private System.Windows.Forms.TabPage tabPage3;
        private System.Windows.Forms.TextBox tbXmlRetorno;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.RadioButton rbNrRecibo;
        private System.Windows.Forms.RadioButton rbIdEvento;
        private System.Windows.Forms.RadioButton rbIdLote;
        private System.Windows.Forms.Button btnReconsultar;
        private System.Windows.Forms.TextBox txtPincode;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.TabControl tabControl2;
        private System.Windows.Forms.TabPage tabPage4;
        private System.Windows.Forms.TabPage tabPage5;
        private System.Windows.Forms.CheckBox checkBox1;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.TextBox txtIdLote;
        private System.Windows.Forms.ComboBox cbGrupo;
        private System.Windows.Forms.Label label16;
    }
}

