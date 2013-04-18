module Tracker
  class ProjectSummary < BaseSummary

    private

    def grouped
      records.group_by(&:project)
    end
  end
end
