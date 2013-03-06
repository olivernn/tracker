module Tracker
  class Record

    attr_reader :category, :project, :hours, :minutes, :description

    def initialize(attrs = {})
      @category = attrs.fetch(:category)
      @project = attrs.fetch(:project, '')
      @hours = attrs.fetch(:hours, 0)
      @minutes = attrs.fetch(:minutes, 0)
      @description = attrs[:description]
    end

    def duration
      hours * 60 + minutes
    end
  end
end
