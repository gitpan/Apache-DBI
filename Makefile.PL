#-------------------------------------------------------
#
# $Id: Makefile.PL,v 1.2 2003/01/10 08:18:02 ask Exp $
#
#-------------------------------------------------------

use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'         => 'Apache::DBI',
    'VERSION_FROM' => 'DBI.pm',
    'PREREQ_PM'    => { 'Test::More' => 0,    # without tests we don't know fun.
			'DBI'        => 1.00, # no DBI can never be any fun.
		      },
);

# EOF
