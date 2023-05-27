using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CompuBill.GUI
{
    public partial class Login : Form
    {
        SessionManager.Session oSesion = SessionManager.Session.Instancia;
        Boolean _Autorizado = false;
        public bool Autorizado { get => _Autorizado; }
        public Login()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (oSesion.IniciarSesion(txbUsuario.Text, txbClave.Text))
            {
                _Autorizado=true;
                Close();
            }
            else
            {
                _Autorizado = false;
                lblMensaje.Text = "Datos No Válidos";
                txbClave.Focus();
                txbClave.SelectAll();
            }
        }
        /*private void Login_Load(object sender, EventArgs e)
        {
            txbUsuario.Text = "";
            txbClave.Text = "";
        }*/
    }
}
