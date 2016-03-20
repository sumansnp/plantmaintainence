<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Equipment Tracking - Equipment Specification Report</title>
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
    <h1>Instrument Specification Report</h1>
                <p>&nbsp;</p>
                <c:catch var="exception">
                <sql:query var="instrument" dataSource="jdbc/plantmaintenance">
                    SELECT `iCode`,`iName`,`range`,`makeAndSerialNo`,`measurementType`,`leastCount`,`accuracy`,`location`,`frequencyCalibrationYear`,`typeCalibration`,`acquisitionDate`
                    FROM `instrumentlist`
                    WHERE `iCode`=?
                    <sql:param value="${param.icode}"/>
                </sql:query>
 				<c:set var="instrumentSpec" value="${instrument.rows[0]}"/>
                <c:choose>
                    <c:when test="${instrumentSpec!=null}">
                       
                        <table border="" cellpadding="5" align="center" width="80%">

                            <tr>
                                <td><strong>Instrument Code: </strong></td>
                                <td>${instrumentSpec.iCode}</td>
                            </tr>
                            <tr>
                                <td><strong>Instrument Name: </strong></td>
                                <td>${instrumentSpec.iName}</td>
                            </tr>
                            <tr>
                                <td><strong>Range: </strong></td>
                                <td>${instrumentSpec.range}</td>
                            </tr>
                            <tr>
                                <td><strong>Make &amp; Serial No: </strong></td>
                                <td>${instrumentSpec.makeAndSerialNo}</td>
                            </tr>
                            <tr>
                                <td><strong>Measurement Type: </strong></td>
                                <td>${instrumentSpec.measurementType}</td>
                            </tr>
                            <tr>
                                <td><strong>Least Count: </strong></td>
                                <td>${instrumentSpec.leastCount}</td>
                            </tr>
                            <tr>
                                <td><strong>Accuracy: </strong></td>
                                <td>${instrumentSpec.accuracy}</td>
                            </tr>
                            <tr>
                                <td><strong>Location: </strong></td>
                                <td>${instrumentSpec.location}</td>
                            </tr>
                            <tr>
                                <td><strong>Calibration Frequency (years): </strong></td>
                                <td>${instrumentSpec.frequencyCalibrationYear}</td>
                            </tr>
                            <tr>
                                <td><strong>Calibration Type: </strong></td>
                                <td>${instrumentSpec.typeCalibration}</td>
                            </tr>
                            <tr>
                                <td><strong>Acquisition Date: </strong></td>
                                <td>${instrumentSpec.acquisitionDate}</td>
                            </tr>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <h4>Not Found</h4>
                    </c:otherwise>
                </c:choose>
                </c:catch>
                        <c:if test="${exception!=null}">
                            <c:out value="Unable to view data from database." />
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
