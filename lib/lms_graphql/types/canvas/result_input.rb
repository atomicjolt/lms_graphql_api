require_relative "../canvas_base_input_type"
require_relative "result_link_input"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasResultInput < BaseInputObject
        description "LiveAssessments. API Docs: https://canvas.instructure.com/doc/api/live_assessments.html"
        argument :id, ID, "A unique identifier for this result.Example: 42", required: false
        argument :passed, Boolean, "Whether the user passed or not.Example: true", required: false
        argument :assessed_at, LMSGraphQL::Types::DateTimeType, "When this result was recorded.Example: 2014-05-13T00:01:57-06:00", required: false
        argument :links, LMSGraphQL::Types::Canvas::CanvasResultLinkInput, "Unique identifiers of objects associated with this result.Example: 42, 23, 5", required: false

      end
    end
  end
end