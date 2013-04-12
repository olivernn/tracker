module Tracker
  class GraphFormatter
    BLOCK = "\u2589"

    def initialize(lines = [])
      @lines = lines
    end

    def to_s
      lines.reduce("") do |output, line|
        output += format_name(line.name)
        #output += line.name.ljust(max_label_length)
        output += " : "
        output += bar(line.percentage * 100)
        output += " "
        output += format_time(line.value)
        output += format_percentage(line.percentage)
        output += "\n"
      end
    end

    private

    def max_label_length
      @max_label_length ||= lines.map { |line| line.name.size }.max
    end

    def bar(size)
      buffer = ""
      size.to_i.times do
        buffer += BLOCK
      end
      buffer
    end

    def format_name(name)
      name.gsub('_', ' ').upcase.rjust(max_label_length)
    end

    def format_time(value)
      hours = value / 60
      minutes = value - (hours * 60)
      "#{hours}h#{minutes}m"
    end

    def format_percentage(percentage)
      " (#{(percentage * 100).round(2)}%)"
    end

    attr_reader :lines
  end
end
