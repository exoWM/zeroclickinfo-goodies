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
my $egg_triggers;

foreach my $egg(keys %$all_eggs){
    my $answer=$all_eggs->{$egg};
    if(ref($answer->{aliases}) eq 'ARRAY'){
        foreach my $alias(@{$answer->{aliases}}){
            $egg->{$alias} = $answer;
    }    
    foreach my $key(keys %$answer){
        delete $answer->{key} unless (grep { $key eq $_ };
    }
}

handle remainder=>sub {
    my $answer=$egg_triggers->{$egg};
    
    return unless ($_ eq '' || $_ eq '?' && ($response));
    return $answer->{response};
}
1;
   
