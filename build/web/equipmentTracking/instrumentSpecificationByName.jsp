<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Equipment Tracking - Instrument List</title>
<link href="css/oneColFixCtrHdr.css" rel="stylesheet" type="text/css" />
<link href="css/instrumentsummary.css" rel="stylesheet" type="text/css" />
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
    	<font size=2><a href="equipmentTracking.jsp">Home</a> <a href="http://localhost:8080/plantMaintenance/index.jsp">Logout</a></font>
    </td>
   </tr>
  </table>
  </div>
  <div class="sidebar1">
    <ul class="nav">
    <font size=2>
      <li><a href="equipmentSpecification.jsp">Equipment Specification </a></li>
      <li><a href="addEquipment.jsp">Add Equipment </a></li>
      <li><a href="updateEquipment.jsp">Update Equipment </a></li>
      <li><a href="deleteEquipment.jsp">Delete Equipment</a></li>
      <li><a href="instrumentSpecification.jsp">Instrument Specification </a></li>
      <li><a href="addInstrument.jsp">Add Instrument</a></li>
      <li><a href="updateInstrument.jsp">Update Instrument</a></li>
      <li><a href="deleteInstrument.jsp">Delete Instrument</a></li>
      <li>&nbsp;&nbsp;<b>Other Modules</b></li>
      <li><a href="viewMaintenanceScheduleSummaryReport.jsp">View Maintenance Schedule</a></li>
      <li><a href="viewMaintenanceLogSummaryReport.jsp">View Maintenance Log</a></li>
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
    <h2>Instrument List</h2>
    <p>&nbsp;</p>
    <p><sql:query var="instrument_list" dataSource="jdbc/plantmaintenance">
        SELECT * from instrumentList where iName=? <sql:param value="${param.iName}"/>
    </sql:query>
        <font size="1">
        <table border="1" align="center" width="900px" >
        <!-- column headers -->
        <tr>
            <th>Instrument Code</th>
            <th>Name of Instrument</th>
            <th>Range</th>
            <th>Make & Sr No.</th>
            <th>Measurement Type</th>
            <th>Least Count</th>
            <th>Accuracy</th>
            <th>Location</th>
            <th>Frequency (years)</th>
            <th>Calibration Type</th>
            <th>Acquisition Date</th>
        </tr>
        <!-- column data -->
        <c:forEach var="row" items="${instrument_list.rowsByIndex}">
            <tr align="center">
                <c:forEach var="column" items="${row}">
                    <td><c:out value="${column}"/></td>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
            </font></p>
    
<p>&nbsp;</p>
<p>&nbsp;</p>
  </div>
  <div class="footer">
    <p>� 2010-2011 Presstech India Pvt Ltd.  </p>
    <!-- end .footer --></div>
  <!-- end .container --></div>
</body>
</html>
