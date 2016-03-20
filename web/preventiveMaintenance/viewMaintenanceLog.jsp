<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<link href="css/oneColFixCtrHdr.css" rel="stylesheet" type="text/css" />
<link href="css/twoColFixLtHdr.css" rel="stylesheet" type="text/css" />
<title>Preventive Maintenance - View Maintenance Log</title>
<script type="text/javascript">
	function trim(s) 
	{
		s = s.replace(/(^\s*)|(\s*$)/gi,"");
		s = s.replace(/[ ]{2,}/gi," ");
		s = s.replace(/\n /,"\n");
		return s;
	}
	function validate()
	{
		var ecode=trim(document.form1.e_code.value);
		if(ecode=="")
		{
			window.alert("please enter equipment code");
			document.form1.e_code.focus();
			return false;
		}
		else if(ecode.length<=1)
		{
			window.alert("invalid equipment code");
			document.form1.e_code.focus();
			return false;
		}
		else if(ecode.length>10)
		{
			window.alert("invalid equipment code");
			document.form1.e_code.focus();
			return false;
		}
	}
</script>
</head>
<body>

<div class="container">
   <div class="header">
  <table width=100%>
  <tr>
  	<td> 
    	<img src="imgs/logo5.JPG" width="130" height="50" />
    </td>
    <td align="right">
    	<font size=2><a href="preventiveMaintenance.jsp">Home</a> <a href="http://localhost:8080/plantMaintenance/index.jsp">Logout</a></font>
    </td>
   </tr>
  </table>
  </div>
  <div class="sidebar1">
    <ul class="nav">
   	<font size=2>
      <li><a href="viewMaintenanceSchedule.jsp">View Maintenance Schedule</a></li>
      <li><a href="addMaintenanceSchedule.jsp">Add Schedule </a></li>
      <li><a href="updateMaintenanceSchedule.jsp">Update Schedule </a></li>
      <li><a href="deleteMaintenanceSchedule.jsp">Delete  Schedule </a></li>
      <li><a href="viewMaintenanceLog.jsp">View Maintenance Log </a></li>
      <li><a href="addMaintenanceLog.jsp">Add Log</a></li>
      <li><a href="updateMaintenanceLog.jsp">Update Log</a></li>
      <li><a href="deleteMaintenanceLog.jsp">Delete Log</a></li>
      <li>&nbsp;&nbsp;<b>Other Modules</b></li>
      <li><a href="equipmentSpecificationSummaryReport.jsp">View Equipment Specification</a></li>
      <li><a href="instrumentSpecificationSummaryReport.jsp">View Instrument Specification</a></li>
      <li><a href="viewCalibrationScheduleSummaryReport.jsp">View Calibration Schedule</a></li>
      <li><a href="viewCalibrationLogSummaryReport.jsp">View Calibration Log</a></li>
      <li><a href="viewDefectiveEquipmentSummaryReport.jsp">View Defective Equipments</a></li>
      <li><a href="viewDefectiveInstrumentSummaryReport.jsp">View Defective Instruments</a></li>
      <li><a href="viewRepairHistorySummaryReport.jsp">View Repair History</a></li>
      <li><a href="viewRepairerSummaryReport.jsp">View Repairer Details</a></li>
   	</font>
    </ul>
  </div>
  <div class="content">
  <h1>View Maintenance Log</h1>
  <p>&nbsp;</p>
 <form method="post" action="viewMaintenanceLogReport.jsp" name="form1" onSubmit="return validate();">
   <table width="80%" border="1" align="center">
     <tr>
       <td>Enter Equipment Code</td>
       <td><input type="text" name="e_code" id="icode" /></td>
     </tr>
     <tr>
       <td>&nbsp;</td>
       <td align="right"><input type="submit" name="btn_view" id="btn_view" value="View" />
         <input type="reset" name="btn_reset" id="btn_reset" value="Reset" /></td>
     </tr>
   </table>
   <p>&nbsp;</p>
<p><a href="viewMaintenanceLogSummaryReport.jsp">View Equipment Log of All Equipments</a> </p>
 </form>
  </div>
  	<div class="footer">
    <p>© 2010-2011 Presstech India Pvt Ltd.  </p>
	</div>
</div>
</body>
</html>
