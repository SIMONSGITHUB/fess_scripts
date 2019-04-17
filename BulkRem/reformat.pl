#!/usr/bin/perl -w

use strict;
use warnings;

# get the total number of passed arguments to a perl script

 my $total =@ARGV;
 print "Using method 1 :  number of arguments $total\n";
  
    if ($total !=2) {
     print "\nUsage: script.pl input_file output_file\n";
     print "the number is $total\n";
     exit;
    }

 my  ($filename, $outputfilename) = @ARGV;

# open the file for reading
 open (my $fhin, '<:encoding(UTF-8)', $filename) or die "Could not read file '$filename' $!";
 open (my $fhout, ">", $outputfilename) or die "Could not write to file '$outputfilename' $!";

   while (my $row =<$fhin>) {
   
     chomp $row; 
     my $sqline="SELECT * FROM REMINDERS WHERE CONUMB ='$row';\n" ;
     print $fhout($sqline);
   }
 
   close($fhin);
   close($fhout);
