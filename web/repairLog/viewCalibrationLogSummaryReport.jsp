<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Repair Log </title>
<link href="css/oneColFixCtrHdr.css" rel="stylesheet" type="text/css" />
<link href="css/calibrationlogsummary.css" rel="stylesheet" type="text/css" />
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
  <h1>Calibration Log Summary Report</h1>
  <p>&nbsp;</p>
  <p><sql:query var="calibrationLogSummaryReport" dataSource="jdbc/plantmaintenance">
       select clno,icode,csno,agency,micode,miname,micalibrationdate,miduedate,traceability,temperature,humidity,remarks,donedate from calibrationlog
  </sql:query>
 <font size="1">
 <table border="1" align="center" width="80%">
      <!-- column headers -->
      <tr align="center">

                <th>Calibration Log No.</th>
                <th>Instrument Code</th>
                <th>Calibration Schedule No.</th>
                <th>Agency</th>
                <th>Master Equipment Code</th>
                <th>Master Equipment Name</th>
                <th>Master Equipment Calibration Date</th>
                <th>Master Equipment Calibration Due Date</th>
                <th>Traceability</th>
                <th>Temperature</th>
                <th>Humidity</th>
                <th>Remarks</th>
                <th>Calibration Done Date</th>
      </tr>
      <!-- column data -->
      <c:forEach var="row" items="${calibrationLogSummaryReport.rowsByIndex}">
          <tr align="center">
              <c:forEach var="column" items="${row}">
                  <td><c:out value="${column}"/></td>
              </c:forEach>
          </tr>
      </c:forEach>
  </table></font></p>
  </div>
  <div class="footer">
    <p>© 2010-2011 Presstech India Pvt Ltd.  </p>
    <!-- end .footer --></div>
  <!-- end .container --></div>
</body>
</html>
