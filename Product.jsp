<%@ page import="Database.Variable_Order"%>
<%@ page import="Database.Variable_Brand"%>
<%@ page import="Database.Variable_Category"%>
<%@ page import="Database.Variable_Product"%>
<%@ page import="Database.Variable_Serial"%>
<%@ page import="CRUD.Get_Value"%>
<%@ page import="java.util.*" %>
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
  <title>Product</title>
  <link rel = "icon" href = "/IMS/PICTURE/icon.png" type = "image/x-icon"> 
  <link rel = "icon" href = "icon.png" type = "image/x-icon"> 
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel = "stylesheet" type = "text/css" href = "/IMS/CSS/Product.css" />
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
          <a href="/IMS/INVENTORY/Brand.jsp">Brand</a>
          <a href="/IMS/INVENTORY/Category.jsp">Category</a>
          <a class="active">Product</a>
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
    <button id="myBtn" class="modalb">Add Product</button>
    <input id="myInput" type="search" class="search-table-filter" data-table="js-sort-table" placeholder=" Search.."><i class="fa fa-fw fa-search"></i>
  </div>

  <div id="myModal" class="modal">
    <div class="modal-content">
      <form action="product.html">
      <span class="close">&times;</span>
      <div class="addheader"><i class="fa fa-plus-circle" aria-hidden="true"></i>&nbsp;&nbsp;Add Product</div>
      <!-- modal content -->
      <div class="coc-form">
        <div class="orderrr">
          <div class="coc-block-row">
            <label class="coc-block-label" for="ordernum">Product Number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <div class="coc-block">
              <input class="coc-input3" type="text" placeholder="AUTO GENERATED" readonly="readonly">
            </div>
          </div>
        
          <br>

          <div class="coc-block-row">
            <label class="coc-block-label" for="orderdate">Acquisition Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <div class="coc-block">
              <input class="coc-input3" type="text" placeholder="AUTO GENERATED" readonly="readonly">
            </div>
          </div>
        </div>

        <br><br>

        <div class="client">
          <div class="coc-block-row">
            <label class="coc-block-label" for="clientname">Product Model&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <div class="coc-block">
              <input class="coc-input" type="text" name="name" required="required">
            </div>
          </div>

          <br>

          <div class="coc-block-row">
            <label class="coc-block-label" for="clientname">Price&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <div class="coc-block">
              <input class="coc-input" type="text" name="price" required="required">
            </div>
          </div>

          <br>

          <div class="coc-block-row">
            <label class="coc-block-label" for="clientname">Brand&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <div class="coc-block">
              <select  class="coc-input" style="width: 180px;" id="GFG1" onchange="Product()" name="brand" required="required">
                <option selected value="" disabled selected class="city">---SELECT---</option>
<%

Get_Value obj_Get_Value2 = new Get_Value();

List<Variable_Brand> list2 = obj_Get_Value2.Brand();

Iterator<Variable_Brand> it_list2 = list2.iterator();

while (it_list2.hasNext()) {
	
	Variable_Brand obj_Variable_Brand = new Variable_Brand();
	
	obj_Variable_Brand = it_list2.next();
	
%>	

	<option value="<%=obj_Variable_Brand.getBrand() %>"><%=obj_Variable_Brand.getBrand() %></option>
	
<%
	
}
	
%>
              </select>
            </div>
          </div>

          <br>

          <div class="coc-block-row">
            <label class="coc-block-label" for="clientname">Category&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <div class="coc-block">
              <select class="coc-input" style="width: 180px;" id="GFG1" onchange="Product()" name="category" required="required">
                <option selected value="" disabled selected class="city">---SELECT---</option>
<%

Get_Value obj_Get_Value1 = new Get_Value();

List<Variable_Category> list1 = obj_Get_Value1.Category();

Iterator<Variable_Category> it_list1 = list1.iterator();

while (it_list1.hasNext()) {
	
	Variable_Category obj_Variable_Category = new Variable_Category();
	
	obj_Variable_Category = it_list1.next();
	
%>	

	<option value="<%=obj_Variable_Category.getCategory() %>"><%=obj_Variable_Category.getCategory() %></option>
	
<%
	
}
	
%>
              </select>            
              </div>
          </div>
        </div>

        <div class="productchoose">
          <div class="coc-block-row">
            <label class="coc-block-label" for="quantity">Quantity&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <div class="coc-block">
              <input style="width: 100px" class="coc-input" type="number" min="1" name="quantity" id="GFG" onchange="SerialNumber()" onkeydown="return false" required>
            </div>
              <p style="margin-top: 2%;" id="serial"></p>
          </div>
        </div> 
          <div class="addnav">
            <button onclick="window.location.href = 'Product.jsp';" class="cancel"><i class="fa fa-times-circle" aria-hidden="true"></i>&nbsp;&nbsp;Cancel</button>
            <button type="submit" class="addorder" formaction="/IMS/CONTROLLER/Add_Product.jsp"><i class="fa fa-check-circle" aria-hidden="true"></i>&nbsp;&nbsp;Save Product</button>
          </div>
        </div> 
      </div>
      </form>
    </div>
  </div>

<script> 
function SerialNumber() { 
    var i = document.getElementById("GFG").value; 
    var text = "";
    while (i > 0) {
        text += "<input type='text' class='quan' name='SERIALNUMBER" + i + "' required><br>";
        i--;
    }
    document.getElementById("serial").innerHTML = "<form action='BRYAN.html'>" + text + "<input type='hidden' value='SUBMIT'>";
} 
</script> 

  <script>
    var modal = document.getElementById("myModal");
    var btn = document.getElementById("myBtn");
    var span = document.getElementsByClassName("close")[0];
    btn.onclick = function() {
      modal.style.display = "block";
    }
    span.onclick = function() {
      modal.style.display = "none";
    }
