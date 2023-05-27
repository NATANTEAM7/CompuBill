using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataManager
{
    public static class DBConsultas
    {
        public static DataTable VALIDAR_USUARIO(String pUsuario, String pClave)
        {
            DataTable Resultado = new DataTable();
            String Sentencia = @"SELECT 
            a.Id_Usuarios,a.Usuario, a.Id_Empleados_Usuarios, a.Id_Rol_Usuarios,
            b.Nombres_Empleados, b.Apellidos_Empleados,c.Rol  
            FROM usuarios a, empleados b, rol c
            WHERE a.Usuario='" + pUsuario + @"' 
            AND a.Clave=SHA1(MD5('" + pClave + @"'))
            AND a.Id_Empleados_Usuarios=b.Id_Empleados
            AND a.Id_Rol_Usuarios=c.Id_Rol;";
            /*DataTable Resultado = new DataTable();
            String Sentencia = @"SELECT 
            a.IDUsuario,a.Usuario, a.IDEmpleado, a.IDRol,
            b.Nombres, b.Apellidos,c.Rol  
            FROM usuarios a, empleados b, roles c
            WHERE a.Usuario='" + pUsuario + @"' 
            AND a.Clave=SHA1(MD5('" + pClave + @"')) 
            AND a.IDEmpleado=b.IDEmpleado 
            AND a.IDRol=c.IDRol;";*/
            DBOperacion Consultor = new DBOperacion();
            try
            {
                Resultado = Consultor.Consultar(Sentencia);
            }
            catch (Exception e)
            {
                Resultado = new DataTable();
                Debug.WriteLine("Erroraso papa: ----- " + e.Message);
                //throw;
            }
            return Resultado;
        }


    }
}
