require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class CreateOrFindLiveAssessment < BaseMutation
        argument :course_id, ID, required: true
        field :return_value, Boolean, null: false
        def resolve(course_id:)
          context[:canvas_api].call("CREATE_OR_FIND_LIVE_ASSESSMENT").proxy(
            "CREATE_OR_FIND_LIVE_ASSESSMENT",
            {
              "course_id": course_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end