##
## Spanish tables
##

package Date::Language::Spanish;

use strict;
use warnings;
use utf8;
use Date::Language ();

use base 'Date::Language';

# VERSION: generated
# ABSTRACT: Spanish localization for Date::Format

our @DoW = qw(domingo lunes martes miércoles jueves viernes sábado);
our @MoY = qw(enero febrero marzo abril mayo junio
      julio agosto septiembre octubre noviembre diciembre);
our @DoWs = map { substr($_,0,3) } @DoW;
our @MoYs = map { substr($_,0,3) } @MoY;
our @AMPM = qw(AM PM);

our @Dsuf = ((qw(ro do ro to to to mo vo no mo)) x 3, 'ro');

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
