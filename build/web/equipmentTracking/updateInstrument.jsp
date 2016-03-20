<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<link href="css/oneColFixCtrHdr.css" rel="stylesheet" type="text/css" />
<link href="css/twoColFixLtHdr.css" rel="stylesheet" type="text/css" />

<title>Equipment Tracking - Update Instrument Details</title>
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
        
        var iCodeOld=trim(document.form1.txtiCodeOld.value);
        if(iCodeOld=="")
        {
            window.alert("please enter instrument code");       
            return false;
        }
        else if(iCodeOld.length<=1 || iCodeOld.length>10)
        {
            window.alert("invalid instrument code");
          
            return false;
        }		
        else if(document.form1.update_field.value=="iName")
        {

            var iname=trim(document.form1.txtiName.value);
            if(iname=="")
            {
                window.alert("please enter instrument name");
     
                return false;
            }
            else if(iname.length<3||iname.length>40)
            {
                window.alert("invalid instrument name");
                return false;
            }				
            	document.form1.txtiCodeNew.value="";
		document.form1.txtFrequency.value="";
		document.form1.txtrange.value="";
		document.form1.txtmake.value="";
		document.form1.txtleastcount.value="";
		document.form1.txtaccuracy.value="";
		document.form1.txtlocation.value="";
		document.form1.m_type.value="";
		document.form1.c_type.value="";
		document.form1.acq_date.value="";
		document.form1.day.value="";
		document.form1.month.value="";
		document.form1.year.value="";
            return true;					
        }
        else if(document.form1.update_field.value=="iCode")
        {
            var iCodeNew=trim(document.form1.txtiCodeNew.value);
            if(iCodeNew=="")
            {
                window.alert("please enter instrument code");
        
                return false;
            }
            else if(iCodeNew.length<=1 ||iCodeNew.length>10)
            {
                window.alert("invalid instrument code");
    
                return false;
            }
           	document.form1.txtiName.value="";
		document.form1.txtFrequency.value="";
		document.form1.txtrange.value="";
		document.form1.txtmake.value="";
		document.form1.txtleastcount.value="";
		document.form1.txtaccuracy.value="";
		document.form1.txtlocation.value="";
		document.form1.m_type.value="";
		document.form1.c_type.value="";
		document.form1.acq_date.value="";
		document.form1.day.value="";
		document.form1.month.value="";
		document.form1.year.value="";
            return true;					
        }
        else if(document.form1.update_field.value=="frequencyCalibrationYear")
        {
            var freq=trim(document.form1.txtFrequency.value);
            if(freq=="")
            {
                window.alert("please enter frequency");
    
                return false;
            }
            else if(isNaN(freq))
            {
                window.alert("frequency must be a numeric value");
     
                return false;
            }
           	document.form1.txtiName.value="";
		document.form1.txtiCodeNew.value="";
		document.form1.txtrange.value="";
		document.form1.txtmake.value="";
		document.form1.txtleastcount.value="";
		document.form1.txtaccuracy.value="";
		document.form1.txtlocation.value="";
		document.form1.m_type.value="";
		document.form1.c_type.value="";
		document.form1.acq_date.value="";
		document.form1.day.value="";
		document.form1.month.value="";
		document.form1.year.value="";
            return true;					
        }
        else if(document.form1.update_field.value=="range")
        {
            var range=trim(document.form1.txtrange.value);		          
		   	if(range=="")
			{
				window.alert("please enter range");
				document.form1.txtrange.focus();
				return false;
			}
			else if(range.length>=15)
			{
				window.alert("invalid range");
				document.form1.txtrange.focus();
				return false;
			}  
		document.form1.txtiName.value="";
		document.form1.txtiCodeNew.value="";
		document.form1.txtFrequency.value="";
		document.form1.txtmake.value="";
		document.form1.txtleastcount.value="";
		document.form1.txtaccuracy.value="";
		document.form1.txtlocation.value="";
		document.form1.m_type.value="";
		document.form1.c_type.value="";
		document.form1.acq_date.value=""; 
		document.form1.day.value="";
		document.form1.month.value="";
		document.form1.year.value="";
		   return true;	   
          					
        }	
		else if(document.form1.update_field.value=="makeAndSerialNo")
		{
			var make=trim(document.form1.txtmake.value);
			if(make=="")
			{
				window.alert("please enter make & sr no.");
				document.form1.txtmake.focus();
				return false;
			}
			else if(make.length>=15)
			{
				window.alert("invalid make and sr. no.");
				document.form1.txtmake.focus();
				return false;
			}
		document.form1.txtiName.value="";
		document.form1.txtiCodeNew.value="";
		document.form1.txtFrequency.value="";
		document.form1.txtrange.value="";
		document.form1.txtleastcount.value="";
		document.form1.txtaccuracy.value="";
		document.form1.txtlocation.value="";
		document.form1.m_type.value="";
		document.form1.c_type.value="";
		document.form1.acq_date.value="";
		document.form1.day.value="";
		document.form1.month.value="";
		document.form1.year.value="";
		return true;
		}
		else if(document.form1.update_field.value=="leastCount")
		{
			var leastCount=trim(document.form1.txtleastcount.value);
			if(leastCount=="")
			{
				window.alert("please enter least count");
				document.form1.txtleastcount.focus();
				return false;
			}
			else if(leastCount.length>=10)
			{
				window.alert("invalid least count");
				document.form1.txtleastcount.focus();
				return false;
			}
		document.form1.txtiName.value="";
		document.form1.txtiCodeNew.value="";
		document.form1.txtFrequency.value="";
		document.form1.txtrange.value="";
		document.form1.txtmake.value="";
		document.form1.txtaccuracy.value="";
		document.form1.txtlocation.value="";
		document.form1.m_type.value="";
		document.form1.c_type.value="";
		document.form1.acq_date.value="";
		document.form1.day.value="";
		document.form1.month.value="";
		document.form1.year.value="";
		return true;
		}	
		else if(document.form1.update_field.value=="accuracy")
		{
			var accuracy=trim(document.form1.txtaccuracy.value);
			if(accuracy=="")
			{
				window.alert("please enter accuracy");
				document.form1.txtaccuracy.focus();
				return false;
			}
			else if(accuracy.length>=10)
			{
				window.alert("invalid accuracy");
				document.form1.txtaccuracy.focus();
				return false;
			}
		document.form1.txtiName.value="";
		document.form1.txtiCodeNew.value="";
		document.form1.txtFrequency.value="";
		document.form1.txtrange.value="";
		document.form1.txtmake.value="";
		document.form1.txtleastcount.value="";
		document.form1.txtlocation.value="";
		document.form1.m_type.value="";
		document.form1.c_type.value="";
		document.form1.acq_date.value="";
		document.form1.day.value="";
		document.form1.month.value="";
		document.form1.year.value="";
		return true;
		}
		else if(document.form1.update_field.value=="location")
		{
			var location=trim(document.form1.txtlocation.value);
			if(location=="")
			{
				window.alert("please enter location");
				document.form1.txtlocation.focus();
				return false;
			}
			else if(location.length>=30)
			{
				window.alert("invalid location");
				document.form1.txtlocation.focus();
				return false;
			}
		document.form1.txtiName.value="";
		document.form1.txtiCodeNew.value="";
		document.form1.txtFrequency.value="";
		document.form1.txtrange.value="";
		document.form1.txtmake.value="";
		document.form1.txtleastcount.value="";
		document.form1.txtaccuracy.value="";
		document.form1.m_type.value="";
		document.form1.c_type.value="";
		document.form1.acq_date.value="";
		document.form1.day.value="";
		document.form1.month.value="";
		document.form1.year.value="";
		return true;
		}
		else if(document.form1.update_field.value=="measurementType")
		{
			if (document.form1.m_type.value=="")
			{
				window.alert("select measurement type");
				return false;
			}
		document.form1.txtiName.value="";
		document.form1.txtiCodeNew.value="";
		document.form1.txtFrequency.value="";
		document.form1.txtrange.value="";
		document.form1.txtmake.value="";
		document.form1.txtleastcount.value="";
		document.form1.txtaccuracy.value="";
		document.form1.txtlocation.value="";
		document.form1.c_type.value="";
		document.form1.acq_date.value="";
		document.form1.day.value="";
		document.form1.month.value="";
		document.form1.year.value="";
		return true;
		}
		else if(document.form1.update_field.value=="typeCalibration")
		{
			if (document.form1.c_type.value=="")
			{
				window.alert("select calibration type");
				return false;
			}
		document.form1.txtiName.value="";
		document.form1.txtiCodeNew.value="";
		document.form1.txtFrequency.value="";
		document.form1.txtrange.value="";
		document.form1.txtmake.value="";
		document.form1.txtleastcount.value="";
		document.form1.txtaccuracy.value="";
		document.form1.txtlocation.value="";
		document.form1.m_type.value="";
		document.form1.acq_date.value="";
		document.form1.day.value="";
		document.form1.month.value="";
		document.form1.year.value="";
		return true;
		}		
		else if(document.form1.update_field.value=="acquisitionDate")
		{
			var day=document.form1.day.value;
          	var month=document.form1.month.value;
          	var year=document.form1.year.value;
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
                document.form1.txtiName.value="";
		document.form1.txtiCodeNew.value="";
		document.form1.txtFrequency.value="";
		document.form1.txtrange.value="";
		document.form1.txtmake.value="";
		document.form1.txtleastcount.value="";
		document.form1.txtaccuracy.value="";
		document.form1.txtlocation.value="";
		document.form1.m_type.value="";
		document.form1.c_type.value="";
		return true;
              }
              document.form1.acq_Date.value=year+"-"+month+"-"+day;
			  
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
    <h1>Update Instrument Details</h1>
      <c:if test="${pageContext.request.method=='POST'}">
                    <c:catch var="exception">
                        <sql:update var="updateInstrumentList" dataSource="jdbc/plantmaintenance">
                            UPDATE instrumentList
                            SET <%=request.getParameter("update_field")%> = '<%=sel_field(request)%>'
                            WHERE iCode='<%=request.getParameter("txtiCodeOld")%>'
                            <%!
                        
                            public String sel_field(ServletRequest request)
                            {
                                String update_value=null;
                                if(request.getParameter("txtiName")!="")
                                {
                                    update_value=request.getParameter("txtiName");
                                }
                                else if(request.getParameter("txtiCodeNew")!="")
                                {
                                    update_value=request.getParameter("txtiCodeNew");
                                }
                                else if(request.getParameter("txtrange")!="")
                                {
                                    update_value=request.getParameter("txtrange");
                                }
                                else if(request.getParameter("txtmake")!="")
                                {
                                     update_value=request.getParameter("txtmake");
                                }                                
								else if(request.getParameter("m_type")!="")
                                {
                                     update_value=request.getParameter("m_type");
                                }
								else if(request.getParameter("txtleastcount")!="")
                                {
                                     update_value=request.getParameter("txtleastcount");
                                }
								else if(request.getParameter("txtaccuracy")!="")
                                {
                                     update_value=request.getParameter("txtaccuracy");
                                }
								else if(request.getParameter("txtlocation")!="")
                                {
                                     update_value=request.getParameter("txtlocation");
                                }
								else if(request.getParameter("txtFrequency")!="")
                                {
                                     update_value=request.getParameter("txtFrequency");
                                }								
								else if(request.getParameter("c_type")!="")
                                {
                                     update_value=request.getParameter("c_type");
                                }
								else if(request.getParameter("acq_date")!="")
                                {
                                     update_value=request.getParameter("acq_date");
                                }
                                return update_value;
                            }
                            %>
                        </sql:update>
                        <c:choose>
                            <c:when test="${updateInstrumentList>=1}">
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
    <form name="form1" method="post" action="" onSubmit="return validate();">    
     <table width="80%" border=1 align="center">
      <tr>
        <td width="50%">Enter Instrument Code</td>
        <td width="50%"><input name="txtiCodeOld" type="text"></td>
      </tr>
       <tr>
        <td width="50%">Select Field</td>
        <td width="50%">
           <select name="update_field" style="width:165px">
        	  <option value="iName">Instrument Name</option>
        	  <option value="iCode">Instrument Code</option>
        	  <option value="range">Range</option>
        	  <option value="makeAndSerialNo">Make and Sr. No.</option>
        	  <option value="measurementType">Measurement Type</option>
        	  <option value="leastCount">Least Count</option>
        	  <option value="accuracy">Accuracy</option>
        	  <option value="location">Location</option>
        	  <option value="frequencyCalibrationYear">Frequency of Calibration</option>
        	  <option value="typeCalibration">Type of Calibration</option>
               <option value="acquisitionDate">Acquisition Date</option>
            </select>
         </td>
      </tr>
      </table>
     <table width="80%" border="1" align="center">
   <tr><td colspan=2>&nbsp;</td></tr>
           <tr>
				<td width="50%">Instrument Name
				<td width="50%"><input type="text" name="txtiName">
			<tr>
				<td>Instrument Code
				<td><input type="text" name="txtiCodeNew">
			<tr>
				<td>Range
				<td><input type="text" name="txtrange">
			<tr>
				<td>Make and Sr. No.
				<td><input type="text" name="txtmake">		
			<tr>
				<td>Measurement Type
				<td>
					<select name="m_type">
                    	<option>
						<option value="Physical Dimension">Physical Dimension
						<option value="Electrical Type">Electrical Type
						<option value="Pressure Type">Pressure Type
						<option value="Thermal Type">Thermal Type
						<option value="Contact Type">Contact Type
						<option value="Durational Type">Durational Type
					</select>
			<tr>
				<td>Least Count
				<td><input type="text" name="txtleastcount">
			<tr>
				<td>Accuracy
				<td><input type="text" name="txtaccuracy">
			<tr>
				<td>Location
				<td><input type="text" name="txtlocation">
			<tr>
				<td>Frequency of Calibration (in Years)
				<td><input type="text" name="txtFrequency">
					
			<tr>
				<td>Type of Calibration
				<td>	
					<select name="c_type">
                    	<option>
                    	<option value="Inhouse">Inhouse
                        <option value="Outhouse">Outhouse
                    </select>
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
            </tr>
      <tr>
        <td>&nbsp;</td>
        <td>
          <input type="submit" name="btn_update" id="btn_update" value="Update"/>
          <input type="reset" name="btn_reset" id="btn_reset" value="Reset" />
        </td>
      </tr>
  </table>
     <input type=hidden name="acq_date">
    </form>
</div>
  <div class="footer">
    <p>© 2010-2011 Presstech India Pvt Ltd.  </p>
   </div>
</div>
</body>
</html>
