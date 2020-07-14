require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/content_share"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateContentShare < BaseMutation
        argument :user_id, ID, required: true
        argument :receiver_ids, String, required: true
        argument :content_type, String, required: true
        argument :content_id, ID, required: true
        field :content_share, LMSGraphQL::Types::Canvas::CanvasContentShare, null: false
        def resolve(user_id:, receiver_ids:, content_type:, content_id:)
          context[:canvas_api].call("CREATE_CONTENT_SHARE").proxy(
            "CREATE_CONTENT_SHARE",
            {
              "user_id": user_id
            },
            {
              "receiver_ids": receiver_ids,
              "content_type": content_type,
              "content_id": content_id
            },
          ).parsed_response
        end
      end
    end
  end
end