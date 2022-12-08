<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="MainPack.ConnectionJDBC"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Rent</title>
<link rel="stylesheet" href="viewtablee.css">
<link rel="stylesheet" href="popup.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<style>
@media ( min-width : 576px) {
	.jumbotron {
		padding: 1rem 2rem;
	}
}

.tdaction {
	width: 15%;
}

.tdSr {
	width: 7%;
}

strong {
	font-size: 24px !important;
}

input.largerCheckbox {
	width: 20px;
	height: 20px;
}
</style>
</head>
<body>
	<%
	String login_id = session.getAttribute("login_id").toString();
	String book_id = request.getParameter("book_id");
	%>

	<div class="table_header">
		<p>Rented Books</p>
		<div>
				<button class="add_new"  id="but" onClick=location.href='deletehistory.jsp' >Delete Returned History</button>
				<button class="add_new"  id="but" onClick=location.href='MemberPage.jsp' >Home</button>
			</div>
	</div>
	<table>
		<thead>
			<tr>
				<th><input type="checkbox" class="largerCheckbox" id="chkAll">
				</th>
				<th scope="col">Book Name</th>
				<th scope="col">Issued Date</th>
				<th scope="col">Return Date</th>
				<th scope="col">Returned Date</th>
				<th scope="col">Outstandings</th>
				<th scope="col">Return Book</th>
			</tr>
		</thead>
	</table>



	<table>
		<tbody>
			<%
			try {
				ConnectionJDBC o=new ConnectionJDBC();
				Connection con=o.createConnection();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from rental where login_id='" + login_id + "'");
				
				int fine = 0;
				
				while (rs.next()) {
					Date curr_date = java.sql.Date.valueOf(java.time.LocalDate.now());
					Date return_date = rs.getDate(4);
					Date returneddate = rs.getDate(5);
					String rd = "Not Yet Returned";
					Statement st2 = con.createStatement();
					ResultSet rs2 = st2.executeQuery("select DATEDIFF('" + curr_date + "','" + return_date + "')");
					rs2.next();
					int due_days = Math.abs(Integer.parseInt(rs2.getString(1)));
					if (due_days > 3) {
						fine = ((rs.getInt(8) * 5 * rs2.getInt(1))/300);
						//fine = ((rs.getInt(8) * 5 * (Integer.parseInt(rs2.getString(1))))) / 300;
					}
					if (returneddate!=null) {
						rd = returneddate.toString();
							}
					
					

					//System.out.println(fine+" "+i++);
					
			%>
			
			<tr>
				<td><input type="checkbox" data-id="1"
					class="largerCheckbox tblChk chk0"></td>
				<td><%=rs.getString(9)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rd%></td>
				<td><%=Math.abs(fine)%></td>

				<td><div class="container">
						<button type="submit" class="btn" onClick=
							"location.href='ReturnDate.jsp?bookid=<%=rs.getString(2)%>'">
							<span>Return Book</span>
						</button>
						<div class="popup" id="popup">
						<img src="tick.png">
						<h2>Thank You!</h2>
						<p>Your Book has successfully returned.</p>
						<button type="button" onClick="closePopup()">OK</button>
						</div>
					</div></td>
			</tr>
			<%}
			} catch (Exception e) {
			out.println(e);
			System.out.println(e);
			}
			%>
		</tbody>
	</table>
	<script>
	let popup=document.getElementById("popup");
	
	function openPopup(){
		popup.classList.add("open-popup");
	}
	
	function closePopup(){
		popup.classList.remove("open-popup");
	}
	
	
	</script>
	
	<script>
	

    $(document).ready(function () {
      loadGridData();
      $('#tblData').on('change', '.tblChk', function () {
        debugger;
        if ($('.tblChk:checked').length == $('.tblChk').length) {
          $('#chkAll').prop('checked', true);
        } else {
          $('#chkAll').prop('checked', false);
        }
        getCheckRecords();
      });

      $("#chkAll").change(function () {
        debugger;
        if ($(this).prop('checked')) {
          $('.tblChk').not(this).prop('checked', true);
        } else {
          $('.tblChk').not(this).prop('checked', false);
        }
        getCheckRecords();
      })
    });
    function getCheckRecords() {
      debugger;
      $(".selectedDiv").html("");
      $('.tblChk:checked').each(function () {
        debugger;
        if ($(this).prop('checked')) {
          if ($(".selectedDiv").children().length == 0) {
            const rec = "<strong>" + $(this).attr("data-id") + " </strong>";
            $(".selectedDiv").append(rec);
          } else {
            const rec = ", <strong>" + $(this).attr("data-id") + " </strong>";
            $(".selectedDiv").append(rec);
          }
        }
        console.log(this.value);
      });
    }

    function loadGridData() {
      $.ajax({
        type: "GET",
        url: "https://jsonplaceholder.typicode.com/users",
        contentType: false,
        processData: false,
        data: "",
        beforeSend: function () {
          $("#trLoader").show();
        },
        success: function (results) {
          $("#trLoader").remove();
          let index = 0;
          results.forEach(element => {
            let dynamicTR = "<tr>";
            dynamicTR = dynamicTR + "<td> <input type='checkbox' data-id=" + element.bookid + " class='largerCheckbox tblChk chk" + index + "' /></td>";
            dynamicTR = dynamicTR + "<td>" + element.booktitle + "</td>";
            dynamicTR = dynamicTR + "<td>" + element.renteddate + "</td>";
            dynamicTR = dynamicTR + "<td>" + element.returndate + "</td>";
            dynamicTR = dynamicTR + "<td>" + element.returneddate + "</td>";
            dynamicTR = dynamicTR + "<td>" + element.fine + "</td>";
            dynamicTR = dynamicTR + " </tr>";
            $("#tblData tbody").append(dynamicTR);
            index++;
          });
        }
      });
    }

  </script>

</body>
</html>