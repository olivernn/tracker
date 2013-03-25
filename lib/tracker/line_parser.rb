module Tracker
  class LineParser

    PROJECT_NAME_REGEX = /\#(\w+)/
    HOURS_REGEX = /(\d+)h/
    MINUTES_REGEX = /(\d+)m/
    DESCRIPTION_REGEX = /\|(.+)/

    attr_reader :line

    def initialize(line = '')
      @line = line
    end

    def parse
      [:category, :hours, :minutes, :project, :description].inject({}) do |memo, attr|
        val = send(attr)
        memo[attr] = val unless val.nil?
        memo
      end
    end

    private

    def category
      Tracker::CATEGORIES.find { |category| line.include?(category) }
    end

    def hours
      if match = line.match(HOURS_REGEX)
        match.captures.first.to_i
      else
        0
      end
    end

    def minutes
      if match = line.match(MINUTES_REGEX)
        match.captures.first.to_i
      else
        0
      end
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
