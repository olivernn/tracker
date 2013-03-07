# Tracker

Simple time tracking tool for Batman@New-Bamboo

## Installation

Clone the repository and then do a rake build && rake install

This is _not_ on rubygems.

## Usage

Record tasks using the simple text format. A category and duration are mandatory.

Tab completion is available for both the category and the project name.o

Project names must be prefixed with a #, durations are expressed as number of hours and number of minutes, both are optional but at least one must be passed.  E.g. 1h, 1h30m & 30m

    $ tracker
    > CLIENT_SUPPORT #efg 1h30m | optional description
    ok

To stop recording tasks just enter `exit`

