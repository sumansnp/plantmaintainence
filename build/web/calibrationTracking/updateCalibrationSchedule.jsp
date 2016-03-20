<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<link href="css/oneColFixCtrHdr.css" rel="stylesheet" type="text/css" />
<link href="css/twoColFixLtHdr.css" rel="stylesheet" type="text/css" />
<title>Calibration Tracking - Update Calibration Schedule</title>
<script type=text/javascript>
	function trim(s) 
	{
		s = s.replace(/(^\s*)|(\s*$)/gi,"");
		s = s.replace(/[ ]{2,}/gi," ");
		s = s.replace(/\n /,"\n");
		return s;
	}
	function validate()
	{
		var csno=trim(document.form1.cs_no.value);
		var icode=trim(document.form1.i_code.value);
		var date=document.form1.date.value;
		var month=document.form1.month.value;
		var year=document.form1.year.value;
		var noOfDays=trim(document.form1.no_of_days.value);
		if(csno=="")
		{
			window.alert("please enter calibration schedule number");
			document.form1.cs_no.focus();
			return false;
		}
		else if(isNaN(csno))
		{
			window.alert("calibration schedule number must be a numeric value");
			document.form1.cs_no.focus();
			return false;
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
			else if(icode.length>=10)
			{
				window.alert("invalid instrument code");
				document.form1.i_code.focus();
				return false;
			}
			document.form1.no_of_days.value="";
			document.form1.date.value="";
			document.form1.month.value="";
			document.form1.year.value="";
			document.form1.due_date.value="";
			return true;
		}
		else if(document.form1.update_field.value=="dueDate")
		{
			if(date=="" || month=="" || year=="")
			{
				window.alert("invalid date");
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
			document.form1.i_code.value="";
			document.form1.no_of_days.value="";
			document.form1.due_date.value=year+"-"+month+"-"+date;
			return true;
		}
		else if(document.form1.update_field.value=="noOfDays")
		{
			if(noOfDays=="")
			{
				window.alert("please enter number of days");
				document.form1.no_of_days.focus();
				return false;
			}
			else if(isNaN(noOfDays))
			{
				window.alert("number of days must be a numeric value");
				document.form1.no_of_days.focus();
				return false;
			}
			document.form1.i_code.value="";
			document.form1.date.value="";
			document.form1.month.value="";
			document.form1.year.value="";
			document.form1.due_date.value="";
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
  <h1>Update Calibration Schedule</h1>
  <c:if test="${pageContext.request.method=='POST'}">
                    <c:catch var="exception">
                        <sql:update var="updateCalibrationSchedule" dataSource="jdbc/plantmaintenance">
                            UPDATE calibrationSchedule
                            SET <%=request.getParameter("update_field")%> = '<%=sel_field(request)%>'
                            WHERE csNo=<%=request.getParameter("cs_no")%>
                            <%!
                        
                            public String sel_field(ServletRequest request)
                            {
                                String update_value=null;
                                if(request.getParameter("i_code")!="")
                                {
                                    update_value=request.getParameter("i_code");
                                }
                                else if(request.getParameter("due_date")!="")
                                {
                                    update_value=request.getParameter("due_date");
                                }
                                else if(request.getParameter("no_of_days")!="")
                                {
                                    update_value=request.getParameter("no_of_days");
                                }                                
                                return update_value;
                            }
                            %>
                        </sql:update>
                        <c:choose>
                            <c:when test="${updateCalibrationSchedule>=1}">
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
 	<table border=1 width=80% align=center>
    	  <td width="40%">Calibration Schedule No.
		  <td width="60%"><input type="text" name="cs_no">
	<tr>
                      <td width="40%">Select Field</td>
              <td width="60%">
              <select name="update_field" style="width:145px">            			
                          <option value="iCode">Instrument Code</option>
                          <option value="dueDate">Due Date</option>
                          <option value="noOfDays">Number of Days</option>
                  </select>
                  </td>
                  </tr>
    </table>
   <table border="1" align="center" width=80%>
   <tr>
   	 <td align=center colspan=2>
 	   <tr>
				<td width="40%">Instrument Code
				<td width="60%"><input type="text" name="i_code">
			<tr>
				<td>Due Date
				<td>
					<select name="date">
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
				<td>Number of Days
				<td><input type="text" name="no_of_days">
			<tr>
				<td>&nbsp;
				<td>
					<input type="submit" name="submit" value="Submit">
					<input type="reset" name="reset" value="Reset">
		</table>
		<input type="hidden" name="due_date">
 </form>
 </div>
  <div class="footer">
    <p>© 2010-2011 Presstech India Pvt Ltd.  </p>
  </div>
</div>
</body>
</html>
