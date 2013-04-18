require 'csv'

module Tracker
  module Commands
    class Reporter
      def self.run(grouper, options = {})
        self.new(grouper, options).run
      end

      def initialize(grouper, options = {})
        today = Time.now
        @year = options[:year] || today.year
        @month = options[:month] || today.month
        @record_list = Tracker::RecordList.new(Tracker::DEFAULT_CSV_PATH)
        @grouper = grouper
      end

      def run
        summary = grouper.new(records)
        puts Tracker::GraphFormatter.new(summary.lines).to_s
      end

      private

      def records
        record_list.select do |record|
          record.created_at.month == month && record.created_at.year == year
        end
      end

      attr_reader :record_list, :year, :month, :grouper
    end
  end
end
