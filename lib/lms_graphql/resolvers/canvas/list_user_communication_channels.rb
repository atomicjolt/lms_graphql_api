require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/communication_channel"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListUserCommunicationChannel < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasCommunicationChannel], null: false
        argument :get_all, Boolean, required: false
        argument :user_id, ID, required: true
        def resolve(user_id:, get_all: false)
          result = context[:canvas_api].call("LIST_USER_COMMUNICATION_CHANNELS").proxy(
            "LIST_USER_COMMUNICATION_CHANNELS",
            {
              "user_id": user_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end