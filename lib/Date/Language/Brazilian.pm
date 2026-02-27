##
## Brazilian tables, contributed by Christian Tosta (tosta@cce.ufmg.br)
##

package Date::Language::Brazilian;

use strict;
use warnings;
use utf8;

use Date::Language ();

# VERSION: generated
# ABSTRACT: Brazilian localization for Date::Format

our @ISA = qw(Date::Language);

our @DoW = qw(Domingo Segunda Terça Quarta Quinta Sexta Sábado);
our @MoY = qw(Janeiro Fevereiro Março Abril Maio Junho
	  Julho Agosto Setembro Outubro Novembro Dezembro);
our @DoWs = map { substr($_,0,3) } @DoW;
our @MoYs = map { substr($_,0,3) } @MoY;
our @AMPM = qw(AM PM);

our @Dsuf = (qw(mo ro do ro to to to mo vo no)) x 3;

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
