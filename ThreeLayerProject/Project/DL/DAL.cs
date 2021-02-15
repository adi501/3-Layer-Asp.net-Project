using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Project.App_Code.DL
{
    public class DAL
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());
        SqlCommand cmd;
        public string InsertUpdateDeleteData(string spName, SqlParameter[] parametersList)
        {
            try
            {
                string message = "";
                cmd = new SqlCommand(spName, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddRange(parametersList);
                cmd.Parameters.Add("@result", SqlDbType.VarChar, 100);
                cmd.Parameters["@result"].Direction = ParameterDirection.Output;
                con.Open();
                cmd.ExecuteNonQuery();

                message = (string)cmd.Parameters["@result"].Value;
                con.Close();

                return message;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public DataTable GetData(string spName, SqlParameter[] parametersList)
        {
            try
            {
                cmd = new SqlCommand(spName, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddRange(parametersList);
                cmd.Parameters.Add("@result", SqlDbType.VarChar, 100);
                cmd.Parameters["@result"].Direction = ParameterDirection.Output;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}