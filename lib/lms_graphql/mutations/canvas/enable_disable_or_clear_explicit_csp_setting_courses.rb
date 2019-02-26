require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class EnableDisableOrClearExplicitCspSettingCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :status, String, required: true
        field :return_value, Boolean, null: false
        def resolve(course_id:, status:)
          context[:canvas_api].call("ENABLE_DISABLE_OR_CLEAR_EXPLICIT_CSP_SETTING_COURSES").proxy(
            "ENABLE_DISABLE_OR_CLEAR_EXPLICIT_CSP_SETTING_COURSES",
            {
              "course_id": course_id
            },
            {
              "status": status
            },
          ).parsed_response
        end
      end
    end
  end
end