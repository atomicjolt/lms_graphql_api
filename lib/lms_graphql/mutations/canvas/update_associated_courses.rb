require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateAssociatedCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :template_id, ID, required: true
        argument :course_ids_to_add, String, required: false
        argument :course_ids_to_remove, String, required: false
        
        
        field :return_value, Boolean, null: false
        
        def resolve(course_id:, template_id:, course_ids_to_add: nil, course_ids_to_remove: nil)
          context[:canvas_api].call("UPDATE_ASSOCIATED_COURSES").proxy(
            "UPDATE_ASSOCIATED_COURSES",
            {
              "course_id": course_id,
              "template_id": template_id
            },
            {
              "course_ids_to_add": course_ids_to_add,
              "course_ids_to_remove": course_ids_to_remove
            },
          ).parsed_response
        end
      end
    end
  end
end