##
## Oromo tables
##

package Date::Language::Oromo;

use strict;
use warnings;

use Date::Language ();
use base 'Date::Language';

# VERSION: generated
# ABSTRACT: Oromo localization for Date::Format

our (@DoW, @DoWs, @MoY, @MoYs, @AMPM, @Dsuf, %MoY, %DoW);

@DoW = qw(Dilbata Wiixata Qibxata Roobii Kamiisa Jimaata Sanbata);
@MoY = qw(Amajjii Guraandhala Bitooteessa Elba Caamsa Waxabajjii
          Adooleessa Hagayya Fuulbana Onkololeessa Sadaasa Muddee);
@DoWs = map { substr($_,0,3) } @DoW;
@MoYs = map { substr($_,0,3) } @MoY;
@AMPM = qw(WD WB);

@Dsuf = (qw(th st nd rd th th th th th th)) x 3;
@Dsuf[11,12,13] = qw(th th th);
@Dsuf[30,31] = qw(th st);

Date::Language::_build_lookups();

# Formatting routines

sub format_a { $DoWs[$_[0]->[6]] }
sub format_A { $DoW[$_[0]->[6]] }
sub format_b { $MoYs[$_[0]->[4]] }
sub format_B { $MoY[$_[0]->[4]] }
sub format_h { $MoYs[$_[0]->[4]] }
sub format_p { $_[0]->[2] >= 12 ?  $AMPM[1] : $AMPM[0] }

1;
