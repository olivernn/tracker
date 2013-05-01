require 'time'

module Tracker
  class CSVRowParser
    def initialize(row = [])
      @category, @project, @task, @duration, @description, @date = row
    end

    def parse
      [:category, :project, :task, :minutes, :description, :created_at].inject({}) do |memo, attr|
        value = self.send(attr)
        memo[attr] = value unless value.nil?
        memo
      end
    end

    private

    attr_reader :category, :project, :task, :duration, :description, :date

    def created_at
      Time.parse(date)
    end

    def minutes
      duration.to_i
    end
  end
end
