require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/quiz_assignment_override_set_container"
module LMSGraphQL
  module Resolvers
    module Canvas
      class RetrieveAssignmentOverriddenDatesForNewQuiz < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasQuizAssignmentOverrideSetContainer, null: false
        argument :course_id, ID, required: true
        argument :quiz_assignment_overrides_0_quiz_ids, Int, required: false
        def resolve(course_id:, quiz_assignment_overrides_0_quiz_ids: nil, get_all: false)
          result = context[:canvas_api].call("RETRIEVE_ASSIGNMENT_OVERRIDDEN_DATES_FOR_NEW_QUIZZES").proxy(
            "RETRIEVE_ASSIGNMENT_OVERRIDDEN_DATES_FOR_NEW_QUIZZES",
            {
              "course_id": course_id,
              "quiz_assignment_overrides[0][quiz_ids]": quiz_assignment_overrides_0_quiz_ids            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end