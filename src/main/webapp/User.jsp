<%@ page language="Java" contentType="text/html charset=UTF=8" pageEncoding="UTF-8" isELIgnored="false"%>
<!Doctype html>
<html lang="en">
<head>
<title>Flyaway Home</title>

<style>
*{box-sizing:border-box;font-family:Montserrat;}
body{
justify-content: center;
align-items: center;
}
h2{text-align:center;}
div,form{
display:flex;
flex-direction:column;
justify-content: space-between;
gap:16px;
}
input[type="submit"]{background-color:#121212;color:#ffffff;font-weight:bold;font-size:18px;text-transform:uppercase;border:none;}

form{
width:480px;
margin:auto;
}
.vertical{flex-direction:row;}
input{padding:12px;margin:8px;border-radius:4px;}
</style>
</head>
<body>
<form action="search" method="GET">
<h2>FlyAway</h2>
<div class="vertical">
<div>
    <div>
                      <label>Source</label>
                      <input type="text" name="source" id="source">
    </div>
    <div>
                      <label>Travellers</label>
                      <input type="number" name="travellers" id="travellers">
    </div>

</div>
<div>
    <div>
                      <label>Destination</label>
                           <input type="text" name="destination" id="destination">
    </div>
    <div>              <label>Date</label>
                        <input type="date" name="date" id="date">
    </div>

</div>
</div>

<input type="Submit" value="Search">
</form>
</body>
</html>