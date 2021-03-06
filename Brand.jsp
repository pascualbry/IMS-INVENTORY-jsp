<%@ page import="Database.Variable_Brand"%>
<%@ page import="CRUD.Get_Value"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>

<%
	response.setHeader("Cache-Control", "no-cache, no-store, must revalidate");
	
	if(session.getAttribute("email")==null)	
		response.sendRedirect("/IMS/Login.jsp");
%>

<head>
  <title>Brand</title>
  <link rel = "icon" href = "/IMS/PICTURE/icon.png" type = "image/x-icon"> 
  <link rel = "icon" href = "icon.png" type = "image/x-icon"> 
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel = "stylesheet" type = "text/css" href = "/IMS/CSS/Brand.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script type="text/javascript" src="sort-table.js"></script>
  <script src="/IMS/JS/search.js"></script>
  <script src="/IMS/JS/pagenumber.js"></script>
  <script src="/IMS/JS/sort-table.js"></script>
</head>

<body>
<div class="navbar">
  <div class="heading">
    <a href="/IMS/DASHBOARD/Dashboard.jsp">ORDER<br/>TRACKING<br/>SYSTEM</a>
  </div>
  <ul>
    <li class="unactive">
      <a href="/IMS/DASHBOARD/Dashboard.jsp">
      <div class="icon">
        <i class="fa fa-tachometer" aria-hidden="true"></i>
      </div>
      <div class="name" data-text="Dashboard">Dashboard</div>
      </a>
    </li>

    <li class="unactive">
      <a href="/IMS/PURCHASING/Purchasing.jsp">
      <div class="icon">
        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
      </div>
      <div class="name" data-text="Purchasing">Purchasing</div>
      </a>
    </li>

    <li class="unactive">
      <div class="dropdown">
        <button onclick="myFunction()" class="dropbtn">
          <div class="icon">
            <i class="fa fa-cubes" aria-hidden="true"></i>
          </div>
          <div class="name" data-text="Inventory">Inventory <i class="fa fa-angle-down" aria-hidden="true" font-size="14"></i></div>
        </button>
        <div id="myDropdown" class="dropdown-content">
          <a class="active">Brand</a>
          <a href="/IMS/INVENTORY/Category.jsp">Category</a>
          <a href="/IMS/INVENTORY/Product.jsp">Product</a>
          <a href="/IMS/INVENTORY/Archive.jsp">Archive</a>
        </div>
      </div>
    </li>

    <li class="unactive">
      <a href="/IMS/QUALITYCONTROL/QCG.jsp">
      <div class="icon">
        <i class="fa fa-check-square-o" aria-hidden="true"></i>
      </div>
      <div class="name" data-text="Quality Control">Quality Control</div>
      </a>
    </li>

    <li class="unactive">
      <a href="/IMS/DELIVERY/Delivery.jsp">
      <div class="icon">
        <i class="fa fa-truck" aria-hidden="true"></i>
      </div>
      <div class="name" data-text="Delivery">Delivery</div>
      </a>
    </li>

    <li class="unactive">
      <a href="/IMS/REPORTS/Reports.jsp">
      <div class="icon">
        <i class="fa fa-line-chart" aria-hidden="true"></i>
      </div>
      <div class="name" data-text="Reports">Reports</div>
      </a>
    </li>

    <li class="unactive">
      <div class="dropdown">
        <button onclick="myFunction()" class="dropbtn">
          <div class="icon">
            <i class="fa fa-cog" aria-hidden="true"></i>
          </div>
          <div class="name" data-text="Settings">Settings <i class="fa fa-angle-down" aria-hidden="true" font-size="14"></i></div>
        </button>
        <div id="myDropdown" class="dropdown-content">
          <a href="/IMS/ACCOUNT/Accounts.jsp"><i class="fa fa-user" aria-hidden="true" font-size="14"></i>&nbsp;&nbsp;&nbsp;&nbsp;Account</a>
          <a href="/IMS/Login.jsp"><i class="fa fa-sign-out" aria-hidden="true" font-size="14"></i>&nbsp;&nbsp;&nbsp;&nbsp;Logout</a>
        </div>
      </div>
    </li>
  </ul>
</div>

<script>
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
</script>

<div class="body">
  <div class="search">
    <a class="modalb" href="#popupadd">Add Brand</a>
    <input id="myInput" type="search" class="search-table-filter" data-table="js-sort-table" placeholder=" Search.."><i class="fa fa-fw fa-search"></i>
  </div>

<div id="popupadd" class="overlay">
  <div class="popup">
    <a class="close" href="#">&times;</a>
      <div class="addheader2"><i class="fa fa-plus-circle" aria-hidden="true"></i>&nbsp;&nbsp;Add Brand</div>
        <div class="orderrr2">
          <form action="/IMS/CONTROLLER/Add_Brand.jsp">
            <label class="coc-block-label2" for="ordernum">Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <div class="coc-block2">
              <input class="coc-input2" type="text" placeholder="AUTO GENERATED" readonly="">
            </div>
        
            <br>

            <label class="coc-block-label2" for="ordernum">Brand&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <div class="coc-block2">
              <input class="coc-input2" type="text" name="brand" required="">
            </div>
        </div>
        <div class="addnav">
          <button type="submit" class="addorder"><i class="fa fa-check-circle" aria-hidden="true"></i>&nbsp;&nbsp;Add Brand</button>
        </div>
        </form>
  </div>
</div>


<!-- table -->

  <table id="tablepaging" class="js-sort-table" align="center">
    <thead>
      <tr>
        <th width="50%" onclick="sortTable(0)">Date Created</th>
        <th width="70%" onclick="sortTable(1)">Product Brand</th>
      </tr>
    </thead>

    <tbody>

<%

Get_Value obj_Get_Value = new Get_Value();

List<Variable_Brand> list = obj_Get_Value.Brand();

Iterator<Variable_Brand> it_list = list.iterator();

while (it_list.hasNext()) {
	
	Variable_Brand obj_Variable_Brand = new Variable_Brand();
	
	obj_Variable_Brand = it_list.next();
	
%>	

	<tr>
	
		<td><%=obj_Variable_Brand.getDateReceive() %></td>
		<td><%=obj_Variable_Brand.getBrand() %></td>

	</tr>
	
<%	
	
}

%>	

    </tbody>
  </table>
</div>
<div id="pageNavPosition" style="padding-top: 20px" align="center">
</div>
<script type="text/javascript"><!--
var pager = new Pager('tablepaging', 10);
pager.init();
pager.showPageNav('pager', 'pageNavPosition');
pager.showPage(1);
</script>
</div>
</body>
</html>
