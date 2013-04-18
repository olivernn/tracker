module Tracker
  class CategorySummary < BaseSummary

    private

    def grouped
      records.group_by(&:category)
    end
  end
end
