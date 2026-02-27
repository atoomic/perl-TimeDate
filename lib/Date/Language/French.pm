##
## French tables, contributed by Emmanuel Bataille (bem@residents.frmug.org)
##

package Date::Language::French;

use strict;
use warnings;
use utf8;
use Date::Language ();

use base 'Date::Language';

# VERSION: generated
# ABSTRACT: French localization for Date::Format

our @DoW = qw(dimanche lundi mardi mercredi jeudi vendredi samedi);
our @MoY = qw(janvier février mars avril mai juin
          juillet août septembre octobre novembre décembre);
our @DoWs = map { substr($_,0,3) } @DoW;
our @MoYs = map { substr($_,0,3) } @MoY;
$MoYs[6] = 'jul';

our @AMPM = qw(AM PM);
our @Dsuf = ((qw(er e e e e e e e e e)) x 3, 'er');

our ( %MoY, %DoW );
Date::Language::_build_lookups();

# Formatting routines

sub format_a { $DoWs[$_[0]->[6]] }
sub format_A { $DoW[$_[0]->[6]] }
sub format_b { $MoYs[$_[0]->[4]] }
sub format_B { $MoY[$_[0]->[4]] }
sub format_h { $MoYs[$_[0]->[4]] }
sub format_p { $_[0]->[2] >= 12 ?  $AMPM[1] : $AMPM[0] }
sub format_o { $_[0]->[3] }

1;
