use strict;
use warnings;
use Test::More tests => 38;
use Date::Parse qw(str2time strptime);
use Date::Language;

# --- Undef / empty / garbage inputs ---
ok(!defined str2time(undef),           "str2time(undef) returns undef");
ok(!defined str2time(""),              "str2time('') returns undef");
ok(!defined str2time("garbage"),       "str2time('garbage') returns undef");
ok(!defined str2time("not a date at all"), "str2time('not a date at all') returns undef");

# --- ISO 8601 variants ---
{
    my $t1 = str2time("2002-07-22T10:00:00Z");
    ok(defined $t1, "ISO 8601 with T separator and Z");
    is($t1, 1027332000, "ISO 8601 basic format parses correctly");

    my $t2 = str2time("2002-07-22 10:00:00Z");
    is($t2, 1027332000, "ISO 8601 with space separator and Z");

    my $t3 = str2time("20020722T100000Z");
    is($t3, 1027332000, "ISO 8601 compact format");

    my $t4 = str2time("2001-02-26T13:44:12-0700");
    is($t4, 983220252, "ISO 8601 with negative offset");

    my $t5 = str2time("2002-11-07T23:31:49-05:00");
    is($t5, 1036729909, "RFC 3339 with colon in offset");
}

# --- AM/PM parsing ---
{
    my $base = str2time("Jul 13 1999 13:23:00 GMT");
    is(str2time("Jul 13 1999 1:23P GMT"),    $base, "1:23P parses as PM");
    is(str2time("Jul 13 1999 1:23P.M GMT"),  $base, "1:23P.M parses as PM");
    is(str2time("Jul 13 1999 1:23P.M. GMT"), $base, "1:23P.M. parses as PM");

    my $am = str2time("92/01/02 12:01 AM");
    my $pm = str2time("92/01/02 12:01 PM");
    ok(defined $am && defined $pm, "AM/PM dates parse");
    cmp_ok($pm - $am, '==', 12 * 3600, "PM is 12 hours after AM");
}

# --- Fractional seconds ---
{
    my $t = str2time("2003-02-17T08:14:07.198189+0000");
    ok(defined $t, "fractional seconds parse");
    cmp_ok(abs($t - 1045469647.198189), '<', 0.001, "fractional seconds preserved");

    my $t2 = str2time("1995-01-24T09:08:17.1823213");
    ok(defined $t2, "high-precision fractional seconds parse");
}

# --- Apache-style dates ---
{
    my $t = str2time("07/Nov/2000:16:45:56 +0100");
    is($t, 973611956, "Apache log date format");
}

# --- RFC 2822 / email dates ---
{
    my $t = str2time("Wed, 9 Nov 1994 09:50:32 -0500 (EST)");
    is($t, 784392632, "RFC 2822 date with comment");

    my $t2 = str2time("Sat, 19 Nov 1994 16:59:14 +0100");
    is($t2, 785260754, "RFC 2822 date with positive offset");
}

# --- Date::Language error handling ---
{
    eval { Date::Language->new('NonexistentLanguage') };
    ok($@, "Date::Language->new with invalid language dies");

    my $fr = Date::Language->new('French');
    ok(defined $fr, "Date::Language->new('French') succeeds");

    my $ts = $fr->str2time('15 janvier 2010');
    ok(defined $ts, "French 'janvier' parses");
}

# --- French month parsing ---
{
    my $fr = Date::Language->new('French');
    my @months = (
        ['janvier',  1],
        ['mars',     3],
        ['juin',     6],
        ['octobre', 10],
        ['novembre', 11],
    );
    for my $pair (@months) {
        my ($month_name, $month_num) = @$pair;
        my $ts = $fr->str2time("15 $month_name 2010");
        if (defined $ts) {
            my @lt = localtime($ts);
            is($lt[4] + 1, $month_num, "French '$month_name' -> month $month_num");
        }
        else {
            fail("French '$month_name' failed to parse");
        }
    }
}

# --- Two-digit year handling ---
{
    my $t = str2time("16 Oct 09");
    ok(defined $t, "two-digit year '09' parses");
    cmp_ok($t, '>=', 0, "two-digit year '09' gives non-negative time");
}

# --- Time-only formats ---
{
    my $t = str2time("10:00:00Z");
    ok(defined $t, "time-only with Z parses");

    my $t2 = str2time("10:00:00");
    ok(defined $t2, "time-only without zone parses");

    my $t3 = str2time("10:00");
    ok(defined $t3, "time-only HH:MM parses");
}

# --- Various date separator styles ---
{
    my $t1 = str2time("21 dec 17:05");
    my $t2 = str2time("21-dec 17:05");
    my $t3 = str2time("21/dec 17:05");
    ok(defined $t1, "space-separated day month");
    is($t1, $t2, "dash separator matches space separator");
    is($t1, $t3, "slash separator matches space separator");
}

# --- Boost C++ timestamp format ---
{
    my $t = str2time("2024-May-15 14:30:00.123456");
    ok(defined $t, "boost format YYYY-Mon-DD HH:MM:SS.f parses");
}
