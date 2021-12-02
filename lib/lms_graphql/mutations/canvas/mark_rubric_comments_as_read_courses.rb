require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class MarkRubricCommentsAsReadCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :assignment_id, ID, required: true
        argument :user_id, ID, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(course_id:, assignment_id:, user_id:)
          context[:canvas_api].call("MARK_RUBRIC_COMMENTS_AS_READ_COURSES").proxy(
            "MARK_RUBRIC_COMMENTS_AS_READ_COURSES",
            {
              "course_id": course_id,
              "assignment_id": assignment_id,
              "user_id": user_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end