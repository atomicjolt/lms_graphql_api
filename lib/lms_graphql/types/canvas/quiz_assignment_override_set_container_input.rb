require_relative "../canvas_base_input_type"
require_relative "quiz_assignment_override_set_input"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasQuizAssignmentOverrideSetContainerInput < BaseInputObject
        description "Quiz Assignment Overrides. API Docs: https://canvas.instructure.com/doc/api/quiz_assignment_overrides.html"
        argument :quiz_assignment_overrides, [LMSGraphQL::Types::Canvas::CanvasQuizAssignmentOverrideSetInput], "The QuizAssignmentOverrideSet.", required: false

      end
    end
  end
end