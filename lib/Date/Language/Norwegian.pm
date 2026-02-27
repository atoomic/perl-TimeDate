##
## Norwegian tables
##

package Date::Language::Norwegian;

use strict;
use warnings;
use utf8;
use Date::Language ();

use base 'Date::Language';
use Date::Language::English ();

# VERSION: generated
# ABSTRACT: Norwegian localization for Date::Format

our @MoY  = qw(Januar Februar Mars April Mai Juni
       Juli August September Oktober November Desember);
our @MoYs = qw(Jan Feb Mar Apr Mai Jun Jul Aug Sep Okt Nov Des);
our @DoW  = qw(Søndag Mandag Tirsdag Onsdag Torsdag Fredag Lørdag Søndag);
our @DoWs = qw(Søn Man Tir Ons Tor Fre Lør Søn);

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
