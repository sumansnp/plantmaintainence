<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<link href="css/oneColFixCtrHdr.css" rel="stylesheet" type="text/css" />
<link href="css/twoColFixLtHdr.css" rel="stylesheet" type="text/css" />
<title>Equipment Tracking - Add Instrument Details</title>
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
	  var iName=trim(document.addInstrument.i_name.value);
	  var iCode=trim(document.addInstrument.i_code.value);
	  var range=trim(document.addInstrument.range.value);
	  var make=trim(document.addInstrument.make.value);
	  var leastCount=trim(document.addInstrument.least_count.value);
	  var accuracy=trim(document.addInstrument.accuracy.value);
	  var location=trim(document.addInstrument.location.value);
	  var day=document.addInstrument.day.value;
	  var month=document.addInstrument.month.value;
	  var year=document.addInstrument.year.value;
	  var freq=trim(document.addInstrument.frequency.value);
	  if(iName=="")
	  {
		  window.alert("please enter instrument name");
		  document.addInstrument.i_name.focus();
		  return false;
	  }
	  else if(iName.length<=3)
	  {
		  window.alert("invalid instrument name");
		  document.addInstrument.i_name.focus();
		  return false;
	  }
	  else if(iName.length>=40)
	  {
		  window.alert("invalid instrument name");
		  document.addInstrument.i_name.focus();
		  return false;
	  }
	  else if(iCode=="")
	  {
		  window.alert("please enter instrument code");
		  document.addInstrument.i_code.focus();
		  return false;
	  }
	  else if(iCode.length<=1)
	  {
		  window.alert("invalid instrument code");
		  document.addInstrument.i_code.focus();
		  return false;
	  }
	  else if(iCode.length>=10)
	  {
		  window.alert("invalid instrument code");
		  document.addInstrument.i_code.focus();
		  return false;
	  }
	  else if(range=="")
	  {
		  window.alert("please enter range");
		  document.addInstrument.range.focus();
		  return false;
	  }
	  else if(range.range>=15)
	  {
		  window.alert("invalid range");
		  document.addInstrument.range.focus();
		  return false;
	  }
	  else if(make.length>=15)
	  {
		  window.alert("invalid make and sr. no.");
		  document.addInstrument.make.focus();
		  return false;
	  }
	  else if(leastCount=="")
	  {
		  window.alert("please enter least count");
		  document.addInstrument.least_count.focus();
		  return false;
	  }
	  else if(leastCount.length>=10)
	  {
		  window.alert("invalid least count");
		  document.addInstrument.least_count.focus();
		  return false;
	  }
	  else if(accuracy=="")
	  {
		  window.alert("please enter accuracy");
		  document.addInstrument.accuracy.focus();
		  return false;
	  }
	  else if(accuracy.length>=10)
	  {
		  window.alert("invalid accuracy");
		  document.addInstrument.accuracy.focus();
		  return false;
	  }
	  else if(location=="")
	  {
		  window.alert("please enter location");
		  document.addInstrument.location.focus();
		  return false;
	  }
	  else if(location.length>=30)
	  {
		  window.alert("invalid location");
		  document.addInstrument.location.focus();
		  return false;
	  }
	   else if(freq=="")
	{
		window.alert("please enter frequency");
		document.addInstrument.frequency.focus();
		return false;
	}
	else if(isNaN(freq))
	{
		window.alert("frequency must be a numeric value");
		  document.addInstrument.frequency.focus();
		return false;
	}
	  else if (day=="" || month=="" || year=="")
	{
		window.alert("Please enter valid date");             
		return false;
	}
	else if(year%4==0)
	{
	   switch(month)	
	   {
				  case "02":
					  if(day>29)
					  {
						  window.alert("invalid date");
						  return false;
					  }
				  case "04":
					  if(day==31)
					  {
						  window.alert("invalid date");
						  return false;
					  }
				  case "06":
					  if(day==31)
					  {
						  window.alert("invalid date");
						  return false;
					  }
				  case "09":
					  if(day==31)
					  {
						  window.alert("invalid date");
						  return false;
					  }
				  case "11":
					  if(day==31)
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
					  if(day>28)
					  {
						  window.alert("invalid date");
						  return false;
					  }
				  case "04":
					  if(day==31)
					  {
						  window.alert("invalid date");
						  return false;
					  }
				  case "06":
					  if(day==31)
					  {
						  window.alert("invalid date");
						  return false;
					  }
				  case "09":
					  if(day==31)
					  {
						  window.alert("invalid date");
						  return false;
					  }
				  case "11":
					  if(day==31)
					  {
						  window.alert("invalid date");
						  return false;
					  }	
			  }
			  
		  }
		  document.addInstrument.acq_date.value=year+"-"+month+"-"+day;
		  return true;    	
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
<h1>Add Instrument Details</h1>
<c:if test="${pageContext.request.method=='POST'}">
<c:catch var="exception">
					  <sql:update var="addInstrument" dataSource="jdbc/plantmaintenance">
						  
						  insert into instrumentList(`iCode`,`iName`,`range`,`makeAndSerialNo`,`measurementType`,`leastCount`,`accuracy`,`location`,`frequencyCalibrationYear`,`typeCalibration`,`acquisitionDate`)
                                                  values (?,?,?,?,?,?,?,?,?,?,?)
						  <sql:param value="${param.i_code}" />
						  <sql:param value="${param.i_name}" />
						  <sql:param value="${param.range}" />
						  <sql:param value="${param.make}" />
						  <sql:param value="${param.m_type}" />
                                                  <sql:param value="${param.least_count}" />
                          <sql:param value="${param.accuracy}" />
                          <sql:param value="${param.location}" />
                          <sql:param value="${param.frequency}" />
                          <sql:param value="${param.cal_type}" />
                          <sql:param value="${param.acq_date}" />
					  </sql:update>
					  <c:if test="${addInstrument>=1}">
						  <center><h3> Data inserted successfully.</h3></center>
						  </c:if>
					  </c:catch>
					  <c:if test="${exception!=null}">
						  <c:out value="Unable to insert data in database." />
					  </c:if>
				  </c:if>       
  <form method="post" action="" name="addInstrument" onSubmit="return validate();">
	  <table border=1 width=80% align=center>
		  <tr>
			  <td>Instrument Name
			  <td><input type="text" name="i_name">
		  <tr>
			  <td>Instrument Code
			  <td><input type="text" name="i_code"> 
		  <tr>
			  <td>Range
			  <td><input type="text" name="range">
		  <tr>
			  <td>Make and Sr. No.
			  <td><input type="text" name="make">
		  <tr>
			  <td>Measurement Type
			  <td>
				  <select name="m_type">
					  <option value="Physical Dimension">Physical Dimension
					  <option value="Electrical Type">Electrical Type
					  <option value="Pressure Type">Pressure Type
					  <option value="Thermal Type">Thermal Type
					  <option value="Contact Type">Contact Type
					  <option value="Durational Type">Durational Type
				  </select>
		  <tr>
			  <td>Least Count
			  <td><input type="text" name="least_count">
		  <tr>
			  <td>Accuracy
			  <td><input type="text" name="accuracy">
		  <tr>
			  <td>Location
			  <td><input type="text" name="location">
		  <tr>
			  <td>Frequency of Calibration(in Years)
			  <td><input type="text" name="frequency">
		  <tr>
			  <td>Type of Calibration
			  <td>	
				  <input type="radio" name="cal_type" value="INHOUSE">Inhouse
				  <input type="radio" name="cal_type" checked value="OUTHOUSE">Outhouse
		  <tr>
			  <td>Acquisition Date
			  <td><select name="day">
					  
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
				  </select></td>				
		  <tr>
			  <td>&nbsp;
			  <td align="right">
				  <input type="submit" name="savebtn" value="Save">
				  <input type="reset" name="reset" value="Reset">		
	  </table>	
	  <input type=hidden name="acq_date">
  </form>
</div>
<div class="footer">
  <p>© 2010-2011 Presstech India Pvt Ltd. </p>
</div>
</div>
</body>
</html>
