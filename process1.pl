#!/usr/bin/perl

print "Content-type:text/html\r\n\r\n";
use DBI;

 $host = "localhost"; 
 $database = "testing";
 $user = "root";
 $password = "rsvp1260";

$dbh = DBI->connect("DBI:mysql:$database:$host",$user,$password)
	or die ("can't connect to the database");

 if($dbh){
     print "Connected";
 }   

local ($buffer, @pairs, $pair, $name, $value, %FORM);
# Read in text
$ENV{'REQUEST_METHOD'} =~ tr/a-z/A-Z/;
if ($ENV{'REQUEST_METHOD'} eq "POST") {
   read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
} else {
   $buffer = $ENV{'QUERY_STRING'};
}
# Split information into name/value pairs
@pairs = split(/&/, $buffer);
foreach $pair (@pairs) {
   ($name, $value) = split(/=/, $pair);
   $value =~ tr/+/ /;
   $value =~ s/%(..)/pack("C", hex($1))/eg;
   $FORM{$name} = $value;
}

$fn = $FORM{fn};
$ln = $FORM{ln};
$password = $FORM{password};
$renterp = $FORM{renterp};
$email = $FORM{email};
$number = $FORM{number};
$address = $FORM{address};
$g = $FORM{g};
$date = $FORM{date};
$college = $FORM{college};


$Query=("INSERT INTO info(fn,ln,password,renterp,email,number,address,g,date,college)values('$fn','$ln','$password','$renterp','$email','$number','$address','$g','$date','$college')");
print $Query;

my $sth = $dbh->prepare($Query);

if($sth->execute()){
   print "row suceessfully inserted";

}
else {
   print "ERROR: $Query <br> $dbh->error";
}

$sth = $dbh->prepare("SELECT * FROM info");
$sth->bind_columns(\$fn,\$ln,\$password,\$renterp,\$email,\$number,\$address,\$g,\$date,\$college);
while($mydatafetch=$sth->fetchrow_array){
push @fn,$fn;
push @ln,$ln;
push @password,$password;
push @renterp,$renterp;
push @email,$email;
push @number,$number;
push @address,$address;
push @g,$g;
push @date,$date;
push @college,$college;
}

$sth->execute();

$sth->finish();

$body .= $fn." ".$ln." ".$password." ".$renterp." ".$email." ".$number." ".$address." ".$g." ".$date." ".$college."\n\n";



use MIME::Lite;
	my $msg = MIME::Lite->new(
 
	From    => 'Registration Details<birthday@greettech.com>',
	To      => 'rrj775@gmail.com',
   Subject => 'Registration form details',
	Type    => 'multipart/mixed',
	);

	$msg->attach(
    Type     => 'TEXT',
    Data     => "$body",
	);
	
   $msg->send('smtp','greettech-tlsv1.mail.pairserver.com',SSL => 1, Port => 465,Debug=>1 );
   print "Email Sent Successfully\n";