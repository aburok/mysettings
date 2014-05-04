use strict;
use warnings;

# vimrc_generate_help.pl vimrc_file output_help_file
#
print "Openning file $ARGV[0]...\n";
open(my $vimrc, "<", $ARGV[0]) or die("Cannot open file $ARGV[0].");

print "Openning file $ARGV[1]...\n";
open(my $vimrc_help, ">", $ARGV[1]) or die("Cannot open file $ARGV[1].");

while(<$vimrc>){
    #Match any mapping
    if($_ =~ m/^[vnorei]*map\s+(\S+)\s+(.+)$/){
        print $vimrc_help "[sc]$1\n[def] $2\n";
    }
}

close($vimrc) or die("Cannot close file $ARGV[0].");
close($vimrc_help) or die("Cannot close file $ARGV[1].");


