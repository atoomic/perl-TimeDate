package TimeDate;

# VERSION: generated
# ABSTRACT: Date and time formatting subroutines

1;

__END__

=head1 SYNOPSIS

    use Date::Format;
    use Date::Parse;

    # Formatting
    print time2str("%Y-%m-%d %T", time);          # 2024-01-15 14:30:00
    print time2str("%a %b %e %T %Y\n", time);     # Mon Jan 15 14:30:00 2024

    # Parsing
    my $time = str2time("Wed, 16 Jun 94 07:29:35 CST");
    my ($ss,$mm,$hh,$day,$month,$year,$zone) = strptime("2024-01-15T14:30:00Z");

    # Multi-language support
    use Date::Language;
    my $lang = Date::Language->new('German');
    print $lang->time2str("%a %b %e %T %Y\n", time);

=head1 DESCRIPTION

The TimeDate distribution provides date parsing, formatting, and timezone
handling for Perl.

=over 4

=item L<Date::Parse>

Parse date strings in a wide variety of formats into Unix timestamps
or component values.

=item L<Date::Format>

Format Unix timestamps or localtime arrays into strings using
C<strftime>-style conversion specifications.

=item L<Date::Language>

Format and parse dates in over 30 languages including French, German,
Spanish, Chinese, Russian, Arabic, and many more.

=item L<Time::Zone>

Timezone offset lookups and conversions for named timezones.

=back

=head1 SEE ALSO

L<Date::Format>, L<Date::Parse>, L<Date::Language>, L<Time::Zone>

=cut
