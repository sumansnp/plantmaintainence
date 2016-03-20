<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<link href="css/oneColFixCtrHdr.css" rel="stylesheet" type="text/css" />
<link href="css/twoColFixLtHdr.css" rel="stylesheet" type="text/css" />
<title>Calibration Tracking - Update Calibration Log</title>
<script type=text/javascript>
	function trim(s)
	{
		s = s.replace(/(^\s*)|(\s*$)/gi,"");
		s = s.replace(/[ ]{2,}/gi," ");
		s = s.replace(/\n /,"\n");
		return s;
	}
	function dateCheck(date,month,year)
	{
		if(year%4==0)
			{
				switch(month)
				{
					case "02":
						if(date>29)
						{
							return false;
						}
					case "04":
						if(date==31)
						{
							return false;
						}
					case "06":
						if(date==31)
						{

							return false;
						}
					case "09":
						if(date==31)
						{
							return false;
						}
					case "11":
						if(date==31)
						{

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
							return false;
						}
					case "04":
						if(date==31)
						{

							return false;
						}
					case "06":
						if(date==31)
						{
							return false;
						}
					case "09":
						if(date==31)
						{
							return false;
						}
					case "11":
						if(date==31)
						{

							return false;
						}
				}
			}
	}
	function validate()
	{
		var clno=trim(document.form1.cl_no.value);
		var icode=trim(document.form1.i_code.value);
		var calDay=document.form1.calDate.value;
		var calMonth=document.form1.calMonth.value;
		var calYear=document.form1.calYear.value;
		var agency=trim(document.form1.agency.value);
		var masterName=trim(document.form1.master_name.value);
		var masterCode=trim(document.form1.master_code.value);
		var day=document.form1.date.value;
		var month=document.form1.month.value;
		var year=document.form1.year.value;
		var dueDay=document.form1.dueDate.value;
		var dueMonth=document.form1.dueMonth.value;
		var dueYear=document.form1.dueYear.value;
		var trac=trim(document.form1.traceability.value);
		var temp=trim(document.form1.temp.value);
		var humidity=trim(document.form1.humidity.value);
		var remarks=document.form1.remarks.value;
		if(clno=="")
		{
			window.alert("please enter calibration log number");
			document.form1.cl_no.focus();
			return false;
		}
		else if(isNaN(clno))
		{
			window.alert("calibration log number must be a numeric value");
			document.form1.cl_no.focus();
			return false;
		}
		else if(document.form1.update_field.value=="icode")
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
			document.form1.calDate.value="";
			document.form1.calMonth.value="";
			document.form1.calYear.value="";
			document.form1.agency.value="";
			document.form1.master_name.value="";
			document.form1.master_code.value="";
			document.form1.date.value="";
			document.form1.month.value="";
			document.form1.year.value="";
			document.form1.dueDate.value="";
			document.form1.dueMonth.value="";
			document.form1.dueYear.value="";
			document.form1.traceability.value="";
			document.form1.temp.value="";
			document.form1.humidity.value="";
			return true;
		}
		else if(document.form1.update_field.value=="calDate")
		{
			if(calDay=="" || calMonth=="" || calYear=="")
			{
				window.alert("invalid calibration date");
				return false;
			}
			else if(dateCheck(calDay,calMonth,calYear)==false)
			{
				window.alert("invalid calibration date");
				return false;
			}
			document.form1.cal_date.value=calYear+"-"+calMonth+"-"+calDate;
			document.form1.i_code.value="";
			document.form1.agency.value="";
			document.form1.master_name.value="";
			document.form1.master_code.value="";
			document.form1.date.value="";
			document.form1.month.value="";
			document.form1.year.value="";
			document.form1.dueDate.value="";
			document.form1.dueMonth.value="";
			document.form1.dueYear.value="";
			document.form1.traceability.value="";
			document.form1.temp.value="";
			document.form1.humidity.value="";
			return true;
		}
		else if(document.form1.update_field.value=="agency")
		{
			if(agency=="")
			{
				window.alert("please enter agency");
				document.form1.agency.focus();
				return false;
			}
			else if(agency.length<=3)
			{
				window.alert("invalid agency");
				document.form1.agency.focus();
				return false;
			}
			else if(agency.length>100)
			{
				window.alert("invalid agency");
				document.form1.agency.focus();
				return false;
			}
			document.form1.calDate.value="";
			document.form1.calMonth.value="";
			document.form1.calYear.value="";
			document.form1.i_code.value="";
			document.form1.master_name.value="";
			document.form1.master_code.value="";
			document.form1.date.value="";
			document.form1.month.value="";
			document.form1.year.value="";
			document.form1.dueDate.value="";
			document.form1.dueMonth.value="";
			document.form1.dueYear.value="";
			document.form1.traceability.value="";
			document.form1.temp.value="";
			document.form1.humidity.value="";
			return true;
		}
		else if(document.form1.update_field.value=="masterName")
		{
			if(masterName=="")
			{
				window.alert("please enter name of master equipment");
				document.form1.master_name.focus();
				return false;
			}
			else if(masterName.length<=3 || masterName.length>50)
			{
				window.alert("invalid master equipment name");
				document.form1.master_name.focus();
				return false;
			}
			document.form1.calDate.value="";
			document.form1.calMonth.value="";
			document.form1.calYear.value="";
			document.form1.i_code.value="";
			document.form1.agency.value="";
			document.form1.master_code.value="";
			document.form1.date.value="";
			document.form1.month.value="";
			document.form1.year.value="";
			document.form1.dueDate.value="";
			document.form1.dueMonth.value="";
			document.form1.dueYear.value="";
			document.form1.traceability.value="";
			document.form1.temp.value="";
			document.form1.humidity.value="";
			return true;
		}
		else if(document.form1.update_field.value=="masterCode")
		{
			if(masterCode=="")
			{
				window.alert("please enter master equipment code");
				document.form1.master_code.focus();
				return false;
			}
			else if(masterCode.length<=1)
			{
				window.alert("invalid master equipment code");
				document.form1.master_code.focus();
				return false;
			}
			else if(masterCode.length>10)
			{
				window.alert("invalid master equipment code");
				document.form1.master_code.focus();
				return false;
			}
			document.form1.calDate.value="";
			document.form1.calMonth.value="";
			document.form1.calYear.value="";
			document.form1.i_code.value="";
			document.form1.agency.value="";
			document.form1.master_name.value="";
			document.form1.date.value="";
			document.form1.month.value="";
			document.form1.year.value="";
			document.form1.dueDate.value="";
			document.form1.dueMonth.value="";
			document.form1.dueYear.value="";
			document.form1.traceability.value="";
			document.form1.temp.value="";
			document.form1.humidity.value="";
			return true;
		}
		else if(document.form1.update_field.value=="masterDate")
		{
			if(day=="" || month=="" || year=="")
			{
				window.alert("invalid calibration date for master equipment");
				return false;
			}
			else if(dateCheck(day,month,year)==false)
			{
				window.alert("invalid calibration date for master equipment");
				return false;
			}
			document.form1.master_date.value=year+"-"+month+"-"+day;
			document.form1.calDate.value="";
			document.form1.calMonth.value="";
			document.form1.calYear.value="";
			document.form1.i_code.value="";
			document.form1.agency.value="";
			document.form1.master_name.value="";
			document.form1.master_code.value="";
			document.form1.dueDate.value="";
			document.form1.dueMonth.value="";
			document.form1.dueYear.value="";
			document.form1.traceability.value="";
			document.form1.temp.value="";
			document.form1.humidity.value="";
			return true;
		}
		else if(document.form1.update_field.value=="dueDate")
		{
			if(dueDay=="" || dueMonth=="" || dueYear=="")
			{
				window.alert("invalid due date");
				return false;
			}
			else if(dateCheck(dueDay,dueMonth,dueYear)==false)
			{
				window.alert("invalid due date");
				return false;
			}
			document.form1.due_date.value=dueYear+"-"+dueMonth+"-"+dueDate;
			document.form1.calDate.value="";
			document.form1.calMonth.value="";
			document.form1.calYear.value="";
			document.form1.i_code.value="";
			document.form1.agency.value="";
			document.form1.master_name.value="";
			document.form1.master_code.value="";
			document.form1.date.value="";
			document.form1.month.value="";
			document.form1.year.value="";
			document.form1.traceability.value="";
			document.form1.temp.value="";
			document.form1.humidity.value="";
			return true;
		}
		else if(document.form1.update_field.value=="trac")
		{
			if(trac=="")
			{
				window.alert("please enter traceability");
				document.form1.traceability.focus();
				return false;
			}
			else if(trac.length>50)
			{
				window.alert("invalid traceability");
				document.form1.traceability.focus();
				return false;
			}
			document.form1.calDate.value="";
			document.form1.calMonth.value="";
			document.form1.calYear.value="";
			document.form1.i_code.value="";
			document.form1.agency.value="";
			document.form1.master_name.value="";
			document.form1.master_code.value="";
			document.form1.date.value="";
			document.form1.month.value="";
			document.form1.year.value="";
			document.form1.dueDate.value="";
			document.form1.dueMonth.value="";
			document.form1.dueYear.value="";
			document.form1.temp.value="";
			document.form1.humidity.value="";
			return true;
		}
		else if(document.form1.update_field.value=="temp")
		{
			if(temp=="")
			{
				window.alert("please enter temperature");
				document.form1.temp.focus();
				return false;
			}
			else if(temp.length>10)
			{
				window.alert("invalid temperature");
				document.form1.temp.focus();
				return false;
			}
			document.form1.calDate.value="";
			document.form1.calMonth.value="";
			document.form1.calYear.value="";
			document.form1.i_code.value="";
			document.form1.agency.value="";
			document.form1.master_name.value="";
			document.form1.master_code.value="";
			document.form1.date.value="";
			document.form1.month.value="";
			document.form1.year.value="";
			document.form1.dueDate.value="";
			document.form1.dueMonth.value="";
			document.form1.dueYear.value="";
			document.form1.traceability.value="";
			document.form1.humidity.value="";
			return true;
		}
		else if(document.form1.update_field.value=="humidity")
		{
			if(humidity=="")
			{
				window.alert("please enter humidity");
				document.form1.humidity.focus();
				return false;
			}
			else if(humidity.length>10)
			{
				window.alert("invalid humidity");
				document.form1.humidity.focus();
				return false;
			}
			document.form1.calDate.value="";
			document.form1.calMonth.value="";
			document.form1.calYear.value="";
			document.form1.i_code.value="";
			document.form1.agency.value="";
			document.form1.master_name.value="";
			document.form1.master_code.value="";
			document.form1.date.value="";
			document.form1.month.value="";
			document.form1.year.value="";
			document.form1.dueDate.value="";
			document.form1.dueMonth.value="";
			document.form1.dueYear.value="";
			document.form1.traceability.value="";
			document.form1.temp.value="";
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


  <h1>Update Calibration Log</h1>
  <c:if test="${pageContext.request.method=='POST'}">
                    <c:catch var="exception">
                        <sql:update var="updateCalibrationLog" dataSource="jdbc/plantmaintenance">
                            UPDATE calibrationLog
                            SET <%=request.getParameter("update_field")%> = '<%=sel_field(request)%>'
                            WHERE clNo='<%=request.getParameter("cl_no")%>'
                            <%!
                        
                            public String sel_field(ServletRequest request)
                            {
                                String update_value=null;
                                if(request.getParameter("cal_date")!="")
                                {
                                    update_value=request.getParameter("cal_date");
                                }
                                else if(request.getParameter("i_code")!="")
                                {
                                    update_value=request.getParameter("i_code");
                                }
                                else if(request.getParameter("master_date")!="")
                                {
                                    update_value=request.getParameter("master_date");
                                }
                                else if(request.getParameter("due_date")!="")
                                {
                                     update_value=request.getParameter("due_date");
                                }                                
				else if(request.getParameter("agency")!="")
                                {
                                     update_value=request.getParameter("agency");
                                }
				else if(request.getParameter("master_name")!="")
                                {
                                     update_value=request.getParameter("master_name");
                                }
				else if(request.getParameter("remarks")!="")
                                {
                                     update_value=request.getParameter("remarks");
                                }
                                else if(request.getParameter("master_code")!="")
                                {
                                     update_value=request.getParameter("master_code");
                                }
                                else if(request.getParameter("humidity")!="")
                                {
                                     update_value=request.getParameter("humidity");
                                }
                                else if(request.getParameter("traceability")!="")
                                {
                                     update_value=request.getParameter("traceability");
                                }
				return update_value;
                            }
                            %>
                        </sql:update>
                        <c:choose>
                            <c:when test="${updateCalibrationLog>=1}">
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
<form name="form1" method="post" action="" onsubmit="return validate();">
		<table align="center">
    			<tr>
        			<td><strong>Calibration Log Number</strong>
				<td><input type="text" name="cl_no">

	 		<tr>
              			<td>Select Field</td>
              			<td>
					<select name="update_field">
						<option value="iCode">Instrument Code
						<option value="doneDate">Calibration date
						<option value="agency">Agency
						<option value="miName">Name of master equipment
						<option value="miCode">Master equipment code
						<option value="micalibrationDate">Date
						<option value="midueDate">Due Date
						<option value="traceability">Traceability
						<option value="temperature">Temperature
						<option value="humidity">Humidity
						<option value="remarks">Remarks
					</select>

		</table>
		<table align="center">
			<tr>
     				<td colspan=2 align=center><strong>Enter new values</strong></td></tr>
			<tr>
				<td>Instrument Code:
				<td align="right"><input type="text" name="i_code">
			<tr>
				<td>Calibration Date:
				<td align="right">

					<select name="calDate">
						<option>Day
						<option value=1>1<option value=2>2<option value=3>3<option value=4>4<option value=5>5
						<option value=6>6<option value=7>7<option value=8>8<option value=9>9<option value=10>10
						<option value=11>11<option value=12>12<option value=13>13<option value=14>14<option value=15>15
						<option value=16>16<option value=17>17<option value=18>18<option value=19>19<option value=20>20
						<option value=21>21<option value=22>22<option value=23>23<option value=24>24<option value=25>25
						<option value=26>26<option value=27>27<option value=28>28<option value=29>29<option value=30>30
						<option value=31>31
					</select>

					<select name="calMonth">
						<option>Month
						<option value=01>January<option value=02>February<option value=03>March
						<option value=04>April<option value=05>May<option value=06>June
						<option value=07>July<option value=08>August<option value=09>September
						<option value=10>October<option value=11>November
						<option value=12>December
					</select>

					<select name="calYear">
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
				<td>Agency (only for outhouse calibration):
				<td align="right"><textarea name="agency" cols=20 rows=5>In-house</textarea>
			<tr>
				<td>Name of Master Equipment:
				<td align="right"><input type="text" name="master_name">
			<tr>
				<td>Master Equipment Code:
				<td align="right"><input type="text" name="master_code">
			<tr>

				<td>Date:
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

				<td>Due Date:
					<select name="dueDate">
						<option>Day
						<option value=1>1<option value=2>2<option value=3>3<option value=4>4<option value=5>5
						<option value=6>6<option value=7>7<option value=8>8<option value=9>9<option value=10>10
						<option value=11>11<option value=12>12<option value=13>13<option value=14>14<option value=15>15
						<option value=16>16<option value=17>17<option value=18>18<option value=19>19<option value=20>20
						<option value=21>21<option value=22>22<option value=23>23<option value=24>24<option value=25>25
						<option value=26>26<option value=27>27<option value=28>28<option value=29>29<option value=30>30
						<option value=31>31
					</select>

					<select name="dueMonth">
						<option>Month
						<option value=01>January<option value=02>February<option value=03>March
						<option value=04>April<option value=05>May<option value=06>June
						<option value=07>July<option value=08>August<option value=09>September
						<option value=10>October<option value=11>November
						<option value=12>December
					</select>

					<select name="dueYear">
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
				<td>Traceability: &nbsp;<input type="text" name="traceability">
			<tr>
				<td>Temperature: <input type="text" name="temp">
				<td align="right">Humidity: <input type="text" name="humidity">
			<tr>
				<td>Remarks
					<select name="remarks">
						<option value="ok">OK
						<option value="repair">Repair
					</select>

			<tr>
				<td>&nbsp;
				<td>
					<input type="submit" name="submit" value="Submit">
					<input type="reset" name="reset" value="Reset">
		</table>
		<input type="hidden" name="cal_date">
		<input type="hidden" name="master_date">
		<input type="hidden" name="due_date">

	</form>

  </div>
  <div class="footer">
    <p>© 2010-2011 Presstech India Pvt Ltd.  </p>
  </div>
</div>
</body>
</html>
