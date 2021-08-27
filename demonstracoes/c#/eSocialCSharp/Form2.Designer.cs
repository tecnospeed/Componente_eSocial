
namespace eSocialCSharp
{
    partial class Form2
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
            this.btnESocial = new System.Windows.Forms.Button();
            this.btnESocialS = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnESocial
            // 
            this.btnESocial.Location = new System.Drawing.Point(27, 22);
            this.btnESocial.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btnESocial.Name = "btnESocial";
            this.btnESocial.Size = new System.Drawing.Size(165, 37);
            this.btnESocial.TabIndex = 0;
            this.btnESocial.Text = "eSocial 2.5";
            this.btnESocial.UseVisualStyleBackColor = true;
            this.btnESocial.Click += new System.EventHandler(this.btnESocial_Click);
            // 
            // btnESocialS
            // 
            this.btnESocialS.Location = new System.Drawing.Point(27, 83);
            this.btnESocialS.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btnESocialS.Name = "btnESocialS";
            this.btnESocialS.Size = new System.Drawing.Size(165, 37);
            this.btnESocialS.TabIndex = 1;
            this.btnESocialS.Text = "eSocial Simplificado 1.0";
            this.btnESocialS.UseVisualStyleBackColor = true;
            this.btnESocialS.Click += new System.EventHandler(this.btnESocialS_Click);
            // 
            // Form2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(219, 154);
            this.Controls.Add(this.btnESocialS);
            this.Controls.Add(this.btnESocial);
            this.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.Name = "Form2";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Menu";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnESocial;
        private System.Windows.Forms.Button btnESocialS;
    }
}