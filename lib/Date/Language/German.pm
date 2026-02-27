##
## German tables
##

package Date::Language::German;

use strict;
use warnings;
use utf8;

use Date::Language::English ();

use base 'Date::Language';

# VERSION: generated
# ABSTRACT: German localization for Date::Format

our @MoY  = qw(Januar Februar März April Mai Juni
	   Juli August September Oktober November Dezember);
our @MoYs = qw(Jan Feb Mär Apr Mai Jun Jul Aug Sep Okt Nov Dez);
our @DoW  = qw(Sonntag Montag Dienstag Mittwoch Donnerstag Freitag Samstag);
our @DoWs = qw(Son Mon Die Mit Don Fre Sam);

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
sub format_o { sprintf("%2d.",$_[0]->[3]) }

1;
