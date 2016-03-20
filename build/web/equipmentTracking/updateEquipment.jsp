<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<link href="css/oneColFixCtrHdr.css" rel="stylesheet" type="text/css" />
<link href="css/twoColFixLtHdr.css" rel="stylesheet" type="text/css" />
<title>Equipment Tracking - Update Equipment Details</title>
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
        
        var eCodeOld=trim(document.form1.txteCodeOld.value);
        if(eCodeOld=="")
        {
            window.alert("please enter equipment code");
       
            return false;
        }
        else if(eCodeOld.length<=1 || eCodeOld.length>10)
        {
            window.alert("invalid equipment code");
          
            return false;
        }		
        else if(document.form1.update_field.value=="eName")
        {
            document.getElementById("2").disabled=true;
            var ename=trim(document.form1.txteName.value);
            if(ename=="")
            {
                window.alert("please enter equipment name");
     
                return false;
            }
            else if(ename.length<3||ename.length>40)
            {
                window.alert("invalid equipment name");
     
                return false;
            }				
            document.form1.txteCodeNew.value="";
            document.form1.txtFrequency.value="";
            document.form1.txtCapacity.value="";
            document.form1.txtacqDate.value="";
            return true;					
        }
        else if(document.form1.update_field.value=="eCode")
        {
            var eCodeNew=trim(document.form1.txteCodeNew.value);
            if(eCodeNew=="")
            {
                window.alert("please enter equipment code");
        
                return false;
            }
            else if(eCodeNew.length<=1 ||eCodeNew.length>10)
            {
                window.alert("invalid equipment code");
    
                return false;
            }
            document.form1.txteName.value="";
            document.form1.txtFrequency.value="";
            document.form1.txtCapacity.value="";
			document.form1.txtacqDate.value="";
            return true;					
        }
        else if(document.form1.update_field.value=="frequencyMaintenanceMonth")
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
            document.form1.txteCodeNew.value="";
            document.form1.txteName.value="";
            document.form1.txtCapacity.value="";
			document.form1.txtacqDate.value="";
            return true;					
        }
        else if(document.form1.update_field.value=="capacity")
        {
            var cap=trim(document.form1.txtCapacity.value);
            if(cap=="")
            {
                window.alert("please enter capacity");
   
                return false;
            }
            else if(cap.length>10)
            {
                window.alert("Invalid capacity");
        
                return false;
            }
            document.form1.txteCodeNew.value="";
            document.form1.txtFrequency.value="";
            document.form1.txteName.value="";
			document.form1.txtacqDate.value="";
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
                  
              }
              document.form1.txtacqDate.value=year+"-"+month+"-"+day;
			  document.form1.txteCodeNew.value="";
              document.form1.txtFrequency.value="";
              document.form1.txteName.value="";
			  document.form1.txtCapacity.value="";
			  return true;
		}
    }
    function disable()
    {
        var index=document.getElementById("update").selectedIndex;
        switch(index)
        {
            case 0:
                document.getElementById("2").disabled=true;
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
  <h1>Update Equipment Details</h1>
  <c:if test="${pageContext.request.method=='POST'}">
                    <c:catch var="exception">
                        <sql:update var="updateEquipment" dataSource="jdbc/plantmaintenance">
                            UPDATE equipmentlist
                            SET <%=request.getParameter("update_field")%> = '<%=sel_field(request)%>'
                            WHERE eCode='<%=request.getParameter("txteCodeOld")%>'
                            <%!
                        
                            public String sel_field(ServletRequest request)
                            {
                                String update_value=null;
                                if(request.getParameter("txteName")!="")
                                {
                                    update_value=request.getParameter("txteName");
                                }
                                else if(request.getParameter("txteCodeNew")!="")
                                {
                                    update_value=request.getParameter("txteCodeNew");
                                }
                                else if(request.getParameter("txtCapacity")!="")
                                {
                                    update_value=request.getParameter("txtCapacity");
                                }
                                else if(request.getParameter("txtFrequency")!="")
                                {
                                     update_value=request.getParameter("txtFrequency");
                                }                                
								else if(request.getParameter("txtacqDate")!="")
                                {
                                     update_value=request.getParameter("txtacqDate");
                                }
                                return update_value;
                            }
                            %>
                        </sql:update>
                        <c:choose>
                            <c:when test="${updateEquipment>=1}">
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
  <p>&nbsp;</p>                
  <table width="80%" border=1 align="center">
            <tr>
                <td width="50%">Enter Equipment Code</td>
                <td width="50%"><input type="text" name="txteCodeOld"></td>
            </tr>
            <tr>
                <td width="50%">Select Field</td>
        <td width="50%">
        	<select name="update_field" id="update" style="width:145px" onclick="disable();">
                    <option value="eName">Equipment Name</option>
                    <option value="eCode">Equipment Code</option>
                    <option value="capacity">Capacity</option>
                    <option value="frequencyMaintenanceMonth">Frequency</option>
                    <option value="acquisitionDate">Acquisition Date</option>
            </select>
            </td>
            </tr>
        </table>
        <table width="80%" border="1" align="center">
            <tr><td colspan=2>&nbsp;</td></tr>
            <tr>
                 <td width="50%">Equipment Name</td>
                 <td width="50%"><input type="text" name="txteName"></td>
            </tr>
            <tr>
                 <td>Equipment Code</td>
                 <td><input type="text" id="2" name="txteCodeNew"></td>
            </tr>
            <tr>
                 <td>Capacity</td>
                 <td><input type="text" name="txtCapacity"></td>
            </tr>
            <tr>
                 <td>Frequency</td>
                 <td><input type="text" name="txtFrequency"></td>
            </tr>
            <tr>
                  <td>Due Date
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
                 <td><input type="submit" name="btn_update" id="btn_update" value="Update" />
                 <input type="reset" name="btn_reset" id="btn_reset" value="Reset" />
                 </td>
            </tr>
           </table>
           <input type=hidden name="txtacqDate" />
 <p>&nbsp;</p>
 <p>&nbsp;</p>
 <p>&nbsp;</p>
</form>
 </div>
  <div class="footer">
<p>© 2010-2011 Presstech India Pvt Ltd.  </p>
</div>
</div>
</body>
</html>
