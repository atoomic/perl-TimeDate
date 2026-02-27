##
## Icelandic tables
##

package Date::Language::Icelandic;

use strict;
use warnings;
use utf8;
use Date::Language ();

use base 'Date::Language';

use Date::Language::English ();

# VERSION: generated
# ABSTRACT: Icelandic localization for Date::Format

our @MoY  = qw(Janúar Febrúar Mars Apríl Maí Júni
	   Júli Ágúst September Október Nóvember Desember);
our @MoYs = qw(Jan Feb Mar Apr Maí Jún Júl Ágú Sep Okt Nóv Des);
our @DoW  = qw(Sunnudagur Mánudagur Þriðjudagur Miðvikudagur Fimmtudagur Föstudagur Laugardagur Sunnudagur);
our @DoWs = qw(Sun Mán Þri Mið Fim Fös Lau Sun);

our @AMPM =   @{Date::Language::English::AMPM};
our @Dsuf =   @{Date::Language::English::Dsuf};

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
