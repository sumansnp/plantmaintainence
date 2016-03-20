<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<link href="css/oneColFixCtrHdr.css" rel="stylesheet" type="text/css" />
<link href="css/twoColFixLtHdr.css" rel="stylesheet" type="text/css" />
<title>Repair Log - View Repair History</title>

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
    <h1>Repair History Report</h1>
                <p>&nbsp;</p>
                <c:catch var="exception">
                <sql:query var="repairHistory" dataSource="jdbc/plantmaintenance">
                    select rh.`rhNo`,rh.`iCode`,il.`iName`,rh.remarks,rh.cost,rh.`csNo`,rh.`clNo`,rh.`rId`
from repairHistory rh,instrumentList il where rh.iCode=il.iCode and rh.`iCode`=?
                    <sql:param value="${param.i_code}"/>
                </sql:query>
 				<c:set var="repairHistoryReport" value="${repairHistory.rows[0]}"/>
                <c:choose>
                    <c:when test="${repairHistoryReport!=null}">

                        <table border="" cellpadding="5" align="center" width="80%">

                            <tr>
                                <td><strong>Instrument Code: </strong></td>
                                <td>${repairHistoryReport.iCode}</td>
                            </tr>
                            <tr>
                                <td><strong>Instrument Name: </strong></td>
                                <td>${repairHistoryReport.iName}</td>
                            </tr>
                            <tr>
                                <td><strong>Repair History No: </strong></td>
                                <td>${repairHistoryReport.rhNo}</td>
                            </tr>
                            <tr>
                                <td><strong>Remarks: </strong></td>
                                <td>${repairHistoryReport.remarks}</td>
                            </tr>
                            <tr>
                                <td><strong>Cost: </strong></td>
                                <td>${repairHistoryReport.cost}</td>
                            </tr>
                            <tr>
                                <td><strong>Calibration Schedule No: </strong></td>
                                <td>${repairHistoryReport.csNo}</td>
                            </tr>
                            <tr>
                                <td><strong>Calibration Log No: </strong></td>
                                <td>${repairHistoryReport.clNo}</td>
                            </tr>
                            <tr>
                                <td><strong>Repairer ID: </strong></td>
                                <td>${repairHistoryReport.rId}</td>
                            </tr>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <h4>Not Found</h4>
                    </c:otherwise>
                </c:choose>
                </c:catch>
                        <c:if test="${exception!=null}">
                            <c:out value="Unable to delete data in database." />
                        </c:if>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
    <p>&nbsp;</p>
                <p>&nbsp;</p>
  </div>
  <div class="footer">
    <p>© 2010-2011 Presstech India Pvt Ltd.  </p>
    <!-- end .footer --></div>
  <!-- end .container --></div>
</body>
</html>
