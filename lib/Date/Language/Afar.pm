##
## Afar tables
##

package Date::Language::Afar;

use strict;
use warnings;

use Date::Language ();
use base 'Date::Language';

# VERSION: generated
# ABSTRACT: Afar localization for Date::Format

our (@DoW, @DoWs, @MoY, @MoYs, @AMPM, @Dsuf, %MoY, %DoW);

@DoW = qw(Acaada Etleeni Talaata Arbaqa Kamiisi Gumqata Sabti);
@MoY = (
"Qunxa Garablu",
"Kudo",
"Ciggilta Kudo",
"Agda Baxis",
"Caxah Alsa",
"Qasa Dirri",
"Qado Dirri",
"Liiqen",
"Waysu",
"Diteli",
"Ximoli",
"Kaxxa Garablu"
);
@DoWs = map { substr($_,0,3) } @DoW;
@MoYs = map { substr($_,0,3) } @MoY;
@AMPM = qw(saaku carra);

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