</script>

<!-- table -->

<table id="tablepaging" class="js-sort-table" align="center">
    <thead>
      <tr>
        <th onclick="sortTable(0)">Product Number</th>
        <th onclick="sortTable(1)">Acquisition Date</th>
        <th onclick="sortTable(2)">Product Model</th>
        <th onclick="sortTable(3)">Quantity</th>
        <th onclick="sortTable(4)">Price</th>
        <th onclick="sortTable(5)">Brand</th>
        <th onclick="sortTable(6)">Category</th>
        <th onclick="sortTable(6)" colspan="2"></th>
      </tr>
    </thead>

    <tbody>

<%

Get_Value obj_Get_Value = new Get_Value();

List<Variable_Product> list = obj_Get_Value.Product();

Iterator<Variable_Product> it_list = list.iterator();

while (it_list.hasNext()) {
	
	Variable_Product obj_Variable_Product = new Variable_Product();
	
	obj_Variable_Product = it_list.next();
	
	if (obj_Variable_Product.getQuantity() <= 20){
	
%>	

	<tr style="background-color: rgba(255, 51, 51, 0.4);">
	
		<td><%=obj_Variable_Product.getTag() %></td>
		<td><%=obj_Variable_Product.getDateReceive() %></td>
		<td><%=obj_Variable_Product.getName() %></td>
		<td><%=obj_Variable_Product.getQuantity() %></td>
		<td>P<%=obj_Variable_Product.getPrice() %></td>
		<td><%=obj_Variable_Product.getBrand() %></td>
		<td><%=obj_Variable_Product.getCategory() %></td>
        <td><a class="view" href="/IMS/INVENTORY/Product1.jsp?name=<%=obj_Variable_Product.getName() %>">View</a></td>
        <td><a class="view" href="/IMS/INVENTORY/Product3.jsp?name=<%=obj_Variable_Product.getName() %>">Archive</a></td>
		
	</tr>
	
<%	

	}else {
		
%>

	<tr>
	
		<td><%=obj_Variable_Product.getTag() %></td>
		<td><%=obj_Variable_Product.getDateReceive() %></td>
		<td><%=obj_Variable_Product.getName() %></td>
		<td><%=obj_Variable_Product.getQuantity() %></td>
		<td>P<%=obj_Variable_Product.getPrice() %></td>
		<td><%=obj_Variable_Product.getBrand() %></td>
		<td><%=obj_Variable_Product.getCategory() %></td>
        <td><a class="view" href="/IMS/INVENTORY/Product1.jsp?name=<%=obj_Variable_Product.getName() %>">View</a></td>
        <td><a class="view" href="/IMS/INVENTORY/Product3.jsp?name=<%=obj_Variable_Product.getName() %>">Archive</a></td>
		
	</tr>

<%
	}
	
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

<script>

$(function(){
	$("#GFG1").change(function(){
		var product = $("#GFG1 option:selected").text();		
		$("#product1").val(product);
	})
})

$(function(){
	$("#GFG2").change(function(){
		var product = $("#GFG2 option:selected").text();		
		$("#product2").val(product);
	})
})

$(function(){
	$("#GFG3").change(function(){
		var product = $("#GFG3 option:selected").text();		
		$("#product3").val(product);
	})
})

$(function(){
	$("#GFG4").change(function(){
		var product = $("#GFG4 option:selected").text();		
		$("#product4").val(product);
	})
})

$(function(){
	$("#GFG5").change(function(){
		var product = $("#GFG5 option:selected").text();		
		$("#product5").val(product);
	})
})

function Product() { 

    document.getElementById("price1").setAttribute('value',document.getElementById("GFG1").value);
    document.getElementById("price2").setAttribute('value',document.getElementById("GFG2").value);
    document.getElementById("price3").setAttribute('value',document.getElementById("GFG3").value);
    document.getElementById("price4").setAttribute('value',document.getElementById("GFG4").value);
    document.getElementById("price5").setAttribute('value',document.getElementById("GFG5").value);

} 

function Total() { 
	
	var x1 = document.getElementById("GFG1").value;	
	var y1 = document.getElementById("QUANTITY1").value;	
	var z1 = x1 * y1;	
	document.getElementById("total1").setAttribute('value',z1);
	document.getElementById("total").setAttribute('value',z1);
	
	var x2 = document.getElementById("GFG2").value;	
	var y2 = document.getElementById("QUANTITY2").value;	
	var z2 = x2 * y2;
	document.getElementById("total2").setAttribute('value',z2);
	document.getElementById("total").setAttribute('value',z2);
	
	var x3 = document.getElementById("GFG3").value;	
	var y3 = document.getElementById("QUANTITY3").value;
	var z3 = x3 * y3;	
	document.getElementById("total3").setAttribute('value',z3);
	document.getElementById("total").setAttribute('value',z3);
	
	var x4 = document.getElementById("GFG4").value;	
	var y4 = document.getElementById("QUANTITY4").value;
	var z4 = x4 * y4;	
	document.getElementById("total4").setAttribute('value',z4);
	document.getElementById("total").setAttribute('value',z4);
	
	var x5 = document.getElementById("GFG5").value;	
	var y5 = document.getElementById("QUANTITY5").value;
	var z5 = x5 * y5;	
	document.getElementById("total5").setAttribute('value',z5);
	document.getElementById("total").setAttribute('value',z5);

	var total = z1 + z2 + z3 + z4 + z5;
	var vat = (total * .13);
	var finalTotal = vat + total;

	document.getElementById("total").setAttribute('value',total);
	document.getElementById("vat").setAttribute('value',vat);
	document.getElementById("finalTotal").setAttribute('value',finalTotal);
	
} 

</script> 
</div>
</body>
</html>
