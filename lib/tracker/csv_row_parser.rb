require 'time'

module Tracker
  class CSVRowParser
    def initialize(row = [])
      @category, @project, @duration, @description, @date = row
    end

    def parse
      [:category, :project, :minutes, :description, :created_at].inject({}) do |memo, attr|
        value = self.send(attr)
        memo[attr] = value unless value.nil?
        memo
      end
    end

    private

    attr_reader :category, :project, :duration, :description, :date

    def created_at
      Time.parse(date)
    end

    def minutes
      duration.to_i
    end
  end
end
