require "tracker/version"

require "tracker/line_parser"
require "tracker/csv_row_parser"

require "tracker/record"
require "tracker/record_list"
require "tracker/record_presenter"

require "tracker/base_summary"
require "tracker/category_summary"
require "tracker/project_summary"

require "tracker/graph_formatter"

require "tracker/commands/recorder"
require "tracker/commands/reporter"

module Tracker
  DEFAULT_CSV_PATH = File.expand_path('~/.tracking.csv')

  CATEGORIES = %w(
    INFORMAL_TRAINING
    INTERNAL_APPS_SUPPORT
    SALES
    FORMAL_TRAINING
    CLIENT_SUPPORT
  )
end
