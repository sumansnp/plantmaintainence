<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<link href="css/oneColFixCtrHdr.css" rel="stylesheet" type="text/css" />
<link href="css/twoColFixLtHdr.css" rel="stylesheet" type="text/css" />
<title>Repair Log - Update Repair History</title>
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
		var clno=trim(document.form1.log_no.value);
		var csno=trim(document.form1.c_no.value);
		var icode=trim(document.form1.i_code.value);
		var rid=trim(document.form1.r_id.value);
		var cost=trim(document.form1.cost.value);
		var remarks=trim(document.form1.remarks.value);
		var rhno=trim(document.form1.txtrhno.value);
		if(rhno=="")
		{
			window.alert("please enter repair history number");
			document.form1.txtrhno.focus();
			return false;
		}
		else if(isNaN(rhno))
		{
			window.alert("please enter valid repair history number");
			document.form1.txtrhno.focus();
			return false;
		}
		else if(document.form1.update_field.value=="clNo")
		{
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
			document.form1.c_no.value="";
			document.form1.i_code.value="";
			document.form1.r_id.value="";
			document.form1.cost.value="";
			document.form1.remarks.value="";
			return true;
		}
		else if(document.form1.update_field.value=="csNo")
		{
			if(csno=="")
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
			document.form1.log_no.value="";
			document.form1.i_code.value="";
			document.form1.r_id.value="";
			document.form1.cost.value="";
			document.form1.remarks.value="";
			return true;
		}
		else if(document.form1.update_field.value=="iCode")
		{
			if(icode=="")
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
			document.form1.log_no.value="";
			document.form1.c_no.value="";			
			document.form1.r_id.value="";
			document.form1.cost.value="";
			document.form1.remarks.value="";
			return true;
		}
		else if(document.form1.update_field.value=="rId")
		{
			if(rid=="")
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
			document.form1.log_no.value="";
			document.form1.c_no.value="";
			document.form1.i_code.value="";
			document.form1.cost.value="";
			document.form1.remarks.value="";
			return true;
		}
		else if(document.form1.update_field.value=="remarks")
		{
			if(remarks=="")
			{
				window.alert("please enter remark");
				return false;
			}
			
			document.form1.log_no.value="";
			document.form1.c_no.value="";
			document.form1.i_code.value="";
			document.form1.r_id.value="";
			document.form1.cost.value="";
			return true;
		}
		else if(document.form1.update_field.value=="cost")
		{
			if(cost=="")
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
			document.form1.remarks.value="";
			document.form1.log_no.value="";
			document.form1.c_no.value="";
			document.form1.i_code.value="";
			document.form1.r_id.value="";			
			return true;
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
    <h1>Update Repair History</h1>
    <p>&nbsp;</p>
    <c:if test="${pageContext.request.method=='POST'}">
                    <c:catch var="exception">
                        <sql:update var="updateRepairHistory" dataSource="jdbc/plantmaintenance">
                            UPDATE repairHistory
                            SET <%=request.getParameter("update_field")%> = '<%=sel_field(request)%>'
                            WHERE rhNo=<%=request.getParameter("txtrhno")%>
                            <%!
                        
                            public String sel_field(ServletRequest request)
                            {
                                String update_value=null;
                                if(request.getParameter("log_no")!="")
                                {
                                    update_value=request.getParameter("log_no");
                                }
                                else if(request.getParameter("c_no")!="")
                                {
                                    update_value=request.getParameter("c_no");
                                }
                                else if(request.getParameter("i_code")!="")
                                {
                                    update_value=request.getParameter("i_code");
                                }
                                else if(request.getParameter("r_id")!="")
                                {
                                     update_value=request.getParameter("r_id");
                                }                                
				else if(request.getParameter("remarks")!="")
                                {
                                     update_value=request.getParameter("remarks");
                                }
				else if(request.getParameter("cost")!="")
                                {
                                     update_value=request.getParameter("cost");
                                }
                                return update_value;
                            }
                            %>
                        </sql:update>
                        <c:choose>
                            <c:when test="${updateRepairHistory>=1}">
                                <center><h3> Data update successful.</h3></center>
                            </c:when>
                            <c:otherwise>
                                <center><h3> Unable to update.</h3></center>
                            </c:otherwise>
                        </c:choose>
                    </c:catch>
                    <c:if test="${exception!=null}">
                        <c:out value="Unable to update data in database." />
                    </c:if>

                </c:if>
    <form action="" method="post" name="form1" onSubmit="return validate();">
   	  <table border=1 align=center width=80%>
        	<tr>
            	<td width="50%">Repair History No.				
            	<td width="50%"><input type="text" name="txtrhno">
             <tr>
                <td width="50%">Select Field</td>
        		<td width="50%">
        			<select name="update_field" style="width:165px">
                   			<option value="clNo">Calibration Log No</option>
                    		<option value="csNo">Calibration Schedule No</option>
                    		<option value="iCode">Instrument Code</option>
                    		<option value="rId">Repairer ID</option>
                    		<option value="remarks">Remarks </option>
                            <option value="cost">Cost</option>
            		</select>
           		</td>
          </tr>  
        </table>
		<table border=1 align=center width=80%>
        	<tr>
            	<td colspan=2 align=center>&nbsp;</td>
            <tr>
				<td width="50%">Calibration Log No.
				<td width="50%"><input type="text" name="log_no">
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
                    	<option>
						<option value="OK">OK
						<option value="REPAIR">Repair
						<option value="REPLACE">Replace
					</select>
			<tr>
				<td>Cost
				<td><input type="text" name="cost">
			<tr>
				<td>&nbsp;
				<td>
					<input type="submit" name="submit" value="Save">
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
