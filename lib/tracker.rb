require "tracker/version"
require "tracker/line_parser"
require "tracker/csv_row_parser"
require "tracker/record"
require "tracker/record_list"
require "tracker/record_presenter"

require "tracker/commands/recorder"
require "tracker/commands/reporter"

module Tracker
  DEFAULT_CSV_PATH = File.expand_path('~/.tracking.csv')

  CATEGORIES = %w(
    INFORMAL_TRAINING
    DEV_SUPPORT
    INTERNAL_APPS_SUPPORT
    SALES
    FORMAL_TRAINING
    CLIENT_SUPPORT
    CLIENT_SUPPORT_NO_CONTRACT
    BATMAN_TOOLS
  )
end
