require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/content_share"
module LMSGraphQL
  module Mutations
    module Canvas
      class AddUsersToContentShare < BaseMutation
        argument :user_id, ID, required: true
        argument :id, ID, required: true
        argument :receiver_ids, String, required: false
        field :content_share, LMSGraphQL::Types::Canvas::CanvasContentShare, null: false
        def resolve(user_id:, id:, receiver_ids: nil)
          context[:canvas_api].call("ADD_USERS_TO_CONTENT_SHARE").proxy(
            "ADD_USERS_TO_CONTENT_SHARE",
            {
              "user_id": user_id,
              "id": id
            },
            {
              "receiver_ids": receiver_ids
            },
          ).parsed_response
        end
      end
    end
  end
end