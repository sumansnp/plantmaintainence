<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<link href="css/oneColFixCtrHdr.css" rel="stylesheet" type="text/css" />
<link href="css/twoColFixLtHdr.css" rel="stylesheet" type="text/css" />
<title>Repair Log - Delete Defective Equipment</title>
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
    <h1>Delete Defective Equipment</h1>
    <p>&nbsp;</p>
    <c:if test="${pageContext.request.method=='POST'}">
                    <c:catch var="exception">
                        <sql:update var="deleteDefectiveEquipment" dataSource="jdbc/plantmaintenance">
                            DELETE FROM defectiveEquipments
                            WHERE eCode=?
                            <sql:param value="${param.e_code}"/>
                        </sql:update>
                            <c:choose>
                                <c:when test="${deleteDefectiveEquipment>=1}">
                                    <center><h3> Data delete successfully.</h3></center>
                                </c:when>
                                <c:otherwise>
                                    <center><h3> Unable to delete.</h3></center>
                                </c:otherwise>
                            </c:choose>
      </c:catch>
                        <c:if test="${exception!=null}">
                            <c:out value="Unable to delete data in database." />
                        </c:if>
    </c:if>
    <form action="" method="post" name="form1" onSubmit="return validate();">
    	<table border=1 align=center width=80%>
        	<tr>
            	<td width="50%">Enter Equipment Code<td width="50%"><input type="text" name="e_code">
                    
			<tr>
				<td>&nbsp;
				<td>
					<input type="submit" name="submit" value="Delete">
					<input type="reset" name="reset" value="Reset">
	  </table>
	</form>
  </div>
  <div class="footer">
    <p>© 2010-2011 Presstech India Pvt Ltd. </p>
   </div>
</div>
</body>
</html>
