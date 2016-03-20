<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.*" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ERP Solution for Plant Maintenance - Home</title>
<link href="css/oneColFixCtrHdr.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%session.invalidate();%>
<div class="container">
  <div class="header">
  <table width=100%>
  <tr>
  	<td><img src="imgs/logo5.JPG" width="130" height="50" /></td>    
   </tr>
  </table>
  </div>
  <div class="content">
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <table width="200" border="0" align="center">
        <td><p><a href="preventiveMaintenance/preventiveMaintenance.jsp"><img src="imgs/prm.JPG" alt="" width="125" height="136" /></a></p>
        </td>
        <td><h3>Preventive Maintenance</h3>
        <p>Inspection Schedules &amp; Inspection Log</p></td>
        <td><p><a href="equipmentTracking/equipmentTracking.jsp"><img src="imgs/et.JPG" alt="" width="120" height="120" /></a></p>
        </td>
        <td><h3>Equipment Tracking</h3>
        <p>Equipment Specification</p></td>
      </tr>
      <tr>
          <td><p><a href="calibrationTracking/calibrationTracking.jsp"><img src="imgs/ct.jpg" alt="" width="120" height="120" /></a></p>
        </td>
        <td><h3>Calibration Tracking</h3>
        <p>Calibration Schedules &amp; Calibration Log</p></td>
          <td><p><a href="repairLog/repairLog.jsp"><img src="imgs/rh.jpg" alt="" width="120" height="120" /></a></p>
        </td>
        <td><h3>Repair Log</h3>
        <p>Log of Repaired &amp; Defective Equipments</p></td>
      </tr>
     
     
  </table>
    <h1><!-- end .content --></h1>
<p>&nbsp;</p>
<p>&nbsp;</p>
  </div>
  <div class="footer">
    <p>© 2010-2011 Presstech India Pvt Ltd.  </p>
  <!-- end .footer --></div>
  <!-- end .container --></div>
</body>
</html>
