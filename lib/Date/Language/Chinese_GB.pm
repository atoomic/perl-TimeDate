##
## English tables
##

package Date::Language::Chinese_GB;

use Date::Language ();

use strict;
use warnings;
use utf8;

# VERSION: generated
# ABSTRACT: Chinese_GB localization for Date::Format

our @ISA = qw(Date::Language);

our @DoW = qw(ÐÇÆÚÈÕ ÐÇÆÚÒ» ÐÇÆÚ¶þ ÐÇÆÚÈý ÐÇÆÚËÄ ÐÇÆÚÎå ÐÇÆÚÁù);
our @MoY = qw(Ò»ÔÂ ¶þÔÂ ÈýÔÂ ËÄÔÂ ÎåÔÂ ÁùÔÂ
	  ÆßÔÂ °ËÔÂ ¾ÅÔÂ Ê®ÔÂ Ê®Ò»ÔÂ Ê®¶þÔÂ);
our @DoWs = map { $_ } @DoW;
our @MoYs = map { $_ } @MoY;
our @AMPM = qw(ÉÏÎç ÏÂÎç);

our @Dsuf = (qw(ÈÕ ÈÕ ÈÕ ÈÕ ÈÕ ÈÕ ÈÕ ÈÕ ÈÕ ÈÕ)) x 3;

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

sub format_o { sprintf("%2d%s",$_[0]->[3],"ÈÕ") }

1;