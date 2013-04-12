module Tracker
  class CategorySummary

    Line = Struct.new(:name, :value, :percentage)

    def initialize(records = [])
      @records = records
    end

    def lines
      @lines ||= grouped.map do |category, category_records|
        category_sum = category_records.map(&:duration).reduce(:+)
        Line.new(category, category_sum, category_sum / total)
      end
    end

    private

    attr_reader :records

    def grouped
      records.group_by(&:category)
    end

    def total
      @total ||= records.map(&:duration).reduce(:+).to_f
    end
  end
end
