##
## Russian cp1251
##

package Date::Language::Russian_cp1251;

use base 'Date::Language';
use Date::Language ();

# VERSION: generated
# ABSTRACT: Russian_cp1251 localization for Date::Format

our @DoW = qw(Âîñêðåñåíüå Ïîíåäåëüíèê Âòîðíèê Ñðåäà ×åòâåðã Ïÿòíèöà Ñóááîòà);
our @MoY = qw(ßíâàðü Ôåâðàëü Ìàðò Àïðåëü Ìàé Èþíü
      Èþëü Àâãóñò Ñåíòÿáðü Îêòÿáðü Íîÿáðü Äåêàáðü);
our @DoWs = qw(Âñê Ïíä Âòð Ñðä ×òâ Ïòí Ñáò);

our @MoYs = map { substr($_,0,3) } @MoY;
our @AMPM = qw(AM PM);

our @Dsuf = ('e') x 31;

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
sub format_o { sprintf("%2de",$_[0]->[3]) }

1;
