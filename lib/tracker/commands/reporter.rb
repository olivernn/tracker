require 'csv'

module Tracker
  module Commands
    class Reporter
      def self.run(options = {})
        self.new(options).run
      end

      def initialize(options = {})
        today = Time.now
        @year = options[:year] || today.year
        @month = options[:month] || today.month
        @csv = CSV.open(File.expand_path('~/.tracking.csv'), 'r')
      end

      def run
        CSV.generate do |output|
          category_sums.each do |category, percentage|
            output << [category, percentage]
          end
        end
      end

      private

      def total_time
        @total_time ||= entries.inject(0) { |count, row| count + row[2].to_i }.to_f
      end

      def category_sums
        @category_sums ||= entries.group_by(&:first).each_with_object({}) do |(category, values), memo|
          time = values.inject(0) { |count, row| count + row[2].to_i }
          memo[category] = (time / total_time) * 100
        end
      end

      def entries
        @entries ||= csv.each.select do |row|
          date = Date.parse(row[4])
          date.year == year && date.month == month
        end
      end

      attr_reader :csv, :year, :month
    end
  end
end
