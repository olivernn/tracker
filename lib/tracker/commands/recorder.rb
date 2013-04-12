require 'csv'
require 'readline'

module Tracker
  module Commands
    class Recorder
      def self.run
        self.new.run
      end

      def initialize
        @record_list = Tracker::RecordList.new(Tracker::DEFAULT_CSV_PATH)
      end

      def run
        setup_readline_completion
        print_prompt_header

        while line = Readline.readline('> ', true)
          if line == "exit"
            record_list.close
            exit
          end

          record = record_from_line(line)

          if record.valid?
            record_list << record
            puts "ok"
          else
            puts "record invalid"
          end
        end
      end

      private

      attr_reader :record_list

      def record_from_line(line)
        parser = Tracker::LineParser.new(line)
        Tracker::Record.new(parser.parse)
      end

      def setup_readline_completion
        Readline.completion_append_character = ' '

        Readline.completion_proc = proc { |s|
          Tracker::CATEGORIES.grep(/^#{Regexp.escape(s.upcase)}/) +
          record_list.projects
            .grep(/^#{Regexp.escape(s.gsub('#', ''))}/)
            .map { |s| "##{s}" }
        }
      end

      def print_prompt_header
        puts "Records must include a category and a duration"
        puts "Duration should be expressed as hours and/or minutes, e.g. 1h or 1h30m or 30m"
        puts "To stop recording tasks enter 'exit'"
    end
  end
end
