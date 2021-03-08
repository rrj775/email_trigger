#!/usr/bin/perl
use strict;
use warnings;



print "Content-type:text/html\n\n";




print <<HTMLEND
<html>
<head>
<title>Registration form</title>
<script>
    function myfun() {
        alert("Hello");
    var a = document.getElementById("passwords").value;
    var b = document.getElementById("passwordss").value;
    alert(a);
    if(a!=b){
        document.getElementById("messages").innerHTML="**Password should match";
        return false;
    }


    }
    
</script>
</head>
<body>
<form method="POST" action="process1.pl"  onsubmit="return myfun();">
<table border="1" align="center" width="400" bgcolor="#CCCCCC" >
<caption>Registration form</caption>
<tr>
<th>Enter your first name</th>
<td><input type="text" name="fn" id="fn1" maxlength="10" title="enter your first name" placeholder="enter your first name" required/></td>
</tr>
<tr>
<th>Enter your last name</th>
<td><input type="text" name="ln"/></td>
</tr>
<tr>
<span id="messagess"></span>
<th>Enter your password</th>
<td><input type="password" name="password" id="passwords" value=""/></td>
</tr>

<tr>
<span id="messages"></span>
<th>ReEnter your password</th>
<td><input type="password" name="renterp" id="passwordss"value="" /></td>
</tr>

<tr>


<th>Enter your email</th>
<td><input type="email" name="email"/></td>
</tr>
<tr>
<th>Enter your mobile</th>
<td><input type="number" name="number"/></td>
</tr>
<tr>
<th>Enter your address</th>
<td><textarea rows="8" cols="20" name="address"></textarea></td>
</tr>
<tr>
<th>Select your gender</th>
<td>
male<input type="radio" name="g" value="m"/>
female<input type="radio" name="g" value="f"/>
</td>
</tr>
<tr>
<th>Select your DOB</th>
<td><input type="date" name="date"/></td>
</tr>
<tr>
<th>Select your College Name</th>
<td>
<select name="college" name="college">
<option value="" selected="selected" disabled="disabled">Select your college</option>
<option value="1">Jain College</option>
<option value="2">Christ College</option>
</select>
</td>
</tr>
<tr>
<td colspan="2" align="center"><input type="submit" value="Save My Data" name='submit' id='submit'/>
<input type="reset" value="Reset Data"/>
</td>
</tr>
</table>
</form>
</body>
</html>
HTMLEND
;
