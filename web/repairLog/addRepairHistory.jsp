<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<link href="css/oneColFixCtrHdr.css" rel="stylesheet" type="text/css" />
<link href="css/twoColFixLtHdr.css" rel="stylesheet" type="text/css" />
<title>Repair Log - Add Repair History</title>
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
		var clno=trim(document.form1.log_no.value);
		var csno=trim(document.form1.c_no.value);
		var icode=trim(document.form1.i_code.value);
		var rid=trim(document.form1.r_id.value);
		var cost=trim(document.form1.cost.value);
		if(clno=="")
		{
			window.alert("please enter calibration log number");
			document.form1.log_no.focus();
			return false;
		}
		else if(isNaN(clno))
		{
			window.alert("calibration log number must be a numeric value");
			document.form1.log_no.focus();
			return false;
		}
		else if(csno=="")
		{
			window.alert("please enter calibration schedule number");
			document.form1.c_no.focus();
			return false;
		}
		else if(isNaN(csno))
		{
			window.alert("calibration schedule number must be a numeric value");
			document.form1.c_no.focus();
			return false;
		}
		else if(icode=="")
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
		else if(icode>10)
		{
			window.alert("invalid instrument code");
			document.form1.i_code.focus();
			return false;
		}
		else if(rid=="")
		{
			window.alert("please enter repairer id");
			document.form1.r_id.focus();
			return false;
		}
		else if(isNaN(rid))
		{
			window.alert("repairer id must be a numeric value");
			document.form1.r_id.focus();
			return false;
		}
		else if(cost=="")
		{
			window.alert("please enter cost");
			document.form1.cost.focus();
			return false;
		}
		else if(isNaN(cost))
		{
			window.alert("cost must be a numeric value");
			document.form1.cost.focus();
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
    	<font size=2><a href="repairLog.jsp">Home</a> <a href="http://localhost:8080/plantMaintenance/index.jsp">Logout</a></font>
    </td>
   </tr>
  </table>
  </div>
  <div class="sidebar1">
    <ul class="nav">
   	<font size=2>
      <li><a href="viewDefectiveEquipmentSummaryReport.jsp">View Defective Equipments</a></li>
      <li><a href="deleteDefectiveEquipment.jsp">Delete Defective Equipments</a></li>
      <li><a href="viewDefectiveInstrumentSummaryReport.jsp">View Defective Instruments </a></li>
      <li><a href="deleteDefectiveinstrument.jsp">Delete Defective Instruments </a></li>
      <li><a href="viewRepairHistory.jsp">View Repair History</a></li>
      <li><a href="addRepairHistory.jsp">Add Repair History</a></li>
      <li><a href="updateRepairHistory.jsp">Update Repair History</a></li>
      <li><a href="deleteRepairHistory.jsp">Delete Repair History</a></li>
      <li><a href="viewRepairer.jsp">View Repairer Details</a></li>
      <li><a href="addRepairer.jsp">Add Repairer </a></li>
      <li><a href="updateRepairer.jsp">Update Repairer </a></li>
      <li><a href="deleteRepairer.jsp">Delete Repairer </a></li>
      <li>&nbsp;&nbsp;<b>Other Modules</b></li>
<li><a href="equipmentSpecificationSummaryReport.jsp">View Equipment Specification</a></li>
<li><a href="instrumentSpecificationSummaryReport.jsp">View Instrument Specification</a></li>
<li><a href="viewMaintenanceScheduleSummaryReport.jsp">View Maintenance Schedule</a></li>
<li><a href="viewMaintenanceLogSummaryReport.jsp">View Maintenance Log</a></li>
<li><a href="viewCalibrationScheduleSummaryReport.jsp">View Calibration Schedule</a></li>
<li><a href="viewCalibrationLogSummaryReport.jsp">View Calibration Log</a></li>
   	</font>
    </ul>
  </div>
   <div class="content">
    <h1>Add Repair History    </h1>
    <p>&nbsp;</p>
    <c:if test="${pageContext.request.method=='POST'}">
                    <c:catch var="exception">
                        <sql:update var="addRepairHistory" dataSource="jdbc/plantmaintenance">
                            insert into repairHistory(iCode,csNo,clNo,remarks,cost,rId)
                            VALUES (?,?,?,?,?,?)
                            <sql:param value="${param.i_code}" />
                            <sql:param value="${param.c_no}" />
                            <sql:param value="${param.log_no}" />
                            <sql:param value="${param.remarks}" />
                            <sql:param value="${param.cost}" />
                            <sql:param value="${param.r_id}" />
                        </sql:update>
                        <c:if test="${addRepairHistory>=1}">
                            <center><h3> Data inserted successfully.</h3></center>
                            </c:if>
                        </c:catch>
                        <c:if test="${exception!=null}">
                            <c:out value="Unable to insert data in database." />
                        </c:if>
</c:if>    
    <form action="" method="post" name="form1" onSubmit="return validate();">
<table border=1 align=center width=80%>
			<tr>
				<td width="46%">Calibration Log No.
				<td width="54%"><input type="text" name="log_no">
			<tr>
				<td>Calibration Schedule No.
				<td><input type="text" name="c_no">
			<tr>
				<td>Instrument Code
				<td><input type="text" name="i_code">
			<tr>
				<td>Repairer ID
				<td><input type="text" name="r_id">
			<tr>
				<td>Remarks
				<td>
					<select name="remarks">
						<option>OK
						<option>Repair
						<option>Replace
					</select>
			<tr>
				<td>Cost
				<td><input type="text" name="cost">
			<tr>
				<td>&nbsp;
				<td>
					<input type="submit" name="submit" value="Submit">
					<input type="reset" name="reset" value="Reset">
		</table>
	</form>
  </div>
  <div class="footer">
    <p>© 2010-2011 Presstech India Pvt Ltd.  </p>
    <!-- end .footer --></div>
  <!-- end .container --></div>
</body>
</html>
