#!/usr/bin/perl

# This file is part of ovirt-Monitoring UI-Plugin.
#
# ovirt-Monitoring UI-Plugin is free software: you can redistribute it 
# and/or modify it under the terms of the GNU General Public License 
# as published by the Free Software Foundation, either version 3 of the i
# License, or (at your option) any later version.
#
# ovirt-Monitoring UI-Plugin is distributed in the hope that it will be 
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with ovirt-Monitoring UI-Plugin.  
# If not, see <http://www.gnu.org/licenses/>.


use strict;
use warnings;

use Pod::Xhtml;

my ($lib_path, $docs_path);
BEGIN {
  $lib_path		= "../www/ovirt-monitoring/lib/oVirtUI";		# path to oVirtUI lib directory
  $docs_path	= "../docs/modules";	# path to oVirtUI module docs directory
}


# check if lib dir exists
die "lib_path ($lib_path) doesn't exist!" unless (-d $lib_path);

# create docs directory if not exist
if (! -d $docs_path){
  mkdir $docs_path or die "Can't create doc_dir: $!";
}

# get perl modules
opendir (LIBDIR, $lib_path) or die ("Can't open directory $lib_path: $!");
while (my $file = readdir (LIBDIR)){
  next if $file =~ /^\./;
  next if -d $file;
  # skip non *.pm files
  next unless $file =~ /\.pm$/;
  chomp $file;
  my @name = split /\./, $file;
  
  # create POD docs
  my $parser = new Pod::Xhtml;
  $parser->parse_from_file( $lib_path . "/" . $file, $docs_path . "/" . $name[0] . ".html")
}


exit 0;
