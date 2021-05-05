require_relative "../canvas_base_type"
require_relative "quiz_assignment_override_set"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasQuizAssignmentOverrideSetContainer < BaseType
          description "Quiz Assignment Overrides. API Docs: https://canvas.instructure.com/doc/api/quiz_assignment_overrides.html"
        field :quiz_assignment_overrides, [LMSGraphQL::Types::Canvas::CanvasQuizAssignmentOverrideSet], "The QuizAssignmentOverrideSet.", null: true

      end
    end
  end
end