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
        @record_list = Tracker::RecordList.new(Tracker::DEFAULT_CSV_PATH)
      end

      def run
        category_summary = Tracker::CategorySummary.new(records)
        puts Tracker::GraphFormatter.new(category_summary.lines).to_s
      end

      private

      def records
        record_list.select do |record|
          record.created_at.month == month && record.created_at.year == year
        end
      end

      attr_reader :record_list, :year, :month
    end
  end
end
