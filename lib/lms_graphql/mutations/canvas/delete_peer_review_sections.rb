require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/peer_review"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeletePeerReviewSection < BaseMutation
        argument :section_id, ID, required: true
        argument :assignment_id, ID, required: true
        argument :submission_id, ID, required: true
        argument :user_id, ID, required: true
        
        
        field :peer_review, LMSGraphQL::Types::Canvas::CanvasPeerReview, null: false
        
        def resolve(section_id:, assignment_id:, submission_id:, user_id:)
          context[:canvas_api].call("DELETE_PEER_REVIEW_SECTIONS").proxy(
            "DELETE_PEER_REVIEW_SECTIONS",
            {
              "section_id": section_id,
              "assignment_id": assignment_id,
              "submission_id": submission_id,
              "user_id": user_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end