require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/submission_comment"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteSubmissionComment < BaseMutation
        argument :course_id, ID, required: true
        argument :assignment_id, ID, required: true
        argument :user_id, ID, required: true
        argument :id, ID, required: true
        
        
        field :submission_comment, LMSGraphQL::Types::Canvas::CanvasSubmissionComment, null: false
        
        def resolve(course_id:, assignment_id:, user_id:, id:)
          context[:canvas_api].call("DELETE_SUBMISSION_COMMENT").proxy(
            "DELETE_SUBMISSION_COMMENT",
            {
              "course_id": course_id,
              "assignment_id": assignment_id,
              "user_id": user_id,
              "id": id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end