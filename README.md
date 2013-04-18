# Tracker

Simple time tracking tool for Batman@New-Bamboo

## Installation

Clone the repository and then do a rake build && rake install

This is _not_ on rubygems.

## Usage

Help is available by running `tracker help`

### Recording

Record tasks using the simple text format. A category and duration are mandatory.

Tab completion is available for both the category and the project name.o

Project names must be prefixed with a #, durations are expressed as number of hours and number of minutes, both are optional but at least one must be passed.  E.g. 1h, 1h30m & 30m

    $ tracker
    > CLIENT_SUPPORT #efg 1h30m | optional description
    ok

To stop recording tasks just enter `exit`

### Reporting

Reports the amount of time spent over the last month

              DEV SUPPORT : ▉▉▉▉▉▉▉▉▉ 3h40m (9.57%)
    INTERNAL APPS SUPPORT : ▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉ 9h5m (23.7%)
                    SALES : ▉▉▉▉▉▉▉▉▉▉▉▉▉▉ 5h30m (14.35%)
           CLIENT SUPPORT : ▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉ 18h5m (47.17%)
          FORMAL TRAINING : ▉ 0h30m (1.3%)
             BATMAN TOOLS : ▉▉ 1h0m (2.61%)
        INFORMAL TRAINING : ▉ 0h30m (1.3%)

By default this will work over the last month, but this can be changed using the `--month` and `--year` options. The report can also be done against projects by passing the `--project` switch.