require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class DisableAssignmentsCurrentlyEnabledForGradeExportToSi < BaseMutation
        argument :course_id, ID, required: true
        argument :grading_period_id, ID, required: false
        field :return_value, Boolean, null: false
        def resolve(course_id:, grading_period_id: nil)
          context[:canvas_api].call("DISABLE_ASSIGNMENTS_CURRENTLY_ENABLED_FOR_GRADE_EXPORT_TO_SIS").proxy(
            "DISABLE_ASSIGNMENTS_CURRENTLY_ENABLED_FOR_GRADE_EXPORT_TO_SIS",
            {
              "course_id": course_id,
              "grading_period_id": grading_period_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end