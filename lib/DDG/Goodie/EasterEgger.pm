package DDG::Goodie::EasterEgger;
# ABSTRACT: shows the user an easter egg if their query is a trigger.
use DDG::Goodie;
use YAML qw( Load );
use Data::Dumper;
zci_answer_type => 'easterEgger';

primary example queries 'Dude, wheres my car', 'What is the ultimate answer to life the universe and everything';
secondary_example_queries 'Valar morgulis';
description 'Shows a funny answer to the user\'s query'
name 'EasterEgger';
code_url 'https://github.com/duckduckgo/zeroclickinfo-goodies/blob/master/lib/DDG/Goodie/EasterEgger.pm';
category 'general';
attribution github  => ['https://github.com/jfeeneywm/', 'jfeeneywm'],
            twitter => ['https://twitter.com/jfeeneywm', 'jfeeneywm'];
# Going to need to look back at Jira and DDG goodies to get a refresher on the DDG way.
#open my $filename, '<', 'eggs.yml' or die "can't open the file";
# This is were I'm loading in the yaml, I think this will be different when i put the code on DDG, the (file)->slurp method. 
#my $file = do {local $/; <$filename>};
#my $yml = Load($file);

# adding the keys and aliases to 'triggers' which will be put into a regex much like goodie/Jira.pm
my @all_keys = sort keys %$yml;
my $triggers .= join('|', keys%{$yml});
foreach my $key(keys %$yml){
    my $answer=$yml->{$key};
    if(ref($answer->{aliases}) eq 'ARRAY') {
        $triggers .= '|';
        $triggers .= join('|', values @{$answer->{aliases}});
    }
}
# These next two lines will need to be added to handle => query sub
# $input=~s/\W+//g;
# $input=lc($input);
handle query=> sub {
    # Kinda hoping that this is proper.
    s/\W+//g;
    lc; 
    # Returns the response if there is no aliases.
    return ($yml->{$input}->{response}) if ($yml->{$input}->{response});
    # Loops through triggers to find
    foreach my $key(keys %$yml) {
        my $current=$yml->{$key};
        my $iter=0;
        if(ref($current->{aliases}) eq 'ARRAY'){         
            print ($current->{response}) if ($current->{aliases}[$iter++] eq $_;
        }
    } 
    # Need to figure out a way to print the response if $input is an alias.
    # Think this might be related to lines 32-33.
    # Look at the DDG goodie again tomorrow. I think some help lies in there.
    #print ($yml->{});
    print "\n";
}
# print $triggers, "\n";

1;

