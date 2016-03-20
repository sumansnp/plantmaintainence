﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<link href="css/oneColFixCtrHdr.css" rel="stylesheet" type="text/css" />
<link href="css/twoColFixLtHdr.css" rel="stylesheet" type="text/css" />
<title>Preventive Maintenance - View Maintenance Schedule</title>
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
        function validate1()
        {
            var year=document.form2.year.value;
            if(year=="")
                {
                    window.alert("please select year");
                    document.form2.year.focus();
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
  <h1>View Maintenance Schedule</h1>
  <p>&nbsp;</p>
  <h3>Schedule for particular equipment</h3>
 <form method="post" action="viewMaintenanceScheduleReport.jsp" name="form1" onSubmit="return validate();">
   <table width="80%" border="1" align="center">
     <tr>
       <td width="50%">Enter Equipment Code</td>
       <td><input type="text" name="e_code" id="icode" /></td>
     </tr>
     <tr>
       <td>&nbsp;</td>
       <td align="right"><input type="submit" name="btn_view" id="btn_view" value="View" />
         <input type="reset" name="btn_reset" id="btn_reset" value="Reset" /></td>
     </tr>
   </table>
</form>
<p>&nbsp;</p>
<h3>Schedule for all equipments (year-wise)</h3>
<form method="post" action="viewMaintenanceScheduleSummaryReportYearwise.jsp" name="form2" onsubmit="return validate1();">
   <table width="80%" border="1" align="center">
    <tr>
      <td width="50%">Select year</td>
      <td><select name="year">
						<option>Year
						<option value=1990>1990<option value=1991>1991<option value=1992>1992
						<option value=1993>1993<option value=1994>1994<option value=1995>1995
						<option value=1996>1996<option value=1997>1997<option value=1998>1998
						<option value=1999>1999<option value=2000>2000<option value=2001>2001
						<option value=2002>2002<option value=2003>2003<option value=2004>2004
						<option value=2005>2005<option value=2006>2006<option value=2007>2007
						<option value=2008>2008<option value=2009>2009<option value=2010>2010
						<option value=2011>2011<option value=2012>2012<option value=2013>2013
						<option value=2014>2014<option value=2015>2015<option value=2016>2016
						<option value=2017>2017<option value=2018>2018<option value=2019>2019
						<option value=2020>2020
					</select>
</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>
        <input type="submit" name="view" id="view" value="View" />
        <input type="reset" name="reset" id="reset" value="Reset" />
      </td>
    </tr>
  </table>
</form>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><a href="viewMaintenanceScheduleSummaryReport.jsp">View Summary Report </a> </p>

 </div>
  	<div class="footer">
    <p>© 2010-2011 Presstech India Pvt Ltd.  </p>
	</div>
</div>
</body>
</html>
