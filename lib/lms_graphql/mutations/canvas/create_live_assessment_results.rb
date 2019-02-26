require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class CreateLiveAssessmentResult < BaseMutation
        argument :course_id, ID, required: true
        argument :assessment_id, ID, required: true
        field :return_value, Boolean, null: false
        def resolve(course_id:, assessment_id:)
          context[:canvas_api].call("CREATE_LIVE_ASSESSMENT_RESULTS").proxy(
            "CREATE_LIVE_ASSESSMENT_RESULTS",
            {
              "course_id": course_id,
              "assessment_id": assessment_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end