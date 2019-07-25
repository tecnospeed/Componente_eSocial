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
            this.cbGrupo = new System.Windows.Forms.ComboBox();
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
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.tabPage3.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // cbCertificado
            // 
            this.cbCertificado.FormattingEnabled = true;
            this.cbCertificado.Location = new System.Drawing.Point(11, 188);
            this.cbCertificado.Name = "cbCertificado";
            this.cbCertificado.Size = new System.Drawing.Size(479, 21);
            this.cbCertificado.TabIndex = 0;
            // 
            // btnCarregaTX2
            // 
            this.btnCarregaTX2.Location = new System.Drawing.Point(11, 290);
            this.btnCarregaTX2.Name = "btnCarregaTX2";
            this.btnCarregaTX2.Size = new System.Drawing.Size(114, 23);
            this.btnCarregaTX2.TabIndex = 1;
            this.btnCarregaTX2.Text = "Carrega TX2";
            this.btnCarregaTX2.UseVisualStyleBackColor = true;
            this.btnCarregaTX2.Click += new System.EventHandler(this.btnCarregaTX2_Click);
            // 
            // btnGerarXML
            // 
            this.btnGerarXML.Location = new System.Drawing.Point(131, 290);
            this.btnGerarXML.Name = "btnGerarXML";
            this.btnGerarXML.Size = new System.Drawing.Size(117, 23);
            this.btnGerarXML.TabIndex = 3;
            this.btnGerarXML.Text = "Gerar XML";
            this.btnGerarXML.UseVisualStyleBackColor = true;
            this.btnGerarXML.Click += new System.EventHandler(this.btnGerarXML_Click);
            // 
            // btnAssinarXML
            // 
            this.btnAssinarXML.Location = new System.Drawing.Point(255, 290);
            this.btnAssinarXML.Name = "btnAssinarXML";
            this.btnAssinarXML.Size = new System.Drawing.Size(108, 23);
            this.btnAssinarXML.TabIndex = 4;
            this.btnAssinarXML.Text = "Assinar XML";
            this.btnAssinarXML.UseVisualStyleBackColor = true;
            this.btnAssinarXML.Click += new System.EventHandler(this.btnAssinarXML_Click);
            // 
            // btnEnviar
            // 
            this.btnEnviar.Location = new System.Drawing.Point(369, 290);
            this.btnEnviar.Name = "btnEnviar";
            this.btnEnviar.Size = new System.Drawing.Size(119, 23);
            this.btnEnviar.TabIndex = 5;
            this.btnEnviar.Text = "Enviar";
            this.btnEnviar.UseVisualStyleBackColor = true;
            this.btnEnviar.Click += new System.EventHandler(this.btnEnviar_Click);
            // 
            // btnConsultar
            // 
            this.btnConsultar.Location = new System.Drawing.Point(11, 375);
            this.btnConsultar.Name = "btnConsultar";
            this.btnConsultar.Size = new System.Drawing.Size(236, 23);
            this.btnConsultar.TabIndex = 6;
            this.btnConsultar.Text = "Consultar";
            this.btnConsultar.UseVisualStyleBackColor = true;
            this.btnConsultar.Click += new System.EventHandler(this.btnConsultar_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(8, 401);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(104, 13);
            this.label1.TabIndex = 7;
            this.label1.Text = "Identificador do Lote";
            // 
            // txtIdentificadorLote
            // 
            this.txtIdentificadorLote.Location = new System.Drawing.Point(11, 417);
            this.txtIdentificadorLote.Name = "txtIdentificadorLote";
            this.txtIdentificadorLote.Size = new System.Drawing.Size(380, 20);
            this.txtIdentificadorLote.TabIndex = 8;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(394, 401);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(36, 13);
            this.label2.TabIndex = 9;
            this.label2.Text = "Grupo";
            // 
            // cbGrupo
            // 
            this.cbGrupo.FormattingEnabled = true;
            this.cbGrupo.Items.AddRange(new object[] {
            "1",
            "2",
            "3"});
            this.cbGrupo.Location = new System.Drawing.Point(397, 417);
            this.cbGrupo.Name = "cbGrupo";
            this.cbGrupo.Size = new System.Drawing.Size(92, 21);
            this.cbGrupo.TabIndex = 10;
            this.cbGrupo.Text = "1";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(12, 13);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(141, 13);
            this.label3.TabIndex = 11;
            this.label3.Text = "CPF/CNPJ Software House:";
            // 
            // txtCpfCnpjSH
            // 
            this.txtCpfCnpjSH.Location = new System.Drawing.Point(13, 30);
            this.txtCpfCnpjSH.Name = "txtCpfCnpjSH";
            this.txtCpfCnpjSH.Size = new System.Drawing.Size(155, 20);
            this.txtCpfCnpjSH.TabIndex = 12;
            // 
            // txtTokenSH
            // 
            this.txtTokenSH.Location = new System.Drawing.Point(180, 30);
            this.txtTokenSH.Name = "txtTokenSH";
            this.txtTokenSH.Size = new System.Drawing.Size(169, 20);
            this.txtTokenSH.TabIndex = 13;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(177, 14);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(120, 13);
            this.label4.TabIndex = 14;
            this.label4.Text = "Token Software House:";
            // 
            // btnConfigurarSH
            // 
            this.btnConfigurarSH.Location = new System.Drawing.Point(11, 261);
            this.btnConfigurarSH.Name = "btnConfigurarSH";
            this.btnConfigurarSH.Size = new System.Drawing.Size(479, 23);
            this.btnConfigurarSH.TabIndex = 15;
            this.btnConfigurarSH.Text = "Configurar";
            this.btnConfigurarSH.UseVisualStyleBackColor = true;
            this.btnConfigurarSH.Click += new System.EventHandler(this.btnConfigurarSH_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(11, 172);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(60, 13);
            this.label5.TabIndex = 16;
            this.label5.Text = "Certificado:";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(176, 55);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(121, 13);
            this.label6.TabIndex = 20;
            this.label6.Text = "CPF/CNPJ Transmissor:";
            // 
            // txtTransmissor
            // 
            this.txtTransmissor.Location = new System.Drawing.Point(179, 71);
            this.txtTransmissor.Name = "txtTransmissor";
            this.txtTransmissor.Size = new System.Drawing.Size(169, 20);
            this.txtTransmissor.TabIndex = 19;
            // 
            // txtEmpregador
            // 
            this.txtEmpregador.Location = new System.Drawing.Point(12, 71);
            this.txtEmpregador.Name = "txtEmpregador";
            this.txtEmpregador.Size = new System.Drawing.Size(155, 20);
            this.txtEmpregador.TabIndex = 18;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(11, 54);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(122, 13);
            this.label7.TabIndex = 17;
            this.label7.Text = "CPF/CNPJ Empregador:";
            // 
            // cbAmbiente
            // 
            this.cbAmbiente.FormattingEnabled = true;
            this.cbAmbiente.Items.AddRange(new object[] {
            "1 - Produção",
            "2 - Homologação"});
            this.cbAmbiente.Location = new System.Drawing.Point(362, 30);
            this.cbAmbiente.Name = "cbAmbiente";
            this.cbAmbiente.Size = new System.Drawing.Size(129, 21);
            this.cbAmbiente.TabIndex = 21;
            // 
            // cbVersaoManual
            // 
            this.cbVersaoManual.FormattingEnabled = true;
            this.cbVersaoManual.Location = new System.Drawing.Point(361, 71);
            this.cbVersaoManual.Name = "cbVersaoManual";
            this.cbVersaoManual.Size = new System.Drawing.Size(129, 21);
            this.cbVersaoManual.TabIndex = 22;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(362, 14);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(54, 13);
            this.label8.TabIndex = 23;
            this.label8.Text = "Ambiente:";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(361, 55);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(81, 13);
            this.label9.TabIndex = 24;
            this.label9.Text = "Versão Manual:";
            // 
            // txtEsquemas
            // 
            this.txtEsquemas.Location = new System.Drawing.Point(11, 111);
            this.txtEsquemas.Name = "txtEsquemas";
            this.txtEsquemas.Size = new System.Drawing.Size(478, 20);
            this.txtEsquemas.TabIndex = 26;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(10, 94);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(101, 13);
            this.label10.TabIndex = 25;
            this.label10.Text = "Diretório Esquemas:";
            // 
            // txtTemplates
            // 
            this.txtTemplates.Location = new System.Drawing.Point(11, 149);
            this.txtTemplates.Name = "txtTemplates";
            this.txtTemplates.Size = new System.Drawing.Size(478, 20);
            this.txtTemplates.TabIndex = 28;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(10, 132);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(101, 13);
            this.label11.TabIndex = 27;
            this.label11.Text = "Diretório Templates:";
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Controls.Add(this.tabPage3);
            this.tabControl1.Location = new System.Drawing.Point(495, 12);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(516, 432);
            this.tabControl1.TabIndex = 29;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.tbRetorno);
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(508, 406);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Retorno";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // tbRetorno
            // 
            this.tbRetorno.Location = new System.Drawing.Point(6, 6);
            this.tbRetorno.Multiline = true;
            this.tbRetorno.Name = "tbRetorno";
            this.tbRetorno.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.tbRetorno.Size = new System.Drawing.Size(496, 394);
            this.tbRetorno.TabIndex = 3;
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.tbXmlEnvio);
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(508, 355);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Xml de Envio";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // tbXmlEnvio
            // 
            this.tbXmlEnvio.Location = new System.Drawing.Point(6, 6);
            this.tbXmlEnvio.Multiline = true;
            this.tbXmlEnvio.Name = "tbXmlEnvio";
            this.tbXmlEnvio.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.tbXmlEnvio.Size = new System.Drawing.Size(496, 343);
            this.tbXmlEnvio.TabIndex = 4;
            // 
            // tabPage3
            // 
            this.tabPage3.Controls.Add(this.tbXmlRetorno);
            this.tabPage3.Location = new System.Drawing.Point(4, 22);
            this.tabPage3.Name = "tabPage3";
            this.tabPage3.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage3.Size = new System.Drawing.Size(508, 355);
            this.tabPage3.TabIndex = 2;
            this.tabPage3.Text = "Xml de Retorno";
            this.tabPage3.UseVisualStyleBackColor = true;
            // 
            // tbXmlRetorno
            // 
            this.tbXmlRetorno.Location = new System.Drawing.Point(6, 6);
            this.tbXmlRetorno.Multiline = true;
            this.tbXmlRetorno.Name = "tbXmlRetorno";
            this.tbXmlRetorno.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.tbXmlRetorno.Size = new System.Drawing.Size(496, 343);
            this.tbXmlRetorno.TabIndex = 4;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.rbNrRecibo);
            this.groupBox1.Controls.Add(this.rbIdEvento);
            this.groupBox1.Controls.Add(this.rbIdLote);
            this.groupBox1.Location = new System.Drawing.Point(12, 321);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(476, 48);
            this.groupBox1.TabIndex = 30;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Tipo de Envio:";
            // 
            // rbNrRecibo
            // 
            this.rbNrRecibo.AutoSize = true;
            this.rbNrRecibo.Location = new System.Drawing.Point(386, 19);
            this.rbNrRecibo.Name = "rbNrRecibo";
            this.rbNrRecibo.Size = new System.Drawing.Size(76, 17);
            this.rbNrRecibo.TabIndex = 2;
            this.rbNrRecibo.TabStop = true;
            this.rbNrRecibo.Text = "Nr. Recibo";
            this.rbNrRecibo.UseVisualStyleBackColor = true;
            // 
            // rbIdEvento
            // 
            this.rbIdEvento.AutoSize = true;
            this.rbIdEvento.Location = new System.Drawing.Point(187, 19);
            this.rbIdEvento.Name = "rbIdEvento";
            this.rbIdEvento.Size = new System.Drawing.Size(86, 17);
            this.rbIdEvento.TabIndex = 1;
            this.rbIdEvento.TabStop = true;
            this.rbIdEvento.Text = "Id do Evento";
            this.rbIdEvento.UseVisualStyleBackColor = true;
            // 
            // rbIdLote
            // 
            this.rbIdLote.AutoSize = true;
            this.rbIdLote.Location = new System.Drawing.Point(16, 19);
            this.rbIdLote.Name = "rbIdLote";
            this.rbIdLote.Size = new System.Drawing.Size(73, 17);
            this.rbIdLote.TabIndex = 0;
            this.rbIdLote.TabStop = true;
            this.rbIdLote.Text = "Id de Lote";
            this.rbIdLote.UseVisualStyleBackColor = true;
            // 
            // btnReconsultar
            // 
            this.btnReconsultar.Location = new System.Drawing.Point(255, 375);
            this.btnReconsultar.Name = "btnReconsultar";
            this.btnReconsultar.Size = new System.Drawing.Size(233, 23);
            this.btnReconsultar.TabIndex = 31;
            this.btnReconsultar.Text = "Forçar consulta no eSocial";
            this.btnReconsultar.UseVisualStyleBackColor = true;
            this.btnReconsultar.Click += new System.EventHandler(this.BtnReconsultar_Click);
            // 
            // txtPincode
            // 
            this.txtPincode.Location = new System.Drawing.Point(11, 228);
            this.txtPincode.Name = "txtPincode";
            this.txtPincode.PasswordChar = '*';
            this.txtPincode.Size = new System.Drawing.Size(477, 20);
            this.txtPincode.TabIndex = 32;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(8, 212);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(152, 13);
            this.label12.TabIndex = 33;
            this.label12.Text = "Pin Code (Para certificado A3):";
            // 
            // frmESocial
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1018, 451);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.txtPincode);
            this.Controls.Add(this.btnReconsultar);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.tabControl1);
            this.Controls.Add(this.txtTemplates);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.txtEsquemas);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.cbVersaoManual);
            this.Controls.Add(this.cbAmbiente);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.txtTransmissor);
            this.Controls.Add(this.txtEmpregador);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.btnConfigurarSH);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.txtTokenSH);
            this.Controls.Add(this.txtCpfCnpjSH);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.cbGrupo);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtIdentificadorLote);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnConsultar);
            this.Controls.Add(this.btnEnviar);
            this.Controls.Add(this.btnAssinarXML);
            this.Controls.Add(this.btnGerarXML);
            this.Controls.Add(this.btnCarregaTX2);
            this.Controls.Add(this.cbCertificado);
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
            this.ResumeLayout(false);
            this.PerformLayout();

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
        private System.Windows.Forms.ComboBox cbGrupo;
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
    }
}

