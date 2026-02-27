##
## Russian tables
##
## Contributed by Danil Pismenny <dapi@mail.ru>

package Date::Language::Russian;

use strict;
use warnings;
use utf8;
use Date::Language ();

use base qw(Date::Language Date::Format::Generic);

# VERSION: generated
# ABSTRACT: Russian localization for Date::Format

our @MoY = qw(ñÎ×ÁÒÑ æÅ×ÒÁÌÑ íÁÒÔÁ áÐÒÅÌÑ íÁÑ éÀÎÑ éÀÌÑ á×ÇÕÓÔÁ óÅÎÔÑÂÒÑ ïËÔÑÂÒÑ îÏÑÂÒÑ äÅËÁÂÒÑ);
our @MoY2 = qw(ñÎ×ÁÒØ æÅ×ÒÁÌØ íÁÒÔ áÐÒÅÌØ íÁÊ éÀÎØ éÀÌØ á×ÇÕÓÔ óÅÎÔÑÂÒØ ïËÔÑÂÒØ îÏÑÂÒØ äÅËÁÂÒØ);
our @MoYs = qw(ñÎ× æÅ× íÒÔ áÐÒ íÁÊ éÀÎ éÀÌ á×Ç óÅÎ ïËÔ îÏÑ äÅË);

our @DoW = qw(ðÏÎÅÄÅÌØÎÉË ÷ÔÏÒÎÉË óÒÅÄÁ þÅÔ×ÅÒÇ ðÑÔÎÉÃÁ óÕÂÂÏÔÁ ÷ÏÓËÒÅÓÅÎØÅ);
our @DoWs = qw(ðÎ ÷Ô óÒ þÔ ðÔ óÂ ÷Ó);
our @DoWs2 = qw(ðÎÄ ÷ÔÒ óÒÄ þÔ× ðÔÎ óÂÔ ÷ÓË);

our @AMPM = qw(ÄÐ ÐÐ);

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

sub format_d { $_[0]->[3] }
sub format_m { $_[0]->[4] + 1 }
sub format_o { $_[0]->[3] . '.' }

sub format_Q { $MoY2[$_[0]->[4]] }

sub str2time {
  my ($self,$value) = @_;
  map {$value=~s/(\s|^)$DoWs2[$_](\s)/$DoWs[$_]$2/ig} (0..6);
  $value=~s/(\s+|^)íÁÒ(\s+)/$1íÒÔ$2/;
  return $self->SUPER::str2time($value);
}

1;
