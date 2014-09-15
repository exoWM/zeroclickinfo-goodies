package DDG::Goodie::EasterEgger;
# ABSTRACT: shows the user an easter egg if their query is a trigger.

use DDG::Goodie;

use YAML qw( Load );

zci_answer_type => 'easterEgger';

primary example queries 'Dude, wheres my car', 'What is the ultimate answer to life the universe and everything';
secondary_example_queries 'Valar morgulis';
description 'Shows a funny answer to the user\'s query'
name 'EasterEgger';
code_url 'https://github.com/duckduckgo/zeroclickinfo-goodies/blob/master/lib/DDG/Goodie/EasterEgger.pm';
category 'general';
attribution github  => ['https://github.com/jfeeneywm/', 'jfeeneywm'],
            twitter => ['https://twitter.com/jfeeneywm', 'jfeeneywm'];

my $eggs = Load(scalar share('eggs.yml')->slurp);

my @all_eggs = sort keys %$eggs;

my $egg_triggers;

foreach $egg(@all_eggs){
    $egg_triggers .= join('|', keys %{$eggs->{$egg}->{'keys'}});
}

handle remainder=>sub {
    return unless ($_ eq '' || $_ eq '?');
}
1;
   
