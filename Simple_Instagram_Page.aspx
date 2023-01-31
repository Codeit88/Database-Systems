<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm1.aspx.vb" Inherits="WebApplication3.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:Image ID="iamg1" ImageUrl="https://image.telanganatoday.com/wp-content/uploads/2022/05/Instagram-users-irked-with-the-new-update_V_jpg--816x480-4g.webp?sw=1600&dsz=816x480&iw=659&p=false&r=1" runat="server" Width="220" />
            <br />
            <p1><b>Create an account</b></p1>
        </div>
        <div>
            <br />
            <p1>First name : 
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </p1>
            
            <p2>Last name : 
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </p2>

            <br />
             <br />
            
            <p3>User name: 
                <asp:TextBox ID="TextBox" runat="server"></asp:TextBox>
            </p3>
             <br />
            <br />
            <p4>Password : 
                <asp:TextBox ID="password" Textmode="Password" runat="server"></asp:TextBox>
            </p4>

        </div>
        <div>
            <br />
            <p3>Date of Birth: 
                  <br />
                 <asp:TextBox ID="TextBox5" Textmode="date" runat="server"></asp:TextBox>
            </p3>
                      <br />
            <br />

        </div>

        <div>
            <p1>
                Country:
            <asp:DropDownList ID="country" runat="server">
            <asp:ListItem Text="Select" Value="0"></asp:ListItem>
            <asp:ListItem Text="Pakistan" Value="Pak"></asp:ListItem>
                 </asp:DropDownList>
                
            </p1>

<br />
            <br />
            <p1>
                Gender:
                <asp:RadioButton ID="rdMale" Text="Male" GroupName="Gender"
runat="server" />
<asp:RadioButton ID="rdFemale" Text="Female" GroupName="Gender"
runat="server" />
            </p1>
        </div>

        <div>
            <br />
              <asp:RadioButton ID="RadioButton2" Text="Enable Privacy" GroupName="Privacy"
runat="server" />
            <br />
            <br />
           <asp:Button ID="btnSave" Text="Create Account" runat="server" />
        </div>
    </form>
</body>
</html>
