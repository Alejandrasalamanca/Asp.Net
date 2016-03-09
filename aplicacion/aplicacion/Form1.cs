using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace aplicacion
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            ServiceReference1.ServiceSoapClient m = new ServiceReference1.ServiceSoapClient();
            int valor1 = Convert.ToInt32(textBox1.Text);
            int valor2 = Convert.ToInt32(textBox2.Text);


            int resultado = m.Calcular(valor1, valor2);
            label1.Text = "El resultado es: " + resultado; 
        }
    }
}
