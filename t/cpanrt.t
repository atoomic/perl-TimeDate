use strict;
use warnings;
use Test::More tests => 11;
use Date::Format qw(time2str strftime);
use Date::Parse qw(strptime str2time);

# RT#45067: Date::Format with %z gives wrong results for half-hour timezones
{
    for my $zone (qw(-0430 -0445)) {
        my $zone_str = time2str("%Z %z", time, $zone);
        is($zone_str, "$zone $zone", "RT#45067: half-hour timezone $zone");
    }
}

# RT#48164: Date::Parse unable to set seconds correctly
{
    for my $str ("2008.11.30 22:35 CET", "2008-11-30 22:35 CET") {
        my @t = strptime($str);
        my $t = join ":", map { defined($_) ? $_ : "-" } @t;
        is($t, "-:35:22:30:10:108:3600:20", "RT#48164: seconds parsing for '$str'");
    }
}

# RT#17396: Parse error for french date with 'mars' (march) as month
{
    use Date::Language;
    my $dateP     = Date::Language->new('French');
    my $timestamp = $dateP->str2time('4 mars 2005');
    my ($ss, $mm, $hh, $day, $month, $year, $zone) = localtime $timestamp;
    $month++;
    $year += 1900;
    my $date = "$day/$month/$year";
    is($date, "4/3/2005", "RT#17396: French 'mars' parsed correctly");
}

# RT#52387: seconds since the Epoch, UCT
{
    my $time = time;
    my @lt = localtime($time);
    is(strftime("%s", @lt), $time, "RT#52387: strftime %s returns epoch");
    is(time2str("%s", $time), $time, "RT#52387: time2str %s returns epoch");
}

# RT#51664: Change in str2time behaviour between 1.16 and 1.19
{
    ok(str2time('16 Oct 09') >= 0, "RT#51664: '16 Oct 09' parses to non-negative time");
}

# RT#84075: Date::Parse::str2time maps date in 1963 to 2063
{
    my $this_year = 1900 + (gmtime(time))[5];
    my $target_year = $this_year - 50;
    my $date = "$target_year-01-01 00:00:00 UTC";
    my $time = str2time($date);
    my $year_parsed_as = 1900 + (gmtime($time))[5];
    is($year_parsed_as, $target_year, "RT#84075: year $target_year not mapped to future");
}

# IST (Indian Standard Time) should resolve to UTC+5:30
{
    use Time::Zone;

    my $offset = tz_offset("ist");
    is($offset, 19800, "tz_offset('ist') returns 19800 (UTC+5:30)");

    my $time = str2time("2024-01-15 12:00:00 IST");
    my $time_utc = str2time("2024-01-15 06:30:00 UTC");
    is($time, $time_utc, "IST date parses to correct UTC equivalent");
}
