use ModPerl::Util (); #for CORE::GLOBAL::exit
  
use Apache2::RequestRec ();
use Apache2::RequestIO ();
use Apache2::RequestUtil ();
  
use Apache2::ServerRec ();
use Apache2::ServerUtil ();
use Apache2::Connection ();
use Apache2::Log ();
  
use APR::Table ();
  
use ModPerl::Registry ();
  
use Apache2::Const -compile => ':common';
use APR::Const -compile => ':common';

use Apache2::Status ();
use Apache::DBI ();
Apache::DBI->connect_on_init('DBI:mysql:test', 'test', 'test');

1;
