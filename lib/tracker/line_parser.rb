module Tracker
  class LineParser

    PROJECT_NAME_REGEX = /\#(\w+)/
    TIME_REGEX = /(\d+h)?(\d+m)/
    DESCRIPTION_REGEX = /\|(.+)/

    attr_reader :line

    def initialize(line = '')
      @line = line
    end

    def parse
      hours, minutes = duration

      {
        category: category,
        hours: hours,
        minutes: minutes,
        project: project,
        description: description
      }
    end

    private

    def category
      Tracker::CATEGORIES.find { |category| line.include?(category) }
    end

    def duration
      line.match(TIME_REGEX).captures.map(&:to_i)
    end

    def project
      if match = line.match(PROJECT_NAME_REGEX)
        match.captures.first
      end
    end

    def description
      if match = line.match(DESCRIPTION_REGEX)
        match.captures.first.strip
      end
    end
  end
end
