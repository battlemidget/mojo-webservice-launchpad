#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use Test::Exception;
use FindBin;
use lib "$FindBin::Bin/../lib";

plan skip_all => 'must export launchpad credentials to enable these tests'
  unless $ENV{LP_CONSUMER_KEY}
  && $ENV{LP_ACCESS_TOKEN}
  && $ENV{LP_ACCESS_TOKEN_SECRET};

diag("testing bugs api");
# replace with the actual test
use_ok('Mojo::WebService::Launchpad::Client');


my $lp = Mojo::WebService::Launchpad::Client->new(
    consumer_key        => $ENV{LP_CONSUMER_KEY},
    access_token        => $ENV{LP_ACCESS_TOKEN},
    access_token_secret => $ENV{LP_ACCESS_TOKEN_SECRET}
);

use_ok('Mojo::WebService::Launchpad::Model::Bug');
my $bug = await $lp->resource('Bug')->by_id(1283310);

# bug
ok($bug->id eq '1283310', $bug->id . " found correctly.");

done_testing;
