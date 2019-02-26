require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class AbortGenerationOfReportOrRemovePreviouslyGeneratedOne < BaseMutation
        argument :course_id, ID, required: true
        argument :quiz_id, ID, required: true
        argument :id, ID, required: true
        field :return_value, Boolean, null: false
        def resolve(course_id:, quiz_id:, id:)
          context[:canvas_api].call("ABORT_GENERATION_OF_REPORT_OR_REMOVE_PREVIOUSLY_GENERATED_ONE").proxy(
            "ABORT_GENERATION_OF_REPORT_OR_REMOVE_PREVIOUSLY_GENERATED_ONE",
            {
              "course_id": course_id,
              "quiz_id": quiz_id,
              "id": id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end