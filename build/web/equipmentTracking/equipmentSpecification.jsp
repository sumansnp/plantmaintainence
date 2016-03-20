<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<link href="css/oneColFixCtrHdr.css" rel="stylesheet" type="text/css" />
<link href="css/twoColFixLtHdr.css" rel="stylesheet" type="text/css" />
<title>Equipment Tracking - Equipment Specification</title>
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
		var ecode=trim(document.form2.txteCode.value);
		if(ecode=="")
		{
			window.alert("please enter equipment code");
			document.form2.txteCode.focus();
			return false;
		}
		else if(ecode.length<=1)
		{
			window.alert("invalid equipment code");
			document.form2.txteCode.focus();
			return false;
		}
		else if(ecode.length>10)
		{
			window.alert("invalid equipment code");
			document.form2.txteCode.focus();
			return false;
		}
	}
        function validate1()
        {
            var ename=trim(document.form1.txteName.value);
            if(ename=="")
            {
                window.alert("please select equipment name");
                document.form1.txteName.focus();
                return false;
            }
            else if(ename.length<3 || ename.length>40)
            {
                window.alert("invalid equipment name");
                document.form1.txteName.focus();
                return false;
            }

        }
        function suggestName( level )
{
document.getElementById("s1").style.visibility="visible";
document.form1.eNameList.size=6;
if ( isNaN( level ) ) { level = 1 }

var f = document.form1;
var listbox = f.eNameList;
var textbox = f.txteName;

var soFar = textbox.value.toString();
var soFarLeft = soFar.substring(0,level).toLowerCase();
var matched = false;
var suggestion = '';
for ( var m = 0; m < listbox.length; m++ ) {
suggestion = listbox.options[m].text.toString();
suggestion = suggestion.substring(0,level).toLowerCase();
if ( soFarLeft == suggestion ) {
listbox.options[m].selected = true;
matched = true;
break;
}
}
if ( matched && level < soFar.length ) { level++; suggestName(level) }
if(document.form1.txteName.value=="")
{
	document.getElementById("s1").style.visibility="hidden";
}
}
function invisible()
{
        document.getElementById("s1").style.visibility="hidden";    
}
function set()
{
    var index=document.getElementById("s1").selectedIndex;
    var list=document.getElementById("s1").options;
    document.form1.txteName.value=list[index].text;
    document.getElementById("s1").style.visibility="hidden";
}
</script>
</head>

<body onload="invisible();">

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
      <sql:query dataSource="jdbc/plantmaintenance" var="equipmentlist">
          select distinct eName from equipmentlist
      </sql:query>
    <h1>Equipment Specification </h1>
    <p>&nbsp;</p>
    <h4>Search equipment by Name</h4>
    <form name ="form1" method="post" action="equipmentSpecificationByName.jsp" onSubmit="return validate1();">
    <table width="80%" border="1" align="center">
      <tr>
        <td width="50%">Enter Equipment Name</td>
        <td>
          <input type="text" name="txteName" id="icode" onKeyUp="suggestName();" />
          <input type="submit" name="btn_view" id="btn_view" value="Search" /><br/>
        </td>
        </tr>
    </table>
        <table align="center" width="80%">
            <tr>
                <td width="50%">&nbsp;<br/><br/><br/><br/><br/></td>
                <td rowspan="5">
                    <select name="eNameList" id="s1" onclick="set();">
                    <c:forEach var="rows" items="${equipmentList.rows}">
                        <option value=<c:out value="${rows.eName}"/>><c:out value="${rows.eName}"/></option>
                    </c:forEach>
                    </select>
                </td>
                </tr>
        </table>
    </form>   
    <h4>Search equipment by ID</h4>
    <form name="form2" action="equipmentSpecificationReport.jsp" onsubmit="return validate();">
        <table border="1" width="80%" align="center">
                <tr>
                    <td width="50%">Enter Equipment Code</td>
                    <td><input type="text" name="txteCode" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td align="right">
                        <input type="submit" name="btn_view" id="btn_view" value="View"/>
                        <input type="reset" name="btn_reset" id="btn_reset" value="Reset"/>
                    </td>
                </tr>
        </table>
    </form>
    <p>&nbsp;</p>
<p><a href="equipmentSpecificationSummaryReport.jsp">View Equipment Specification of All Equipments</a></p>
    <p>&nbsp;</p>   
 </div>
  <div class="footer">
    <p>© 2010-2011 Presstech India Pvt Ltd.  </p>
</div>
 </div>
</body>
</html>
