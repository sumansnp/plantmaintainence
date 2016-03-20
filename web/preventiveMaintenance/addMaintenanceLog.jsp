<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<link href="css/oneColFixCtrHdr.css" rel="stylesheet" type="text/css" />
<link href="css/twoColFixLtHdr.css" rel="stylesheet" type="text/css" />
<title>Preventive Maintenance - Add  Maintenance Log</title>
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
		document.form1.e_code.value=document.form2.e_code.value;
		document.form1.s_no.value=document.form2.s_no.value;
		var date=document.form1.date.value;
		var month=document.form1.month.value;
		var year=document.form1.year.value;
		var operator=trim(document.form1.operator.value);
		var sno=trim(document.form1.s_no.value);
		var ecode=trim(document.form1.e_code.value);
		var type=trim(document.form1.type_of_breakdown.value);
		var details=trim(document.form1.details_of_maintenance.value);
		var cost=trim(document.form1.cost.value);
		if(document.form1.s_no.value=="")
		{
			window.alert("please select equipment code");
			return false;
		}
		if(date=="" || month=="" || year=="")
		{
			window.alert("invalid date");
			return false;
		}
		if(year%4==0)
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
		document.form1.valid_date.value=year+"-"+month+"-"+date;
		if(operator=="")
		{
			window.alert("please enter the operator name");
			document.form1.operator.focus();
			return false;
		}
		else if(operator.length>20)
		{
			window.alert("invalid operator");
			document.form1.operator.focus();
			return false;
		}
		else if(type.length>100)
		{
			window.alert("invalid type of breakdown");
			document.form1.type_of_breakdown.focus();
			return false;
		}
		else if(details.length>300)
		{
			window.alert("invalid details of maintenance");
			document.form1.details_of_maintenance.focus();
			return false;
		}
		else if(isNaN(cost))
		{
			window.alert("cost must be a numeric value");
			document.form1.cost.focus();
			return false;
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
      <sql:query var="eCodeList" dataSource="jdbc/plantmaintenance">
          SELECT eCode FROM maintenanceschedule where sno not in (select sno from maintenancelog)
      </sql:query>
      <c:if test="${pageContext.request.method=='POST'}">
        <sql:query var="snoList" dataSource="jdbc/plantmaintenance">
                SELECT sno FROM maintenanceschedule where sno not in (select sno from maintenancelog) and eCode=?
                <sql:param value="${param.e_code}" />
        </sql:query>
      </c:if>
         <c:set var="snovar" value="${snoList.rows[0]}"/>
           
	<h1>Add Maintenance Log</h1>
        <form name="form2" method="post" action="" >
        <table border="1" align="center" width=80%>
        <tr>
		<td>Equipment Code
		<td><select name="e_code" onchange="this.form.submit();">
                                <option value=<c:out value="${param.e_code}"/> selected> <c:out value="${param.e_code}"/>
                       <c:forEach var="row" items="${eCodeList.rows}">
                                 <option value=<c:out value="${row.eCode}"/>><c:out value="${row.eCode}"/>
                       </c:forEach>
                                 
                     </select></td>
        <tr>
		<td>Schedule No.
                    <td> <input type="text" disabled="true" name="s_no" value=<c:out value="${snovar.sno}"/>></input>
                                
        </table>
        </form>
 	<form name="form1" method="post" action="addMaintenanceLogSuccess.jsp" onSubmit="return validate();">
	  <table border="1" align="center" width=80%>
			<tr>
				<td>Done Date
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
				<td>Remarks
				<td>
					<select name="remarks">
						<option>OK
						<option>Repair
						<option>Replace
					</select>
			<tr>
				<td>Operator
				<td><input type="text" name="operator">
			
                        <tr>
				<td>Type of Breakdown
				<td>
					<textarea name="type_of_breakdown" cols=20 rows=5></textarea>
			<tr>
				<td>Details of Maintenance
				<td>
					<textarea name="details_of_maintenance" cols=20 rows=7></textarea>
			<tr>
				<td>Cost
				<td><input type="text" name="cost" value=0>
			<tr>
				<td>&nbsp;
				<td>
					<input type="submit" name="submit" value="Submit">
					<input type="reset" name="reset" value="Reset">
		</table>
	  <input type="hidden" name="valid_date"/>
           <input type="hidden" name="e_code"/>
            <input type="hidden" name="s_no"/>
	</form>
      </div>
  	<div class="footer">
    <p>© 2010-2011 ERP Solution for Plant Maintenance. </p>
	</div>
</div>
</body>
</html>/form>
      </div>
  	<div class="footer">
    <p>© 2010-2011 Presstech India Pvt Ltd.  </p>
	</div>
</div>
</body>
</html>