using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project.App_Code.DL
{
    public class EmployeeDAO
    {
        public int EmployeeId { get; set; }
        public string EmployeeName { get; set; }
        public string Designation { get; set; }
        public decimal Salary { get; set; }
        public string Email { get; set; }
        public string Mobile { get; set; }
        public string Qualification { get; set; }
        public string Manager { get; set; }
        public int Type { get; set; }
    }
}