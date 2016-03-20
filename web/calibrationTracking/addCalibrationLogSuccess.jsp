<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Calibration Tracking - Add Calibration Log</title>
<link href="css/oneColFixCtrHdr.css" rel="stylesheet" type="text/css" />
<link href="css/twoColFixLtHdr.css" rel="stylesheet" type="text/css" />
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
    <h1> Add Calibration Log</h1>
 <c:catch var="exception">
    <sql:update var="addCalibrationLog" dataSource="jdbc/plantmaintenance">
        INSERT INTO `calibrationlog`
        (`iCode`, `csNo`, `agency`, `miCode`, `miName`, `micalibrationDate`,
         `midueDate`, `traceability`, `temperature`, `humidity`,
          `sv1`, `ov1`, `sv2`, `ov2`, `sv3`, `ov3`, `sv4`, `ov4`, `sv5`, `ov5`,
          `sv6`, `ov6`, `sv7`, `ov7`, `sv8`, `ov8`, `sv9`, `ov9`, `sv10`, `ov10`, `doneDate`, `remarks`)
        VALUES
        (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)

        <sql:param value="${param.i_code}" />
        <sql:param value="${param.cs_no}" />
        <sql:param value="${param.agency}" />
        <sql:param value="${param.master_code}" />
        <sql:param value="${param.master_name}" />
        <sql:param value="${param.master_date}" />
        <sql:param value="${param.due_date}" />
        <sql:param value="${param.traceability}" />
        <sql:param value="${param.temp}" />
        <sql:param value="${param.humidity}" />
        <sql:param value="${param.standard1}" />
        <sql:param value="${param.observed1}" />
        <sql:param value="${param.standard2}" />
        <sql:param value="${param.observed2}" />
        <sql:param value="${param.standard3}" />
        <sql:param value="${param.observed3}" />
        <sql:param value="${param.standard4}" />
        <sql:param value="${param.observed4}" />
        <sql:param value="${param.standard5}" />
        <sql:param value="${param.observed5}" />
        <sql:param value="${param.standard6}" />
        <sql:param value="${param.observed6}" />
        <sql:param value="${param.standard7}" />
        <sql:param value="${param.observed7}" />
        <sql:param value="${param.standard8}" />
        <sql:param value="${param.observed8}" />
        <sql:param value="${param.standard9}" />
        <sql:param value="${param.observed9}" />
        <sql:param value="${param.standard10}" />
        <sql:param value="${param.observed10}" />
        <sql:param value="${param.cal_date}" />
        <sql:param value="${param.remarks}" />
    </sql:update>
    <c:if test="${addCalibrationLog>=1}">
        <center><h3> Data inserted successfully.</h3></center>
        </c:if>
    </c:catch>
    <c:if test="${exception!=null}">
        <center><h3><c:out value="Unable to insert data in database." /></h3></center>
        <c:out value="${exception}"/>
    </c:if>
</div>
  <div class="footer">
    <p>© 2010-2011 Presstech India Pvt Ltd.  </p>
  </div>
</div>
</body>
</html>
