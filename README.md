Timetrack.bash
==============
Effortless timetracking to csv based on bash history + cronjob and patternmatching.

<center><img alt="" src=".res/anim.gif"/></center>

Timetrack.bash will check your bashhistory periodically and maintain a csv.
Aimed to lazy unix ninjas who spent lot of time in the console.

# Install

First enable shared history of your terminals:

    $ curl https://raw.githubusercontent.com/coderofsalvation/timetrack.bash/master/.bashrc >> ~/.bashrc

Then download and run timetrack

    $ wget https://raw.githubusercontent.com/coderofsalvation/timetrack.bash/master/timetrack 
    $ chmod 755 timetrack
    $ ./timetrack 
    please modify ~/.timetrack.conf before running timetrack as a crontab

Now lets modify some patterns and add the cronjob 

# Modify patterns

Now add this line to ~/.timetrack.conf (which timetrack created) :

    patterns['git push|svn update']='git / svn,version management,company foo'

Now suppose timetrack finds a match ('git push' e.g.) in your Bashhistory.
In such case it will append the following line to `~/.timetrack-mm-yyyy.csv`:

    21/13/15,00:03:45,"git / svn","version management","company foo"

Got it?

# Add a cronjob

Finally put it in your cronjob (`crontab -e`):

    */5 * * * * /absolute/path/to/timetrack track 

# Sweet! What will it generate?

It will generate (customizable) csv's like so:

    $ cat ~/.timetrack-04-2015.csv 
    15/04/15,12:47:01,"deploying project","deployment","company foo"
    15/04/15,12:47:01,"git / svn","version management","company foo"
    15/04/15,15:33:28,"working on code in editor","developing","company foo"


Or to get nice outputin the console:

    $ timetrack show 
    date      time      description                type                client
    --------
    15/04/15  12:47:01  deploying project          deployment          company foo
    15/04/15  12:47:01  git / svn                  version management  company foo
    15/04/15  15:33:28  working on code in editor  developing          company foo

# Great! and now what?

The output might need a bit of massaging.
So you can import it into gnumeric or excel as a csv:

    $ cat ~/.timetrack-*.conf /tmp/allinone.csv

## Dependencies

* bash 4
