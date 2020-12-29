require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasNeedsGradingCountInput < BaseInputObject
        description "Assignments. API Docs: https://canvas.instructure.com/doc/api/assignments.html"
      argument :section_id, ID, "The section ID.Example: 123456", required: false
      argument :needs_grading_count, Int, "Number of submissions that need grading.Example: 5", required: false

      end
    end
  end
end