require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/communication_channel"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListUserCommunicationChannel < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasCommunicationChannel], null: false
        argument :user_id, ID, required: true
        def resolve(user_id:)
          context[:canvas_api].proxy(
            "LIST_USER_COMMUNICATION_CHANNELS",
            {
              "user_id": user_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end