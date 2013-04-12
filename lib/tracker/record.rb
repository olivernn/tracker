module Tracker
  class Record

    attr_reader :category, :project, :hours, :minutes, :description, :created_at

    def initialize(attrs = {})
      @category = attrs.fetch(:category)
      @project = attrs.fetch(:project, '')
      @hours = attrs.fetch(:hours, 0)
      @minutes = attrs.fetch(:minutes, 0)
      @description = attrs[:description]
      @created_at = attrs.fetch(:created_at, Time.now)
    end

    def duration
      hours * 60 + minutes
    end

    def valid?
      !category.empty? && duration > 0
    end
  end
end
