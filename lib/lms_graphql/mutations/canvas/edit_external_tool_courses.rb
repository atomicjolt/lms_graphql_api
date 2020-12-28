require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class EditExternalToolCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :external_tool_id, ID, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(course_id:, external_tool_id:)
          context[:canvas_api].call("EDIT_EXTERNAL_TOOL_COURSES").proxy(
            "EDIT_EXTERNAL_TOOL_COURSES",
            {
              "course_id": course_id,
              "external_tool_id": external_tool_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end