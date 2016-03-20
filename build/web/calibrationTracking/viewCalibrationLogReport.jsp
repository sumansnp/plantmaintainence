<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<html>
<head>
<link href="css/oneColFixCtrHdr.css" rel="stylesheet" type="text/css" />
<link href="css/calibrationlogsummary.css" rel="stylesheet" type="text/css" />
<title>Calibration Tracking - View Calibration Log</title>
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
  
  <p>&nbsp;</p>
  <c:catch var="exception">
  <sql:query var="cLog" dataSource="jdbc/plantmaintenance">
      select cl.*, il.iName, il.location,il.range,il.makeAndSerialNo, il.accuracy,cs.dueDate
      from calibrationLog cl,instrumentList il, calibrationSchedule cs
      where cl.`iCode`=il.`icode` and cl.`iCode`=cs.`iCode` and cl.`iCode`=? <sql:param value="${param.i_code}"/>
  </sql:query>
      <c:set var="clReport" value="${cLog.rows[0]}"/>
        <c:choose>
                 <c:when test="${clReport!=null}">

<center><h2>PRESSTECH (INDIA) PVT. LTD</h2><p><h4>CALIBRATION OF INSPECTION MEASURING TEST EQUIPMENT</h4></p><br></center>

<font size="2">
<table width=85% align=center >
<tr>
	<td>i) Instrument Name :-</td>
	<td><c:out value="${clReport.iName}"/></td>
	<td>Calibration Date :-</td>
	<td>${clReport.doneDate}</td>
</tr>
<tr>
	<td>Instrument Code :-</td>
	<td>${clReport.iCode}</td>
	<td>Due Date :-</td>
	<td>${clReport.dueDate}</td>
</tr>
<tr>
	<td>Make :-</td>
	<td>${clReport.makeAndSerialNo}</td>
	<td>Range :-</td>
	<td>${clReport.range} </td>
</tr>
<tr>
	<td>Location :-</td>
	<td>${clReport.location}</td>
	<td>Accuracy :-</td>
	<td>${clReport.accuracy} %</td>
</tr>
<tr>
	<td colspan=4>&nbsp;</td>
</tr>
<tr>
	<td>ii) Agency :-</td>
	<td colspan=3>${clReport.agency}</td>
</tr>
<tr>
	<td>Master Instrument Name :-</td>
	<td>${clReport.miName}</td>
	<td>Instrument Code :-</td>
	<td>${clReport.miCode}</td>
</tr>
<tr>
	<td colspan=4>Calibration Details :-</td>

</tr>
<tr>
	<td>Calibration Date :-</td>
	<td>${clReport.micalibrationDate}</td>
	<td>Due Date :-</td>
	<td>${clReport.midueDate}</td>
</tr>

<tr>
	<td>Traceability :-</td>
	<td>${clReport.traceability}</td>
</tr>

<tr>
	<td colspan=4>&nbsp;</td>
</tr>
<tr>

	<td colspan=4>iii) Enviornmental Conditions :-</td>
</tr>
<tr>
	<td>Temperature :-</td>
	<td>${clReport.temperature}</td>
	<td>Humidity :-</td>
	<td>${clReport.humidity}</td>
</tr>
<tr>
	<td colspan=4>&nbsp;</td>
</tr>
<tr>
	<td colspan=4>iv) Calibration Details :-</td>
</tr>
<tr>
	<td colspan=4>

	<table border=1 width=100% align=center>
		<tr>
			<th>Sr</th>
			<th>Standard Value/Reading Master Equipment</th>
			<th>Observed Value</th>
			
		</tr>
                <tr align=center>
			<td>1<br>2<br>3<br>4<br>5<br>6<br>7<br>8</td>
			<td>${clReport.sv1}<br>${clReport.sv2}<br>${clReport.sv3}<br>${clReport.sv4}<br>${clReport.sv5}<br>${clReport.sv6}<br>${clReport.sv7}<br>&nbsp;</td>
			<td>${clReport.ov1}<br>${clReport.ov2}<br>${clReport.ov3}<br>${clReport.ov4}<br>${clReport.ov5}<br>${clReport.ov6}<br>${clReport.ov7}<br>&nbsp;</td>
                  
		</tr>
                <tr>
			<td>Remark: </td>
			<td colspan=3>${clReport.remarks}</td>
                </tr>

	</table></td>
</table>
</font>                 </c:when>
        <c:otherwise>
                 <h4>No records found</h4>
        </c:otherwise>
                </c:choose>
       </c:catch>
                <c:if test="${exception!=null}">
                            <c:out value="Unable to retrive data from database." />
                </c:if>

 </div>
  <div class="footer">
    <p>© 2010-2011 Presstech India Pvt Ltd.  </p>
  </div>
</div>
</body>
</html>
