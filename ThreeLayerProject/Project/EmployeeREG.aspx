<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeREG.aspx.cs" Inherits="Project.EmployeeREG" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lbl_Message" runat="server"></asp:Label>
            <fieldset>
                <legend>Insert/Update</legend>
                <asp:HiddenField ID="hfId" runat="server" />
                <div>

                    <table>
                        <tr>
                            <td>Employee Name(*):
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmployeeName" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="Dynamic" ErrorMessage="***" ForeColor="Red"
                                    ControlToValidate="txtEmployeeName" ValidationGroup="valid1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Designation(*):
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlDesignation" runat="server">
                                    <asp:ListItem Text="-- Select Designation --" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="CEO" Value="CEO"></asp:ListItem>
                                    <asp:ListItem Text="Manager" Value="Manager"></asp:ListItem>
                                    <asp:ListItem Text="Employee" Value="Employee"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="Dynamic"
                                    runat="server" ErrorMessage="***" ForeColor="Red" ControlToValidate="ddlDesignation" InitialValue="0" ValidationGroup="valid1"></asp:RequiredFieldValidator>

                            </td>
                        </tr>
                        <tr>
                            <td>Salary(*):</td>
                            <td>
                                <asp:TextBox ID="txtSalary" runat="server"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="Dynamic"
                                    ErrorMessage="***" ForeColor="Red"
                                    ControlToValidate="txtSalary" ValidationGroup="valid1"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revDecimals" runat="server" ErrorMessage="Only Decimals With Precision Less Than 2"
                                    ControlToValidate="txtSalary" ValidationExpression="^\d+(\.\d{1,2})?$">
                                </asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Email (*):</td>
                            <td>
                                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" Display="Dynamic"
                                    ErrorMessage="***" ForeColor="Red"
                                    ControlToValidate="txtEmail" ValidationGroup="valid1"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexEmailValid" runat="server"
                                    ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail"
                                    ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Mobile(*):</td>
                            <td>
                                <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" Display="Dynamic"
                                    ErrorMessage="***" ForeColor="Red"
                                    ControlToValidate="txtMobile" ValidationGroup="valid1"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                    ControlToValidate="txtMobile" ErrorMessage="Enter Valid number"
                                    ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Qualification(*):
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlQualification" runat="server">
                                    <asp:ListItem Text="-- Select Qualification --" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="MBA" Value="MBA"></asp:ListItem>
                                    <asp:ListItem Text="B.tech" Value="B.tech"></asp:ListItem>
                                    <asp:ListItem Text="MCA" Value="MCA"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" Display="Dynamic"
                                    runat="server" ErrorMessage="***" ForeColor="Red" ControlToValidate="ddlQualification" InitialValue="0" ValidationGroup="valid1"></asp:RequiredFieldValidator>

                            </td>
                        </tr>
                        <tr>
                            <td>Manager :</td>
                            <td>
                                <asp:TextBox ID="txtManager" runat="server"></asp:TextBox></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="btnInsert" runat="server" Text="Insert" ValidationGroup="valid1" OnClick="btnInsert_Click" />
                                <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" />

                            </td>
                            <td></td>
                        </tr>
                    </table>
                </div>
            </fieldset>
            <fieldset>
                <legend>Search/Delete</legend>
                <div style="width: 100%;">
                    <asp:GridView ID="gvEmployee" runat="server" Width="100%" HeaderStyle-BackColor="#e48201"
                        HeaderStyle-ForeColor="White" RowStyle-BackColor="#FE980F" AlternatingRowStyle-BackColor="White"
                        RowStyle-ForeColor="#3A3A3A" PageSize="10" AllowPaging="true"
                        AutoGenerateColumns="false" OnRowCommand="gvEmployee_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="EmployeeName" HeaderText="EmployeeName" />
                            <asp:BoundField DataField="Designation" HeaderText="Designation" />
                            <asp:BoundField DataField="Salary" HeaderText="Salary" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                            <asp:BoundField DataField="Qualification" HeaderText="Qualification" />
                            <asp:BoundField DataField="Manager" HeaderText="Manager" />
                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:LinkButton ID="link_edit" CommandArgument='<%# Eval("EmployeeId") %>' Text="Edit" CommandName="eedit"
                                        runat="server">
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="link_delete" CommandArgument='<%# Eval("EmployeeId") %>' Text="Delete" CommandName="edelete"
                                        runat="server">
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </fieldset>
        </div>
    </form>
</body>
</html>
