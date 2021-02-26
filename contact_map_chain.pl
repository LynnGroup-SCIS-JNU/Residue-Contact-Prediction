print "enter the file name\n";
chomp ($pdb='s_pombe_three_subunit.pdb');
my $res1;
my $res2;
unless (open(FILE ,$pdb) )
  {  
 	print "cannot open the file\n";
        exit;
   }
   @array=<FILE>;
foreach $line (@array)
 { 
    if($line=~/^ATOM/ && $line=~/CA/)
       {
         push(@file,$line) ;
	} 
}
close FILE ;
for($i=0;$i<=$#file;$i++)
 {
   my @line=split(" ",$file[$i]);
   if (length($line[4])>1){
      $res1=$line[4];
       $x1=$line[5];
       $y1=$line[6];
       $z1=$line[7]; 
   }else{
      $res1=($line[4].$line[5]);
      $x1=$line[6];
      $y1=$line[7];
      $z1=$line[8];
   }
 for($j=$i+1;$j<=$#file;$j++)

 {my @line=split(" ",$file[$j]);
  if (length($line[4])>1){
      $res2=$line[4];
       $x2=$line[5];
       $y2=$line[6];
       $z2=$line[7]; 
   }else{
      $res2=($line[4].$line[5]);
      $x2=$line[6];
      $y2=$line[7];
      $z2=$line[8];
   }
my $dist=sqrt((($x1)-($x2))**2+(($y1)-($y2))**2+(($z1)-($z2))**2);
if($dist<=8){
print "$res1\t$res2\t$dist\n";
       push(@residue,$res1);
       push(@residue,$res2);
             }
   }
}

