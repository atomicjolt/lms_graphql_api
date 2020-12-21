require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasPeerReviewInput < BaseInputObject
        description "Peer Reviews. API Docs: https://canvas.instructure.com/doc/api/peer_reviews.html"
      	argument :assessor_id, ID, "The assessors user id.Example: 23", required: false
      	argument :asset_id, ID, "The id for the asset associated with this Peer Review.Example: 13", required: false
      	argument :asset_type, String, "The type of the asset.Example: Submission", required: false
      	argument :id, ID, "The id of the Peer Review.Example: 1", required: false
      	argument :user_id, ID, "The user id for the owner of the asset.Example: 7", required: false
      	argument :workflow_state, String, "The state of the Peer Review, either 'assigned' or 'completed'.Example: assigned", required: false
      	argument :user, String, "the User object for the owner of the asset if the user include parameter is provided (see user API) (optional).Example: User", required: false
      	argument :assessor, String, "The User object for the assessor if the user include parameter is provided (see user API) (optional).Example: User", required: false
      	argument :submission_comments, String, "The submission comments associated with this Peer Review if the submission_comment include parameter is provided (see submissions API) (optional).Example: SubmissionComment", required: false

      end
    end
  end
end