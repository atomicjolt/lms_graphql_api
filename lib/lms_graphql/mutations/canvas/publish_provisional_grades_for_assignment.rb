require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class PublishProvisionalGradesForAssignment < BaseMutation
        argument :course_id, ID, required: true
        argument :assignment_id, ID, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(course_id:, assignment_id:)
          context[:canvas_api].call("PUBLISH_PROVISIONAL_GRADES_FOR_ASSIGNMENT").proxy(
            "PUBLISH_PROVISIONAL_GRADES_FOR_ASSIGNMENT",
            {
              "course_id": course_id,
              "assignment_id": assignment_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end