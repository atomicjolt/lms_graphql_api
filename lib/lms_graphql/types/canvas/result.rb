require_relative "../canvas_base_type"
require_relative "result_link"

module LMSGraphQL
  module Types
    module Canvas
      class Result < BaseType
        description "LiveAssessments. API Docs: https://canvas.instructure.com/doc/api/live_assessments.html"
        field :id, ID, "A unique identifier for this result.Example: 42", null: true
        field :passed, Boolean, "Whether the user passed or not.Example: true", null: true
        field :assessed_at, LMSGraphQL::Types::DateTimeType, "When this result was recorded.Example: 2014-05-13T00:01:57-06:00", null: true
        field :links, LMSGraphQL::Types::Canvas::ResultLink, "Unique identifiers of objects associated with this result.Example: 42, 23, 5", null: true

      end
    end
  end
end