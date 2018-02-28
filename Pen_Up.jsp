<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>Pen Up</title>
  <link rel="stylesheet" href="css/style.css">
  <style>
    .select_country{
      width: 150px;
      height: 30px;
      background-color: lightgrey;
    }

  </style>
</head>

<body>

  <div class="login">
  <div class="login-triangle"></div>
  
  <h2 class="login-header">Pen Up</h2>

  <form class="login-container">
    <p><input type="text" placeholder="First Name" name="first_name_field_penUp" required></p>
    <p><input type="text" placeholder="Last Name" name="last_name_field_penUp" required></p>
    <p><input type="text" placeholder="User Name" name="user_name_field_penUp" required=""></p>
    <p><input type="email" placeholder="Email" name="email_field_penUp" required></p>
    <p>
      <select name="country_selection_penUp " class="select_country">
        <option>Country 1</option>
        <option>Country 2</option>
        <option>Country 3</option>
        <option>Country 4</option>
      </select>
    </p>
    <p><input type="password" placeholder="Password" name="password_field_penUp" required></p>
    <p><input type="submit" value="Pen Up"></p>
  </form>
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  

</body>

</html>
