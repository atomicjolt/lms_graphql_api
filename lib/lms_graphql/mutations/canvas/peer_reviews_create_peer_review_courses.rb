require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/peer_review"
module LMSGraphQL
  module Mutations
    module Canvas
      class PeerReviewsCreatePeerReviewCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :assignment_id, ID, required: true
        argument :submission_id, ID, required: true
        argument :user_id, ID, required: true
        field :peer_review, LMSGraphQL::Types::Canvas::CanvasPeerReview, null: false
        def resolve(course_id:, assignment_id:, submission_id:, user_id:)
          context[:canvas_api].call("PEER_REVIEWS_CREATE_PEER_REVIEW_COURSES").proxy(
            "PEER_REVIEWS_CREATE_PEER_REVIEW_COURSES",
            {
              "course_id": course_id,
              "assignment_id": assignment_id,
              "submission_id": submission_id,
              "user_id": user_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end