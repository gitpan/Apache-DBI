use strict;
use Test::More tests => 7;
use DBI;

BEGIN { 
  # trick DBI.pm into thinking we are running under mod_perl

  if ($DBI::VERSION > 1.33) {
    $ENV{MOD_PERL} = 'CGI-Perl';  
  } 
  else {  
    $ENV{GATEWAY_INTERFACE} = 'CGI-Perl';  
  }
  use_ok('Apache::DBI', 'load Apache::DBI') 
};

my $dbd_mysql = eval { require DBD::mysql };

#$Apache::DBI::DEBUG = 10;

SKIP: {
  skip "Could not load DBD::mysql", 6 unless $dbd_mysql;

  ok($dbd_mysql, "DBD::mysql loaded");

  my $dbh_1 = DBI->connect('dbi:mysql:test', undef, undef, { RaiseError => 0, PrintError => 0 });

 SKIP: {
    skip "Could not connect to test database: $DBI::errstr", 5 unless $dbh_1;
    ok(my $thread_1 = $dbh_1->{'mysql_thread_id'}, "Connected 1");

    my $dbh_2 = DBI->connect('dbi:mysql:test', undef, undef, { RaiseError => 0, PrintError => 0 });
    ok(my $thread_2 = $dbh_2->{'mysql_thread_id'}, "Connected 2");

    is($thread_1, $thread_2, "got the same connection both times");

    my $dbh_3 = DBI->connect('dbi:mysql:test', undef, undef, { RaiseError => 0, PrintError => 1 });
    ok(my $thread_3 = $dbh_3->{'mysql_thread_id'}, "Connected 3");

    isnt($thread_1, $thread_3, "got different connection from different attributes");


  }


} 

1;
