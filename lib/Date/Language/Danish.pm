##
## Danish tables
##

package Date::Language::Danish;

use strict;
use warnings;
use utf8;
use Date::Language ();

use base 'Date::Language';

use Date::Language::English ();

# VERSION: generated
# ABSTRACT: Danish localization for Date::Format

our @MoY  = qw(Januar Februar Marts April Maj Juni
       Juli August September Oktober November December);
our @MoYs = qw(Jan Feb Mar Apr Maj Jun Jul Aug Sep Okt Nov Dec);
our @DoW  = qw(Søndag Mandag Tirsdag Onsdag Torsdag Fredag Lørdag);
our @DoWs = qw(Søn Man Tir Ons Tor Fre Lør);

our @AMPM =   @{Date::Language::English::AMPM};
our @Dsuf =   @{Date::Language::English::Dsuf};

our ( %MoY, %DoW );
@MoY{@MoY}  = (0 .. scalar(@MoY));
@MoY{@MoYs} = (0 .. scalar(@MoYs));
@DoW{@DoW}  = (0 .. scalar(@DoW));
@DoW{@DoWs} = (0 .. scalar(@DoWs));

# Formatting routines

sub format_a { $DoWs[$_[0]->[6]] }
sub format_A { $DoW[$_[0]->[6]] }
sub format_b { $MoYs[$_[0]->[4]] }
sub format_B { $MoY[$_[0]->[4]] }
sub format_h { $MoYs[$_[0]->[4]] }
sub format_p { $_[0]->[2] >= 12 ?  $AMPM[1] : $AMPM[0] }

1;
