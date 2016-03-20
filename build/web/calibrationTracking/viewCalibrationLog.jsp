<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<link href="css/oneColFixCtrHdr.css" rel="stylesheet" type="text/css" />
<link href="css/twoColFixLtHdr.css" rel="stylesheet" type="text/css" />
<title>Calibration Tracking - View Calibration Log</title>
<script type=text/javascript>
	function trim(s) 
	{
		s = s.replace(/(^\s*)|(\s*$)/gi,"");
		s = s.replace(/[ ]{2,}/gi," ");
		s = s.replace(/\n /,"\n");
		return s;
	}
	function validate()
	{
		var icode=trim(document.form1.i_code.value);
		if(icode=="")
		{
			window.alert("please enter instrument code");
			document.form1.i_code.focus();
			return false;
		}
		else if(icode.length<=1)
		{
			window.alert("invalid instrument code");
			document.form1.i_code.focus();
			return false;
		}
		else if(icode.length>=10)
		{
			window.alert("invalid instrument code");
			document.form1.i_code.focus();
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
    	<font size=2><a href="calibrationTracking.jsp">Home</a> <a href="http://localhost:8080/plantMaintenance/index.jsp">Logout</a></font>
    </td>
   </tr>
  </table>
  </div>
  <div class="sidebar1">
    <ul class="nav">
   	<font size=2>
      <li><a href="viewCalibrationSchedule.jsp">View Calibration Schedule</a></li>
      <li><a href="addCalibrationSchedule.jsp">Add Calibration Schedule </a></li>
      <li><a href="updateCalibrationSchedule.jsp">Update Calibration Schedule </a></li>
      <li><a href="deleteCalibrationSchedule.jsp">Delete Calibration Schedule </a></li>
      <li><a href="viewCalibrationLog.jsp">View Calibration Log </a></li>
      <li><a href="addCalibrationLog.jsp">Add Calibration Log</a></li>
      <li><a href="updateCalibrationLog.jsp">Update Calibration Log</a></li>
      <li><a href="deleteCalibrationLog.jsp">Delete Calibration Log</a></li>
      <li>&nbsp;&nbsp;<b>Other Modules</b></li>
<li><a href="equipmentSpecificationSummaryReport.jsp">View Equipment Specification</a></li>
<li><a href="instrumentSpecificationSummaryReport.jsp">View Instrument Specification</a></li>
<li><a href="viewMaintenanceScheduleSummaryReport.jsp">View Maintenance Schedule</a></li>
<li><a href="viewMaintenanceLogSummaryReport.jsp">View Maintenance Log</a></li>
<li><a href="viewDefectiveEquipmentSummaryReport.jsp">View Defective Equipments</a></li>
<li><a href="viewDefectiveInstrumentSummaryReport.jsp">View Defective Instruments</a></li>
<li><a href="viewRepairHistorySummaryReport.jsp">View Repair History</a></li>
<li><a href="viewRepairerSummaryReport.jsp">View Repairer Details</a></li>
   	</font>
    </ul>
  </div>
   <div class="content">   
  <h1>View Calibration Log</h1>
  <p>&nbsp;</p>
 <form method="post" action="viewCalibrationLogReport.jsp" name="form1" onSubmit="return validate();">
   <table width="80%" border="1" align="center">
     <tr>
       <td>Enter Instrument Code</td>
       <td><input type="text" name="i_code" id="icode" /></td>
     </tr>
     <tr>
       <td>&nbsp;</td>
       <td align="right"><input type="submit" name="btn_view" id="btn_view" value="View" />
         <input type="reset" name="btn_reset" id="btn_reset" value="Reset" /></td>
     </tr>
   </table>
   <p>&nbsp;</p>
<p><a href="viewCalibrationLogSummaryReport.jsp">View Calibration Log for All Instruments</a> </p>
 </form>
 </div>
  <div class="footer">
    <p>© 2010-2011 Presstech India Pvt Ltd. </p>
  </div>
</div>
</body>
</html>
