<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<link href="css/oneColFixCtrHdr.css" rel="stylesheet" type="text/css" />
<link href="css/twoColFixLtHdr.css" rel="stylesheet" type="text/css" />
<title>Equipment Tracking - Add Equipment Details</title>
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
		var iCode;
		iCode=trim(document.form1.icode.value);
		if(iCode=="")
		{
			window.alert("please enter instrument code");
			document.form1.icode.focus();
			return false;
		}
		else if(iCode.length>=10)
		{
			window.alert("invalid instrument code");
			document.form1.icode.focus();
			return false;
		}
		else
		{
                        var msg=window.confirm("WARNING: The records from secondary(related) tables will also be deleted by deleting this record. Click OK to continue.");
                        if(msg==true)
                        {
                            return true;
                        }
                        else
                        {
                            return false;
                        }
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
    <h1>Delete Instrument Details</h1>
    <p>&nbsp;</p>
    <c:if test="${pageContext.request.method=='POST'}">
                    <c:catch var="exception">
                        <sql:update var="deleteInstrument" dataSource="jdbc/plantmaintenance">
                            DELETE FROM instrumentlist
                            WHERE iCode=?
                            <sql:param value="${param.icode}"/>
                        </sql:update>
                            <c:choose>
                                <c:when test="${deleteInstrument>=1}">
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
    <form id="form1" name="form1" method="post" action="" onSubmit="return validate();">
	<table width="75%" border="1" align="center">
      	<tr>
       	 	<td>Enter Instrument Code</td>
        	<td><input type="text" name="icode" id="icode" /></td>
      	</tr>
      	<tr>
        	<td>&nbsp;</td>
        	<td align="right">
          	<input type="submit" name="btn_delete" id="btn_delete" value="Delete"/>
          	<input type="reset" name="btn_reset" id="btn_reset" value="Reset" /></td>
      	</tr>
    	</table>
	</form>
     </div>
  <div class="footer">
    <p>� 2010-2011 Presstech India Pvt Ltd.  </p>
   </div>
 </div> 
</body>
</html>
