require 'forwardable'

module Tracker
  class RecordPresenter
    extend Forwardable

    def initialize(record)
      @record = record
    end

    def as_csv
      [category.downcase, project.downcase, task.downcase, duration, description, created_at]
    end

    private

    def_delegators :@record, :category, :project, :task, :duration, :description

    attr_reader :record

    def created_at
      record.created_at.strftime('%Y-%m-%d')
    end
  end
end
