require 'forwardable'

module Tracker
  class RecordList
    extend Forwardable
    include Enumerable

    def_delegators :records, :each, :<<
    def_delegators :csv, :close

    def initialize(file_path)
      @csv = CSV.open(file_path, 'a+')

      @records = @csv.map do |row|
        parser = Tracker::CSVRowParser.new(row)
        Tracker::Record.new(parser.parse)
      end
    end

    def projects
      records.map(&:project).uniq
    end

    def <<(record)
      records << record
      csv << Tracker::RecordPresenter.new(record).as_csv
    end

    private

    attr_reader :csv, :records
  end
end
