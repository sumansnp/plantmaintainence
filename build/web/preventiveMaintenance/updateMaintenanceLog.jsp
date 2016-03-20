<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<link href="css/oneColFixCtrHdr.css" rel="stylesheet" type="text/css" />
<link href="css/twoColFixLtHdr.css" rel="stylesheet" type="text/css" />
<title>Preventive Maintenance - Update  Maintenance Log</title>
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
		var mlno=trim(document.form1.ml_no.value);
		var date=document.form1.date.value;
		var month=document.form1.month.value;
		var year=document.form1.year.value;
		var operator=trim(document.form1.operator.value);
		var sno=trim(document.form1.s_no.value);
		var ecode=trim(document.form1.e_code.value);
		var type=trim(document.form1.type_of_breakdown.value);
		var details=trim(document.form1.details_of_maintenance.value);
		var cost=trim(document.form1.cost.value);
		var remarks=document.form1.remarks.value;
		if(mlno=="")
		{
			window.alert("please enter maintenance log number");
			document.form1.ml_no.focus();
			return false;
		}
		else if(isNaN(mlno))
		{
			window.alert("log number must be a numeric value");
			document.form1.ml_no.focus();
			return false;
		}
		else if(document.form1.update_field.value=="doneDate")
		{
			if(day=="" || month=="" || year=="")
          		{
              			window.alert("Please enter valid date");             
              			return false;
          		}
			else if(year%4==0)
			{
				switch(month)	
				{
					case "02":
						if(date>29)
						{
							window.alert("invalid date");
							return false;
						}
					case "04":
						if(date==31)
						{
							window.alert("invalid date");
							return false;
						}
					case "06":
						if(date==31)
						{
							window.alert("invalid date");
							return false;
						}
					case "09":
						if(date==31)
						{
							window.alert("invalid date");
							return false;
						}
					case "11":
						if(date==31)
						{
							window.alert("invalid date");
							return false;
						}	
				}
			}
			else
			{
				switch(month)	
				{
					case "02":
						if(date>28)
						{
							window.alert("invalid date");
							return false;
						}
					case "04":
						if(date==31)
						{
							window.alert("invalid date");
							return false;
						}
					case "06":
						if(date==31)
						{
							window.alert("invalid date");
							return false;
						}
					case "09":
						if(date==31)
						{
							window.alert("invalid date");
							return false;
						}
					case "11":
						if(date==31)
						{
							window.alert("invalid date");
							return false;
						}	
				}
			}
		document.form1.done_date.value=year+"-"+month+"-"+date;
		document.form1.remarks.value="";
		document.form1.operator.value="";
		document.form1.s_no.value="";
		document.form1.e_code.value="";
		document.form1.type_of_breakdown.value="";
		document.form1.details_of_maintenance.value="";
		document.form1.cost.value="";
		return true;
		}
		else if(document.form1.update_field=="remarks")
		{
			if(remarks=="")
			{
				window.alert("please select a remark");
				return false;
			}
		document.form1.date.value="";
		document.form1.month.value="";
		document.form1.year.value="";
		document.form1.done_date.value="";
		document.form1.operator.value="";
		document.form1.s_no.value="";
		document.form1.e_code.value="";
		document.form1.type_of_breakdown.value="";
		document.form1.details_of_maintenance.value="";
		document.form1.cost.value="";
		return true;
		}
		else if(document.form1.update_field.value=="operator")
		{
			if(operator=="")
			{
				window.alert("please enter operator");
				document.form1.operator.focus();
				return false;
			}
			else if(operator.length>20)
			{
				window.alert("invalid operator");
				document.form1.operator.focus();
				return false;
			}
		document.form1.date.value="";
		document.form1.month.value="";
		document.form1.year.value="";
		document.form1.done_date.value="";
		document.form1.remarks.value="";
		document.form1.s_no.value="";
		document.form1.e_code.value="";
		document.form1.type_of_breakdown.value="";
		document.form1.details_of_maintenance.value="";
		document.form1.cost.value="";
		return true;
		}
		else if(document.form1.update_field.value=="sno")
		{
			if(sno=="")
			{
				window.alert("please enter schedule number");
				document.form1.s_no.focus();
				return false;
			}
			else if(isNaN(sno))
			{
				window.alert("schedule number must be a numeric value");
				document.form1.s_no.focus();
				return false;
			}
		document.form1.date.value="";
		document.form1.month.value="";
		document.form1.year.value="";
		document.form1.done_date.value="";
		document.form1.remarks.value="";
		document.form1.operator.value="";
		document.form1.e_code.value="";
		document.form1.type_of_breakdown.value="";
		document.form1.details_of_maintenance.value="";
		document.form1.cost.value="";
		return true;
		}
		else if(document.form1.update_field.value=="eCode")
		{
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
		document.form1.date.value="";
		document.form1.month.value="";
		document.form1.year.value="";
		document.form1.done_date.value="";
		document.form1.remarks.value="";
		document.form1.operator.value="";
		document.form1.s_no.value="";
		document.form1.type_of_breakdown.value="";
		document.form1.details_of_maintenance.value="";
		document.form1.cost.value="";
		return true;
		}
		else if(document.form1.update_field.value=="typeBreakdown")
		{
			if(type=="")
			{
				window.alert("please enter type of breakdown");
				document.form1.type_of_breakdown.focus();
				return false;
			}
			else if(type.length>100)
			{
				window.alert("invalid type of breakdown");
				document.form1.type_of_breakdown.focus();
				return false;
			}
		document.form1.date.value="";
		document.form1.month.value="";
		document.form1.year.value="";
		document.form1.done_date.value="";
		document.form1.remarks.value="";
		document.form1.operator.value="";
		document.form1.s_no.value="";
		document.form1.e_code.value="";
		document.form1.details_of_maintenance.value="";
		document.form1.cost.value="";
		return true;
		}
		else if(document.form1.update_field.value=="detailsMaintenance")
		{
			if(details=="")
			{
				window.alert("please enter details of maintenance");
				document.form1.details_of_maintenance.focus();
				return false
			}
			else if(details.length>300)
			{
				window.alert("invalid details of maintenance");
				document.form1.details_of_maintenance.focus();
				return false;
			}
		document.form1.date.value="";
		document.form1.month.value="";
		document.form1.year.value="";
		document.form1.done_date.value="";
		document.form1.remarks.value="";
		document.form1.operator.value="";
		document.form1.s_no.value="";
		document.form1.e_code.value="";
		document.form1.type_of_breakdown.value="";
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
			if(isNaN(cost))
			{
				window.alert("cost must be a numeric value");
				document.form1.cost.focus();
				return false;
			}
		document.form1.date.value="";
		document.form1.month.value="";
		document.form1.year.value="";
		document.form1.done_date.value="";
		document.form1.remarks.value="";
		document.form1.operator.value="";
		document.form1.s_no.value="";
		document.form1.e_code.value="";
		document.form1.type_of_breakdown.value="";
		document.form1.details_of_maintenance.value="";
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
    	<font size=2><a href="preventiveMaintenance.jsp">Home</a> <a href="http://localhost:8080/plantMaintenance/index.jsp">Logout</a></font>
    </td>
   </tr>
  </table>
  </div>
  <div class="sidebar1">
    <ul class="nav">
   	<font size=2>
      <li><a href="viewMaintenanceSchedule.jsp">View Maintenance Schedule</a></li>
      <li><a href="addMaintenanceSchedule.jsp">Add Schedule </a></li>
      <li><a href="updateMaintenanceSchedule.jsp">Update Schedule </a></li>
      <li><a href="deleteMaintenanceSchedule.jsp">Delete  Schedule </a></li>
      <li><a href="viewMaintenanceLog.jsp">View Maintenance Log </a></li>
      <li><a href="addMaintenanceLog.jsp">Add Log</a></li>
      <li><a href="updateMaintenanceLog.jsp">Update Log</a></li>
      <li><a href="deleteMaintenanceLog.jsp">Delete Log</a></li>
      <li>&nbsp;&nbsp;<b>Other Modules</b></li>
      <li><a href="equipmentSpecificationSummaryReport.jsp">View Equipment Specification</a></li>
      <li><a href="instrumentSpecificationSummaryReport.jsp">View Instrument Specification</a></li>
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
  <h1>Update Maintenance Log</h1>
  <c:if test="${pageContext.request.method=='POST'}">
                    <c:catch var="exception">
                        <sql:update var="updateMaintenanceLog" dataSource="jdbc/plantmaintenance">
                            UPDATE maintenanceLog
                            SET <%=request.getParameter("update_field")%> = '<%=sel_field(request)%>'
                            WHERE mlno='<%=request.getParameter("ml_no")%>'
                            <%!
                        
                            public String sel_field(ServletRequest request)
                            {
                                String update_value=null;
                                if(request.getParameter("remarks")!="")
                                {
                                    update_value=request.getParameter("remarks");
                                }
                                else if(request.getParameter("operator")!="")
                                {
                                    update_value=request.getParameter("operator");
                                }
                                else if(request.getParameter("s_no")!="")
                                {
                                    update_value=request.getParameter("s_no");
                                }
                                else if(request.getParameter("type_of_breakdown")!="")
                                {
                                     update_value=request.getParameter("type_of_breakdown");
                                }                                
								else if(request.getParameter("e_code")!="")
                                {
                                     update_value=request.getParameter("e_code");
                                }
								else if(request.getParameter("details_of_maintenance")!="")
                                {
                                     update_value=request.getParameter("details_of_maintenance");
                                }
								else if(request.getParameter("cost")!="")
                                {
                                     update_value=request.getParameter("cost");
                                }
								else if(request.getParameter("done_date")!="")
                                {
                                     update_value=request.getParameter("done_date");
                                }
                                return update_value;
                            }
                            %>
                        </sql:update>
                        <c:choose>
                            <c:when test="${updateMaintenanceLog>=1}">
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
 <form method="post" action="" name="form1" onSubmit="return validate();">
   <table border=1 align=center width=80%>
    	<tr>
        	<td width="38%">Maintenance Log No. 
       	  <td width="62%"><input type="text" name="ml_no">
	 <tr>
              <td width="50%">Select Field</td>
              <td width="50%">
              		<select name="update_field" style="width:145px">            			
                          	<option value="doneDate">Done Date</option>
                          	<option value="remarks">Remarks</option>
                          	<option value="operator">Operator</option>
				<option value="sno">Schedule No.</option>
				<option value="eCode">Equipment Code</option>
				<option value="typeBreakdown">Type of Breakdown</option>
				<option value="detailsMaintenance">Details of Maintenance</option>
				<option value="cost">Cost</option>
              		</select>
        </tr>
    </table>
   <table border="1" align="center" width=80%>
   <tr>
     <td colspan=2 align=center>&nbsp;</td></tr>
			<tr>
				<td>Done Date
				<td>
			<select name="day">
                          <option>Day
                          <option value=1>1<option value=2>2<option value=3>3<option value=4>4<option value=5>5
                          <option value=6>6<option value=7>7<option value=8>8<option value=9>9<option value=10>10
                          <option value=11>11<option value=12>12<option value=13>13<option value=14>14<option value=15>15
                          <option value=16>16<option value=17>17<option value=18>18<option value=19>19<option value=20>20
                          <option value=21>21<option value=22>22<option value=23>23<option value=24>24<option value=25>25
                          <option value=26>26<option value=27>27<option value=28>28<option value=29>29<option value=30>30
                          <option value=31>31
                      </select>
                      <select name="month">
                          <option>Month
                          <option value=01>January<option value=02>February<option value=03>March
                          <option value=04>April<option value=05>May<option value=06>June
                          <option value=07>July<option value=08>August<option value=09>September
                          <option value=10>October<option value=11>November
                          <option value=12>December
                      </select>
                      <select name="year">
                          <option>Year
                          <option value=1990>1990<option value=1991>1991<option value=1992>1992
                          <option value=1993>1993<option value=1994>1994<option value=1995>1995
                          <option value=1996>1996<option value=1997>1997<option value=1998>1998
                          <option value=1999>1999<option value=2000>2000<option value=2001>2001
                          <option value=2002>2002<option value=2003>2003<option value=2004>2004
                          <option value=2005>2005<option value=2006>2006<option value=2007>2007
                          <option value=2008>2008<option value=2009>2009<option value=2010>2010
                          <option value=2011>2011<option value=2012>2012<option value=2013>2013
                          <option value=2014>2014<option value=2015>2015<option value=2016>2016
                          <option value=2017>2017<option value=2018>2018<option value=2019>2019
                          <option value=2020>2020
                      </select>
			<tr>
				<td>Remarks
				<td>
					<select name="remarks">
						<option>
						<option>OK
						<option>Repair
						<option>Replace
					</select>
			<tr>
				<td>Operator
				<td><input type="text" name="operator">
			<tr>
				<td>Schedule No.
				<td><input type="text" name="s_no">
			<tr>
				<td>Equipment Code
				<td><input type="text" name="e_code">
			<tr>
				<td>Type of Breakdown
				<td>
					<textarea name="type_of_breakdown" cols=20 rows=5>	
					</textarea>
			<tr>
				<td>Details of Maintenance
				<td>
					<textarea name="details_of_maintenance" cols=20 rows=7>	
					</textarea>
			<tr>
				<td>Cost
				<td><input type="text" name="cost">
			<tr>
				<td>&nbsp;
				<td>
					<input type="submit" name="submit" value="Submit">
					<input type="reset" name="reset" value="Reset">
		</table>
		<input type="hidden" name="done_date">
 </form>
  </div>
  	<div class="footer">
    <p>© 2010-2011 Presstech India Pvt Ltd.  </p>
	</div>
</div>
</body>
</html>
