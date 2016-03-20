<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html>
    <head>
        <link href="css/oneColFixCtrHdr.css" rel="stylesheet" type="text/css" />
        <link href="css/twoColFixLtHdr.css" rel="stylesheet" type="text/css" />
        <title>Calibration Tracking - View Calibration Schedule</title>
        
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
        <h1>Calibration Schedule Report</h1>
        <p>&nbsp;</p>
        <sql:query var="calibrationScheduleReport" dataSource="jdbc/plantmaintenance">
      select csNo, cs.iCode,il.iName,dueDate from calibrationSchedule cs, instrumentlist il where cs.iCode=il.iCode and cs.iCode=? <sql:param value="${param.i_code}"/>
    </sql:query>
                <font size=2>
                <table border="1" align="center" width="80%">
                <!-- column headers -->
                <tr align="center">
        
                <th width="25%">Calibration Schedule No.</th>
                <th>Instrument Code</th>
                <th> Name of Instrument</th>
                <th>Due Date</th>

                </tr>
                <!-- column data -->
    <c:forEach var="row" items="${calibrationScheduleReport.rowsByIndex}">
                <tr align="center">
            <c:forEach var="column" items="${row}">
                <td><c:out value="${column}"/></td>
        </c:forEach>
                </tr>
    </c:forEach>
                </table></font>
                </div>
                <div class="footer">
                <p>© 2010-2011 Presstech India Pvt Ltd.  </p>
                </div>
                </div>
                </body>
                </html>
