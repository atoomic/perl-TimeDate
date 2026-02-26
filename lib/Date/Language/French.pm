##
## French tables, contributed by Emmanuel Bataille (bem@residents.frmug.org)
##

package Date::Language::French;

use Date::Language ();
our @ISA = qw(Date::Language);
our $VERSION = "1.04";
our (@DoW, @DoWs, @MoY, @MoYs, @AMPM, @Dsuf, %MoY, %DoW);

@DoW = qw(dimanche lundi mardi mercredi jeudi vendredi samedi);
@MoY = qw(janvier f�vrier mars avril mai juin 
          juillet ao�t septembre octobre novembre d�cembre);
@DoWs = map { substr($_,0,3) } @DoW;
@MoYs = map { substr($_,0,3) } @MoY;
$MoYs[6] = 'jul';
@AMPM = qw(AM PM);

@Dsuf = ((qw(er e e e e e e e e e)) x 3, 'er');

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
sub format_o { sprintf("%2de",$_[0]->[3]) }

1;
