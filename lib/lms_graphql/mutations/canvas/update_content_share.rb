require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/content_share"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateContentShare < BaseMutation
        argument :user_id, ID, required: true
        argument :id, ID, required: true
        argument :read_state, String, required: false
        
        
        field :content_share, LMSGraphQL::Types::Canvas::CanvasContentShare, null: false
        
        def resolve(user_id:, id:, read_state: nil)
          context[:canvas_api].call("UPDATE_CONTENT_SHARE").proxy(
            "UPDATE_CONTENT_SHARE",
            {
              "user_id": user_id,
              "id": id
            },
            {
              "read_state": read_state
            },
          ).parsed_response
        end
      end
    end
  end
end