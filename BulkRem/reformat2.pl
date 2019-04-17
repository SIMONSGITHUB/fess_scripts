#!/usr/bin/perl -w

use strict;
use warnings;

# get the total number of passed arguments to a perl script

 my $total =@ARGV;
 print "Using method 1 :  number of arguments $total\n";
  
    if ($total !=3) {
     print "\nUsage: script.pl input_file email_adress output_file\n";
     print "the number is $total\n";
     exit;
    }

 my  ($filename, $email, $outputfilename) = @ARGV;

 print "the filename is $ARGV[0]\n";
 print " the email addres is $ARGV[1]\n";
 print " the outputfile is $ARGV[2]\n";

 $email=$ARGV[1]; 
 
# open the file for reading
 open (my $fhin, '<:encoding(UTF-8)', $filename) or die "Could not read file '$filename' $!";
 open (my $fhout, '>', $outputfilename) or die "Could not write to file '$filename' $!";

   while (my $erow =<$fhin>) {
   
     chomp $erow; 
     chomp $email;
     my $sqline='sqlplus bcd/b4byb3ll@chprd.internal.ch @erembulk.sql ' . "$email '$erow';\n" ;
     print $fhout($sqline);
   }
 
   close($fhin);
   close($fhout);

