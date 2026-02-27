##
## Austrian tables
##

package Date::Language::Austrian;

use strict;
use warnings;
use utf8;

use Date::Language ();
use Date::Language::English ();

# VERSION: generated
# ABSTRACT: Austrian localization for Date::Format

use base 'Date::Language';

our @MoY  = qw(Jänner Feber März April Mai Juni
       Juli August September Oktober November Dezember);
our @MoYs = qw(Jän Feb Mär Apr Mai Jun Jul Aug Sep Oct Nov Dez);
our @DoW  = qw(Sonntag Montag Dienstag Mittwoch Donnerstag Freitag Samstag);
our @DoWs = qw(Son Mon Die Mit Don Fre Sam);


our @AMPM = @{Date::Language::English::AMPM};
our @Dsuf = @{Date::Language::English::Dsuf};

our ( %MoY, %DoW );
Date::Language::_build_lookups();

# Formatting routines

sub format_a { $DoWs[$_[0]->[6]] }
sub format_A { $DoW[$_[0]->[6]] }
sub format_b { $MoYs[$_[0]->[4]] }
sub format_B { $MoY[$_[0]->[4]] }
sub format_h { $MoYs[$_[0]->[4]] }
sub format_p { $_[0]->[2] >= 12 ?  $AMPM[1] : $AMPM[0] }

1;
