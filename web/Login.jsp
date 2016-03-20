<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ERP Solution for Plant Maintenance - Login</title>
<link href="http://localhost:8080/plantMaintenance/css/oneColFixCtrHdr.css" rel="stylesheet" type="text/css" />
</head>

<body>

<div class="container">
  <div class="header">
    <p><img src="http://localhost:8080/plantMaintenance/imgs/logo5.JPG" width="130" height="50" /><!-- end .header --></p>
  </div>
  <div class="content">
    <fieldset>
      <legend>Log In</legend>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <form method="post" action="LoginServlet">
          <font size="2">
      <table width="34%" align="center" >
        <tr>
          <td>Username </td>  
          <td><input type="text" name="username" required="required" size="25" /></td>
        </tr>
        <tr>
          <td>Password </td>      
          <td><input type="password" name="userpass" required="required" size="25" /></td>
        </tr>
        <tr>            
        <td>&nbsp;</td>
          <td align="right">
            <input type="submit" name="Login" id="Login" value="Login" />
            <input type="reset" name="btnreset" id="btnreset" value="Reset" />
          </td>
        </tr>
        
      </table></font>
      </form>
      <p>&nbsp;</p>
      <h2>&nbsp;</h2>
      <p>&nbsp;</p>
    </fieldset>
    <!-- end .content --></div>
  <div class="footer">
    <p>© 2010-2011 Presstech India Pvt Ltd.  </p>
    <!-- end .footer --></div>
  <!-- end .container --></div>
</body>
</html>
