require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetRubricAssessmentsReadStateSectionsRubricAssessment < CanvasBaseResolver
        type Boolean, null: false
        argument :section_id, ID, required: true
        argument :assignment_id, ID, required: true
        argument :user_id, ID, required: true
        def resolve(section_id:, assignment_id:, user_id:, get_all: false)
          result = context[:canvas_api].call("GET_RUBRIC_ASSESSMENTS_READ_STATE_SECTIONS_RUBRIC_ASSESSMENTS").proxy(
            "GET_RUBRIC_ASSESSMENTS_READ_STATE_SECTIONS_RUBRIC_ASSESSMENTS",
            {
              "section_id": section_id,
              "assignment_id": assignment_id,
              "user_id": user_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end