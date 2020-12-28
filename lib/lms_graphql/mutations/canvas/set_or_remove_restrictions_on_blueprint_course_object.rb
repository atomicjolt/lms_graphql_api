require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class SetOrRemoveRestrictionsOnBlueprintCourseObject < BaseMutation
        argument :course_id, ID, required: true
        argument :template_id, ID, required: true
        argument :content_type, String, required: false
        argument :content_id, ID, required: false
        argument :restricted, Boolean, required: false
        argument :restrictions, String, required: false
        
        
        field :return_value, Boolean, null: false
        
        def resolve(course_id:, template_id:, content_type: nil, content_id: nil, restricted: nil, restrictions: nil)
          context[:canvas_api].call("SET_OR_REMOVE_RESTRICTIONS_ON_BLUEPRINT_COURSE_OBJECT").proxy(
            "SET_OR_REMOVE_RESTRICTIONS_ON_BLUEPRINT_COURSE_OBJECT",
            {
              "course_id": course_id,
              "template_id": template_id
            },
            {
              "content_type": content_type,
              "content_id": content_id,
              "restricted": restricted,
              "restrictions": restrictions
            },
          ).parsed_response
        end
      end
    end
  end
end