using Project.App_Code.BL;
using Project.App_Code.DL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Project
{
    public partial class EmployeeREG : System.Web.UI.Page
    {
        EmployeeBL objusers = new EmployeeBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    bindGrid();
                }
            }
            catch (Exception ex)
            {
                lbl_Message.Text = ex.ToString();
            }
        }
        protected void bindGrid()
        {
            try
            {
                DataTable dt = new DataTable();
                EmployeeDAO objEmployeeDAO = new EmployeeDAO();
                objEmployeeDAO.Type = 2;
                dt = objusers.GetData(objEmployeeDAO);
                gvEmployee.DataSource = dt;
                gvEmployee.DataBind();
            }
            catch (Exception ex)
            {
                lbl_Message.Text = ex.ToString();
            }
        }
        protected void gvEmployee_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "edelete")
                {
                    EmployeeDAO objEmployeeDAO = new EmployeeDAO();
                    objEmployeeDAO.EmployeeId = Convert.ToInt32(e.CommandArgument);
                    objEmployeeDAO.Type = 6;
                    string message = objusers.InsertUpdateDeleteData(objEmployeeDAO);
                    if (message == "1")
                    {
                        lbl_Message.Text = "Data Deleted";
                    }
                    bindGrid();

                }
                else if (e.CommandName == "eedit")
                {
                    DataTable dt = new DataTable();
                    EmployeeDAO objEmployeeDAO = new EmployeeDAO();
                    objEmployeeDAO.EmployeeId = Convert.ToInt32(e.CommandArgument);
                    objEmployeeDAO.Type = 5;
                    dt = objusers.GetData(objEmployeeDAO);
                    if (dt.Rows.Count > 0)
                    {
                        hfId.Value = dt.Rows[0]["EmployeeId"].ToString();
                        ddlDesignation.SelectedValue = dt.Rows[0]["Designation"].ToString();
                        ddlQualification.SelectedValue = dt.Rows[0]["Qualification"].ToString();
                        txtEmail.Text = dt.Rows[0]["Email"].ToString();
                        txtEmployeeName.Text = dt.Rows[0]["EmployeeName"].ToString();
                        txtManager.Text = dt.Rows[0]["Manager"].ToString();
                        txtMobile.Text = dt.Rows[0]["Mobile"].ToString();
                        txtSalary.Text = dt.Rows[0]["Salary"].ToString();
                        btnInsert.Text = "Update";

                    }
                }

            }
            catch (Exception ex)
            {
                lbl_Message.Text = ex.ToString();
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                EmployeeDAO objEmployeeDAO = new EmployeeDAO();
                objEmployeeDAO.Designation = ddlDesignation.SelectedValue;
                objEmployeeDAO.Email = txtEmail.Text.Trim();
                objEmployeeDAO.EmployeeName = txtEmployeeName.Text.Trim();
                objEmployeeDAO.Manager = txtManager.Text.Trim();
                objEmployeeDAO.Mobile = txtMobile.Text.Trim();
                objEmployeeDAO.Qualification = ddlQualification.SelectedValue;
                objEmployeeDAO.Salary = Convert.ToDecimal(txtSalary.Text.Trim());
                if (hfId.Value == "")
                {
                    objEmployeeDAO.Type = 1;
                }
                else
                {
                    objEmployeeDAO.Type = 3;
                    objEmployeeDAO.EmployeeId = Convert.ToInt32(hfId.Value);
                }
                string message = objusers.InsertUpdateDeleteData(objEmployeeDAO);
                if(message=="1")
                {
                    lbl_Message.Text = "Data Inserted";
                }
                else if(message=="2")
                {
                    lbl_Message.Text = "Data Updated";
                }
                
                Clear();
                btnInsert.Text = "Insert";
                bindGrid();

            }
            catch (Exception ex)
            {
                lbl_Message.Text = ex.ToString();
            }
        }
        protected void Clear()
        {
            ddlDesignation.SelectedValue = "0";
            ddlQualification.SelectedValue = "0";
            txtEmail.Text = "";
            txtEmployeeName.Text = "";
            txtManager.Text = "";
            txtMobile.Text = "";
            txtSalary.Text = "";
            hfId.Value = "";
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            Clear();
        }
    }
}