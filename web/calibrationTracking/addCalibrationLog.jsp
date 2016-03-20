<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Calibration Tracking - Add Calibration Log</title>
<link href="css/oneColFixCtrHdr.css" rel="stylesheet" type="text/css" />
<link href="css/twoColFixLtHdr.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
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
		document.form1.i_code.value=document.form2.i_code.value;
		document.form1.cs_no.value=document.form2.cs_no.value;
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
		var std1=trim(document.form1.standard1.value);
		var std2=trim(document.form1.standard2.value);
		var std3=trim(document.form1.standard3.value);
		var std4=trim(document.form1.standard4.value);
		var std5=trim(document.form1.standard5.value);
		var std6=trim(document.form1.standard6.value);
		var std7=trim(document.form1.standard7.value);
		var std8=trim(document.form1.standard8.value);
		var std9=trim(document.form1.standard9.value);
		var std10=trim(document.form1.standard10.value);
		var obs1=trim(document.form1.observed1.value);
		var obs2=trim(document.form1.observed2.value);
		var obs3=trim(document.form1.observed3.value);
		var obs4=trim(document.form1.observed4.value);
		var obs5=trim(document.form1.observed5.value);
		var obs6=trim(document.form1.observed6.value);
		var obs7=trim(document.form1.observed7.value);
		var obs8=trim(document.form1.observed8.value);
		var obs9=trim(document.form1.observed9.value);
		var obs10=trim(document.form1.observed10.value);
		if(document.form1.cs_no.value=="")
		{
			window.alert("please select instrument code");
                        document.form2.i_code.focus();
			return false;
		}
		else if(calDay=="" || calMonth=="" || calYear=="")
		{
			window.alert("invalid calibration date");
			return false;
		}
		else if(dateCheck(calDay,calMonth,calYear)==false)
		{
			window.alert("invalid calibration date");
			return false;
		}
		else if(agency=="")
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
		else if(masterName=="")
		{
			window.alert("please enter name of master equipment");
			document.form1.master_name.focus();
			return false;
		}
		else if(masterCode=="")
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
		else if(day=="" || month=="" || year=="")
		{
			window.alert("invalid calibration date for master equipment");
			return false;
		}
		else if(dateCheck(day,month,year)==false)
		{
			window.alert("invalid calibration date for master equipment");
			return false;
		}
		else if(dueDay=="" || dueMonth=="" || dueYear=="")
		{
			window.alert("invalid due date");
			return false;
		}
		else if(dateCheck(dueDay,dueMonth,dueYear)==false)
		{
			window.alert("invalid due date");
			return false;
		}
		else if(trac=="")
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
		else if(temp=="")
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
		else if(humidity=="")
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
		else if(std1=="" || std2=="" || std3=="" || std4=="" || std5=="")
		{
			window.alert("please enter atleast five standard readings");
			return false;
		}
		else if(isNaN(std1) || isNaN(std2)  || isNaN(std3) || isNaN(std4) || isNaN(std5) || isNaN(std6) || isNaN(std7) || isNaN(std8) || isNaN(std9) || isNaN(std10))
		{
			window.alert("standard readings must be numeric values");
			return false;
		}
		else if(obs1=="" || obs2=="" || obs3=="" || obs4=="" || obs5=="")
		{
			window.alert("please enter atleast five observed readings");
			return false;
		}
		else if(isNaN(obs1) || isNaN(obs2)  || isNaN(obs3) || isNaN(obs4) || isNaN(obs5) || isNaN(obs6) || isNaN(obs7) || isNaN(obs8) || isNaN(obs9) || isNaN(obs10))
		{
			window.alert("observed readings must be numeric values");
			return false;
		}
		document.form1.cal_date.value=document.form1.calYear.value+"-"+document.form1.calMonth.value+"-"+document.form1.calDate.value;
		document.form1.master_date.value=document.form1.year.value+"-"+document.form1.month.value+"-"+document.form1.date.value;
		document.form1.due_date.value=document.form1.dueYear.value+"-"+document.form1.dueMonth.value+"-"+document.form1.dueDate.value;
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
        <sql:query var="iCodeList" dataSource="jdbc/plantmaintenance">
          SELECT iCode FROM calibrationschedule where csno not in (select csno from calibrationlog)
      </sql:query>
      <c:if test="${pageContext.request.method=='POST'}">
        <sql:query var="csnoList" dataSource="jdbc/plantmaintenance">
                SELECT csno FROM calibrationschedule where csno not in (select csno from calibrationlog) and iCode=?
                <sql:param value="${param.i_code}" />
        </sql:query>
      </c:if>
         <c:set var="csnovar" value="${csnoList.rows[0]}"/>
    <h1> Calibration Tracking</h1>    
  
       <font size="2">       
           <form name="form2" action="" method="post">
		<table border="1" width="58.4%">
			<tr>
				<td>Instrument Code:
				<td><select name="i_code" onchange="this.form.submit();" style="width:170px">
                                            <option value=<c:out value="${param.i_code}"/> selected> <c:out value="${param.i_code}"/>
                                        <c:forEach var="row" items="${iCodeList.rows}">
                                            <option value=<c:out value="${row.iCode}"/>><c:out value="${row.iCode}"/>
                                        </c:forEach>
                                    </select>
			<tr>
				<td>Calibration Schedule Number:
                                    <td><input type="text" name="cs_no" disabled="true" value=<c:out value="${csnovar.csno}"/>></input>
		</table>
	</form>
	<form name="form1" method="post" action="addCalibrationLogSuccess.jsp" onsubmit="return validate();">
		<table>

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
				<td colspan=2><table border=1 width="100%">

					<tr align="center">
						<th>Sr
						<th>Standard Value/<br>Reading Master Equipment
						<th>Observed Value
					<tr align="center">
						<td>1
						<td><input type="text" name="standard1" value="0">
						<td><input type="text" name="observed1" value="0">
					<tr align="center">
						<td>2
						<td><input type="text" name="standard2" value="0">

						<td><input type="text" name="observed2" value="0">
					<tr align="center">
						<td>3
						<td><input type="text" name="standard3" value="0">
						<td><input type="text" name="observed3" value="0">
					<tr align="center">
						<td>4
						<td><input type="text" name="standard4" value="0">
						<td><input type="text" name="observed4" value="0">
					<tr align="center">

						<td>5
						<td><input type="text" name="standard5" value="0">
						<td><input type="text" name="observed5" value="0">
					<tr align="center">
						<td>6
						<td><input type="text" name="standard6" value="0">
						<td><input type="text" name="observed6" value="0">
					<tr align="center">
						<td>7
						<td><input type="text" name="standard7" value="0">

						<td><input type="text" name="observed7" value="0">
					<tr align="center">
						<td>8
						<td><input type="text" name="standard8" value="0">
						<td><input type="text" name="observed8" value="0">
					<tr align="center">
						<td>9
						<td><input type="text" name="standard9" value="0">
						<td><input type="text" name="observed9" value="0">
					<tr align="center">

						<td>10
						<td><input type="text" name="standard10" value="0">
						<td><input type="text" name="observed10" value="0">
				</table></td>
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

		<input type="hidden" name="i_code">
		<input type="hidden" name="cs_no">
	</form>

           
       </font>
 

    </div>
  <div class="footer">
    <p>© 2010-2011 Presstech India Pvt Ltd.  </p>
  </div>
</div>
</body>
</html>
