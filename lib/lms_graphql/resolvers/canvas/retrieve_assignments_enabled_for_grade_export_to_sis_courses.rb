require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class RetrieveAssignmentsEnabledForGradeExportToSisCourse < CanvasBaseResolver
        type Boolean, null: false
        argument :account_id, ID, required: false
        argument :course_id, ID, required: true
        argument :starts_before, GraphQL::Types::ISO8601DateTime, required: false
        argument :ends_after, GraphQL::Types::ISO8601DateTime, required: false
        argument :include, String, required: false
        def resolve(account_id: nil, course_id:, starts_before: nil, ends_after: nil, include: nil, get_all: false)
          result = context[:canvas_api].call("RETRIEVE_ASSIGNMENTS_ENABLED_FOR_GRADE_EXPORT_TO_SIS_COURSES").proxy(
            "RETRIEVE_ASSIGNMENTS_ENABLED_FOR_GRADE_EXPORT_TO_SIS_COURSES",
            {
              "account_id": account_id,
              "course_id": course_id,
              "starts_before": starts_before,
              "ends_after": ends_after,
              "include": include            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end