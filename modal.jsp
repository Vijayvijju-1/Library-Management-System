<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}



/* Set a style for all buttons */
button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 180px;
 
  border-radius:11px;
}



button:hover {
  opacity:0.8;
}



/* Float cancel and delete buttons and add an equal width */
.cancelbtn, .deletebtn {
  float: left;
  width: 50%;
}



/* Add a color to the cancel button */
.cancelbtn {
  background-color: #ccc;
  color: black;
}



/* Add a color to the delete button */
.deletebtn {
  background-color: #f44336;
}



/* Add padding and center-align text to the container */
.container1 {
  padding: 16px;
  text-align: center;
}



/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 10%;
  top: 15%;
  width: 1500px; /* Full width */
  height: 900px; /* Full height */
  overflow: hidden; /* Enable scroll if needed */
  background-color: transparent;
  padding-top: 50px;
 
}



/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto auto auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}



/* Style the horizontal ruler */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* The Modal Close Button (x) */
.close {
  position: absolute;
  right: 15px;
  top: 15px;
  left:80.5%;
  font-size: 40px;
  font-weight: bold;
  color: grey;
}



.close:hover,
.close:focus {
  color: #f44336;
  cursor: pointer;
}



/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}



/* Change styles for cancel button and delete button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .deletebtn {
     width: 100%;
  }
}
</style>
<head><link rel="stylesheet" href="NewProduct-style.css"></head>









<div id="id01" class="modal">
  <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">×</span>
    <div class="container">
     
    <div class="title">Add Book</div>
    <div class="content">
      <form action="bookAdded.jsp" method="post">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Book Name</span>
            <input type="text" placeholder="Enter your Book Name" name="book_title" required>
          </div>
          <div class="input-box">
            <span class="details">Book Author</span>
            <input type="text" placeholder="Enter your Book Author" name="book_author" required>
          </div>
          <div class="input-box">
            <span class="details">No of Copies</span>
            <input type="text" placeholder="Enter No of Copies" name="No_actual_copies" required>
          </div>
          <div class="input-box">
            <span class="details">Book Genre</span>
            <input type="text" placeholder="Enter Book Genre" name="category" required>
          </div>
          <div class="input-box">
            <span class="details">Book Price</span>
            <input type="text" placeholder="Enter Book Price" name="price"required>
          </div>
          <div class="input-box">
            <span class="details">Published Year</span>
            <input type="text" placeholder="Enter Year" name="published_year"required>
          </div>
        </div>
        <div class="butt">
          <input type="submit" value="Add Book">
        </div>
      </form>
    </div>
  </div>
     
</div>



<script>
// Get the modal
var modal = document.getElementById('id01');
var x = document.getElementById('vijay').value;


// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>