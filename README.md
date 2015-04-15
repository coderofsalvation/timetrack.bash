Timetrack.bash
==============
Effortless timetracking to csv based on bash history + cronjob and patternmatching.

<center><img alt="" src=".res/anim.gif"/></center>

Timetrack.bash will scan your bashhistory periodically and maintain a csv.
This can be very handy if you spend a lot of time in the console.

## Attention UNIX ninjas 

    Usage:

      timetrack track          # scans bash history (usually called by cron)
      timetrack show           # pretty console overview of timelog 
      timetrack add <csvstr>   # manually add csv-row
      timetrack createconfig   # creates config

## Install

First enable shared history of your terminals:

    $ curl https://raw.githubusercontent.com/coderofsalvation/timetrack.bash/master/.bashrc >> ~/.bashrc

Then download and run timetrack

    $ wget https://raw.githubusercontent.com/coderofsalvation/timetrack.bash/master/timetrack 
    $ chmod 755 timetrack
    $ ./timetrack createconfig 
    created ~/.timetrack.conf

## Add patterns to scan for

Now add this line to ~/.timetrack.conf (which timetrack created) :

    patterns['git push|svn update']='git / svn,version management,company foo'

## Try it:

    $ git push chucknorris # lets create some history
    $ CMD_IN_CSV=1 timetrack track
    $


## View the result 

    $ timetrack show 
    date      time      description                type                client
    --------
    15/04/15  12:47:01  deploying project          deployment          company foo
    15/04/15  12:47:01  git / svn                  version management  company foo
    15/04/15  15:33:28  working on code in editor  developing          company foo

The csvfiles are produced as ~/.timetrack-mm-yyyy.csv
Check it out, it will probably look something like this:
    
    $ cat ~/.timetrack-*.csv 
    15/04/15,12:47:01,"deploying project","deployment","company foo","git push chucknorris"
    15/04/15,12:47:01,"git / svn","version management","company foo","git add foo"
    15/04/15,15:33:28,"working on code in editor","developing","company foo","vi loop.cs"

## What happened over there?

Timetrack scans your recent bash history, and it found a match ('git push' e.g.).
In such case it will push it to the csv and call the BashHooks (see below).

Got it?
Now lets get this baby always running in the background

## Add a cronjob

Finally put it in your cronjob (`crontab -e`):

    */15 * * * * /absolute/path/to/timetrack track 

Optionally use `CMD_IN_CSV=1 /././timetrack track` to include the matching commands as well.

## Sweet! What else?

Optionally you can manually add entries to the csv, for example a git- or svn-hook could call this:

    timetrack add '"deploying project","deployment","project foo",""'

## Great! and now what?

So you can import it into gnumeric or excel as a csv:

    $ cat ~/.timetrack-*.conf /tmp/allinone.csv

## Advanced: Bashooks

You can extend the behaviour of timetrack. Lets say you 
want to notify matches and add to a REST api as well:

  ON_MATCH='DISPLAY=:0.0 notify-send' ON_ADD="postcurl" timetrack track 

## Todo

* more testing 

## Dependencies

* bash 4
