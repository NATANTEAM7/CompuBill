using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataManager
{
    public class DBConexion
    {
        //CADENA DE CONEXINO HACIA LA BASE DE DATOS
        String _CadenaConexion = "Server=localhost;Port=3306;Database=compubill;Uid=CompuBill;Pwd=CompuBill123;";
        //String _CadenaConexion = "Server=localhost;Port=3306;Database=sistema;Uid=adus-user;Pwd=1234567890;";
        //String _CadenaConexion = "Server=localhost;Port=3306;Database=compubill1;Uid=adus-user;Pwd=1234567890;";
        protected MySqlConnection _CONEXION = new MySqlConnection();

        public Boolean Conectar()
        {
            Boolean result = false;
            try
            {
                _CONEXION.ConnectionString = _CadenaConexion;
                _CONEXION.Open();
                result = true;
            }
            catch (Exception)
            {

                result = false;
            }

            return result;
        }
        public void Desconectar()
        {
            try
            {
                if (_CONEXION.State == System.Data.ConnectionState.Open)
                {
                    _CONEXION.Close();
                }
            }
            catch (Exception)
            {

                //throw;
            }
        }

    }
}
