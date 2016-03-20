<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>

<link href="css/oneColFixCtrHdr.css" rel="stylesheet" type="text/css" />
<link href="css/twoColFixLtHdr.css" rel="stylesheet" type="text/css" />
<title>Preventive Maintenance - Update Maintenance Schedule</title>
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
        var mno=trim(document.form1.m_no.value);
        var ecode=trim(document.form1.e_code.value);
        var day=document.form1.day.value;
        var month=document.form1.month.value;
        var year=document.form1.year.value;    
        if(mno=="")
        {
            window.alert("please enter maintenance schedule number");
            document.form1.m_no.focus();
            return false;
        }
        else if(isNaN(mno))
        {
            window.alert("maintenance schedule number must be a numeric value");
            document.form1.m_no.focus();
            return false;
        }
        else if (document.form1.update_field.value=="eCode")
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
            document.form1.due_date.value="";           
            return true;
        }
        else if (document.form1.update_field.value=="dueDate")
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
            document.form1.due_date.value=year+"-"+month+"-"+day;
            document.form1.ecode.value="";            
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
  <h1>Update Maintenance Schedule</h1>
  <c:if test="${pageContext.request.method=='POST'}">
                    <c:catch var="exception">
                        <sql:update var="updateMaintenanceSchedule" dataSource="jdbc/plantmaintenance">
                            UPDATE maintenanceSchedule
                            SET <%=request.getParameter("update_field")%> = '<%=sel_field(request)%>'
                            WHERE sno='<%=request.getParameter("m_no")%>'
                            <%!
                        
                            public String sel_field(ServletRequest request)
                            {
                                String update_value=null;
                                if(request.getParameter("e_code")!="")
                                {
                                    update_value=request.getParameter("e_code");
                                }
                                else if(request.getParameter("due_date")!="")
                                {
                                    update_value=request.getParameter("due_date");
                                }                                                              
                                return update_value;
                            }
                            %>
                        </sql:update>
                        <c:choose>
                            <c:when test="${updateMaintenanceSchedule>=1}">
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
    <td width="50%">Maintenance Schedule No. 
    <td width="50%"><input type="text" name="m_no">
      <tr>
                    <td width="50%">Select Field</td>
            <td width="50%">
            <select name="update_field" style="width:145px">            			
                        <option value="eCode">Equipment Code</option>
                        <option value="dueDate">Due Date</option>                        
                </select>
                </td>
                </tr>
            </table>
    <table border="1" align="center" width="80%">
            <tr>
                <td colspan=2 align=center>&nbsp;</td>
            </tr>
            <tr>
                <td width="50%">Equipment Code
                <td width="50%"><input type="text" name="e_code">
            <tr>
                <td>Due Date
                <td>
                    <select name="day">
                        <option value="">
                        <option value=1>1<option value=2>2<option value=3>3<option value=4>4<option value=5>5
                        <option value=6>6<option value=7>7<option value=8>8<option value=9>9<option value=10>10
                        <option value=11>11<option value=12>12<option value=13>13<option value=14>14<option value=15>15
                        <option value=16>16<option value=17>17<option value=18>18<option value=19>19<option value=20>20
                        <option value=21>21<option value=22>22<option value=23>23<option value=24>24<option value=25>25
                        <option value=26>26<option value=27>27<option value=28>28<option value=29>29<option value=30>30
                        <option value=31>31
                    </select>
                    <select name="month">
                        <option value="">
                        <option value=01>January<option value=02>February<option value=03>March
                        <option value=04>April<option value=05>May<option value=06>June
                        <option value=07>July<option value=08>August<option value=09>September
                        <option value=10>October<option value=11>November
                        <option value=12>December
                    </select>
                    <select name="year">
                        <option value="">
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
