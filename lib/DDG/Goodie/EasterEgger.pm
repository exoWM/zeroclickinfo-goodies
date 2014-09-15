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
attribution github  => ['https://github.com/jfeeneywm/zeroclickinfo-goodies', 'jfeeneywm'],
            twitter => ['https://twitter.com/jfeeneywm', 'jfeeneywm'];

my $statement = Load(scalar share('eggs.yml')->slurp);


