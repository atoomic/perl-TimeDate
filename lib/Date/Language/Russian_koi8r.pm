##
## Russian koi8r
##

package Date::Language::Russian_koi8r;

use strict;
use warnings;
use utf8;
use base 'Date::Language';

# VERSION: generated
# ABSTRACT: Russian_koi8r localization for Date::Format

our @DoW = qw(÷ÏÓËÒÅÓÅÎØÅ ðÏÎÅÄÅÌØÎÉË ÷ÔÏÒÎÉË óÒÅÄÁ þÅÔ×ÅÒÇ ðÑÔÎÉÃÁ óÕÂÂÏÔÁ);
our @MoY = qw(ñÎ×ÁÒØ æÅ×ÒÁÌØ íÁÒÔ áÐÒÅÌØ íÁÊ éÀÎØ
      éÀÌØ á×ÇÕÓÔ óÅÎÔÑÂÒØ ïËÔÑÂÒØ îÏÑÂÒØ äÅËÁÂÒØ);
our @DoWs = qw(÷ÓË ðÎÄ ÷ÔÒ óÒÄ þÔ× ðÔÎ óÂÔ);

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
