require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasTerm < BaseType
          description "Courses. API Docs: https://canvas.instructure.com/doc/api/courses.html"
        field :id, ID, "Example: 1", null: true
        field :name, String, "Example: Default Term", null: true
        field :start_at, LMSGraphQL::Types::DateTimeType, "Example: 2012-06-01T00:00:00-06:00", null: true
        field :end_at, LMSGraphQL::Types::DateTimeType, "", null: true

      end
    end
  end
end