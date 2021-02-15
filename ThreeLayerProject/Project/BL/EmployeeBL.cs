using Project.App_Code.DL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Project.App_Code.BL
{
    public class EmployeeBL
    {
        DAL objdb = new DAL();
        public string InsertUpdateDeleteData(EmployeeDAO obj)
        {
            SqlParameter[] sqlParams = {
                new SqlParameter("@Designation",obj.Designation),
                new SqlParameter("@Email",obj.Email),
                new SqlParameter("@EmployeeId",obj.EmployeeId),
                 new SqlParameter("@EmployeeName",obj.EmployeeName),
                new SqlParameter("@Manager",obj.Manager),
                new SqlParameter("@Mobile",obj.Mobile),
                new SqlParameter("@Qualification",obj.Qualification),
                new SqlParameter("@Salary",obj.Salary),
                new SqlParameter("@Type",obj.Type)
        };
            return objdb.InsertUpdateDeleteData("spEmployee", sqlParams);
        }
        public DataTable GetData(EmployeeDAO obj)
        {
            SqlParameter[] sqlParams = {
                  new SqlParameter("@Designation",obj.Designation),
                new SqlParameter("@Email",obj.Email),
                new SqlParameter("@EmployeeId",obj.EmployeeId),
                 new SqlParameter("@EmployeeName",obj.EmployeeName),
                new SqlParameter("@Manager",obj.Manager),
                new SqlParameter("@Mobile",obj.Mobile),
                new SqlParameter("@Qualification",obj.Qualification),
                new SqlParameter("@Salary",obj.Salary),
                new SqlParameter("@Type",obj.Type)
        };
            return objdb.GetData("spEmployee", sqlParams);
        }
    }
}