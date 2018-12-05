require_relative "../canvas_base_input_type"
require_relative "quiz_assignment_override"
require_relative "quiz_assignment_override"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasQuizAssignmentOverrideSetInput < BaseInputObject
        description "Quiz Assignment Overrides. API Docs: https://canvas.instructure.com/doc/api/quiz_assignment_overrides.html"
        argument :quiz_id, ID, "ID of the quiz those dates are for..Example: 1", required: false
        argument :due_dates, LMSGraphQL::Types::Canvas::CanvasQuizAssignmentOverrideInput, "An array of quiz assignment overrides. For students, this array will always contain a single item which is the set of dates that apply to that student. For teachers and staff, it may contain more..", required: false
        argument :all_dates, LMSGraphQL::Types::Canvas::CanvasQuizAssignmentOverrideInput, "An array of all assignment overrides active for the quiz. This is visible only to teachers and staff..", required: false

      end
    end
  end
end