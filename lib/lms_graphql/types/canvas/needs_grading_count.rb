require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasNeedsGradingCount < BaseType
        description "Assignments. API Docs: https://canvas.instructure.com/doc/api/assignments.html"
      	field :section_id, ID, "The section ID.Example: 123456", null: true
      	field :needs_grading_count, Int, "Number of submissions that need grading.Example: 5", null: true

      end
    end
  end
end